<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>


<%--
List<ProductVO> list = (List<ProductVO>)session.getAttribute("list");
//ProductServlet.java(Controller), 存入session的list物件
--%>

<%
	ProductService proSvc = new ProductService();
    List<ProductVO> list = proSvc.getAll();
    pageContext.setAttribute("list",list);
%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Manage Product</title>
<jsp:include page="/views/sellerHeader1.jsp"/>
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Template CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/main_backend.css" />
</head>
<body>
	<div class="screen-overlay"></div>
	<aside class="navbar-aside" id="offcanvas_aside">
		<div class="aside-top">
			<a href="index.html" class="brand-wrap"> 
			<img src="<%=request.getContextPath()%>/assets/imgs/theme/logo_Petting.svg" class="logo" alt="logo" />
			</a>
			<div>
				<button class="btn btn-icon btn-aside-minimize">
					<i class="text-muted material-icons md-menu_open"></i>
				</button>
			</div>
		</div>
		<nav>
			<ul class="menu-aside">
				<li class="menu-item"><a class="menu-link" href="index.html">
						<i class="icon material-icons md-home"></i> <span class="text">會員中心</span>
				</a></li>
				<li class="menu-item has-submenu"><a class="menu-link"
					href="<%=request.getContextPath()%>/views/productManage.jsp"> <i
						class="icon material-icons md-shopping_bag"></i> <span
						class="text">商品管理</span>
				</a></li>
				<li class="menu-item has-submenu"><a class="menu-link"
					href="page-orders-1.html"> <i
						class="icon material-icons md-shopping_cart"></i> <span
						class="text">訂單管理</span>
				</a></li>
				<li class="menu-item has-submenu"><a class="menu-link"
					href="page-form-product-1.html"> <i
						class="icon material-icons md-add_box"></i> <span class="text">商品上架</span>
				</a></li>
				<li class="menu-item has-submenu"><a class="menu-link"
					href="page-transactions-1.html"> <i
						class="icon material-icons md-monetization_on"></i> <span
						class="text">財務管理</span>
				</a></li>
				<li class="menu-item has-submenu"><a class="menu-link" href="#">
						<i class="icon material-icons md-person"></i> <span class="text">我的帳戶</span>
				</a></li>
				<li class="menu-item"><a class="menu-link"
					href="page-reviews.html"> <i
						class="icon material-icons md-comment"></i> <span class="text">留言評價</span>
				</a></li>
				<li class="menu-item"><a class="menu-link" href="#"> <i
						class="icon material-icons md-pie_chart"></i> <span class="text">數據中心</span>
				</a></li>
			</ul>
			<hr />
			<ul class="menu-aside">
				<li class="menu-item has-submenu"><a class="menu-link" href="#">
						<i class="icon material-icons md-settings"></i> <span class="text">相關設定</span>
				</a></li>
			</ul>
			<br /> <br />
		</nav>
	</aside>
	<main class="main-wrap">
		<section class="content-main">
			<div class="content-header">
				<div>
					<h2 class="content-title card-title">商品管理</h2>
				</div>
				<div>
					<a href="<%=request.getContextPath()%>/views/addProduct.jsp" class="btn btn-primary btn-sm rounded">新增商品</a>
				</div>
			</div>
			<div class="card mb-4">
				<header class="card-header">
					<div class="row align-items-center">
						<div class="col col-check flex-grow-0">
							<div class="form-check ms-2">
								
							</div>
						</div>
						<div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
							<select class="form-select">
								<option selected>類別總覽</option>
								<option>寵物飼料</option>
								<option>寵物保健</option>
								<option>寵物零食</option>
							</select>
						</div>
						<div class="col-md-2 col-6">
							<input type="date" class="form-control" />
						</div>
						<div class="col-md-2 col-6">
							<select class="form-select">
								<option selected>上架狀態</option>
								<option>尚未開賣</option>
								<option>熱賣中</option>
								<option>已下架</option>
							</select>
						</div>
					</div>
				</header>
				<!-- card-header end// -->
				<div class="card-body">
				<article class="itemlist">
						<div class="row align-items-center">
							<div class="col col-check flex-grow-0">
								<div class="">
								<h6>ID</h6>
								</div>
							</div>
							<div class="col-lg-3 col-sm-4 col-8 flex-grow-1 col-name">
							<div class="itemside">
								<h6 class="mb-0">商品照片</h6>
							<div class="info">
								<h6 class="mb-0">商品名稱</h6>
							</div>
							</div>
							</div>
							<div class="col-lg-1 col-sm-2 col-4 col-price">
								<h6 class="mb-0">商品價格</h6>
							</div>
							<div class="col-lg-1 col-sm-2 col-4 col-price">
								<h6 class="mb-0">庫存數量</h6>
							</div>
							<div class="col-lg-1 col-sm-2 col-4 col-status">
								<h6 class="mb-0">上架狀態</h6>
							</div>
							<div class="col-lg-2 col-sm-2 col-4 col-date">
								<h6 class="mb-0">上架日期</h6>
							</div>
							<div class="col-lg-2 col-sm-2 col-4 col-action text-end">		
							</div>
						</div>
						<!-- row .// -->
					</article>
				<c:forEach var="productVO" items="${list}" > 
					<article class="itemlist">
						<div class="row align-items-center">
							<div class="col col-check flex-grow-0">				
									<p>${productVO.merid}.</p>
							</div>
							<div class="col-lg-3 col-sm-4 col-8 flex-grow-1 col-name">
								<a class="itemside" href="#">
										<img src="<%=request.getContextPath()%>/assets/imgs/items/1.jpg"
											class="img-sm img-thumbnail" alt="Item" />
									<div class="info">
										<h6 class="mb-0">${productVO.name}</h6>
									</div>
								</a>
							</div>
							<div class="col-lg-1 col-sm-2 col-4 col-price">
								<span>${productVO.price}</span>
							</div>
							<div class="col-lg-1 col-sm-2 col-4 col-price">
								<span>${productVO.stock}</span>
							</div>
							<div class="col-lg-1 col-sm-2 col-4 col-status">
								<c:if test="${productVO.status == 1}">尚未開賣</c:if>
								<c:if test="${productVO.status == 2}">熱賣中</c:if>	
								<c:if test="${productVO.status == 3}">暫停販售</c:if>
							</div>
							<div class="col-lg-2 col-sm-2 col-4 col-date">
								<span>${productVO.shelfDate}</span>
							</div>
							<div class="col-lg-2 col-sm-2 col-4 col-action text-end">
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/views/product.do">
								<button class="btn btn-sm font-sm rounded btn-brand" type="submit"><i class="material-icons md-edit"></i>修改</button>			
			     				<input type="hidden" name="merid"  value="${productVO.merid}">
			     				<input type="hidden" name="action" value="getOne_For_Update"></FORM>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/views/product.do">
								<button class="btn btn-sm font-sm btn-light rounded" type="submit"><i class="material-icons md-delete_forever"></i>刪除</button>
			     				<input type="hidden" name="merid"  value="${productVO.merid}">
			     				<input type="hidden" name="action" value="delete"></FORM>
							</div>
						</div>
						<!-- row .// -->
					</article>
				</c:forEach> 
						<!-- row .// -->
					<!-- itemlist  .// -->
				</div>
				<!-- card-body end// -->
			</div>
			<!-- card end// -->
			<div class="pagination-area mt-30 mb-50">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-start">
						<li class="page-item active"><a class="page-link" href="#">01</a></li>
						<li class="page-item"><a class="page-link" href="#">02</a></li>
						<li class="page-item"><a class="page-link" href="#">03</a></li>
						<li class="page-item"><a class="page-link dot" href="#">...</a></li>
						<li class="page-item"><a class="page-link" href="#">16</a></li>
						<li class="page-item"><a class="page-link" href="#"><i
								class="material-icons md-chevron_right"></i></a></li>
					</ul>
				</nav>
			</div>
		</section>
		<!-- content-main end// -->
	</main>
	<script src="<%=request.getContextPath()%>/assets/js/vendors/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/vendors/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/vendors/select2.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/vendors/perfect-scrollbar.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/vendors/jquery.fullscreen.min.js"></script>
	<!-- Main Script -->
	<script src="<%=request.getContextPath()%>/assets/js/main_backend.js" type="text/javascript"></script>
</body>
</html>