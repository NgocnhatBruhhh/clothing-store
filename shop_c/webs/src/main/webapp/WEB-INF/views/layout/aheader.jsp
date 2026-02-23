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
                <a  href="adhome.htm" class="u-hidden-xs u-image u-logo u-image-1" data-image-width="1000" data-image-height="1400">
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
                                 <li style="position: relative; margin-right: 20px;" class="u-nav-item account">
                                    <a class="u-button-style u-nav-link u-text-active-white u-text-hover-palette-1-base u-text-white"
                                       style="padding: 10px 20px;">Quản lý</a>
                                    <div class="back-list"></div>
                                    <div class="back-list2"></div>
                                    <ul class="account-list u-align-right u-nav u-popupmenu-items u-text-hover-palette-1-base u-unstyled u-nav-2">
                                        <li class="item-menu u-nav-item"><a href="staffmanage.htm" class="u-button-style u-nav-link">Quản lý nhân viên</a></li>
                                        <li class="item-menu u-nav-item"><a href="addstaff.htm" class="u-button-style u-nav-link">Thêm nhân viên</a></li>
                                    </ul>
                                </li>
                                
                                <!-- avtar -->
                                <img src="images/avatar/default-img.png" class="avatar-header">
                                
                                
                                <li style="position: relative" class="u-nav-item account">
                                    <a class="u-button-style u-nav-link u-text-active-white u-text-hover-palette-1-base u-text-white"
                                       style="padding: 10px 20px;">Tài khoản</a>
                                    <div class="back-list"></div>
                                    <div class="back-list2"></div>
                                    <ul class="account-list u-align-right u-nav u-popupmenu-items u-text-hover-palette-1-base u-unstyled u-nav-2">
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