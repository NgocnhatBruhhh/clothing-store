package webshop.paymentMethod;

import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class VNPayService {

	@Autowired
	private VNPayConfig config;

	public JsonObject createPayment(HttpServletRequest request, long amount, String bankCode, String language)
			throws Exception {
		String vnp_Version = "2.1.0";
		String vnp_Command = "pay";
		String orderType = "other";
		String vnp_TxnRef = config.getRandomNumber(8); // Tạo mã đơn hàng ngẫu nhiên
		String vnp_IpAddr = getIpAddress(request);

		// Tạo danh sách các tham số
		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", vnp_Version);
		vnp_Params.put("vnp_Command", vnp_Command);
		vnp_Params.put("vnp_TmnCode", config.vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount * 100)); // Lưu ý: nhân 100
		vnp_Params.put("vnp_CurrCode", "VND");

		/*
		 * if (bankCode != null && !bankCode.isEmpty()) { vnp_Params.put("vnp_BankCode",
		 * bankCode); // Thêm vnp_BankCode nếu bạn muốn chỉ định phương thức thanh toán
		 * }
		 */
		
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
		vnp_Params.put("vnp_OrderType", orderType);

		if (language != null && !language.isEmpty()) {
			vnp_Params.put("vnp_Locale", language);
		} else {
			vnp_Params.put("vnp_Locale", "vn");
		}
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

		// Tạo vnp_CreateDate
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		formatter.setTimeZone(TimeZone.getTimeZone("GMT+7")); // Cài đặt múi giờ GMT+7
		String vnp_CreateDate = formatter.format(new Date()); // Lấy thời gian hiện tại
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		// Tạo vnp_ExpireDate (Thêm 15 phút vào vnp_CreateDate)
		Calendar cld = Calendar.getInstance();
		cld.add(Calendar.MINUTE, 15); // Thêm 15 phút
		String vnp_ExpireDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

		// Thêm tham số ReturnUrl
		String returnUrl = "http://localhost:8080/shop_c/payment/result/vnpay.htm"; // Đặt URL trả về sau khi thanh toán
		vnp_Params.put("vnp_ReturnUrl", returnUrl);

		// Tạo danh sách tham số và mã hóa
		List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
		Collections.sort(fieldNames);

		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		for (String fieldName : fieldNames) {
			String fieldValue = vnp_Params.get(fieldName);
			if (fieldValue != null && !fieldValue.isEmpty()) {
				hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII))
						.append('&');
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII)).append('=')
						.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII)).append('&');
			}
		}
		hashData.deleteCharAt(hashData.length() - 1); // Xóa dấu '&' cuối cùng
		query.deleteCharAt(query.length() - 1);

		// Tạo mã bảo mật
		String vnp_SecureHash = VNPayConfig.hmacSHA512(config.secretKey, hashData.toString());
		query.append("&vnp_SecureHash=").append(vnp_SecureHash);

		// Tạo URL thanh toán
		String paymentUrl = config.vnp_PayUrl + "?" + query.toString();

		// Trả về thông tin JSON
		JsonObject job = new JsonObject();
		job.addProperty("code", "00");
		job.addProperty("message", "success");
		job.addProperty("data", paymentUrl);
		
		return job;
	}

	private String getIpAddress(HttpServletRequest request) {
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		return ipAddress;
	}
}