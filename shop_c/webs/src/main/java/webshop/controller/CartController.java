package webshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import webshop.dao.AccountDAO;
import webshop.dao.CartDAO;
import webshop.dao.CustomerDAO;
import webshop.dao.ProductDAO;
import webshop.dao.ProductDetailDAO;
import webshop.entity.Account;
import webshop.entity.Cart;
import webshop.entity.Customer;
import webshop.entity.Product;
import webshop.entity.ProductDetail;

@Controller
@RequestMapping(value = "cart")
public class CartController {
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

	@RequestMapping("")
	public String cart(HttpSession session, ModelMap model) {

		List<Cart> dsCart;
		int givenCustomerId;
		String email = (String) session.getAttribute("user");

		if (email != null) {
			Account account = accountDAO.getAccountByEmail(email);
			Customer customer = customerDAO.getCustomerByAccountID(account.getId());
			givenCustomerId = customer.getId();
			dsCart = cartDAO.getAllCarts();
		} else {
			givenCustomerId = 0;
			dsCart = (List<Cart>) session.getAttribute("carts");
		}

		List<ProductDetail> dsDetail = productDetailDAO.getAllProductDetails();
		List<Product> dsProduct = productDAO.getAllProducts();

		// Thay bằng ID của khách hàng mà bạn muốn lọc

		List<Map<String, Object>> cartDetails = new ArrayList<>();

		if (dsCart != null) {
			for (Cart cart : dsCart) {
				if (cart.getStatus() == 0) {
					// Kiểm tra điều kiện customersID
					if (cart.getCustomer().getId() == givenCustomerId) {
						// Tìm ProductDetail tương ứng với product_detailsID trong Cart
						ProductDetail productDetail = dsDetail.stream()
								.filter(detail -> detail.getId() == cart.getProductDetail().getId()) // so sánh ID
								.findFirst().orElse(null);

						if (productDetail != null) {
							// Tìm Product tương ứng với productID trong ProductDetail
							Product product = dsProduct.stream()
									.filter(p -> p.getId() == productDetail.getProduct().getId()).findFirst()
									.orElse(null);

							if (product != null) {
								// Tính tổng tiền
								int quantity = cart.getQuantity();
								int price = productDetail.getPrice();
								int total = price * quantity;

								// Lưu thông tin vào danh sách
								Map<String, Object> detail = new HashMap<>();
								detail.put("cartid", cart.getID());
								detail.put("status", cart.getStatus());
								detail.put("image", product.getImage());
								detail.put("productId", productDetail.getProduct().getId());
								detail.put("name", product.getName());
								detail.put("size", productDetail.getSize().getId());
								detail.put("price", price);
								detail.put("quantity", quantity);
								detail.put("maxQuantity", productDetail.getQuantity());
								detail.put("total", total);

								cartDetails.add(detail);
							}
						}
					}
				}
			}
		}

		// Đưa cartDetails vào model để hiển thị trên giao diện
		model.addAttribute("cartDetails", cartDetails);
		return "user/cart";
	}

	@ResponseBody // Để trả về dữ liệu trực tiếp
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String insert(@RequestParam("pdid") int pdid, @RequestParam("quantity") int quantity, HttpSession session) {

		ProductDetail productDetail = productDetailDAO.getProductDetailById(pdid);
		if (productDetail == null) {
			return "one";
		} else if (quantity < 1 || quantity > productDetail.getQuantity()) {
			return "two";
		}

		String email = (String) session.getAttribute("user");
		List<Cart> carts;

		if (email != null) {
			Account account = accountDAO.getAccountByEmail(email);
			Customer customer = customerDAO.getCustomerByAccountID(account.getId());
			productDetail = productDetailDAO.getProductDetailById(pdid);
			carts = cartDAO.getCartsByCustomerId(customer.getId());

			for (Cart cart : carts) {
				if (cart.getProductDetail().getId() == pdid && cart.getStatus() == 0) {
					if ((cart.getQuantity() + quantity) >= productDetail.getQuantity()) {
						cart.setQuantity(productDetail.getQuantity());
					} else {
						cart.setQuantity(cart.getQuantity() + quantity);
					}
					cartDAO.updateCart(cart);

					carts = cartDAO.getCartsByCustomerId(customer.getId());
					session.setAttribute("carts", carts);
					return "three";
				}
			}

			Cart cart = new Cart(quantity, 0, quantity * productDetail.getPrice(), customer, productDetail);

			cartDAO.createCart(cart);
			carts = cartDAO.getCartsByCustomerId(customer.getId());
		} else {
			carts = (List<Cart>) session.getAttribute("carts");
			if (carts == null) {
				carts = new ArrayList<>();
			} else {
				for (Cart cart : carts) {
					if (cart.getProductDetail().getId() == pdid && cart.getStatus() == 0) {
						if ((cart.getQuantity() + quantity) >= productDetail.getQuantity()) {
							cart.setQuantity(productDetail.getQuantity());
						} else {
							cart.setQuantity(cart.getQuantity() + quantity);
						}

						session.setAttribute("carts", carts);
						return "three";
					}
				}
			}
			Customer customer = new Customer(0);
			Cart cart = new Cart(carts.size() + 1, quantity, 0, quantity * productDetail.getPrice(), customer, productDetail);
			// Thêm sản phẩm vào giỏ
			carts.add(cart);
		}

		session.setAttribute("carts", carts);
		return "four";
	}

	@ResponseBody // Để trả về dữ liệu trực tiếp
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	public String delete(@RequestParam("idCart") int idCart, HttpSession session) {

		List<Integer> selectIdCarts = (List<Integer>) session.getAttribute("selectIdCarts");

		String email = (String) session.getAttribute("user");
		List<Cart> carts = (List<Cart>) session.getAttribute("carts");
		if (email != null) {
			cartDAO.deleteCart(idCart);
			if (selectIdCarts != null && selectIdCarts.contains(idCart)) {
				selectIdCarts.remove(Integer.valueOf(idCart));
			}
		} else {
			if (carts != null) {
				carts.removeIf(cart -> cart.getID() == idCart);
				if (selectIdCarts != null && selectIdCarts.contains(idCart)) {
					selectIdCarts.remove(Integer.valueOf(idCart));
				}
				session.setAttribute("carts", carts);
			}
		}

		session.setAttribute("selectIdCarts", selectIdCarts);
		return "Xóa giỏ hàng thành công!!!";
	}

	@ResponseBody // Để trả về dữ liệu trực tiếp
	@RequestMapping(value = "/upd", method = RequestMethod.GET)
	public String update(@RequestParam("idCart") int idCart, @RequestParam("quantity") int quantity,
			@RequestParam("total") int total, HttpSession session) {
		String email = (String) session.getAttribute("user");

		if (email != null) {
			Cart cart = cartDAO.getCartById(idCart);
			cart.setQuantity(quantity);
			cart.setTotalPrice(total);
			cartDAO.updateCart(cart);
		} else {
			List<Cart> carts = (List<Cart>) session.getAttribute("carts");
			if (carts != null) {
				Cart cart = carts.stream().filter(c -> c.getID() == idCart).findFirst().orElse(null);

				if (cart != null) {
					cart.setQuantity(quantity);
					cart.setTotalPrice(total);
				}
			}
		}

		return "Sửa số lượng thành công!!!";
	}

	@ResponseBody // Để trả về dữ liệu trực tiếp
	@RequestMapping(value = "select/{idCart}", method = RequestMethod.GET)
	public String selectedIdCart(@PathVariable("idCart") Integer idCart, @RequestParam("checkvalue") Boolean checkvalue,
			HttpSession session, ModelMap model) {

		List<Integer> selectIdCarts = (List<Integer>) session.getAttribute("selectIdCarts");
		if (selectIdCarts == null) {
			selectIdCarts = new ArrayList<>();
		}

		if (checkvalue == null) {
			return "Hớ???";
		}

		String email = (String) session.getAttribute("user");

		if (email != null) {
			Account account = accountDAO.getAccountByEmail(email);
			Customer customer = customerDAO.getCustomerByAccountID(account.getId());
			Cart cart = cartDAO.getCartById(idCart);
			if (cart.getCustomer().getId() != customer.getId()) {
				return "Hả???";
			} else {
				if (checkvalue != null && checkvalue) {
					if (!selectIdCarts.contains(idCart)) {
						selectIdCarts.add(idCart);
					}
				} else {
					selectIdCarts.remove(Integer.valueOf(idCart));
				}
			}

		} else {
			List<Cart> carts = (List<Cart>) session.getAttribute("carts");
			if (carts != null) {
				Cart cart = carts.stream().filter(c -> c.getID() == idCart).findFirst().orElse(null);

				if (cart != null) {
					if (checkvalue != null && checkvalue) {
						if (!selectIdCarts.contains(idCart)) {
							selectIdCarts.add(idCart);
						}
					} else {
						selectIdCarts.remove(Integer.valueOf(idCart));
					}
				}
			}
		}

		session.setAttribute("selectIdCarts", selectIdCarts);
		return "OK!!!";
	}

}