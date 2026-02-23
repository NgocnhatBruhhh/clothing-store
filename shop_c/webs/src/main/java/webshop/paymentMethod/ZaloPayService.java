package webshop.paymentMethod;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.codec.digest.HmacUtils;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

@Service
public class ZaloPayService {

    // This method creates an order
	public String createOrder(String appTransId, String amount, String description) {
	    try {
	        // Tạo dữ liệu yêu cầu
	        Map<String, Object> orderData = new TreeMap<>();
	        ObjectMapper objectMapper = new ObjectMapper();

	        orderData.put("app_id", ZaloPayConfig.APP_ID);
	        orderData.put("app_user", "ZaloPayDemo");
	        orderData.put("app_trans_id", appTransId);
	        orderData.put("app_time", System.currentTimeMillis());
	        orderData.put("amount", Integer.parseInt(amount));
	        orderData.put("bank_code", "");

	        // Thêm callback_url và redirect URL vào embed_data
	        Map<String, Object> embedData = new HashMap<>();
	        embedData.put("redirecturl", "http://localhost:8080/shop_c/payment/zalopay/result.htm");

	        // Chuyển embedData thành JSON string
	        String embedDataJson = objectMapper.writeValueAsString(embedData);

	        orderData.put("callback_url", ""); 
	        orderData.put("embed_data", embedDataJson);
	        orderData.put("item", "[]");
	        orderData.put("description", description);

	        // Tạo checksum (sử dụng embedDataJson)
	        String hmacInput = ZaloPayConfig.APP_ID + "|"
	            + appTransId + "|"
	            + "ZaloPayDemo" + "|"
	            + amount + "|"
	            + orderData.get("app_time") + "|"
	            + embedDataJson + "|"
	            + orderData.get("item");

	        String checksum = HmacUtils.hmacSha256Hex(ZaloPayConfig.KEY1, hmacInput);
	        orderData.put("mac", checksum);

	        // Gửi yêu cầu HTTP POST
	        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
	            HttpPost httpPost = new HttpPost(ZaloPayConfig.CREATE_ORDER_URL);
	            httpPost.setHeader("Content-Type", "application/json");

	            // Chuyển dữ liệu thành JSON
	            String json = objectMapper.writeValueAsString(orderData);
	            httpPost.setEntity(new StringEntity(json));

	            // Log request for debugging
	            System.out.println("ZaloPay Request: " + json);

	            // Thực thi yêu cầu
	            try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
	                String responseString = EntityUtils.toString(response.getEntity());
	                
	                // Log response for debugging
	                System.out.println("ZaloPay Response: " + responseString);
	                
	                return responseString;
	            }
	        }
	    } catch (Exception e) {
	        // More detailed error logging
	        System.err.println("ZaloPay Order Creation Error: " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }
	}

    // Callback method to handle ZaloPay server's response
    public void handleCallback(Map<String, String> callbackData) {
        try {
            // Extract the response data
            String receivedMac = callbackData.get("mac");
            String data = callbackData.get("data");

            // Generate MAC using your key2 and callback data
            String hmacInput = data;
            String generatedMac = HmacUtils.hmacSha256Hex(ZaloPayConfig.KEY2, hmacInput);

            // Verify if the received MAC matches the generated MAC
            if (receivedMac.equals(generatedMac)) {
                // The callback is valid, now handle the data
                ObjectMapper objectMapper = new ObjectMapper();
                Map<String, Object> dataMap = objectMapper.readValue(data, Map.class);

                // Check the payment status
                int returnCode = (int) dataMap.get("return_code");
                if (returnCode == 1) {
                    // Payment was successful, handle success logic
                    System.out.println("Payment Successful. Transaction ID: " + dataMap.get("zp_trans_id"));
                    // Redirect or update status in your system
                } else {
                    // Payment failed, handle failure logic
                    System.out.println("Payment Failed. Error: " + dataMap.get("return_message"));
                    // Redirect to error page or handle accordingly
                }

            } else {
                // Invalid callback, handle accordingly (e.g., log the error)
                System.out.println("Invalid callback MAC");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}