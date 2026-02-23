<%@page import="webshop.dao.CustomerDAO"%>
<%@page import="webshop.dao.AccountDAO"%>
<%@page import="webshop.entity.Customer"%>
<%@page import="webshop.entity.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <header  class="u-clearfix u-custom-color-1 u-header u-sticky u-sticky-8e13 u-header" id="sec-ba2b">
            <div  class="u-clearfix u-sheet u-sheet-1">
                <a  href="home.htm" class="u-hidden-xs u-image u-logo u-image-1" data-image-width="1000" data-image-height="1400">
                    <img src="images/web/logo.png" class="u-logo-image u-logo-image-1">
                </a>
                <nav class="u-dropdown-icon u-menu u-menu-one-level u-menu-open-right u-offcanvas u-menu-1"
                     data-responsive-from="MD" data-submenu-level="on-click">
                     <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
                        <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-hamburger-link u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base u-hamburger-link-1"
                           href="#">
                            <svg class="u-svg-link" viewBox="0 0 24 24">
                            <use xlink:href="#menu-hamburger"></use>
                            </svg>
                            <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
                            <g>
                            <rect y="1" width="16" height="2"></rect>
                            <rect y="7" width="16" height="2"></rect>
                            <rect y="13" width="16" height="2"></rect>
                            </g>
                            </svg>
                        </a>
                    </div>
                    <div class="u-custom-menu u-nav-container">
          
                        <ul class="u-nav u-unstyled u-nav-1">
                            <!-- Kiểm tra nếu session tồn tại -->
                            <c:if test="${sessionScope.user != null}">
                                <!-- Nội dung hiển thị khi đã đăng nhập -->
                                <a href="order.htm" class="abc">
                                    <img src="images/web/produc.png" class="avatar-header">
                                </a>
                                <li class="u-nav-item item">
                                    <a class="u-button-style u-nav-link u-text-active-white u-text-hover-palette-1-base u-text-white"
                                       href="order.htm" style="padding: 10px 20px;">Đơn hàng
                                    </a>
                                </li>
                                
                                <!-- avtar -->
                                <img src="images/avatar/default-img.png" class="avatar-header">
                                
                                
                                <li style="position: relative" class="u-nav-item account">
                                    <a class="u-button-style u-nav-link u-text-active-white u-text-hover-palette-1-base u-text-white"
                                       style="padding: 10px 20px;">Tài khoản</a>
                                    <div class="back-list"></div>
                                    <div class="back-list2"></div>
                                    <ul class="account-list u-align-right u-nav u-popupmenu-items u-text-hover-palette-1-base u-unstyled u-nav-2">
                                        <li class="item-menu u-nav-item"><a href="personal.htm" class="u-button-style u-nav-link">Thông tin cá nhân</a></li>
                                        <li class="item-menu u-nav-item"><a href="resetpass.htm" class="u-button-style u-nav-link">Đổi mật khẩu</a></li>
                                        <li class="item-menu u-nav-item"><a href="logout.htm" class="u-button-style u-nav-link">Đăng xuất</a></li>
                                    </ul>
                                </li>
                            </c:if>

                            <!-- Kiểm tra nếu session không tồn tại -->
                            <c:if test="${sessionScope.user == null}">
                                <!-- Nội dung hiển thị khi chưa đăng nhập -->
                                <li class="u-nav-item item">
                                    <a class="u-button-style u-nav-link u-text-active-white u-text-hover-palette-1-base u-text-white"
                                       href="login.htm" style="padding: 10px 20px;">Đăng nhập</a>
                                </li>
                            </c:if>

                        </ul>
                    </div>
                    <div class="u-custom-menu u-nav-container-collapse">

                        <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
                    </div>
                    <style class="menu-style">
                        @media (max-width: 939px) {
                            [data-responsive-from="MD"] .u-nav-container {
                                display: none;
                            }

                            [data-responsive-from="MD"] .menu-collapse {
                                display: block;
                            }
                        }
                    </style>
                </nav><!--shopping_cart-->
                <a class="u-shopping-cart u-shopping-cart-1" href="cart.htm"><span
                        class="u-icon u-shopping-cart-icon u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice"
                                                                      viewBox="0 0 16 16" style="">
                        <use xlink:href="#svg-49fd"></use>
                        </svg><svg class="u-svg-content" viewBox="0 0 16 16" x="0px" y="0px" id="svg-49fd">
                        <path d="M14.5,3l-2.1,5H6.1L5.9,7.6L4,3H14.5 M0,0v1h2.1L5,8l-2,4h11v-1H4.6l1-2H13l3-7H3.6L2.8,0H0z M12.5,13
                              c-0.8,0-1.5,0.7-1.5,1.5s0.7,1.5,1.5,1.5s1.5-0.7,1.5-1.5S13.3,13,12.5,13L12.5,13z M4.5,13C3.7,13,3,13.7,3,14.5S3.7,16,4.5,16
                              S6,15.3,6,14.5S5.3,13,4.5,13L4.5,13z"></path>
                        </svg>
                        <span id="quantityCart" class="u-icon-circle u-palette-1-base u-shopping-cart-count"
                              style="font-size: 0.75rem;">${quantityCart != null ? quantityCart : 0}</span>
                    </span>
                </a><!--/shopping_cart-->
                <form style="max-width: 450px; transform: translateX(15px);" action="search.htm" class="u-border-1 u-border-grey-30 u-radius u-search u-search-left u-white u-search-1"
                      data-search-token="no-license" method="post">
                    <button class="u-search-button" type="submit">
                        <span class="u-search-icon u-spacing-10 u-search-icon-1">
                            <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 56.966 56.966">
                            <use xlink:href="#svg-a313"></use>
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
                                 id="svg-a313" x="0px" y="0px" viewBox="0 0 56.966 56.966" style="enable-background:new 0 0 56.966 56.966;"
                                 xml:space="preserve" class="u-svg-content">
                            <path
                                d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z">
                            </path>
                            </svg>
                        </span>
                    </button>
                    <input style="padding-left: 23px;" class="u-search-input" type="search" name="search" value="" placeholder="Tìm kiếm">
                </form>
            </div>
            <style class="u-sticky-style" data-style-id="8e13">
                .u-sticky-fixed.u-sticky-8e13,
                .u-body.u-sticky-fixed .u-sticky-8e13 {
                    box-shadow: 5px 5px 20px 0 rgba(0, 0, 0, 0.4) !important
                }

                .account:hover .account-list{
                    display: block;
                }

                .abc:hover{
                    color: red!important;
                }

                .account:hover .back-list{
                    display: block;
                }

                .back-list {
                    display: none;
                    transform: translateY(10px);
                    top: 50%;
                    right: 50%;
                    width: 0;
                    height: 0;
                    border-left: 12px solid transparent; /* Nửa đáy tam giác bên trái */
                    border-right: 12px solid transparent; /* Nửa đáy tam giác bên phải */
                    border-bottom: 14px solid #fff; /* Chiều cao và màu tam giác */
                    position: absolute;
                }

                .back-list2 {
                    top: 50%;
                    right: 0;
                    width: 120px;
                    height: 40px;
                    background: transparent;
                    position: absolute;
                }

                .item-menu {
                    padding-left: 10px;
                    color: #333333;
                }

                .account-list{
                    transform: translate(-50px, 5px);
                    padding: 8px;
                    left:0;
                    box-shadow: 5px 5px 20px 0 rgba(0, 0, 0, 0.4);
                    border-radius: 5px;
                    display: none;
                    position: absolute;
                    width: 180px;
                    background: #fff;
                }

                .u-nav-item{

                    cursor: pointer;
                }

                .item{
                    margin-right: 24px;
                }

                .avatar-header{
                    border-radius: 50%;
                    position: absolute;
                    transform: translate(-22px, -3px);
                    padding: 4px;
                    height: 40px;
                    width: 40px;
                }
            </style>
        </header>
    </body>
</html>