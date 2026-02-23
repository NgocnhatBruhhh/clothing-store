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
            <div class="u-clearfix u-sheet u-valign-middle u-block-b62f-2">
                <div
                    class="u-align-center u-border-20 u-border-no-bottom u-border-no-left u-border-no-top u-border-palette-1-base u-container-align-center u-container-style u-custom-border u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-radius u-shape-round u-white u-block-b62f-3">
                    <div class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-xl u-block-b62f-4">
                        <h2 class="u-text u-text-default u-text-palette-1-base u-block-b62f-5">Đăng nhập
                        <p class = "message" >${message}</p>
                        ​</h2>
                        
                        <div class="u-expanded-width-xs u-form u-login-control u-block-b62f-6">
                            <form action="authcode.htm" method="POST"
                                  class="u-clearfix u-form-custom-backend u-form-spacing-10 u-form-vertical u-inner-form" source="custom"
                                  name="form" style="padding: 16px;" data-services="">
                                <div class="u-form-group u-form-name u-block-b62f-7">
                                    <label for="username-a30d" class="u-label u-text-grey-25 u-block-b62f-8">Nhập mã code gồm 8 chữ số được gửi qua mail</label>
                                    <input type="number" placeholder="Nhập code" id="username-a30d" name="code"
                                           class="u-border-2 u-border-grey-10 u-grey-10 u-input u-input-rectangle u-block-b62f-9" >
                                </div>

                                <div class="u-align-left u-form-group u-form-submit u-block-b62f-15">
                                    <button  class="u-btn u-btn-round u-btn-submit u-button-style u-radius u-block-b62f-16">Xác nhận</button>
                                    <input type="submit" value="submit" class="u-form-control-hidden">
                                </div>
                                <input type="hidden" value="" name="recaptchaResponse">


                            </form>
                        </div><a href="register.htm"
                                         class="u-border-1 u-border-active-palette-1-base u-border-hover-palette-1-base u-btn u-button-style u-login-control u-login-create-account u-none u-text-palette-1-base u-block-b62f-18">Bạn
                            chưa có tài khoản?​</a>
                    </div>
                </div>
            </div>
            <style data-mode="XL">
            
            		.message{
            		
            			position: absolute; top: 100%; width: 100%;
            			font-size: 14px!important; color: #bd381b;
            			text-transform: none;
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