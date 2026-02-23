/**
 * 
 */
function openCancelModal() {
	const modal = document.getElementById("cancelModal");
	modal.style.display = "flex";
}

function closeCancelModal() {
	const modal = document.getElementById("cancelModal");
	modal.style.display = "none";
}

function confirmCancel() {
	const selectedReason = document.querySelector('input[name="reason"]:checked');
	if (!selectedReason) {
		alert("Vui lòng chọn lý do hủy!");
		return;
	}

	const customerElement = document.querySelector('#idCustomer .left strong');
	const idCustomer = customerElement.nextSibling.textContent.trim();

	const idReason = selectedReason.value;

	if (confirm("Bạn có chắc chắn muốn hủy đơn này?")) {
		// Lấy idOrder từ URL
		const urlParams = window.location.pathname.split('/');
		const idOrder = urlParams[urlParams.length - 1].split('.')[0];  // Lấy phần cuối của URL và bỏ ".htm"

		// Redirect to cancel order URL
		window.location.href = `emorder/cancel/${idOrder}/${idCustomer}.htm?idReason=${idReason}`;
	}
}

document.getElementById('custom-dropdown-menu').addEventListener('change', updateUrlWithFilters);
document.getElementById('idcustom-search-input').addEventListener('keydown', function(event) {
	if (event.key === 'Enter') {
		event.preventDefault();
		updateUrlWithFilters();
	}
});
document.getElementById('idorder-search-input').addEventListener('keydown', function(event) {
	if (event.key === 'Enter') {
		event.preventDefault();
		updateUrlWithFilters();
	}
});

document.getElementById('fromDate').addEventListener('change', updateUrlWithFilters);
document.getElementById('toDate').addEventListener('change', updateUrlWithFilters);

// Thêm sự kiện khi nhấn nút "Hủy"
document.getElementById('clear-date').addEventListener('click', function() {
	const urlParams = new URLSearchParams(window.location.search);

	// Xóa các tham số liên quan đến ngày
	urlParams.delete('fromDate');
	urlParams.delete('toDate');

	// Cập nhật URL mà không làm mới toàn bộ trang
	const newUrl = 'emorder.htm?' + urlParams.toString();

	// Điều hướng đến URL đã được cập nhật
	window.location.href = newUrl;

	// Xóa giá trị các ô nhập ngày
	document.getElementById('fromDate').value = '';
	document.getElementById('toDate').value = '';

	// Có thể thêm logic khác nếu cần, như cập nhật danh sách dữ liệu
	console.log('Đã hủy lọc theo ngày và cập nhật URL:', newUrl);
});

function updateUrlWithFilters() {
	const dropdown = document.getElementById('custom-dropdown-menu');
	const idcustomerInput = document.getElementById('idcustom-search-input');
	const idorderInput = document.getElementById('idorder-search-input');
	const fromDateInput = document.getElementById('fromDate');
	const toDateInput = document.getElementById('toDate');

	const idstatus = dropdown.value !== '0' ? dropdown.value : null;
	const idcustomer = idcustomerInput.value.trim();
	const idorder = idorderInput.value.trim();
	const fromDate = fromDateInput.value;
	const toDate = toDateInput.value;

	const urlParams = new URLSearchParams(window.location.search);

	// Update parameters
	if (idorder && /^\d+$/.test(idorder)) {
		urlParams.set('idorder', idorder);
	} else {
		urlParams.delete('idorder');
	}
	if (idstatus) {
		urlParams.set('idstatus', idstatus);
	} else {
		urlParams.delete('idstatus');
	}

	if (idcustomer && /^\d+$/.test(idcustomer)) {
		urlParams.set('idcustomer', idcustomer);
	} else {
		urlParams.delete('idcustomer');
	}

	if (fromDate) {
		urlParams.set('fromDate', fromDate);
	} else {
		urlParams.delete('fromDate');
	}

	if (toDate) {
		urlParams.set('toDate', toDate);
	} else {
		urlParams.delete('toDate');
	}

	// Redirect with updated URL
	window.location.href = 'emorder.htm?' + urlParams.toString();
}

// Pre-fill input fields from URL on page load
window.addEventListener('DOMContentLoaded', () => {
	const urlParams = new URLSearchParams(window.location.search);

	const dropdown = document.getElementById('custom-dropdown-menu');
	const idcustomerInput = document.getElementById('idcustom-search-input');
	const idorderInput = document.getElementById('idorder-search-input');
	const fromDateInput = document.getElementById('fromDate');
	const toDateInput = document.getElementById('toDate');

	idorderInput.value = urlParams.get('idorder') || '';
	dropdown.value = urlParams.get('idstatus') || '0';
	idcustomerInput.value = urlParams.get('idcustomer') || '';
	fromDateInput.value = urlParams.get('fromDate') || '';
	toDateInput.value = urlParams.get('toDate') || '';
});