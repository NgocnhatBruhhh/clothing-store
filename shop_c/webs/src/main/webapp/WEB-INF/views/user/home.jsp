<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <meta name="keywords" content="Related Products, INTUITIVE">
  <meta name="description" content="">
  <title>Home</title>
  <link rel="stylesheet" href="css/page.css" media="screen">
  <link rel="stylesheet" href="css/index.css" media="screen">
  <meta name="generator" content="Nicepage 7.0.3, nicepage.com">
  <link id="u-theme-google-font" rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
  <link id="u-page-google-font" rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i">

  <meta name="theme-color" content="#478ac9">
  <meta property="og:title" content="Home">
  <meta property="og:type" content="website">
  <meta data-intl-tel-input-cdn-path="intlTelInput/">
</head>

<body data-home-page="Home.html" data-home-page-title="Home" data-path-to-root="./" data-include-products="true"
  class="u-body u-overlap u-overlap-contrast u-xl-mode" data-lang="en">

  <jsp:include page="/WEB-INF/views/layout/header.jsp" />



  <section class="skrollable u-align-center u-clearfix u-grey-5 u-lightbox u-parallax u-section-1" id="carousel_93bd"
    data-href="#" data-image-width="2000" data-image-height="1333">
    <c:if test="${empty productInfo}">
      <jsp:include page="/WEB-INF/views/user/noproduct.jsp" />
      <style>
        section {
          margin-top: 90px;
          min-height: 80vh;
          background: #fff;
        }

        body {
          min-height: 80vh;
        }

        .notmargin {
          margin: 0 !important;
        }
      </style>
    </c:if>

    <c:if test="${not empty productInfo}">

      <div class="u-clearfix u-sheet u-sheet-1">
        <h2
          class="u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
          ${message}</h2>
        <div
          class="u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-border-3 u-border-grey-dark-1 u-line u-line-horizontal u-line-1">
        </div>
        <!--products--><!--products_options_json--><!--{"type":"products-recent","source":"","tags":"","count":"7"}--><!--/products_options_json-->
        <div class="u-expanded-width u-layout-grid u-products u-products-1" data-site-sorting-prop="created"
          data-site-sorting-order="desc" data-items-per-page="5" data-products-datasource="cms" data-max-items="7">
          <div class="u-list-control"></div>
          <div class="u-repeater u-repeater-1">


            <!--product_item-->
            <c:forEach var="product" items="${productInfo}">
              <div
                class="u-align-center u-border-1 u-border-palette-5-light-2 u-container-style u-gradient u-products-item u-repeater-item u-repeater-item-1"
                data-product-id="2">
                <div class="u-container-layout u-similar-container u-container-layout-1"><!--product_image-->
                  <img alt="" class="u-expanded-width u-image u-image-round u-product-control u-radius u-image-1"
                    src="images/products/${product[3]}"><!--/product_image--><!--product_title-->
                  <h4 class="u-align-center u-product-control u-text u-text-default u-text-2">
                    <a class="u-product-title-link"
                      href="#"><!--product_title_content-->${product[1]}<!--/product_title_content--></a>
                  </h4><!--/product_title--><!--product_price-->
                  <div class="u-align-center u-product-control u-product-price u-product-price-1"
                    data-add-zero-cents="true">
                    <div class="u-price-wrapper u-spacing-10"><!--product_old_price-->
                      <div class="u-old-price" style="text-decoration: line-through !important;">
                        <!--product_old_price_content--> <fmt:formatNumber value="${product[2]*1.4}" type="number" groupingUsed="true" /> <!--/product_old_price_content-->
                      </div>
                      <!--/product_old_price--><!--product_regular_price-->
                      <div class="u-price u-text-palette-2-base" style="font-size: 1.25rem; font-weight: 700;">
                        <!--product_regular_price_content--> <fmt:formatNumber value="${product[2]}" type="number" groupingUsed="true" /> ₫ <!--/product_regular_price_content-->
                      </div>
                      <!--/product_regular_price-->
                    </div>
                  </div><!--/product_price-->
                  <form action="productinfo.htm" method="post">
                  	<input type = "hidden" name ="proid" value ="${product[0]}">
	                   <button
	                    class="u-btn u-btn-round u-button-style u-radius u-btn-1">Xem chi tiết </button>
                  </form>
                 
                </div>
              </div>

            </c:forEach>

          </div>
          <div class="u-list-control"></div>
        </div><!--/products-->
      </div>
    </c:if>

  </section>
  <style>
    .u-align-center.u-border-1.u-border-palette-5-light-2 {

      border-radius: 8px;
    }
    
     button{
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
			overflow:hidden;
		}
		
		.u-btn{
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
			overflow:hidden;
		}
		
		
			.u-layout{
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2)!important;
		}

    .u-align-center.u-product-control.u-text {
      display: block;
      margin: 0 !important;
      margin-top: 15px !important;
      width: 100%;
    }

    .u-product-title-link {
      font-size: 20px !important;
      display: block !important;
      text-align: center;
    }

    .u-align-center.u-border-1.u-border-palette-5-light-2:hover {
      transform: translateY(-4px);
      box-shadow: 0px 0px 8px 0px rgba(160, 160, 160, 2);
    }
  </style>
  <style class="u-overlap-style">
    .u-overlap:not(.u-sticky-scroll) .u-header {
      background-color: #333333 !important
    }
  </style>



  <jsp:include page="/WEB-INF/views/layout/footer.jsp" />


  <style>
    h2 {
      color: #478ac9 !important;
      opacity: 0.8 !important;
    }

    .u-section-1 .u-container-layout-1 {
      padding: 20px;
      ]
    }

    .u-dialog-section-4 .u-dialog-1 {
      width: 570px;
      min-height: 578px;
      height: auto;
      box-shadow: 0px 0px 8px 0px rgba(0, 0, 0, 0.2);
      margin: 60px auto;
    }

    .u-dialog-section-4 .u-container-layout-1 {
      padding: 34px 35px;
    }

    .u-dialog-section-4 .u-text-1 {
      font-weight: 700;
      margin: 0 165px 0 0;
    }

    .u-dialog-section-4 .u-products-1 {
      margin-top: 30px;
      margin-bottom: 0;
    }

    .u-dialog-section-4 .u-repeater-1 {
      grid-template-columns: 100%;
      min-height: 206px;
      grid-gap: 10px;
    }

    .u-dialog-section-4 .u-container-layout-2 {
      padding: 0 0 30px;
    }

    .u-dialog-section-4 .u-text-2 {
      background-image: none;
      margin: 0;
    }

    .u-dialog-section-4 .u-text-3 {
      font-size: 0.875rem;
      margin: 20px 0 0;
    }

    .u-dialog-section-4 .u-product-quantity-1 {
      width: 125px;
      margin: 30px auto 0 0;
    }

    .u-dialog-section-4 .u-product-price-1 {
      margin: -34px 0 0 auto;
    }

    .u-dialog-section-4 .u-payment-services-1 {
      min-height: 250px;
      min-width: 50px;
      margin: 0;
    }

    .u-dialog-section-4 .u-container-layout-3 {
      padding: 20px 0 0;
    }

    .u-dialog-section-4 .u-container-layout-4 {
      padding: 20px 0 0;
    }

    .u-dialog-section-4 .u-btn-1 {
      width: 100%;
      margin: 0 auto;
    }

    .u-dialog-section-4 .u-icon-1 {
      width: 20px;
      height: 20px;
      left: auto;
      top: 36px;
      position: absolute;
      right: 35px;
      padding: 0;
    }

    @media (max-width: 1199px) {
      .u-dialog-section-4 .u-text-1 {
        margin-right: 165px;
      }

      .u-dialog-section-4 .u-payment-services-1 {
        margin-right: initial;
        margin-left: initial;
      }
    }

    @media (max-width: 991px) {
      .u-dialog-section-4 .u-container-layout-1 {
        padding: 30px;
      }

      .u-dialog-section-4 .u-container-layout-3 {
        padding-bottom: 0;
        padding-left: 0;
        padding-right: 0;
      }

      .u-dialog-section-4 .u-container-layout-4 {
        padding-bottom: 0;
        padding-left: 0;
        padding-right: 0;
      }

      .u-dialog-section-4 .u-icon-1 {
        top: 32px;
        right: 30px;
      }
    }

    @media (max-width: 767px) {
      .u-dialog-section-4 .u-dialog-1 {
        width: 540px;
      }
    }

    @media (max-width: 575px) {
      .u-dialog-section-4 .u-dialog-1 {
        width: 340px;
      }

      .u-dialog-section-4 .u-container-layout-1 {
        padding-left: 20px;
        padding-right: 20px;
      }

      .u-dialog-section-4 .u-text-1 {
        margin-right: 5px;
      }

      .u-dialog-section-4 .u-icon-1 {
        right: 20px;
      }
    }
  </style>
</body>

</html>