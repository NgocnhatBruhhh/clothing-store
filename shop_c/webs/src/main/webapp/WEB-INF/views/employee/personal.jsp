<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thông tin nhân viên</title>
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
            margin: 112px auto;
            padding-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            overflow:hidden;
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
        	width: 50%;
        	padding: 4px 30px;
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
	<jsp:include page="/WEB-INF/views/layout/eheader.jsp" />


    <div class="form-container">
         <h2
				class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
				Thông tin cá nhân 
				
				</h2>
				<p style="width: 100%; color: #bd381b; text-align: center; margin: 12px 0px 0px 0px">${message}</p>
        <form action="updateinfo.htm" method="POST" class="form">
        	<input type="hidden" name="id" value="${personal.id}" />
        	<div class="wrap">
	        	<label for="name">Email</label>
	            <input disabled class="input" type="text" name="email" value="${acc.email}"  placeholder="Nhập email" required>
        	</div>
        	<div class="wrap">
	            <label for="description">Tên</label>
	            <input class="input" type="text" name="name" placeholder="Nhập họ và tên" value="${personal.name}" required >
            </div>
            <div class="wrap">
	            <label for="description">Số điện thoại</label>
	            <input class="input" type="text" name="phone" placeholder="Nhập số điện thoại" value="${personal.phone}" required >
            </div>
            <div class="wrap">
	            <label for="description">Địa chỉ</label>
	            <input class="input"type="text" name="address" placeholder="Nhập địa chỉ" value="${personal.address}" required >
	        </div>

			
			



            <div class="wrap2">
	            
	         </div>
	         
	         <div class="wrap2">
	            
	         </div>
	         
	         <div class="wrap2">
	            <button onclick="handleButtonClick(event)" style = "margin-top: 20px" class="button" type="submit">Cập nhật</button>
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
          const isConfirmed = confirm("Bạn có chắc chắn cập nhật?");
          
          if (!isConfirmed) {
              // Ngăn hành động mặc định (nếu có)
              event.preventDefault();
              
          } 
      }

</script>

</body>

</html>