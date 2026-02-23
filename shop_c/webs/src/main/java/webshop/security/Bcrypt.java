package webshop.security;

import java.util.Random;

import de.svws_nrw.ext.jbcrypt.BCrypt;

public class Bcrypt {

    // Mã hóa mật khẩu
    public static String encodePassword(String password) {
        return de.svws_nrw.ext.jbcrypt.BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public static boolean matches(String rawPassword, String encodedPassword) {
        return de.svws_nrw.ext.jbcrypt.BCrypt.checkpw(rawPassword, encodedPassword);
    }
    
    public static boolean isStrongPassword(String password) {
        // Độ dài tối thiểu
        if (password.length() < 8) {
            return false;
        }

        // Regex cho từng tiêu chí
        String upperCasePattern = ".*[A-Z].*"; // Ít nhất một chữ cái viết hoa
        String lowerCasePattern = ".*[a-z].*"; // Ít nhất một chữ cái viết thường
        String digitPattern = ".*\\d.*";       // Ít nhất một chữ số
        String specialCharPattern = ".*[!@#$%^&*()\\-+].*"; // Ít nhất một ký tự đặc biệt

        // Kiểm tra từng tiêu chí
        if (!password.matches(upperCasePattern)) {
            return false;
        }
        if (!password.matches(lowerCasePattern)) {
            return false;
        }
        if (!password.matches(digitPattern)) {
            return false;
        }
        if (!password.matches(specialCharPattern)) {
            return false;
        }

        return true; // Mật khẩu đạt yêu cầu
    }
    
    
    public static String generateCaptcha(int length) {
        // Các ký tự có thể có trong CAPTCHA
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder captcha = new StringBuilder();
        Random random = new Random();

        // Tạo chuỗi ngẫu nhiên với độ dài xác định
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length()); // Chọn ký tự ngẫu nhiên
            captcha.append(characters.charAt(index));
        }

        return captcha.toString();
    }

    
}
