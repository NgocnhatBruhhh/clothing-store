<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thêm nhân viên</title>
    <link rel="stylesheet" href="css/page.css" media="screen">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        h2{
    		top: 100%;
    		z-index: 1;
    		font-weight: 600!important;
   			color: #478ac9!important;
    		font-size: 16px!important;
    		display: block!important;
    		width: 100%!important;
    		color: #fff!important;
    		padding: 14px 0px!important;
    		margin: 0!important;
    		background: #333333;
    		text-decoration: none!important;
    		text-align: center;
    	}

        .form-container,
        .result {
            max-width: 1000px;
            margin: 105px auto;
            padding-bottom: 20px;
            overflow: hidden;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
        }
        


        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        .input,
        .textarea,
        .select,
        .button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        
   

        .textarea {
            resize: vertical;
            height: 100px;
        }

        .button {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        
        .form{
        	display: flex;
		    width: 100%;
		    flex-wrap: wrap;
        
        }
        
        .wrap{
        	width: 33.33333%;
        	padding: 8px 12px;
        }
        
        .wrap2{
        	width: 20%;
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body class="u-body u-xl-mode" data-style="shopping-cart-template-1" data-posts=""
	data-global-section-properties="{&quot;code&quot;:&quot;CART&quot;,&quot;colorings&quot;:{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]},&quot;isPreset&quot;:true}"
	data-source="fix" data-lang="en"
	data-page-sections-style="[{&quot;name&quot;:&quot;shopping-cart-1&quot;,&quot;margin&quot;:&quot;both&quot;,&quot;repeat&quot;:false}]"
	data-page-coloring-types="{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]}"
	data-page-category="&quot;Cart&quot;">
	<jsp:include page="/WEB-INF/views/layout/aheader.jsp" />


    <div class="form-container">
         <h2
				class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
				Thêm nhân viên</h2>
        <form method="post" action="addstaff.htm" class="form">
        	<div class="wrap">
	        	<label for="name">Email</label>
	            <input class="input" type="email" name="email" required placeholder="Nhập email" required>
        	</div>
  
            <div class="wrap">
	            <label for="image">Mật khẩu:</label>
	            <input class="input" type="password" name="password" placeholder="Nhập mật khẩu" required >
            </div>
            
			<div class="wrap">
	            <label for="description">Tên</label>
	            <input class="input" type="text" name="name" placeholder="Nhập họ và tên" required >
			</div>
			<div class="wrap">
	            <label for="description">Số điện thoại</label>
	            <input class="input" type="number" name="phone" placeholder="Nhập số điện thoại" required >
			</div>
			<div class="wrap">
	            <label for="description">Địa chỉ</label>
	            <input class="input"type="text" name="address" placeholder="Nhập địa chỉ" required >
			</div>
			<div class="wrap">
	            <label for="brandsID">Trạng thái</label>
	            <select class="select" id="brandsID" name="status" required>
	
	                  <option value="1">Hoạt động</option>
	                  <option value="0">Khóa</option>
	            </select>
	         </div>

			<div class="wrap2">
	            
	         </div>
	         
	         <div class="wrap2">
	            
	         </div>
	         
	         <div class="wrap2">
	            <button onclick="handleButtonClick(event)" style = "margin-top: 20px" class="button" type="submit">Thêm nhân viên</button>
	         </div>
	         
	         <div class="wrap2">
	            
	         </div>
            
            <div class="wrap2">
	            
	         </div>
        </form>
    </div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />

<script>
//Định nghĩa hàm xử lý sự kiện
function handleButtonClick(event) {
          // Hiển thị hộp thoại xác nhận
          const isConfirmed = confirm("Bạn có chắc chắn thêm nhân viên?");
          
          if (!isConfirmed) {
              // Ngăn hành động mặc định (nếu có)
              event.preventDefault();
              
          } 
      }
</script>
</body>

</html>