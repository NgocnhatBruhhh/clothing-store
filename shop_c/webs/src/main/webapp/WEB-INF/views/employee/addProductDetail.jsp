<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Sửa giá</title>
    <link rel="stylesheet" href="css/page.css" media="screen">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        button{
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
}
        
        
        h2{
    		top: 100%;
    		z-index: 1;
    		font-weight: 600!important;
   			color: #478ac9!important;
    		font-size: 22px!important;
    		display: block!important;
    		width: 100%!important;
    		color: #555555;
    		text-decoration: none!important;
    		text-align: center;
    	}

        .form-container,
        .result {
            max-width: 1000px;
            margin: 60px auto;
            padding-bottom: 20px;
            
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
        }
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
            margin: 100px auto;
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
				Cập nhật giá  sản phẩm</h2>
        <form action="emaddproductdetail.htm" method="POST" enctype="multipart/form-data" class="form">
       		<div style="margin-top: 15px" class="wrap">
	        	<label for="name">Tên sản phẩm:</label>
	            <input class="input" type="hidden" value="${product.id }" name="productId">
	            <input class="input" type="text" id="name" value="${product.name }" name="name" placeholder="Nhập tên sản phẩm" required>
        	</div>
            
            <div style="margin-top: 15px" class="wrap">

	            <label for="sizeID">Size:</label>
				<select class="select" id="sizeID" name="sizeID" required>
					<option value="" disabled selected>Chọn size</option>
					<c:if test="${not empty sizes}">
						<c:forEach var="size" items="${sizes}">
							<option value="${size.id}">${size.name}</option>
						</c:forEach>
					</c:if>
				</select>
	        </div>
            <div  class="wrap">

	            <label for="price">Giá bán:</label>
				<input class="input" id="price" name="price" placeholder="Nhập giá bán" type="number" min="0" required>
	        </div>
            <div class="wrap">

	            <label for="quantity">Số lượng:</label>
				<input class="input" id="quantity" name="quantity" placeholder="Nhập số lượng" type="number" min="1" required>

	        </div>

	         <div class="wrap">
	         </div>
	         <div class="wrap">
	         </div>
	         <div class="wrap2">

           	</div>
           	<div class="wrap2">

           	</div>
            <div class="wrap2">

            	<button onclick="handleButtonClick(event)" style="margin: 20px 0px"class="button" type="submit">Cập nhật</button>
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