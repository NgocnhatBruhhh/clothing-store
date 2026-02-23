package webshop.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import webshop.dao.AccountDAO;
import webshop.dao.CartDAO;
import webshop.dao.CustomerDAO;
import webshop.dao.OrderDAO;
import webshop.dao.OrderDetailDAO;
import webshop.dao.OrderStatusDAO;
import webshop.dao.PaymentMethodDAO;
import webshop.dao.ProductDAO;
import webshop.dao.ProductDetailDAO;
import webshop.dao.ReasonDAO;
import webshop.entity.Account;
import webshop.entity.Cart;
import webshop.entity.Customer;
import webshop.entity.Order;
import webshop.entity.OrderDetail;
import webshop.entity.OrderStatus;
import webshop.entity.Product;
import webshop.entity.ProductDetail;
import webshop.entity.Reason;

@Controller
@RequestMapping(value = "order")
public class OrderController {

	@Autowired
	AccountDAO accountDAO;
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ProductDetailDAO productDetailDAO;
	@Autowired
	CartDAO cartDAO;
	@Autowired
	PaymentMethodDAO paymentMethodDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@Autowired
	OrderStatusDAO orderStatusDAO;
	@Autowired
	ReasonDAO reasonDAO;

	@RequestMapping("")
	public String order(
	        @RequestParam(value = "idstatus", required = false) Integer idstatus,
	        @RequestParam(value = "idorder", required = false) Integer idorder,
	        @RequestParam(value = "fromDate", required = false) String fromDate,
	        @RequestParam(value = "toDate", required = false) String toDate,
	        HttpSession session, 
	        ModelMap model) {

	    if (session.getAttribute("user") == null) {
	        return "redirect:/login.htm";
	    }

	    String email = (String) session.getAttribute("user");
	    Account account = accountDAO.getAccountByEmail(email);
	    Customer customer = customerDAO.getCustomerByAccountID(account.getId());

	    List<Order> orders = orderDAO.getOrdersByCustomerId(customer.getId());
	    List<Map<String, Object>> ordersList = new ArrayList<>();
	    
	    if(idorder != null) {
	    	Order order = orderDAO.getOrderById(idorder);
	    	if(order == null || order.getCustomer().getId() != customer.getId()) {
	    		model.addAttribute("orders", ordersList);
	    	    return "user/order/index";
	    	}
	    	 Map<String, Object> ordersMap = new HashMap<>();
	    	int totalQuantity = 0;
            List<OrderDetail> orderDetails = orderDetailDAO.getOrderDetailsByOrderId(order.getId());

            for (OrderDetail orderDetail : orderDetails) {
                totalQuantity += orderDetail.getQuantity();
            }
            ordersMap.put("order", order);
            ordersMap.put("totalQuantity", totalQuantity);
            ordersList.add(ordersMap);
            model.addAttribute("orders", ordersList);
    	    return "user/order/index";
	    }
	    
	    if (orders != null) {
	        for (Order order : orders) {
	            boolean matchesStatus;
	            if (idstatus != null && idstatus == 1) {
	                matchesStatus = order.getPaymentStatus() == 0;
	            } else {
	                matchesStatus = (idstatus == null || order.getOrderStatus().getId() == idstatus);
	            }

	            boolean matchesDateRange = isWithinDateRange(order, fromDate, toDate);

	            if (matchesStatus && matchesDateRange) {
	                Map<String, Object> ordersMap = new HashMap<>();
	                int totalQuantity = 0;
	                List<OrderDetail> orderDetails = orderDetailDAO.getOrderDetailsByOrderId(order.getId());

	                for (OrderDetail orderDetail : orderDetails) {
	                    totalQuantity += orderDetail.getQuantity();
	                }
	                ordersMap.put("order", order);
	                ordersMap.put("totalQuantity", totalQuantity);
	                ordersList.add(ordersMap);
	            }
	        }
	    }

	    Collections.reverse(ordersList);
	    model.addAttribute("orders", ordersList);
	    return "user/order/index";
	}

	private boolean isWithinDateRange(Order order, String fromDate, String toDate) {
		if (fromDate == null && toDate == null) {
			return true;
		}

		// Lấy ngày tạo của đơn hàng (chuyển sang LocalDateTime)
		Date orderDate = order.getCreateTime();
		LocalDateTime orderDateTime = orderDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		// Kiểm tra ngày từ
		if (fromDate != null) {
			LocalDateTime from = LocalDateTime.parse(fromDate + "T00:00:00");
			if (orderDateTime.isBefore(from)) {
				return false;
			}
		}

		// Kiểm tra ngày đến
		if (toDate != null) {
			LocalDateTime to = LocalDateTime.parse(toDate + "T23:59:59");
			if (orderDateTime.isAfter(to)) {
				return false;
			}
		}

		return true;
	}

	@RequestMapping("orderdetail/{idOrder}")
	public String orderdetail(@PathVariable("idOrder") Integer idOrder, HttpSession session, ModelMap model) {
		session.removeAttribute("idOrderResult");
		
		if (session.getAttribute("user") == null) {
			return "redirect:/login.htm";
		} else if (idOrder == null) {
			return "redirect:/order.htm";
		}

		String email = (String) session.getAttribute("user");
		Account account = accountDAO.getAccountByEmail(email);
		Customer customer = customerDAO.getCustomerByAccountID(account.getId());

		Order order = orderDAO.getOrderById(idOrder);
		if (order == null  || order.getCustomer().getId() != customer.getId()) {
			return "redirect:/order.htm";
		}

		List<OrderDetail> orderDetails = orderDetailDAO.getOrderDetailsByOrderId(idOrder);
		List<Map<String, Object>> orderDetailsList = new ArrayList<Map<String, Object>>();

		if (orderDetails != null) {
			for (OrderDetail orderDetail : orderDetails) {
				Map<String, Object> orderDetailsMap = new HashMap<String, Object>();
				ProductDetail productDetail = orderDetail.getProductDetail();
				Product product = productDetail.getProduct();

				orderDetailsMap.put("product", product);
				orderDetailsMap.put("productDetail", productDetail);
				orderDetailsMap.put("orderDetail", orderDetail);
				orderDetailsList.add(orderDetailsMap);
			}
		} else {
			return "redirect:/order.htm";
		}

		model.addAttribute("order", order);
		model.addAttribute("orderDetails", orderDetailsList);
		model.addAttribute("cancelReasons", reasonDAO.getAllReasons());
		model.addAttribute("paymentMethods", paymentMethodDAO.getAllPaymentMethods());

		return "user/order/detail";
	}

	@RequestMapping("cancel/{idOrder}")
	public String cancel(@PathVariable("idOrder") Integer idOrder, @RequestParam("IdReason") Integer IdReason,
			HttpSession session, ModelMap model) {

		if (session.getAttribute("user") == null) {
			return "redirect:/login.htm";
		} else if (idOrder == null) {
			return "redirect:/order.htm";
		} else if (IdReason == null) {
			return "redirect:/order.htm";
		}

		String email = (String) session.getAttribute("user");
		Account account = accountDAO.getAccountByEmail(email);
		Customer customer = customerDAO.getCustomerByAccountID(account.getId());

		Order order = orderDAO.getOrderById(idOrder);
		if (order == null || (order.getOrderStatus().getId() != 1 && order.getOrderStatus().getId() != 2) || order.getCustomer().getId() != customer.getId()) {
			return "redirect:/order.htm";
		}

		List<OrderDetail> orderDetails = orderDetailDAO.getOrderDetailsByOrderId(idOrder);
		List<Cart> carts = cartDAO.getCartsByCustomerId(customer.getId());

		if (orderDetails != null) {
			for (OrderDetail orderDetail : orderDetails) {
				ProductDetail productDetail = orderDetail.getProductDetail();
				Product product = productDetail.getProduct();

				Integer total = (int) (orderDetail.getQuantity() * orderDetail.getUnitPrice());
				Boolean flag = true;

				if (carts != null) {
					for (Cart cart : carts) {
						if (cart.getProductDetail().getId() == productDetail.getId()) {
							cart.setQuantity(orderDetail.getQuantity());
							cart.setTotalPrice(total);

							cartDAO.updateCart(cart);
							flag = false;
							break;
						}
					}
				}
				if (flag) {
					Cart cart = new Cart(orderDetail.getQuantity(), 0, total, customer, productDetail);
					cartDAO.createCart(cart);
				}

				productDetail.setQuantity(productDetail.getQuantity() + orderDetail.getQuantity());
				productDetailDAO.updateProductDetail(productDetail);
			}
		} else {
			return "redirect:/order.htm";
		}

		Date currentDate = new Date();
		order.setOrderStatus(orderStatusDAO.getOrderStatusById(5));
		order.setUpdateTime(currentDate);
		order.setReason(reasonDAO.getReasonById(IdReason));
		orderDAO.updateOrder(order);

		return "redirect:/order/orderdetail/" + idOrder + ".htm";
	}
}
