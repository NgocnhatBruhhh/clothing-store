package webshop.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import webshop.dao.AccountDAO;
import webshop.dao.CustomerDAO;
import webshop.entity.Account;
import webshop.entity.Customer;

@Controller
public class Authentication {
	

	public static int redirectAuthen(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession ses = request.getSession(false);
		
		if(ses ==  null) {
			deleteToken(request, response);
			return 0;
		}
		
		if(ses.getAttribute("user") ==  null) {
			deleteToken(request, response);
			return 0;
		}
		
    	Cookie[] cookies = request.getCookies();
    	String jwtToken = null;
    	
   
        
        if (cookies != null) {
            // Duyệt qua từng cookie
            for (Cookie cookie : cookies) {
                // Kiểm tra xem cookie có tên "JWT" không
                if ("JWT".equals(cookie.getName())) {
                    jwtToken = (String)cookie.getValue();  // Trả về giá trị của cookie (token JWT)
                    break;
                }
            }
        }
                
        
        if(jwtToken == null) {
        	
        	return 0;
        }
        if(!JwtUtil.validateToken(jwtToken)) {

        	return 0; //chưa đăng nhập, hoặc token fake
        }
        
        String token = JwtUtil.extractJWT(jwtToken);
        if(token.equals(Roles.getAdmin())) {
        	return 1; //quản trị
        }
        if(token.equals(Roles.getEmployee())) {
        	return 2; //nhân viên
        }
        return 3; //user

    }
	
	
	
	
	public static void deleteToken(HttpServletRequest request, HttpServletResponse response) {
			 
		 Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            // 3. Tìm cookie có tên "JWT"
	            if ("JWT".equals(cookie.getName())) {
	                // 4. Cập nhật giá trị của cookie
	                cookie.setValue(null); // Hoặc có thể đặt giá trị mới nếu cần
	                cookie.setMaxAge(0); // Đặt maxAge là 0 để xóa cookie
	                cookie.setPath("/"); // Đảm bảo path khớp với khi tạo
	                cookie.setHttpOnly(true); // Đảm bảo HttpOnly khớp
	                cookie.setSecure(false); // Đặt false nếu không dùng HTTPS
	                response.addCookie(cookie); // Cập nhật cookie trong response
	                return;
	            }
	        }
	    }
	 }
	
	public static void addToken(String role, HttpServletResponse response) {
		//Lưu vào session bằng JWT
		String token = JwtUtil.generateToken(role);
		
		//Lưu jwttoken vào Cookies
		Cookie cookie = new Cookie("JWT", token);  // "JWT" là tên của cookie
	    cookie.setHttpOnly(true);  // Đảm bảo cookie không thể bị truy cập qua JavaScript
	    cookie.setSecure(false);  // Đảm bảo cookie chỉ được gửi qua HTTPS
	    //cookie.setDomain("abc.com");   
	    cookie.setPath("/");  // Đảm bảo cookie có thể truy cập trên toàn bộ ứng dụng
	    cookie.setMaxAge(-1);    // Thời gian sống của cookie khi tắt trình duyệt
	    response.addCookie(cookie);
	}
	
	
	
	
	
	
	public static boolean isLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	Cookie[] cookies = request.getCookies();
    	String jwtToken = "";
    	
        
        if (cookies != null) {
            // Duyệt qua từng cookie
            for (Cookie cookie : cookies) {
                // Kiểm tra xem cookie có tên "JWT" không
                if ("JWT".equals(cookie.getName())) {
                    jwtToken = (String)cookie.getValue();  // Trả về giá trị của cookie (token JWT)
                    break;
                }
            }
        }

        if(!JwtUtil.validateToken(jwtToken)) {
        	
        	return false;
        }
        return true;
	
	}
	
	
	public static int getCountForCapCha(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
    	String jwtToken = null;
    	
   
        
        if (cookies != null) {
            // Duyệt qua từng cookie
            for (Cookie cookie : cookies) {
                // Kiểm tra xem cookie có tên "JWT" không
                if ("count".equals(cookie.getName())) {
                    jwtToken = (String)cookie.getValue();  // Trả về giá trị của cookie (token JWT)
                    break;
                }
            }
        }
        
        if(jwtToken == null) return 0;
        if(!JwtUtil.validateToken(jwtToken)) return 0;
        
        
        String rs = JwtUtil.extractJWT(jwtToken);
        
        return Integer.parseInt(rs);
	}
	
	
	public static void deleteCount(HttpServletRequest request, HttpServletResponse response) {
		 
		 Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            // 3. Tìm cookie có tên "JWT"
	            if ("count".equals(cookie.getName())) {
	                // 4. Cập nhật giá trị của cookie
	                cookie.setValue(null); // Hoặc có thể đặt giá trị mới nếu cần
	                cookie.setMaxAge(0); // Đặt maxAge là 0 để xóa cookie
	                cookie.setPath("/"); // Đảm bảo path khớp với khi tạo
	                cookie.setHttpOnly(true); // Đảm bảo HttpOnly khớp
	                cookie.setSecure(false); // Đặt false nếu không dùng HTTPS
	                response.addCookie(cookie); // Cập nhật cookie trong response
	                return;
	            }
	        }
	    }
	 }
	
	public static void addTokenCount(int count, HttpServletResponse response) {
		//Lưu vào session bằng JWT
		String token = JwtUtil.generateToken(Integer.toString(count));
		
		//Lưu jwttoken vào Cookies
		Cookie cookie = new Cookie("count", token);  // "JWT" là tên của cookie
	    cookie.setHttpOnly(true);  // Đảm bảo cookie không thể bị truy cập qua JavaScript
	    cookie.setSecure(false);  // Đảm bảo cookie chỉ được gửi qua HTTPS
	    //cookie.setDomain("abc.com");   
	    cookie.setPath("/");  // Đảm bảo cookie có thể truy cập trên toàn bộ ứng dụng
	    cookie.setMaxAge(-1);    // Thời gian sống của cookie khi tắt trình duyệt
	    response.addCookie(cookie);
	}
	
	
	
}
