<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>내 계정 페이지</title>
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
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="main2.jsp"><</a>
					<a href="myInfo.jsp" style="color: white">&nbsp;<img src="images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;내 계정</a>
				</div>
			</h4>
			<br>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	<!-- 내 정보 화면 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-12" style="margin-left: 30px">
					<h3>
						<p>
							아이디
						</p>
						<p>
							이름
						</p>
						<p>
							전화번호
						</p>
						<p>
							주소
						</p>
						<p>
							성별
						</p>
						<p>
							생년월일
						</p>
						<p>
							비밀번호 확인
						</p>
						<p>
							비밀번호 변경
						</p>
					</h3>
		</div>
		<hr>
	</div>
	<!-- 내 정보 화면 끝 -->
	<!-- 푸터 시작 -->
	<footer style="background-color: #000000;">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3">
					<h4 style="text-align: left;">사이트맵</h4>
					<div class="list-group">
						<a href="main.jsp" class="list-group-item">VISION팀 정보</a> <a
							href="crew.jsp" class="list-group-item">VISION팀원 정보</a> <a
							href="notice.jsp" class="list-group-item">공지사항</a> <a
							href="FAQ.jsp" class="list-group-item">FAQ</a>
					</div>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: left;">고객 문의</h4>
					<a href="email.jsp" class="list-group-item">이메일 문의</a>
				</div>
				<div class="col-sm-4"></div>
				<div class="col-sm-3">
					<h4 style="text-align: left;">sns</h4>
					<div class="list-group">
						<a href="https://www.kakaocorp.com/service/KakaoTalk"
							class="list-group-item">카카오톡</a> <a
							href="https://ko-kr.facebook.com/" class="list-group-item">페이스북</a>
					</div>
					<h5 style="text-align: left;">협력 업체</h5>
					<div class="list-group">
						<a href="http://www.ikosmo.co.kr/" class="list-group-item"
							style="width: 190px; background-color: #ffffff;"> <img
							src="images/top_logo.gif"></a> <a
							href="http://www.moel.go.kr/index.do" class="list-group-item"
							style="width: 190px; background-color: #ffffff;"> <img
							src="images/logo.png"></a>
					</div>
				</div>
				<div class="col-sm-12" style="height: 30px;">
					<h5 style="text-align: left;">Copyright &copy; 2018-2019
						HEESANG All Rights Reserved.</h5>
				</div>

				<div class="col-sm-12">
					<hr>
				</div>
				<div class="col-sm-12">
					<h4 style="text-align: centar;">
						<img src="images/VISION4.png" id="imagepreview"
							style="width: 150px; height: 80px; margin-right: 10px" align="left">
						(주)비전소프트웨어(123-456) 서울시 금천구 가산동 426-5 월드메르디앙 2차 311호 5강의실
						<br> 비전주식회사 대표이사 황희상 사업자등록번호 123-456-78910 대표번호:010-423-9948
					</h4>
				</div>
			</div>
		</div>
	</footer>
	<!-- 푸터 끝 -->
</body>
</html>