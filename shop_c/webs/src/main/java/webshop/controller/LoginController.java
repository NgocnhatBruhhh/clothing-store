package webshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import webshop.dao.AccountDAO;
import webshop.dao.CartDAO;
import webshop.dao.CustomerDAO;
import webshop.dao.RuleDAO;
import webshop.dao.StaffDAO;
import webshop.dao.UploadFile;
import webshop.entity.Account;
import webshop.entity.Brand;
import webshop.entity.Cart;
import webshop.entity.Customer;
import webshop.entity.Material;
import webshop.entity.Origin;
import webshop.entity.Rule;
import webshop.entity.Staff;
import webshop.entity.Type;
import webshop.security.Authentication;
import webshop.security.Bcrypt;
import webshop.security.Email;
import webshop.security.JwtUtil;
import webshop.security.Roles;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Controller
public class LoginController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private AccountDAO accountDAO;
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	StaffDAO staffDAO;
	@Autowired
	CartDAO cartDAO;
	@Autowired
	private RuleDAO rule;
	@Autowired
	private UploadFile uploadFile;

	@RequestMapping(value = "/login-auth", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, @RequestParam(value = "remember", required = false) String remember,
			HttpSession session, Model model, HttpServletResponse response) throws IOException {

		boolean log = Authentication.isLogin(request, response);
		if (log) {
			return "redirect:home.htm";
		}

		if (request.getParameter("capcha") != null && request.getParameter("newcapcha") != null) {
			String capcha = request.getParameter("capcha");
			String inputCapcha = request.getParameter("newcapcha");
			if (!capcha.equals(inputCapcha)) {
				model.addAttribute("message", "Capcha không trùng khớp!");
				model.addAttribute("mail", username);
				model.addAttribute("pass", password);
				int count = Authentication.getCountForCapCha(request);
				String newCapcha = Bcrypt.generateCaptcha(6);
				model.addAttribute("capcha", newCapcha);
				// model.addAttribute("inputcapcha", request.getParameter("newcapcha"));
				count = count + 1;
				Authentication.addTokenCount(count, response);
				return "login/login_capcha";
			}
			// session.setAttribute("count", null);
		}

		Optional<Account> account = accountDAO.findAccountByUsernameAndPassword(username, password);
		session = request.getSession(false);
		if (account.isPresent()) {
			Authentication.deleteCount(request, response);
			Account acc = accountDAO.getAccountByEmail(username);
			if (acc.getStatus() == 0) {
				model.addAttribute("message", "Tài khoản đã bị khóa!");
				return "login/login";
			}

			String role = acc.getRule().getName();

			if (role.equals(Roles.getAdmin())) {
				// adfmin
			} else if (role.equals(Roles.getEmployee())) {
				Staff staf = staffDAO.getStaffByAccountId(acc.getId());
				if (staf == null) {
					return "notice";
				}
			} else {
				Customer customer = customerDAO.getCustomerByAccountID(acc.getId());
				if (customer == null) {
					return "notice";
				}

				List<Cart> carts = (List<Cart>) session.getAttribute("carts");
				List<Cart> customerCarts = cartDAO.getCartsByCustomerId(customer.getId());
				List<Integer> selectIdCarts = (List<Integer>) session.getAttribute("selectIdCarts");

				if (carts != null) {
					for (Cart cart : carts) {
						int idCart = cart.getID();
						boolean flag = false;
						if (customerCarts != null) {
							for (Cart customerCart : customerCarts) {
								if (customerCart.getProductDetail().getId() == cart.getProductDetail().getId()
										&& customerCart.getStatus() == cart.getStatus()) {
									customerCart.setQuantity(customerCart.getQuantity() + cart.getQuantity());
									cartDAO.updateCart(customerCart);
									if (selectIdCarts != null && selectIdCarts.contains(idCart)) {
										selectIdCarts.remove(Integer.valueOf(idCart));
										selectIdCarts.add(customerCart.getID());
									}
									flag = true;
									break;
								}
							}
						}
						if (!flag) {
							cart.setCustomer(customer);
							cartDAO.createCart(cart);
							if (selectIdCarts != null && selectIdCarts.contains(idCart)) {
								selectIdCarts.remove(Integer.valueOf(idCart));
								selectIdCarts.add(cart.getID());
							}
						}
					}
				}
				session.setAttribute("selectIdCarts", selectIdCarts);
				session.removeAttribute("carts");
			}

			// phân quyền các kiểu
			// sau này có Mã hóa sau session + pass

			Authentication.addToken(role, response);

			// session.setMaxInactiveInterval(JwtUtil.timeExpired); //Thời gian hết hạn của
			// session

			session.setAttribute("user", username);
			session.setAttribute("role", role);
			return "redirect:/home.htm";

		} else {

			model.addAttribute("mail", username);
			model.addAttribute("pass", password);

			model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");

			int dem = Authentication.getCountForCapCha(request);
			System.out.println(dem);
			if (dem == 0) {
				Authentication.addTokenCount(1, response);
			} else {
				if (dem >= 4) {
					String newCapcha = Bcrypt.generateCaptcha(6);

					model.addAttribute("capcha", newCapcha);
					// model.addAttribute("inputcapcha", request.getAttribute("newcapcha"));
					return "login/login_capcha";
				}
				dem = dem + 1;
				Authentication.addTokenCount(dem, response);

			}

		}

		return "login/login";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("confirmPassword") String confirmPassword, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {

		boolean log = Authentication.isLogin(request, response);
		if (log) {
			return "redirect:home.htm";
		}

		model.addAttribute("email", email);
		model.addAttribute("pass", password);
		model.addAttribute("pass2", confirmPassword);

		// Kiểm tra xem email đã tồn tại chưa
		if (accountDAO.getAccountByEmail(email) != null) {
			model.addAttribute("message", "Email đã tồn tại!");
			return "login/register";
		}

		// Kiểm tra xem mật khẩu nhập lại có khớp không
		if (!password.equals(confirmPassword)) {
			model.addAttribute("message", "Mật khẩu không khớp!");
			return "login/register";
		}

		if (!Bcrypt.isStrongPassword(confirmPassword)) {
			model.addAttribute("message", "Mật khẩu phải trên 8 ký tự, có chữ hoa chữ thường, số và ký tự đặc biệt!");
			return "login/register";
		}

		// Lấy quyền mặc định từ RuleDAO
		Rule defaultRule = rule.getRuleById(3); // ID 2 là quyền mặc định
		if (defaultRule == null) {
			model.addAttribute("message", "Không thể tìm thấy quyền mặc định.");
			return "login/register";
		}
		// Tạo tài khoản mới
		Account account = new Account();
		account.setEmail(email);
		account.setPassword(Bcrypt.encodePassword(confirmPassword)); // Bạn nên mã hóa mật khẩu trước khi lưu
		account.setStatus(1); // Đặt trạng thái mặc định (hoạt động)
		account.setRule(defaultRule); // Quyền mặc định

		Customer customer = new Customer();
		customer.setName("");
		customer.setPhone("");

		boolean success = accountDAO.saveAccount(account);
		customer.setAccount(account);
		customerDAO.createCustomer(customer);
		if (success) {
			Authentication.addToken(Roles.getUser(), response);
			HttpSession ses = request.getSession(false);
			ses.setAttribute("user", email);
			request.setAttribute("acc", account);
			request.setAttribute("personal", customer);
			model.addAttribute("message", "Đăng ký tài khoản thành công! Giờ hãy cập nhật thông tin cá nhân!");
			return "user/personal";
		} else {
			model.addAttribute("message", "Có lỗi xảy ra. Vui lòng thử lại.");
			return "login/register";
		}
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String showRegisterPage(Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		boolean log = Authentication.isLogin(request, response);
		if (log) {
			return "redirect:home.htm";
		}
		return "login/register"; // Trả về file JSP trong thư mục WEB-INF/views/
	}

	@RequestMapping(value = "update-profile", method = RequestMethod.POST)
	public String updateProfile(@RequestParam("name") String name, @RequestParam("phone") String phone,
			@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpSession session, Model model)
			throws IOException {

		boolean log = Authentication.isLogin(request, response);
		if (!log) {
			return "redirect:login.htm";
		}
		model.addAttribute("email", email);
		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		// Kiểm tra định dạng email
		String emailPattern = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
		if (!email.matches(emailPattern)) {
			model.addAttribute("message", "Email không hợp lệ.");
			return "user/personal";
		}

		// Kiểm tra định dạng số điện thoại (10 chữ số)
		String phonePattern = "^\\d{10}$";
		if (!phone.matches(phonePattern)) {
			model.addAttribute("message", "Số điện thoại phải có 10 chữ số.");
			return "user/personal";
		}
		// Lấy thông tin tài khoản từ session
		String username = (String) session.getAttribute("user");
		Account account = accountDAO.getAccountByEmail(username);
		if (account == null) {
			model.addAttribute("message", "Không tìm thấy tài khoản.");
			return "login/login";
		}

		// Cập nhật thông tin cá nhân
		Customer customer = customerDAO.getCustomerByAccountID(account.getId());
		if (customer == null) {
			model.addAttribute("message", "Không tìm thấy thông tin người dùng.");
			return "login/login";
		}

		// Cập nhật các trường thông tin cá nhân
		customer.setName(name);
		customer.setPhone(phone);

		// Cập nhật email từ Account
		account.setEmail(email); // Cập nhật email của Account
		accountDAO.updateAccount(account); // Lưu lại thông tin email của Account
		// Kiểm tra nếu có ảnh mới
		if (file != null && !file.isEmpty()) {
			try {
				// Xử lý tải lên ảnh
				String fileName = uploadFile.handleFileUpload(file); // Gọi phương thức xử lý file
				if (!fileName.equals("Vui lòng chọn file!") && !fileName.equals("Loại file không hợp lệ!")) {
					customer.setImage(fileName); // Cập nhật ảnh vào trường image
				} else {
					model.addAttribute("message", "Lỗi khi tải lên ảnh.");
					return "user/personal"; // Quay lại trang cập nhật thông tin cá nhân
				}
			} catch (IOException e) {
				model.addAttribute("message", "Lỗi khi tải lên ảnh.");
				return "user/personal"; // Quay lại trang cập nhật thông tin cá nhân
			}
		}

		// Cập nhật lại thông tin trong cơ sở dữ liệu
		if (customerDAO.updateCustomer(customer)) {
			// Cập nhật lại thông tin session sau khi cập nhật
			model.addAttribute("message", "Cập nhật thông tin thành công!");
			model.addAttribute("email", "");
			model.addAttribute("name", "");
			model.addAttribute("phone", "");
			session.setAttribute("user", username); // Đảm bảo session giữ tài khoản người dùng
			model.addAttribute("personal", customer); // Truyền lại thông tin cá nhân đã cập nhật
			model.addAttribute("acc", account); // Truyền lại thông tin tài khoản đã cập nhật
			return "user/personal"; // Chuyển hướng về trang thông tin cá nhân
		} else {
			model.addAttribute("message", "Có lỗi xảy ra. Vui lòng thử lại.");
			return "user/personal"; // Quay lại trang nếu có lỗi
		}
	}

	@RequestMapping(value = "update-profile", method = RequestMethod.GET)
	public String showUpdateProfilePage(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		boolean log = Authentication.isLogin(request, response);
		if (!log) {
			return "redirect:login.htm";
		}
		// Lấy thông tin tài khoản từ session
		String username = (String) session.getAttribute("user");
		Account account = accountDAO.getAccountByEmail(username);
		if (account == null) {
			model.addAttribute("message", "Không tìm thấy tài khoản.");
			return "login/login"; // Chuyển hướng đến trang login nếu không tìm thấy tài khoản
		}

		// Lấy thông tin cá nhân
		Customer customer = customerDAO.getCustomerByAccountID(account.getId());
		if (customer == null) {
			model.addAttribute("message", "Không tìm thấy thông tin người dùng.");
			return "login/login"; // Chuyển hướng đến trang login nếu không tìm thấy thông tin cá nhân
		}

		// Đưa thông tin vào model để hiển thị trên form
		model.addAttribute("personal", customer); // Thông tin cá nhân của người dùng
		model.addAttribute("acc", account); // Thông tin tài khoản (email)
		return "user/personal"; // Trả về trang personal.jsp để hiển thị form
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		if (session != null) {
			session.invalidate();
		}
		Authentication.deleteToken(request, response);
		return "redirect:login.htm";
	}

	@RequestMapping(value = "inputemail")
	public String inputEmail(ModelMap model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws IOException {

		boolean log = Authentication.isLogin(request, response);
		if (log) {
			return "redirect:home.htm";
		}

		return "login/inputmail";

	}

	@RequestMapping(value = "inputcode", method = RequestMethod.POST)
	public String inputCode(ModelMap model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws IOException {
		boolean log = Authentication.isLogin(request, response);
		if (log) {
			return "redirect:home.htm";
		}
		String mail = request.getParameter("mail");
		Account acc = accountDAO.getAccountByEmail(mail);
		if (acc == null) {
			model.addAttribute("message", "Mail không tồn tại trên hệ thống!");
			model.addAttribute("email", mail);
			if (session.getAttribute("countmail") == null) {
				session.setAttribute("countmail", 1);
			} else {
				int count = (int) session.getAttribute("countmail");
				if (count == 2) {
					session.invalidate();
					return "redirect:login.htm";
				}
				count = count + 1;
				session.setAttribute("countmail", count);
			}
			return "login/inputmail";
		} else {
			session.setAttribute("mail", mail);

			ExecutorService executorService = Executors.newFixedThreadPool(5);
			executorService.submit(() -> {
				// Gửi code
				String code = Email.getCode();
				session.setAttribute("code", code);
				code = code + " là mã khôi phục tài khoản webshop của bạn!";
				new Email().sendCode(mailSender, mail, code, code);
			});
		}

		return "login/inputcode";

	}

	@RequestMapping(value = "authcode", method = RequestMethod.POST)
	public String authcode(ModelMap model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws IOException {
		boolean log = Authentication.isLogin(request, response);
		if (log) {
			return "redirect:home.htm";
		}
		String code = request.getParameter("code");

		String send = (String) session.getAttribute("code");

		if (code.equals(send)) {
			return "login/newpass";
		} else {
			model.addAttribute("message", "Mã code không chính xác!(Không được nhập sai quá 3 lần)");
			if (session.getAttribute("countcode") == null) {
				session.setAttribute("countcode", 1);
			} else {
				int count = (int) session.getAttribute("countcode");
				if (count == 2) {
					session.invalidate();
					return "redirect:login.htm";
				}
				count = count + 1;
				session.setAttribute("countcode", count);
			}
		}

		return "login/inputcode";

	}

	@RequestMapping(value = "newpass", method = RequestMethod.POST)
	public String newpass(ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws IOException {

		boolean log = Authentication.isLogin(request, response);
		if (log) {
			return "redirect:home.htm";
		}
		String pass = request.getParameter("password");
		String repass = request.getParameter("repass");

		if (!pass.equals(repass)) {

			if (session.getAttribute("countpass") == null) {
				session.setAttribute("countpass", 1);
			} else {
				int count = (int) session.getAttribute("countpass");
				if (count == 2) {
					session.invalidate();

					return "redirect:login.htm";
				}
				count = count + 1;
				session.setAttribute("countpass", count);
			}
			model.addAttribute("message", "Mật khẩu không khớp!");
			model.addAttribute("pass1", pass);
			model.addAttribute("pass2", repass);
			return "login/newpass";
		} else {
			// Kiểm tra mk mạnh
			if (!Bcrypt.isStrongPassword(repass)) {
				model.addAttribute("message",
						"Mật khẩu phải trên 8 ký tự, có chữ hoa chữ thường, số và ký tự đặc biệt!");
				model.addAttribute("pass1", pass);
				model.addAttribute("pass2", repass);
				return "login/newpass";
			} else {
				String email = (String) session.getAttribute("mail");
				Account account = accountDAO.getAccountByEmail(email);
				account.setPassword(Bcrypt.encodePassword(repass));
				accountDAO.updateAccount(account);
				session.invalidate();
			}
			//

		}

		return "redirect:login.htm";

	}
}