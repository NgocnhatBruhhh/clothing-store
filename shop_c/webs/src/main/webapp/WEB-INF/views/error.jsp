<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/logo_ptit.ico" type="image/x-icon">
        <title>Thông báo!</title>
        
        <script type="text/javascript">
            window.onload = function() {

                // Hộp thoại xác nhận tự động hiển thị khi tải trang
                if (confirm("Lỗi kết nối hệ thống! Xin truy cập lại ít phút?")) {
                    window.location.href = "logout.htm"; // Đường dẫn đến chủ
                }
            };
        </script>
        
        <style>
            body, html {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
            }
            img {
                height: 50%;
            }
        </style>
    </head>
    <body>
        <img src="images/web/404.png">
    </body>
</html>