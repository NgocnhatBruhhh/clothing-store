package webshop.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import webshop.dao.AccountDAO;
import webshop.dao.CartDAO;
import webshop.dao.CustomerDAO;
import webshop.entity.Account;
import webshop.entity.Cart;
import webshop.entity.Customer;

@Component("CartInterceptor")
public class CartInterceptor implements HandlerInterceptor {

	@Autowired
	AccountDAO accountDAO;
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	CartDAO cartDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		List<Cart> cartList = null;
		int customerId = 0;
		int quantityCart = 0;

		if (session != null) {
			String email = (String) session.getAttribute("user");

			if (email != null) {
				// Fetch account and customer info
				Account account = accountDAO.getAccountByEmail(email);
				if (account != null) {
					Customer customer = customerDAO.getCustomerById(account.getId());
					if (customer != null) {
						customerId = customer.getId();
						cartList = cartDAO.getCartsByCustomerId(customerId);
					}
				}
			} else {
				// Handle guest user's cart
				cartList = (List<Cart>) session.getAttribute("carts");
			}
		}
		
		if (cartList != null) {
			for (Cart cart : cartList) {
				if (cart.getStatus() == 0) {
					quantityCart++;
				}
			}
		}

		request.setAttribute("quantityCart", quantityCart);

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			org.springframework.web.servlet.ModelAndView modelAndView) throws Exception {
		// No specific action required for now
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// No specific action required for now
	}
}