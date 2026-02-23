package webshop.security;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;

//Lọc chuỗi chống tấn công XSS

public class XSS {


	public static String sanitizeInput(String input) {
		
		String s  = Jsoup.clean(input, Safelist.basic());
	    if(s.equals("")) {
	    	s = "Sao lại dùng XSS???";
	    }
	    return s;
	}
	
	
}
