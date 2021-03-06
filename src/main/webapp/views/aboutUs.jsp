<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Petting-關於我們</title>
<!-- Favicon-->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/imgs/theme/favicon.svg" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=request.getContextPath()%>/assets/css/styles.css"
	rel="stylesheet" />
<jsp:include page="/views/userHeader.jsp" />
</head>
<style>
	h2.text-uppercase{
		color:#08834a;
	}
	div.modal-content{
		background-image: url('<%=request.getContextPath()%>/image/pokemonshirts_wp100/201.jpg');
		background-size:105%;
		background-origin: 0.6;
		opacity:0.92;
	}
	P.article{
		font-size: 24px; color:#08834a;
		text-align: left;
/* 		margin-left: 400px; */
	}
	li.manager{
		font-size: 20px; color:#08834a; 
		margin-left: 0px;
	}
	
</style>
<body id="page-top">
	<!-- Navigation-->
	<!-- <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="assets/img/navbar-logo.svg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="#portfolio">Portfolio</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#team">Team</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav> -->
	<!-- Masthead-->
	<!-- <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Petting!</div>
                <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
            </div>
        </header> -->
	<!-- Services-->
	<section class="page-section" id="services">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Petting 的服務內容</h2>
				<h3 class="section-subheading text-muted">販售寵物商品的購物平台 &
					分享討論寵物心得的論壇</h3>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fa-solid fa-cart-shopping fa-stack-2x"
						style="color: #3BB77E"></i>
					</span>
					<h4 class="my-3">Petting的網路購物</h4>
					<p class="text-muted">輕鬆簡易的購物流程</p>
					<p class="text-muted">方便操作的購物系統</p>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fa-solid fa-laptop fa-stack-2x" style="color: #3BB77E"></i>
					</span>
					<h4 class="my-3">Petting的廠商會員</h4>
					<p class="text-muted">條列式的商品管理</p>
					<p class="text-muted">容易追蹤及更新的訂單頁面</p>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fa-solid fa-dog fa-stack-2x" style="color: #3BB77E"></i>
					</span>
					<h4 class="my-3">Petting 的寵物論壇</h4>
					<p class="text-muted">訪客也能瀏覽文章</p>
					<p class="text-muted">會員可以盡情地分享自己的寵物經驗</p>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Team-->
	<section class="page-section bg-light" id="team">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">香香組的組員</h2>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="<%=request.getContextPath()%>/image/aboutUs/JW_.png"
							alt="..." />
						<h4>張家瑋</h4>
						<i class="fas fa-solid fa-phone"></i> &nbsp 0910-855899 <br>
						<i class="fas fa-solid fa-envelope"></i>&nbsp cawic107@gmail.com
						<!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a> -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member" >
						<img class="mx-auto rounded-circle" src="<%=request.getContextPath()%>/image/aboutUs/SA.jpg"
							alt="..." />
						<h4>盧思安</h4>
						<i class="fas fa-solid fa-phone"></i> &nbsp 0910-965433 <br>
						<i class="fas fa-solid fa-envelope"></i>&nbsp im_lu3@hotmail.com
						<!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a> -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="<%=request.getContextPath()%>/image/aboutUs/TY.jpg"
							alt="..." />
						<h4>張庭瑜</h4>
						<i class="fas fa-solid fa-phone"></i> &nbsp 0975-370125 <br>
						<i class="fas fa-solid fa-envelope"></i>&nbsp b860627@gmail.com
						<!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a> -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="<%=request.getContextPath()%>/image/aboutUs/YS.jpg"
							alt="..." />
						<h4>張毓珊</h4>
						<i class="fas fa-solid fa-phone"></i> &nbsp 0918-890529 <br>
						<i class="fas fa-solid fa-envelope"></i>&nbsp schang119@gmail.com
						<!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a> -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="<%=request.getContextPath()%>/image/aboutUs/YH.png"
							alt="..." />
						<h4>郭語涵</h4>
						<i class="fas fa-solid fa-phone"></i> &nbsp 0987-330938 <br>
						<i class="fas fa-solid fa-envelope"></i>&nbsp
						b14001378@gs.ncku.edu.tw
						<!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a> -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="<%=request.getContextPath()%>/image/aboutUs/JT.png"
							alt="..." />
						<h4>陳璟葶</h4>
						<i class="fas fa-solid fa-phone"></i> &nbsp 0988-083495 <br>
						<i class="fas fa-solid fa-envelope"></i>&nbsp astrid0919@gmail.com
						<!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a> -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<p class="large text-muted">緯育Tibame &nbsp Java雲端服務開發技術養成班:
						105期第三組</p>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Portfolio Grid-->
	<section class="page-section bg-light" id="portfolio">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Petting 的製作人們</h2>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 1-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal1">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="https://tw.portal-pokemon.com/play/resources/pokedex/img/pm/ce0ed390ecb8d857d35fc9f9218107752500889a.png"
							alt="..." height="250" width="380" />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">張家瑋</div>
							<div class="portfolio-caption-subheading text-muted">後台管理、身分驗證</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 2-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="https://tw.portal-pokemon.com/play/resources/pokedex/img/pm/7ef9e71e9dc624e5558d7b4619f75ea8659eff55.png"
							alt="..." height="250" width="380" />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">盧思安</div>
							<div class="portfolio-caption-subheading text-muted">搜尋首頁、商品頁</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal3">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="https://tw.portal-pokemon.com/play/resources/pokedex/img/pm/bac1f907c1b3d8eb9ea77477c395cf31147b47e5.png"
							alt="..." height="250" width="380" />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">張庭瑜</div>
							<div class="portfolio-caption-subheading text-muted">廠商、會員中心</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
					<!-- Portfolio item 4-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal4">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="https://tw.portal-pokemon.com/play/resources/pokedex/img/pm/f3868a6a16c75d75435819deab8bab97926fc54c.png"
							alt="..." height="250" width="380" />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">張毓珊</div>
							<div class="portfolio-caption-subheading text-muted">購物車、會員訂單</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- Portfolio item 5-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal5">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="https://tw.portal-pokemon.com/play/resources/pokedex/img/pm/aae700aa7bb29fae4a30b77c495b0b66406d74d6.png"
							alt="..." height="250" width="380" />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">郭語涵</div>
							<div class="portfolio-caption-subheading text-muted">論壇網頁、文章管理</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<!-- Portfolio item 6-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal6">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="https://tw.portal-pokemon.com//play/resources/pokedex/img/pm/706c8f11741c23d1fe770bfaa46d57b7c424522c.png"
							alt="..." height="250" width="380" />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">陳璟葶</div>
							<div class="portfolio-caption-subheading text-muted">商品管理、廠商訂單</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	
	<!-- Clients-->
	<div class="py-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/maven.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/Tomcat.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/java.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/java servlet.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/jsp.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/jQuery.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/HTML.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/AJAX.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/eclipse.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/SourceTree.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/git.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/redis.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/MySQL.png" alt="..." /></a>
				</div>
				<div class="col-md-2 col-sm-6 my-3">
					<img class="img-fluid img-brand d-block mx-auto"
						src="<%=request.getContextPath()%>/image/aboutUs/JDBC.png" alt="..." /></a>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact-->
	<!-- Footer-->
	<jsp:include page="/views/footer.jsp" />
	<footer class="footer py-4">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 text-lg-start">Copyright &copy; Petting
					2022</div>
			</div>
		</div>
	</footer>
	<!-- Portfolio Modals-->
	<!-- Portfolio item 1 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="<%=request.getContextPath()%>/assets/imgs/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">後台管理、身分驗證</h2>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/JW1.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/JW2.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/JW3.png" />
								<p class="article">
									1.後台管理系統<br>
									2.商家賣場頁面<br>
									3.會員身分驗證<br>
									4.廠商客服系統<br>
									5.Git版本控制

								</p>
								<ul class="list-inline">
									<li class="manager"><strong>>項目負責人:</strong> 張家瑋</li>
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 2 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal2"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="<%=request.getContextPath()%>/assets/imgs/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">搜尋首頁、商品頁</h2>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/SA1.png"/>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/SA2.png"/>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/SA3.png"/>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/SA4.png"/>
								<p class="article">
									1.商城首頁畫面<br>
									2.商品的資料查詢<br>
									3.購物車商品加入<br>
									4.Git版本控制
								</p>
								<ul class="list-inline">
									<li class="manager"><strong>>項目負責人:</strong> 盧思安</li>
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 3 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal3"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="<%=request.getContextPath()%>/assets/imgs/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">廠商、會員中心</h2>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/TY1.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/TY2.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/TY3.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/TY4.png" />
								<p class="article">
									1.廠商、會員登入頁面<br>
									2.廠商、會員登入驗證<br>
									3.廠商、會員中心頁面
									
								</p>
								<ul class="list-inline">
									<li class="manager">><strong>項目負責人:</strong> 張庭瑜</li>
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 4 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal4"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="<%=request.getContextPath()%>/assets/imgs/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">購物車、會員訂單</h2>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/YS1.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/YS2.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/YS3.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/YS4.png" />
								<p class="article">
									1.購物車<br>
									2.購物車商品修改<br>
									3.結帳頁面同步會員資料<br>
									4.結帳成功產生訂單
									
								</p>
								<ul class="list-inline">
									<li class="manager"><strong>>項目負責人:</strong> 張毓珊</li>
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 5 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal5"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="<%=request.getContextPath()%>/assets/imgs/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">論壇網頁、文章管理</h2>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/YH1.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/YH2.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/YH3.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/YH4.png" />
								<p class="article">
									1.文章新增/修改<br>
									2.文章收藏<br>
									3.會員追蹤功能<br>
									4.論壇首頁
								</p>
								<ul class="list-inline">
									<li class="manager"><strong>>項目負責人:</strong> 郭語涵</li>
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 6 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal6"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="<%=request.getContextPath()%>/assets/imgs/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">商品管理、廠商訂單</h2>
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/JT1.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/JT2.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/JT3.png" />
								<img class="img-fluid d-block mx-auto"
									src="<%=request.getContextPath()%>/image/aboutUs/JT4.png" />
									<p class="article">
									1.商家會員<br>
									2.商家後台-商品新增、修改<br>
									4.商家後台-出貨訂單管理
								</p>
								
								<ul class="list-inline">
									<li class="manager"><strong>>項目負責人:</strong> 陳璟葶</li>
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="<%=request.getContextPath()%>/assets/js/bootstrapscripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
