<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String mem_id = (String)session.getAttribute("mem_id");
%>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>결제 페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
</head>
<body>
	<!-- 네비게이션 바 시작 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h4>
				<div class="navbar-header" style="height: 50px">
					<a style="color: #ffffff; height: 25px" href="../member/index"><</a>
					<a href="../member/index" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;카드 결제</a>
				</div>
			</h4>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	<!-- 결제 화면 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="col-md-1"></div>
				<div class="col-md-11">
					<h3>
						<p>
							<img src="/images/AAP1266.png" style="width: 250px; height: 150px; margin-right: 30px" align="left"> 
							<br>삼성카드 
							<br><p>
					        <a href="paymentPW">
								<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="background-color: white; color: black; border-color: white;">
								비밀번호 > 
								</button>
							</a>
						</p>
					</h3>
				</div>
			</div>
		</div>
		<hr>
	</div>
	<!-- 결제 화면 끝 -->
		<!-- 푸터 시작 -->
<%@ include file="../include/footer.jsp" %>	
	<!-- 푸터 끝 -->
</body>
</html>