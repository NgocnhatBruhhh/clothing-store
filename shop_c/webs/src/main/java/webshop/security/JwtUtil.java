package webshop.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import java.security.Key;
import java.util.Base64;
import java.util.Date;

import javax.crypto.SecretKey;

import org.springframework.stereotype.Component;

@Component
public class JwtUtil {
	
	// Sử dụng Keys.secretKeyFor để tạo khóa có kích thước đủ mạnh cho HS256
	//Sau này triển khai luôn thì dùng chứ mỗi lần chạy code nó đổi key khác nhau phiền trong việc code
	
    //private static final Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
	
	public static int timeExpired = 10; //60*60 = 1 giờ hết hạn
	
	//Dùng tạm khóa cố định này
	 private static final String SECRET_KEY_BASE64 = "Y2YyM2FjYjM3Y2YyZmY2ZGM4YzZmZGNkYmFzY29mamNhamRpZnJoY2ZodW15cWV0cmS";// Thay bằng một chuỗi Base64 có độ dài đủ mạnh
	    
	    // Chuyển chuỗi Base64 thành Key
    private static final Key key = Keys.hmacShaKeyFor(Base64.getDecoder().decode(SECRET_KEY_BASE64));
	

	
    // Phương thức static để tạo token
    public static String generateToken(String pretoken) {
        return Jwts.builder()
                .setSubject(pretoken)
                .setIssuedAt(new Date())
                //.setExpiration(new Date(System.currentTimeMillis() + 1000 * timeExpired )) // 1 giờ
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    // Phương thức static để xác thực token
    public static boolean validateToken(String token) {
    	if(token.equals("")) return false;
        try {
            Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);
            return true;
        } catch (JwtException e) {
            return false;
        }
    }


    public static String extractJWT(String token) {
    	if(token.equals("")) return "";
        return Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody()
                .getSubject();
    }
}
