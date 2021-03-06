<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Petting 會員中心</title>
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Template CSS -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/plugins/animate.min.css" /> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/main_frontend.css" /> --%>
<script src="https://kit.fontawesome.com/7e95db7a28.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Quick view -->
	<header class="header-area header-style-1 header-height-2">
		<div class="header-middle header-middle-ptb-1 d-none d-lg-block">
			<div class="container">
				<div class="header-wrap">
					<div class="logo logo-width-1">
						<a href="<%=request.getContextPath()%>/nest-frontend/HomePage.jsp"><img
							src="<%=request.getContextPath()%>/assets/imgs/theme/logo_Petting.svg" alt="logo" /></a>
					</div>
					<div class="header-right">
						<div class="search-style-2">
<!-- 							<form action="#"> -->
<!-- 								<input type="text" placeholder="請輸入關鍵字...." /> -->
<!-- 							</form> -->
						</div>
														<div class="header-action-right">
									<div class="header-action-2">
										<div class="header-action-icon-2">
											<a href="<%=request.getContextPath()%>/nest-backend/productManage.jsp">
											<span class="lable mr-10" style="font-size: 18px; color: #3bb77e;"><i class="fa-regular fa-shelves fa-lg mr-5"></i>商品管理</span></a>
										</div>
										<div class="header-action-icon-2">
											<a href="<%=request.getContextPath()%>/nest-backend/orderManage.jsp">
												<span class="lable mr-10" style="font-size: 18px; color: #3bb77e;"><i class="far fa-folder-open fa-lg mr-5"></i>訂單管理</span></a>
										</div>
										<div class="header-action-icon-2">
											<a>
											<span class="label mr-40" style="font-size: 18px; color: #3bb77e;"><i class="fa-regular fa-user-large fa-lg mr-5"></i>合作廠商</span></a>
											<div
												class="cart-dropdown-wrap cart-dropdown-hm2 account-dropdown">
												<ul>
													<li><a
														href="<%=request.getContextPath()%>/nest-backend/busAccountCenter.jsp">
															<i class="fi fi-rs-user mr-10"></i>廠商資料
													</a></li>
													<li><a
														href="<%=request.getContextPath()%>/nest-frontend/fendshop_mainpage.jsp?action=fromBackendSelf">
															<i class="fi fi-rs-settings-sliders mr-10"></i>我的商店
													</a></li>
													<li><a
														href="<%=request.getContextPath()%>/bus/BusLogout?action=logout">
<!-- 														<input type="hidden" name="action" value="logout"> -->
															<i class="fi fi-rs-sign-out mr-10"></i>廠商登出
													</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	       <div class="mobile-header-active mobile-header-wrapper-style">
            <div class="mobile-header-wrapper-inner">
                <div class="mobile-header-top">
                    <div class="mobile-header-logo">
                        <a href="index.html"><img src="<%=request.getContextPath()%>/assets/imgs/theme/logo_Petting.svg" alt="logo" /></a>
                    </div>
                    <div class="mobile-menu-close close-style-wrap close-style-position-inherit">
                        <button class="close-style search-close">
                            <i class="icon-top"></i>
                            <i class="icon-bottom"></i>
                        </button>
                    </div>
                </div>
                <div class="mobile-header-content-area">
                    <div class="mobile-search search-style-3 mobile-header-border">
                        <form action="#">
                            <input type="text" placeholder="請輸入關鍵字..." />
                            <button type="submit"><i class="fi-rs-search"></i></button>
                        </form>
                    </div>
                    <div class="mobile-header-info-wrap">
                        <div class="single-mobile-header-info">
                            <a href="page-contact.html"><i class="fi-rs-marker"></i>台北市中山區南京東路三段219號5樓 </a>
                        </div>
                        <div class="single-mobile-header-info">
                            <a href="<%=request.getContextPath()%>/nest-frontend/Login.jsp"><i class="fi-rs-user"></i>登入 / 登出 </a>
                        </div>
                        <div class="single-mobile-header-info">
                            <a href="#"><i class="fi-rs-headphones"></i>02-2712-0589 </a>
                        </div>
                    </div>
                    <!--
                    <div class="mobile-social-icon mb-50">
                        <h6 class="mb-15">Follow Us</h6>
                        <a href="#"><img src="assets/imgs/theme/icons/icon-facebook-white.svg" alt="" /></a>
                        <a href="#"><img src="assets/imgs/theme/icons/icon-twitter-white.svg" alt="" /></a>
                        <a href="#"><img src="assets/imgs/theme/icons/icon-instagram-white.svg" alt="" /></a>
                        <a href="#"><img src="assets/imgs/theme/icons/icon-pinterest-white.svg" alt="" /></a>
                        <a href="#"><img src="assets/imgs/theme/icons/icon-youtube-white.svg" alt="" /></a>
                    </div>
                    -->
                    <div class="site-copyright">Copyright 2022 © Petting. All rights reserved.</div>
                </div>
            </div>
        </div>
        <!-- End header -->
	<!-- Vendor JS-->
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/vendor/modernizr-3.6.0.min.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/vendor/jquery-3.6.0.min.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/vendor/jquery-migrate-3.3.0.min.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/vendor/bootstrap.bundle.min.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/slick.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/jquery.syotimer.min.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/waypoints.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/perfect-scrollbar.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/magnific-popup.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/select2.min.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/jquery.countdown.min.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/images-loaded.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/isotope.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/scrollup.js"></script>	 --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/jquery.theia.sticky.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/plugins/jquery.elevatezoom.js"></script> --%>
<!-- 	<script src="https://kit.fontawesome.com/60002e5c50.js"></script> -->
	<!-- Template  JS -->
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/main_frontend.js"></script> --%>
<%-- 	<script src="<%=request.getContextPath()%>/assets/js/shop.js?v=4.0"></script> --%>

</body>
</html>