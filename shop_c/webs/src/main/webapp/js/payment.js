/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() {
	const form = document.querySelector("form");
	const nameInput = document.getElementById("name");
	const phoneInput = document.getElementById("phone");
	const addressInput = document.getElementById("address");
	const paymentSelect = document.getElementById("payment");

	form.addEventListener("submit", function(event) {
		let isValid = true;
		let errorMessage = "";

		// Regular expression to detect HTML tags
		const htmlRegex = /<[^>]*>/g;

		// Validate Tên
		if (nameInput.value.trim() === "" || htmlRegex.test(nameInput.value.trim())) {
			isValid = false;
			errorMessage += "Tên không được để trống!!!\n";
		}

		// Validate Số điện thoại
		const phoneRegex = /^[0-9]{10}$/;
		if (!phoneRegex.test(phoneInput.value.trim())) {
			isValid = false;
			errorMessage += "Số điện thoại không hợp lệ!!!\n";
		}

		// Validate Địa chỉ
		if (addressInput.value.trim() === "" || htmlRegex.test(addressInput.value.trim())) {
			isValid = false;
			errorMessage += "Địa chỉ không được để trống!!!\n";
		}

		// Validate Phương thức thanh toán
		if (paymentSelect.value === "") {
			isValid = false;
			errorMessage += "Vui lòng chọn phương thức thanh toán.\n";
		}

		// Nếu có lỗi, hiển thị và ngăn form submit
		if (!isValid) {
			alert(errorMessage);
			event.preventDefault();
		}
	});

	function setDefaultFormAction() {
		const selectedValue = paymentSelect.value;
		const product0 = document.getElementById("product0"); // Kiểm tra sự tồn tại của phần tử có id="product0"
		const table = document.querySelector("table");
		const idOrder = table ? table.id : null; // Lấy idOrder từ bảng nếu tồn tại

		if (product0) {
			// Nếu tồn tại phần tử có id="product0"
			if (selectedValue === "1") {
				form.action = `payment/repurchase/${idOrder}.htm`;
				form.method = "post";
			} else if (selectedValue === "2") {
				form.action = `payment/repurchase/vnpay/${idOrder}.htm`;
				form.method = "get";
			} else if (selectedValue === "3") {
				form.action = `payment/repurchase/zalopay/${idOrder}.htm`;
				form.method = "get";
			}
		} else {
			// Nếu không tồn tại phần tử có id="product0"
			if (selectedValue === "1") {
				form.action = "payment/result.htm";
				form.method = "post";
			} else if (selectedValue === "2") {
				form.action = "payment/vnpay.htm";
				form.method = "get";
			} else if (selectedValue === "3") {
				form.action = "payment/zalopay.htm";
				form.method = "get";
			}
		}
	}

	// Gọi hàm để thiết lập giá trị mặc định khi trang được tải
	setDefaultFormAction();

	paymentSelect.addEventListener("change", setDefaultFormAction);

});