<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/logo_ptit.ico" type="image/x-icon">
        <title>Thông báo!</title>

    </head>
    <body >
    
	    <div class="image-wrap">
	    <h2
				class=" gioHang u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
				Bạn chưa có đơn hàng nào cả!</h2>
	    	<img src="images/web/empty_cart.jpeg">
	    </div>
        
    </body>
    
    <style>
    	h2{
    		position: absolute;
    		top: 100%;
    		z-index: 1;
    		transform: translateY(8vh);
    		font-weight: 600!important;
   			color: #478ac9!important;
    		opacity: 0.8!important;
    		font-size: 22px!important;
    		color: #555555;
    		text-decoration: none!important;
    	}
	    body{
	    	width: 100%;
	    }
	    img{
	    	position: absolute;
	    	
	    	width: 50%;
	    }
	    .image-wrap{
	    	position: relative;
	    	min-height: 80vh;
    		width: 100%;
    		display: flex;
    		justify-content: center;
    		align-items: center;
    	}
    </style>
</html>