package webshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import webshop.dao.AccountDAO;
import webshop.dao.BrandDAO;
import webshop.dao.CartDAO;
import webshop.dao.CustomerDAO;
import webshop.dao.FeedbackDAO;
import webshop.dao.MaterialDAO;
import webshop.dao.OrderDAO;
import webshop.dao.OrderDetailDAO;
import webshop.dao.OrderStatusDAO;
import webshop.dao.OriginDAO;
import webshop.dao.PaymentMethodDAO;
import webshop.dao.ProductDAO;
import webshop.dao.ProductDetailDAO;
import webshop.dao.ReasonDAO;
import webshop.dao.SizeDAO;
import webshop.dao.StaffDAO;
import webshop.dao.TypeDAO;
import webshop.entity.Account;
import webshop.entity.Cart;
import webshop.entity.Customer;
import webshop.entity.Feedback;
import webshop.entity.Order;
import webshop.entity.OrderDetail;
import webshop.entity.OrderDetailId;
import webshop.entity.OrderStatus;
import webshop.entity.Product;
import webshop.entity.ProductDetail;
import webshop.entity.Reason;
import webshop.entity.Size;
import webshop.entity.Staff;

@Controller
public class TestController {

	@Autowired
	AccountDAO accd;
	@Autowired
	CustomerDAO cusd;
	@Autowired
	CartDAO cartd;
	@Autowired
	ProductDAO prd;
	@Autowired
	BrandDAO brd;
	@Autowired
	TypeDAO tyd;
	@Autowired
	OriginDAO ord;
	@Autowired
	MaterialDAO mad;
	@Autowired
	ProductDetailDAO prdd;
	@Autowired
	SizeDAO sid;
	@Autowired
	FeedbackDAO fed;
	@Autowired
	OrderDAO ordd;
	@Autowired
	OrderStatusDAO osd;
	@Autowired
	PaymentMethodDAO pmd;
	@Autowired
	OrderDetailDAO oddd;
	@Autowired
	ReasonDAO rd;
	@RequestMapping("/TestController")
	public String test( ModelMap model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession(false);
		//Account acc=accd.getAccountByEmail("user1@example.com");
//		Customer s=cusd.getCustomerById(3);
//		s.setImage("duong 23");
//		s.setName("hioio");
//		s.setPhone("0001122");
//		s.setAccount(acc);
//		s.setId(3);
//		List<Order> list=ordd.getOrdersByCustomerId(2);
//		Feedback fb=new Feedback();
//		fb.setCustomer(cusd.getCustomerById(1));
//		fb.setProduct(prd.getProductById(2));
//		fb.setDescription("hahah99999");
//		fb.setId(7);
//		
//		List<Cart> list=cartd.getCartsByCustomerId(2);
//		OrderDetail ot=new OrderDetail();
//		OrderDetailId otid=new OrderDetailId();
//		otid.setOrdersID(2);
//		otid.setProduct_detailsID(2);
//		ot.setId(otid);
//		ot.setQuantity(3);
//		ot.setUnitPrice(15000);
		
//		boolean rs=oddd.deleteOrderDetail(otid);
//		rs=brandDAO.deleteBrand(3);
		
		Reason newReason = new Reason();
		newReason.setName("Delivery Delay2");
		boolean rs=rd.addReason(newReason);
//		List<Reason> reasons = rd.getAllReasons();
//		Reason reasonToUpdate = rd.getReasonById(1);
//		reasonToUpdate.setName("testupdate");
//		boolean rs=rd.deleteReason(1);
		model.addAttribute("message", rs);
		
		return "test";
	}
}
