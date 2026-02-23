<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <meta name="keywords" content="subscribe">
  <meta name="description" content="">
  <title>Thông tin cá nhân</title>
  <link rel="stylesheet" href="css/page.css" media="screen">
    <meta name="generator" content="Nicepage 7.0.3, nicepage.com">
    <meta name="referrer" content="origin">
    <link id="u-theme-google-font" rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
      <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "",
            "logo": "images/pngwing.com.png"
            }</script>
  <meta name="theme-color" content="#478ac9">
  <meta property="og:title" content="Page 1">
  <meta property="og:type" content="website">
  <meta data-intl-tel-input-cdn-path="intlTelInput/">
</head>

<body data-path-to-root="./" data-include-products="true" class="u-body u-xl-mode" data-lang="en">

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<section class="u-clearfix u-section-1" id="sec-4712">
  <div class="wrap u-clearfix u-sheet u-sheet-1">
    <div class="wrap2 u-form u-form-1">
      <form action="update-profile.htm" method="post" enctype="multipart/form-data" class="wrap3 u-clearfix u-form-spacing-10 u-form-vertical u-inner-form" source="email" name="form" style="padding: 10px; display: flex; justify-content: space-between; align-items: flex-start;">

        <!-- Hiển thị ảnh đại diện bên trái -->
        <div class="image-container">
          <div class="avatar-container">
            <!-- Hiển thị ảnh người dùng hoặc ảnh mặc định nếu không có -->
            <img src="images/avatar/${personal.image != null && personal.image != '' ? personal.image : 'default.png'}" class="avatar" id="avatarImage" alt="Avatar">
            <input type="file" id="file" name="file" accept="image/*" style="display: none;" onchange="previewFile(event)">
            <label for="file" class="custom-file-upload">Chọn ảnh</label>
          </div>
        </div>

        <!-- Form nhập liệu bên phải -->
        <div class="form-container">
        <h2 class="u-text u-text-default u-text-palette-1-base u-block-b62f-5">Thông tin cá nhân
                        <p style="color: #bd381b; font-weight: 400; font-size: 16px" class = "message">${message}</p>
                        </h2>
          <!-- Họ và tên -->
          <div class="u-form-group u-form-name">
            <label for="name-92f3" class="u-label">Họ và tên</label>
            
            <input type="text" value="${personal.name}${name}" placeholder="Họ và tên" id="name-92f3" name="name" class="input u-input u-input-rectangle" required>
          </div>

          <!-- Số điện thoại -->
          <div class="u-form-phone u-form-group">
            <label for="phone-92f3" class="u-label">Số điện thoại</label>
            <input type="number" value="${personal.phone}${phone}" placeholder="Số điện thoại" id="phone-92f3" name="phone" class="input u-input u-input-rectangle" required>
                        <span id="phoneError" style="color: red; display: none;">Số điện thoại phải có 10 chữ số!</span> <!-- Hiển thị lỗi -->
            
          </div>

           <!-- Email -->
          <div class="u-form-email u-form-group">
            <label for="email-92f3" class="u-label">Email</label>
            <input type="email" value="${acc.email}${email}" placeholder="Email" id="email-92f3" name="email" class="input u-input u-input-rectangle" required>
                <span id="emailError" style="color: red; display: none;">Email không hợp lệ!</span> <!-- Hiển thị lỗi -->
            
          </div>


          <!-- Nút submit -->
          <div class="u-align-center u-form-group u-form-submit">
            <button onclick="handleButtonClick(event)"  class="input2 u-btn u-btn-submit u-button-style">Cập nhật</button>
          </div>
        </div>

        <input type="hidden" value="" name="recaptchaResponse">
        <input type="hidden" name="formServices" value="d4782bfc-b041-1b72-5f81-a5fd7ed9f8a4">
      </form>
    </div>
  </div>
</section>

<!-- Hiển thị thông báo nếu có -->


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

<!-- CSS cho phần hình ảnh và giao diện -->
<style>
  /* Cập nhật nền toàn bộ trang */
  body {
    background-color: #333; /* Nền tối */
    color: #fff; /* Chữ sáng để dễ đọc trên nền tối */
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }

  /* Ẩn input file mặc định */
  input[type="file"] {
    display: none;
  }

  /* Giao diện cho nút chọn ảnh */
  .custom-file-upload {
    display: flex;
    padding: 12px 24px;
    cursor: pointer;
    justify-content: center;
    border: 2px solid #000000;
    border-radius: 15px; /* Bo tròn cho nút */
    background-color: #fff; /* Nền sáng cho nút */
    font-size: 14px;
    font-family: Arial, sans-serif;
    color: #333;
    text-align: center;
    margin-top: 20px;
    margin-bottom: 20px;
    width: 250px;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1); /* Bóng đổ mạnh hơn */
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
  }

  .custom-file-upload:hover {
    background-color: #e9e9e9;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Bóng mạnh hơn khi hover */
  }

  /* Flexbox container */
  .wrap {
  min-height: 80vh !important;
  position: relative;
  margin-top: -50px; /* Giảm khoảng cách từ trên xuống */
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column; /* Để phần tử con nằm dọc */
}


  /* Cải thiện kiểu dáng thông báo */
  .alert-info {
    background-color: #e6f7ff;
    border: 2px solid #b3d8ff;
    color: #007bff;
    padding: 15px 30px;
    border-radius: 8px;
    font-size: 14px;
    margin: 10px auto;
    width: 80%;
    max-width: 400px;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1); /* Thêm bóng đổ cho thông báo */
    text-align: center;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease;
      margin-top: 10px; /* Giảm khoảng cách từ trên */
    
  }
  
  h2{
  width: 100%!important;
    text-align: center!important;
    font-size: 30px!important;
    font-weight: 600!important;
    margin: 0!important;
  }
section{
  	background: #eee;
  	min-height: 80vh;
  }
  .alert-info:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Bóng đổ khi hover */
  }

  .alert-info p {
    margin: 0;
    font-weight: bold;
  }

  /* Căn chỉnh ảnh đại diện */
  .image-container {
    width: 300px; /* Kích thước ảnh cải thiện */
    padding: 40px;
    display: flex;
    justify-content: center;
    margin-top: 32px;
    flex-direction: column;
    align-items: center;
  }

  /* Hình ảnh đại diện */
  .avatar {
    width: 230px; /* Kích thước ảnh hợp lý */
    height: 230px;
    border-radius: 50%;
    object-fit: cover;
    display: block;
    margin: 0 auto;
    box-shadow: 10px 10px 5px 0px #cccccc; /* Thêm bóng cho ảnh đại diện */
  }

  /* Container chứa form */
  .form-container {
    width: 750px;
    padding: 40px;
    background: #fff; /* Nền tối hơn cho form */
    border-radius: 10px; /* Làm viền form bo tròn */
    box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.2); /* Bóng đổ mạnh cho form */
    margin-top: 50px;
  }

  /* Cải thiện giao diện cho nút upload */
  .avatar-container {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  /* Các input dạng vuông được bo tròn */
  .input {
    border-radius: 15px;
    padding: 12px;
    width: 100%;
    font-size: 16px;
    margin-bottom: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Bóng cho các ô nhập liệu */
    background-color: #fff; /* Màu nền trắng cho input */
  }

  /* Hiệu ứng cho các ô input khi focus */
  .input:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 6px rgba(0, 123, 255, 0.5); /* Bóng nhẹ khi focus */
  }
  
  

  /* Nút Cập nhật cũng viền đen và bo tròn */
  .input2 {
    border-radius: 15px;
    padding: 12px 24px;
    background-color: #007bff;
    color: white;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
  }

  .input2:hover {
    background-color: #0056b3;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Bóng mạnh khi hover */
  }
</style>



<!-- JavaScript để hiển thị ảnh ngay khi chọn -->
<script>
  function previewFile(event) {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('avatarImage').src = e.target.result;
      };
      reader.readAsDataURL(file);
    }
  }
</script>
<script>
// Hàm kiểm tra số điện thoại
  function validatePhone() {
      var phone = document.getElementById('phone-92f3').value;
      var phoneError = document.getElementById('phoneError');
      
      // Kiểm tra xem số điện thoại có 10 chữ số không
      var phonePattern = /^\d{10}$/; // Định dạng số điện thoại 10 chữ số
      if (!phonePattern.test(phone)) {
          phoneError.style.display = 'inline'; // Hiển thị thông báo lỗi
      } else {
          phoneError.style.display = 'none'; // Ẩn thông báo lỗi nếu đúng
      }
  }
  
  // Định nghĩa hàm xử lý sự kiện
  function handleButtonClick(event) {
            // Hiển thị hộp thoại xác nhận
            const isConfirmed = confirm("Bạn có chắc chắn cập nhật?");
            
            if (!isConfirmed) {
                // Ngăn hành động mặc định (nếu có)
                event.preventDefault();
                
            } 
        }
</script>
</script>
<script>
  // Hàm kiểm tra email
  function validateEmail() {
      var email = document.getElementById('email-92f3').value;
      var emailError = document.getElementById('emailError');
      
      // Kiểm tra định dạng email
      var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
      if (!emailPattern.test(email)) {
          emailError.style.display = 'inline'; // Hiển thị thông báo lỗi
      } else {
          emailError.style.display = 'none'; // Ẩn thông báo lỗi nếu đúng
      }
  }
</script>
</body>
</html>
