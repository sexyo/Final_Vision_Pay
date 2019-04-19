<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>결제 페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bin.css">
</head>
<body>
	<!-- 네비게이션 바 시작 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h4>
				<div class="navbar-header" style="height: 50px">
					<a style="color: #ffffff; height: 25px" href="main2.jsp"><</a>
					<a href="card.jsp" style="color: white">&nbsp;<img src="images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;카드</a>
					<span style="margin-left: 150px;"><a href="memberJoin.jsp" ><img src="images/card.png" id="imagepreview" style="width: 40px; height: 20px;">&nbsp;추가</a></span>
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
							<img src="images/AAP1266.png" style="width: 250px; height: 150px; margin-right: 30px" align="left"> 
							<br>삼성카드 
							<br><p>
					<a href="paymentPW.jsp">
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="background-color: white; color: black; border-color: white;">
							비밀번호 > 
						</button>
					</a>
				</p>
						</p>
					</h3>
				</div>
			</div>
		</div>
		<hr>
	</div>
	<!-- 결제 화면 끝 -->
</body>
</html>