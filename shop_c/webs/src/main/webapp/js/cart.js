/**
 * 
 */
// Cập nhật tổng tiền
function updateTotal(input) {
	const cartId = input.closest('tr').id.replace('cart', '');  // Lấy cartId từ id của hàng
	const priceElement = document.getElementById(`price${cartId}`);
	const price = parseFloat(priceElement.querySelector('.u-price').dataset.price);  // Lấy đơn giá
	const quantity = parseInt(input.value, 10) || 0;  // Lấy số lượng từ input

	// Tính tổng tiền
	const total = Math.round(price * quantity);  // Làm tròn tổng tiền thành số nguyên
	const formattedTotal = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(total);

	// Cập nhật tổng tiền trong giao diện
	const totalElement = document.getElementById(`total${cartId}`);
	totalElement.querySelector('.u-price').textContent = formattedTotal;  // Hiển thị tổng tiền mà không có thập phân

	// Cập nhật dữ liệu tổng tiền trong thẻ
	totalElement.querySelector('.u-price').setAttribute('data-total', total);

	// Có thể gọi API hoặc thực hiện các thao tác khác nếu cần thiết (ví dụ: gửi dữ liệu về server)
	updateCartTotal(cartId, total, quantity);
}

function updateCartTotal(idCart, total, quantity) {
	fetch(`cart/upd.htm?idCart=${idCart}&quantity=${quantity}&total=${total}`, {
		method: 'GET',
		headers: {
			'Accept': 'text/plain' // Server trả về định dạng text
		}
	})
		.then(response => response.text())  // Server trả về chuỗi
		.then(data => {
			console.log(data);
		})
		.catch(error => console.error('Lỗi:', error));
}

// Quản lý số lượng cho các phần không yêu cầu chọn size
function changeCartQuantity(button, action, maxQuantity) {
	const input = button.closest('.u-quantity-input').querySelector('.quantity-input');
	let quantity = parseInt(input.value, 10) || 0;

	if (action === 'plus') {
		if (quantity < maxQuantity) quantity++;
	} else if (action === 'minus') {
		if (quantity > 1) quantity--;
	}

	input.value = quantity;

	// Gọi hàm cập nhật tổng tiền
	updateTotal(input);
	updateSelectedTotal();
}

// Xử lý kiểm tra giá trị nhập trực tiếp
document.querySelectorAll('.quantity-input').forEach(input => {
	input.addEventListener('input', function(event) {
		let value = parseInt(event.target.value);
		const maxQuantity = parseInt(event.target.closest('.u-quantity-input').getAttribute('data-max-quantity')); // Lấy max từ thuộc tính

		// Kiểm tra giá trị nhập vào
		if (isNaN(value) || value <= 0) {
			alert("Số lượng phải lớn hơn 0");
			event.target.value = 1;
		} else if (value > maxQuantity) {
			alert(`Số lượng tối đa là ${maxQuantity}`);
			event.target.value = maxQuantity;
		}

		// Cập nhật tổng tiền sau khi chỉnh sửa
		updateTotal(event.target);
		updateSelectedTotal();
	});
});

// Cập nhật tổng tiền các món được chọn
function updateSelectedTotal() {
	let total = 0;

	// Lấy tất cả các checkbox
	document.querySelectorAll('.u-checkbox').forEach(checkbox => {
		if (checkbox.checked) {
			// Nếu checkbox được chọn, cộng tổng tiền món vào
			const cartId = checkbox.id.replace('checkbox', '');  // Lấy cartId từ id của checkbox
			const totalElement = document.getElementById(`total${cartId}`);
			//const itemTotal = parseFloat(totalElement.querySelector('.u-price').textContent) || 0;
			const itemTotal = parseFloat(totalElement.querySelector('.u-price').getAttribute('data-total')) || 0;
			total += itemTotal;
		}
	});

	// Cập nhật tổng tiền trong phần tử tổng tiền
	const totalPriceElement = document.getElementById('totalPrice');
	const formattedTotal = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(total);
	totalPriceElement.textContent = formattedTotal;  // Hiển thị tổng tiền, không có phần thập phân
}

// Lắng nghe sự kiện thay đổi trạng thái checkbox
document.querySelectorAll('.u-checkbox').forEach(checkbox => {
	checkbox.addEventListener('change', updateSelectedTotal);
});

// Gọi hàm updateSelectedTotal khi trang được tải để tính toán tổng tiền ban đầu (nếu cần thiết)
window.onload = function() {
	updateSelectedTotal();
};

function deleteCart(idCart) {
	// Hiển thị thông báo xác nhận
	const isConfirmed = window.confirm("Bạn có chắc chắn muốn xóa sản phẩm này?");
	const oldQuantityCartText = document.querySelector('#quantityCart').innerHTML.trim();
	const oldQuantityCart = parseInt(oldQuantityCartText, 10) || 0;
	const newQuantityCart = oldQuantityCart - 1;

	// Nếu người dùng chọn "OK" (true), tiếp tục thực hiện xóa
	if (isConfirmed) {
		fetch('cart/del.htm?idCart=' + idCart, {
			method: 'GET',
			headers: {
				'Accept': 'text/plain' // Server trả về định dạng text
			}
		})
			.then(response => response.text())  // Server trả về chuỗi
			.then(data => {
				console.log(data);
				const allCartProducts = document.querySelectorAll('.cartProduct');
				if (allCartProducts.length === 1) {
					window.location.href = 'cart.htm';
				} else {
					deleteElementById(idCart);  // Xóa phần tử HTML tương ứng với idCart
					document.querySelector('#quantityCart').innerHTML = newQuantityCart;
				}
			})
			.catch(error => console.error('Lỗi:', error));
	} else {
		// Nếu người dùng chọn "Cancel", không làm gì cả
		console.log('Đã hủy xóa sản phẩm');
	}
}

function deleteElementById(id) {
	const element = document.getElementById(id); // Tìm thẻ theo id
	if (element) {
		element.remove(); // Xóa thẻ và tất cả nội dung bên trong
		console.log(`Đã xóa thẻ với id: ${id}`);
		updateSelectedTotal();
	} else {
		console.log(`Không tìm thấy thẻ với id: ${id}`);
	}
}

document.getElementById('confirmBtn').addEventListener('click', function(event) {
	// Lấy tất cả checkbox đã được chọn
	const checkboxes = document.querySelectorAll('.u-checkbox');
	const selectedIds = Array.from(checkboxes)
		.filter(checkbox => checkbox.checked) // Lọc checkbox được chọn
		.map(checkbox => checkbox.id.replace('checkbox', '')); // Lấy idCart từ id của checkbox

	if (selectedIds.length > 0) {
		window.location.href = 'payment.htm';
	} else {
		// Nếu không có checkbox nào được chọn, hiển thị cảnh báo
		alert('Vui lòng chọn ít nhất một sản phẩm để tiếp tục thanh toán.');
		event.preventDefault(); // Ngăn hành động mặc định
	}
});

document.querySelectorAll('.u-checkbox').forEach(checkbox => {
	checkbox.addEventListener('change', function() {
		// Lấy cartid từ ID của checkbox
		const cartid = this.id.replace('checkbox', '');
		const checkvalue = this.checked ? 1 : 0; // Lấy giá trị dựa trên trạng thái của checkbox

		// Gửi yêu cầu fetch
		fetch(`cart/select/${cartid}.htm?checkvalue=${checkvalue}`, {
			method: 'GET',
			headers: {
				'Accept': 'text/plain' // Server trả về định dạng text
			}
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('Lỗi!!!');
				}
				return response.text(); // Chuyển đổi phản hồi thành text
			})
			.then(data => {
				console.log(data);
			})
			.catch(error => {
				console.error('Lỗi!!!', error);
			});
	});
});

