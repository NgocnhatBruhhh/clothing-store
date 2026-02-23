function addToCart() {

	const selectedSize = document.querySelector('.sizebutton.selected'); // Lấy size đã chọn
	const oldQuantityCartText = document.querySelector('#quantityCart').innerHTML.trim();
	const oldQuantityCart = parseInt(oldQuantityCartText, 10) || 0;
	const newQuantityCart = oldQuantityCart + 1;

	if (!selectedSize) {
		alert("Vui lòng chọn size trước khi thêm vào giỏ hàng!"); // Hiển thị cảnh báo nếu chưa chọn size
		return;
	}

	const quantity = document.getElementById("quantityInput");
	fetch('cart/add.htm?pdid=' + selectedSize.id + '&quantity=' + quantity.value, {
		method: 'GET',
		headers: {
			'Accept': 'text/plain' // Server trả về định dạng text
		}
	})
		.then(response => response.text())  // Server trả về chuỗi
		.then(data => {
			if (data === 'one') {
				console.log('Không có sản phẩm này!!! - ' + data);
				alert('Không có sản phẩm này!!!');
			} else if (data === 'two') {
				console.log('Số lượng không hợp lệ!!! - ' + data);
				alert('Số lượng không hợp lệ!!!');
			} else if (data === 'three') {
				console.log('Sản phẩm đã có trong giỏ hàng!!! - ' + data);
				alert('Sản phẩm đã có trong giỏ hàng!!!');
			} else {
				console.log('Thêm sản phẩm thành công! - ' + data);
				document.querySelector('#quantityCart').innerHTML = newQuantityCart;
				alert('Sản phẩm đã thêm vào giỏ hàng!!!');
			}
		})
		.catch(error => console.error('Lỗi:', error));
}

let maxQuantity = 0;  // Biến lưu trữ số lượng tối đa

// Hàm chọn size và cập nhật giá trị số lượng tối đa
function selectSize(button, sizeId, price, quantity) {
	// Deselect tất cả các nút trước đó
	const buttons = document.querySelectorAll('.sizebutton');
	const oldQuantity = document.getElementById("quantityInput").value;
	buttons.forEach(btn => {
		btn.classList.remove('selected');
		btn.textContent = btn.textContent.replace(" (Đang chọn)", "");  // Xóa chữ "Đang chọn"
	});

	// Chọn nút hiện tại
	button.classList.add('selected');
	button.textContent += " (Đang chọn)";  // Thêm chữ "Đang chọn" vào nút

	// Cập nhật giá cho size đã chọn
	const priceElement = document.getElementById("price");
	priceElement.textContent = price;  // Cập nhật giá hiển thị

	// Cập nhật số lượng tối đa dựa trên size được chọn
	maxQuantity = parseInt(quantity);  // Thiết lập maxQuantity theo số lượng của sản phẩm
	document.getElementById("quantityInput").value = oldQuantity;
}

// Hàm thay đổi số lượng (tăng hoặc giảm)
function changeQuantity(action) {
	const selectedSize = document.querySelector('.sizebutton.selected'); // Lấy size đã chọn
	if (!selectedSize) {
		alert("Vui lòng chọn size trước khi thay đổi số lượng!"); // Hiển thị cảnh báo nếu chưa chọn size
		return;
	}

	const inputField = document.getElementById("quantityInput");
	let currentQuantity = parseInt(inputField.value);

	// Kiểm tra hành động (tăng hoặc giảm) và thay đổi giá trị
	if (action === 'plus') {
		if (currentQuantity < maxQuantity) {
			inputField.value = currentQuantity + 1;
		}
	} else if (action === 'minus') {
		if (currentQuantity > 1) {
			inputField.value = currentQuantity - 1;
		}
	}
}

// Kiểm tra tính hợp lệ của giá trị trong input (không cho số âm, chữ, và số 0)
document.getElementById("quantityInput").addEventListener("input", function(event) {
	let value = event.target.value;

	// Kiểm tra giá trị hợp lệ
	if (isNaN(value) || value <= 0) {
		event.target.value = 1;  // Nếu giá trị không hợp lệ, reset về 1
	} else if (parseInt(value) > maxQuantity) {
		event.target.value = maxQuantity;  // Giới hạn không vượt quá số lượng tối đa
	}
});
