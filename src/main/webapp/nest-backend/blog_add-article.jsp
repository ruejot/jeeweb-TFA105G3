<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memblogart.model.*"%>
<%@ page import="com.members.model.*" %>

<%
MembersVO membersVO = (MembersVO) session.getAttribute("MemberUsing");

MemBlogArtVO memBlogArtVO = (MemBlogArtVO) request.getAttribute("memBlogArtVO");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Nest Dashboard</title>
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta property="og:title" content="" />
<meta property="og:type" content="" />
<meta property="og:url" content="" />
<meta property="og:image" content="" />
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/imgs/theme/favicon.svg" />
<!-- Template CSS -->
<link
	href="<%=request.getContextPath()%>/nest-backend/assets/css/main.css"
	rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="screen-overlay"></div>
	<main class="main-wrap">
		<section class="content-main">
			<div class="row">
				<div class="col-9">
					<div class="content-header">
						<h2 class="content-title">新增文章</h2>
					</div>
				</div>
				<form action="<%=request.getContextPath()%>/MemBlogArtServlet"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="action" value="insert">
					<input type="hidden" name="merberusing"
                        value="<%=membersVO.getMemberid()%>">

					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-body">
								<div class="mb-4">
									<label for="product_title" class="form-label">文章標題</label> 
									　　<input
										type="text" placeholder="Type here" class="form-control"
										id="product_title" name="title"
										value="<%=(memBlogArtVO == null) ? "" : memBlogArtVO.getTitle()%>"/>
								</div>
								<div id="errMsg"/>
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
							</div>
						</div>
						<!-- card end// -->
						<div class="card mb-4">
							<div class="card-body">
								<div>
									<label for="article_content" class="form-label">文章內容</label>
									<textarea id="article_content"　placeholder="Type here" class="form-control"
										rows="20" name="content" style="height: 300px"><%=(memBlogArtVO == null) ? "" : memBlogArtVO.getContent()%></textarea>
								</div>
								<div id="errMsg2"/>
							</div>
							<div class="card-body">


								<div class="mb-4">
									<label class="form-label">#HashTags</label> <input type="text"
										placeholder="Type here" class="form-control" />
								</div>
								<span>熱門#HashTags</span> <a href="#"
									class="font-xs hover-up mr-15"><i
									class="font-xs material-icons md-close text-body"></i> 兔兔這麼可愛</a> <a
									href="#" class="font-xs hover-up mr-15"><i
									class="font-xs material-icons md-close text-body"></i> 喵主子</a> <a
									href="#" class="font-xs hover-up mr-15"><i
									class="font-xs material-icons md-close text-body"></i> 黃金獵犬</a>

							</div>
						</div>
						<!-- card end// -->



						<div class="card mb-4">
							<div class="card-body">
								<div>


									<label class="form-label">上傳圖片</label> <input
										class="form-control" type="file" name="file" />
								</div>
							</div>
						</div>
						<div class="card mb-4"></div>

						<div>
							<button
								class="btn btn-light rounded font-sm mr-5 text-body hover-up">儲存草稿</button>
							<button type="submit" class="btn btn-md rounded font-sm hover-up">新增文章</button>
						</div>
						
				</form>


				<!-- card end// -->
			</div>


			<!-- card end// -->
			</div>

		</section>
	</main>
	<script src="assets/js/vendors/jquery-3.6.0.min.js"></script>
	<script src="assets/js/vendors/bootstrap.bundle.min.js"></script>
	<script src="assets/js/vendors/select2.min.js"></script>
	<script src="assets/js/vendors/perfect-scrollbar.js"></script>
	<script src="assets/js/vendors/jquery.fullscreen.min.js"></script>
	<!-- Main Script -->
	<script src="assets/js/main.js?v=1.1" type="text/javascript"></script>
	<script>
		$("input#product_title").blur(function(){
			if ($("input#product_title").val().trim()=='')
				$("#errMsg").html("<div class='text-danger'>文章標題不得空白</div>")
			else
				$("#errMsg").html("")
		})
	</script>

<script>
	$("textarea#article_content").blur(function(){
		if ($("textarea#article_content").val().trim()=='')
			$("#errMsg2").html("<div class='text-danger'>文章內容不得空白</div>")
		else
			$("#errMsg2").html("")
	})
</script>

<script>
	function verificationPicFile(file) {
    	var fileSize = 0;
     	var fileMaxSize = 5*5*1024;//25M
     	var filePath = file.value;
     	if(filePath){
        	fileSize =file.files[0].size;
        	var size = fileSize / 1024;
        	if (size > fileMaxSize) {
            	alert("文件大小不能大於1M！");
            	file.value = "";
            return false;
        }else if (size <= 0) {
            	alert("請上傳圖片");
            	file.value = "";
           return false;
        }
     }else{
         return false;
     }
 }
</script>


</body>
</html>
