<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
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
            margin: 25px auto;
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
        	width: 33.333333%;
        	padding: 4px 30px;
        }
        
        button{
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
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
				Thêm sản phẩm</h2>
        <form action="emaddproduct.htm" method="POST" enctype="multipart/form-data" class="form">
        	<div class="wrap">
	        	<label for="name">Tên sản phẩm:</label>
	            <input class="input" type="text" id="name" name="name" placeholder="Nhập tên sản phẩm" required>
        	</div>
  
            <div class="wrap">
	            <label for="image">Hình ảnh:</label>
	            <input class="input" type="file" id="file" name="file" accept="image/*"  onchange="previewFile(event)">
            </div>
           
	         <div class="wrap">
	            <label for="typesID">Loại sản phẩm:</label>
	            <select class="select" id="typesID" name="typesID" required>
	                <option value="" disabled selected>Chọn loại sản phẩm</option>
	                <c:if test="${not empty types}">
	                    <c:forEach var="type" items="${types}">
	                        <option value="${type.id}">${type.name}</option>
	                    </c:forEach>
	                </c:if>
	            </select>
	         </div>
			<div class="wrap">
	            <label for="originsID">Xuất xứ:</label>
	            <select class="select" id="originsID" name="originsID" required>
	                <option value="" disabled selected>Chọn xuất xứ</option>
	                <c:if test="${not empty origins}">
	                    <c:forEach var="origin" items="${origins}">
	                        <option value="${origin.id}">${origin.name}</option>
	                    </c:forEach>
	                </c:if>
	            </select>
	        </div>
			<div class="wrap">

            <label for="brandsID">Thương hiệu:</label>
	            <select class="select" id="brandsID" name="brandsID" required>
	                <option value="" disabled selected>Chọn thương hiệu</option>
	                <c:if test="${not empty brands}">
	                    <c:forEach var="brand" items="${brands}">
	                        <option value="${brand.id}">${brand.name}</option>
	                    </c:forEach>
	                </c:if>
	            </select>
            </div>
			<div class="wrap">

	            <label for="materialsID">Chất liệu:</label>
	            <select class="select" id="materialsID" name="materialsID" required>
	                <option value="" disabled selected>Chọn chất liệu</option>
	                <c:if test="${not empty materials}">
	                    <c:forEach var="material" items="${materials}">
	                        <option value="${material.id}">${material.name}</option>
	                    </c:forEach>
	                </c:if>
	            </select>
	         </div>
	          <div class="wrap">
	            <label for="description">Mô tả sản phẩm:</label>
	            <textarea class="textarea" id="description" name="description" placeholder="Nhập mô tả sản phẩm" required></textarea>
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
				<button onclick="handleButtonClick(event)" style="margin: 20px 0" class="button" type="submit">Thêm sản phẩm</button>
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