<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta name="keywords" content="Đăng nhập​">
        <meta name="description" content="">
        <title>Đăng nhập</title>
        <link rel="stylesheet" href="css/page.css" media="screen">

        <meta name="generator" content="Nicepage 7.0.3, nicepage.com">
    </head>

    <body class="u-body u-xl-mode" data-style="login-template-1" data-posts=""
          data-global-section-properties="{&quot;code&quot;:&quot;LOGIN&quot;,&quot;colorings&quot;:{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]},&quot;isPreset&quot;:true}"
          data-source="fix" data-lang="en"
          data-page-sections-style="[{&quot;name&quot;:&quot;login-form-1&quot;,&quot;margin&quot;:&quot;both&quot;,&quot;repeat&quot;:false}]"
          data-page-coloring-types="{&quot;light&quot;:[&quot;clean&quot;,&quot;clean&quot;],&quot;colored&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;],&quot;dark&quot;:[&quot;clean&quot;,&quot;clean&quot;,&quot;clean&quot;]}"
          data-page-category="&quot;Login&quot;">
        <section class="u-clearfix u-grey-10 u-block-b62f-1" custom-posts-hash="[]" data-style="blank"
                 data-section-properties="{&quot;margin&quot;:&quot;none&quot;,&quot;stretch&quot;:true}" id="carousel_5973"
                 data-source="functional_fix" data-id="b62f">
            <div style="height: 100vh" class="u-clearfix u-sheet u-valign-middle u-block-b62f-2">
                <div
                    class="u-align-center u-border-20 u-border-no-bottom u-border-no-left u-border-no-top u-border-palette-1-base u-container-align-center u-container-style u-custom-border u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-radius u-shape-round u-white u-block-b62f-3">
                    <div class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-xl u-block-b62f-4">
                        <h2 class="u-text u-text-default u-text-palette-1-base u-block-b62f-5">Đổi mật khẩu
                        <p class = "message">${successMessage}${errorMessage}</p>
                        </h2>
                        
                        <div class="u-expanded-width-xs u-form u-login-control u-block-b62f-6">
                            <form action="#" method="POST"
      class="u-clearfix u-form-custom-backend u-form-spacing-10 u-form-vertical u-inner-form">
    <!-- Mật khẩu cũ -->
                            <div class="u-form-group u-form-password u-block-b62f-10">
                                <label for="currentPassword" class="u-label u-text-grey-25 u-block-b62f-11">Mật khẩu cũ</label>
                                <div style="position: relative;">
                                    <input type="password" placeholder="Nhập mật khẩu cũ" id="currentPassword"
                                        name="currentPassword" value="${ pass1}"
                                        class="u-border-2 u-border-grey-10 u-grey-10 u-input u-input-rectangle u-block-b62f-12"
                                        required>
                                    <span class="toggle-password" onclick="togglePassword('currentPassword', this)"
                                        style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
                                        <img src="${pageContext.request.contextPath}/images/eye-slash.svg"
                                            alt="Toggle Password" id="icon-currentPassword" style="width: 20px;">
                                    </span>
                                </div>
                            </div>

                            <!-- Mật khẩu mới -->
                            <div class="u-form-group u-form-password u-block-b62f-10">
                                <label for="newPassword" class="u-label u-text-grey-25 u-block-b62f-11">Mật khẩu mới</label>
                                <div style="position: relative;">
                                    <input type="password" placeholder="Nhập mật khẩu mới" id="newPassword" name="newPassword"
                                        class="u-border-2 u-border-grey-10 u-grey-10 u-input u-input-rectangle u-block-b62f-12"  value="${ pass2}"
                                        required>
                                    <span class="toggle-password" onclick="togglePassword('newPassword', this)"
                                        style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
                                        <img src="${pageContext.request.contextPath}/images/eye-slash.svg"
                                            alt="Toggle Password" id="icon-newPassword" style="width: 20px;">
                                    </span>
                                </div>
                            </div>

                            <!-- Xác nhận mật khẩu -->
                            <div class="u-form-group u-form-password u-block-b62f-10">
                                <label for="confirmPassword"
                                    class="u-label u-text-grey-25 u-block-b62f-11">Xác nhận mật khẩu</label>
                                <div style="position: relative;">
                                    <input type="password" placeholder="Xác nhận mật khẩu mới" id="confirmPassword"  value="${ pass3}"
                                        name="confirmPassword"
                                        class="u-border-2 u-border-grey-10 u-grey-10 u-input u-input-rectangle u-block-b62f-12"
                                        required>
                                    <span class="toggle-password" onclick="togglePassword('confirmPassword', this)"
                                        style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
                                        <img src="${pageContext.request.contextPath}/images/eye-slash.svg"
                                            alt="Toggle Password" id="icon-confirmPassword" style="width: 20px;">
                                    </span>
                                </div>
                            </div>

                            <!-- Nút gửi form -->
                            <div class="u-align-left u-form-group u-form-submit u-block-b62f-15" style="margin-top: 12px;">
                                <button type="submit"
                                    class="u-btn u-btn-round u-btn-submit u-button-style u-radius u-block-b62f-16">Xác
                                    nhận</button>
                            </div>
                        </form>

                       
                        <script>
                            function togglePassword(inputId, iconElement) {
                                const input = document.getElementById(inputId);
                                const icon = document.getElementById('icon-' + inputId);
                                if (input.type === "password") {
                                    input.type = "text";
                                    icon.src = "${pageContext.request.contextPath}/images/eye.svg"; // Đổi sang biểu tượng "mắt mở"
                                } else {
                                    input.type = "password";
                                    icon.src = "${pageContext.request.contextPath}/images/eye-slash.svg"; // Đổi sang biểu tượng "mắt có dấu gạch"
                                }
                            }
                        </script>
                    </div>
                    <a href="home.htm" style="margin-top: 20px!important"
                        class="u-border-1 u-border-active-palette-1-base u-border-hover-palette-1-base u-btn u-button-style u-login-control u-login-create-account u-none u-text-palette-1-base u-block-b62f-18">Quay lại</a>
                </div>
            </div>
        </div>
        <style>
        button{
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
		}
        
        </style>
            <style data-mode="XL">
            
            		.message{
            		
            			position: absolute; top: 100%; width: 100%;
            			font-size: 14px!important; color: #bd381b;
            			text-transform: none;
            		}
            
            		.u-align-center{
            			margin-top: 40px!important;
            			margin-bottom: 40px!important;
            		}
            
            	    .u-block-b62f-2 {
            	    	min-height: 0!important;
					}
					
					input{
						border-radius: 10px!important;
					}
					
					body{
						height: 100vh;
					}
					
					section{
						height: 100vh;
					}
            	
                @media (min-width: 1200px) {
                    .u-block-b62f-1 {
                        background-image: none;
                    }

                    .u-block-b62f-2 {
                        min-height: 750px;
                    }

                    .u-block-b62f-3 {
                        width: 800px;
                        min-height: 535px;
                        --radius: 20px;
                        margin-top: 60px;
                        margin-bottom: 60px;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .u-block-b62f-4 {
                        padding-top: 50px;
                        padding-bottom: 50px;
                        padding-left: 30px;
                        padding-right: 30px;
                    }

                    .u-block-b62f-5 {
                        text-transform: uppercase;
                        font-size: 2.5rem;
                        font-weight: 700;
                        letter-spacing: 2px;
                        margin-top: 0;
                        margin-bottom: 0;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .u-block-b62f-6 {
                        height: 293px;
                        width: 570px;
                        margin-top: 26px;
                        margin-left: auto;
                        margin-right: auto;
                        margin-bottom: 0;
                    }

                    .u-block-b62f-8 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-9 {
                        background-image: none;
                    }

                    .u-block-b62f-11 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-12 {
                        background-image: none;
                    }

                    .u-block-b62f-16 {
                        width: 100%;
                        --radius: 21px;
                        padding-top: 10px;
                        padding-bottom: 10px;
                        padding-left: 0;
                        padding-right: 0;
                    }

                    .u-block-b62f-17 {
                        border-style: none none solid;
                        align-self: center;
                        margin-top: 26px;
                        margin-right: 75px;
                        margin-bottom: 0;
                        margin-left: auto;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }

                    .u-block-b62f-18 {
                        border-style: none none solid;
                        margin-top: -26px;
                        margin-right: auto;
                        margin-bottom: 0;
                        margin-left: 75px;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }
                }
            </style>
            <style data-mode="LG">
                @media (max-width: 1199px) and (min-width: 992px) {
                    .u-block-b62f-1 {
                        background-image: none;
                    }

                    .u-block-b62f-2 {
                        min-height: 750px;
                    }

                    .u-block-b62f-3 {
                        width: 800px;
                        min-height: 535px;
                        margin-top: 60px;
                        margin-bottom: 60px;
                        margin-left: auto;
                        margin-right: auto;
                        --radius: 20px;
                    }

                    .u-block-b62f-4 {
                        padding-top: 50px;
                        padding-bottom: 50px;
                        padding-left: 30px;
                        padding-right: 30px;
                    }

                    .u-block-b62f-5 {
                        text-transform: uppercase;
                        font-size: 2.5rem;
                        font-weight: 700;
                        letter-spacing: 2px;
                        margin-top: 0;
                        margin-bottom: 0;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .u-block-b62f-6 {
                        height: 293px;
                        width: 570px;
                        margin-top: 26px;
                        margin-left: auto;
                        margin-right: auto;
                        margin-bottom: 0;
                    }

                    .u-block-b62f-8 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-9 {
                        background-image: none;
                    }

                    .u-block-b62f-11 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-12 {
                        background-image: none;
                    }

                    .u-block-b62f-16 {
                        width: 100%;
                        padding-top: 10px;
                        padding-right: 0;
                        padding-bottom: 10px;
                        padding-left: 0;
                        --radius: 21px;
                    }

                    .u-block-b62f-17 {
                        border-style: none none solid;
                        align-self: center;
                        margin-top: 26px;
                        margin-right: 75px;
                        margin-bottom: 0;
                        margin-left: auto;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }

                    .u-block-b62f-18 {
                        border-style: none none solid;
                        margin-top: -26px;
                        margin-right: auto;
                        margin-bottom: 0;
                        margin-left: 75px;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }
                }
            </style>
            <style data-mode="MD" data-visited="true">
                @media (max-width: 991px) and (min-width: 768px) {
                    .u-block-b62f-1 {
                        background-image: none;
                    }

                    .u-block-b62f-2 {
                        min-height: 750px;
                    }

                    .u-block-b62f-3 {
                        min-height: 535px;
                        margin-top: 60px;
                        margin-bottom: 60px;
                        --radius: 20px;
                    }

                    .u-block-b62f-4 {
                        padding-top: 50px;
                        padding-bottom: 50px;
                        padding-left: 30px;
                        padding-right: 30px;
                    }

                    .u-block-b62f-5 {
                        text-transform: uppercase;
                        font-size: 2.5rem;
                        font-weight: 700;
                        letter-spacing: 2px;
                        margin-top: 0;
                        margin-bottom: 0;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .u-block-b62f-6 {
                        height: 293px;
                        width: 570px;
                        margin-top: 26px;
                        margin-left: auto;
                        margin-right: auto;
                        margin-bottom: 0;
                    }

                    .u-block-b62f-8 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-9 {
                        background-image: none;
                    }

                    .u-block-b62f-11 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-12 {
                        background-image: none;
                    }

                    .u-block-b62f-16 {
                        width: 100%;
                        padding-top: 10px;
                        padding-right: 0;
                        padding-bottom: 10px;
                        padding-left: 0;
                        --radius: 21px;
                    }

                    .u-block-b62f-17 {
                        border-style: none none solid;
                        align-self: center;
                        margin-top: 26px;
                        margin-right: 35px;
                        margin-bottom: 0;
                        margin-left: auto;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }

                    .u-block-b62f-18 {
                        border-style: none none solid;
                        margin-top: -26px;
                        margin-right: auto;
                        margin-bottom: 0;
                        margin-left: 35px;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }
                }
            </style>
            <style data-mode="SM" data-visited="true">
                @media (max-width: 767px) and (min-width: 576px) {
                    .u-block-b62f-1 {
                        background-image: none;
                    }

                    .u-block-b62f-2 {
                        min-height: 647px;
                    }

                    .u-block-b62f-3 {
                        min-height: 507px;
                        margin-top: 60px;
                        margin-bottom: 60px;
                        --radius: 20px;
                    }

                    .u-block-b62f-4 {
                        padding-top: 40px;
                        padding-bottom: 40px;
                        padding-left: 30px;
                        padding-right: 30px;
                    }

                    .u-block-b62f-5 {
                        text-transform: uppercase;
                        font-size: 2.5rem;
                        font-weight: 700;
                        letter-spacing: 2px;
                        margin-top: 0;
                        margin-bottom: 0;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .u-block-b62f-6 {
                        height: 264px;
                        width: 460px;
                        margin-top: 26px;
                        margin-left: 0;
                        margin-right: 0;
                        margin-bottom: 0;
                    }

                    .u-block-b62f-8 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-9 {
                        background-image: none;
                    }

                    .u-block-b62f-11 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-12 {
                        background-image: none;
                    }

                    .u-block-b62f-16 {
                        width: 100%;
                        padding-top: 10px;
                        padding-right: 0;
                        padding-bottom: 10px;
                        padding-left: 0;
                        --radius: 21px;
                    }

                    .u-block-b62f-17 {
                        border-style: none none solid;
                        align-self: center;
                        margin-top: 26px;
                        margin-right: 0;
                        margin-bottom: 0;
                        margin-left: auto;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }

                    .u-block-b62f-18 {
                        border-style: none none solid;
                        margin-top: -26px;
                        margin-right: auto;
                        margin-bottom: 0;
                        margin-left: 0;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }
                }
            </style>
            <style data-mode="XS" data-visited="true">
                @media (max-width: 575px) {
                    .u-block-b62f-1 {
                        background-image: none;
                    }

                    .u-block-b62f-2 {
                        min-height: 647px;
                    }

                    .u-block-b62f-3 {
                        min-height: 507px;
                        margin-top: 60px;
                        margin-bottom: 60px;
                        --radius: 20px;
                    }

                    .u-block-b62f-4 {
                        padding-top: 30px;
                        padding-bottom: 30px;
                        padding-left: 30px;
                        padding-right: 30px;
                    }

                    .u-block-b62f-5 {
                        text-transform: uppercase;
                        font-size: 1.5rem;
                        font-weight: 700;
                        letter-spacing: 2px;
                        width: auto;
                        margin-top: 0;
                        margin-bottom: 0;
                        margin-left: 24px;
                        margin-right: 24px;
                    }

                    .u-block-b62f-6 {
                        height: 264px;
                        margin-top: 26px;
                        margin-bottom: 0;
                    }

                    .u-block-b62f-8 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-9 {
                        background-image: none;
                    }

                    .u-block-b62f-11 {
                        text-transform: uppercase;
                        font-size: 0.875rem;
                        letter-spacing: 0px;
                    }

                    .u-block-b62f-12 {
                        background-image: none;
                    }

                    .u-block-b62f-16 {
                        width: 100%;
                        padding-top: 10px;
                        padding-right: 0;
                        padding-bottom: 10px;
                        padding-left: 0;
                        --radius: 21px;
                    }

                    .u-block-b62f-17 {
                        border-style: none none solid;
                        align-self: center;
                        margin-top: 26px;
                        margin-left: auto;
                        margin-right: auto;
                        margin-bottom: 0;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }

                    .u-block-b62f-18 {
                        border-style: none none solid;
                        margin-top: 20px;
                        margin-left: auto;
                        margin-right: auto;
                        margin-bottom: 0;
                        padding-top: 0;
                        padding-bottom: 0;
                        padding-left: 0;
                        padding-right: 0;
                    }
                }
            </style>
        </section>
    </body>

</html>
</html>