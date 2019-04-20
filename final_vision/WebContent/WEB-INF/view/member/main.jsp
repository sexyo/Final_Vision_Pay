<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1"></mata>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
<title>메인(로그아웃) 페이지</title>
</head>
<body>
<style type="text/css">
.jumbotron {
	background-image: url('/images/vision.gif');
	background-size: cover;
	text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
	width: 100%;
	height: 100%;
}
</style>
	<%
		//로그인시 mem_id라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String mem_id = null;
		String r_card = null;
		String r_account = null;
		String r_point = null;
		String r_mship = null;
		String r_coupon = null;
		if (session.getAttribute("mem_id") != null) {
			mem_id = (String) session.getAttribute("mem_id");
			r_card = (String) request.getAttribute("r_card");
			r_account = (String) request.getAttribute("r_account");
			r_point = (String) request.getAttribute("r_point");
			r_mship = (String) request.getAttribute("r_mship");
			r_coupon = (String) request.getAttribute("r_coupon");
	%>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				type : "Get",
				url : "../plan/mainCarousel",
				dataType : "HTML",
				success : function(data) {
					$("#mainCar").html(data);
				}
			});
		});
	</script>
	<%
		}

		int pageNumber = 1; //기본 페이지 넘버
		//페이지넘버값이 있을때
		if (request.getParameter("pageNumber") != null) {

			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<!-- 네비게이션 바 시작 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">

			<div class="navbar-header">
				<h4>
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navber-collapse-1"
						aria-expanded="false">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index"> <img
						src="/images/vision_pay.png" id="imagepreview"
						style="width: 150px; height: 30px">
					</a>
				</h4>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navber-collapse-1">
				<h4>
					<ul class="nav navbar-nav">
						<%
							//로그아웃인 경우
							if (mem_id == null) {
						%>
						<li class="active"><a href="index">VISION PAY 소개 <span
								class="sr-only"></span>
						</a></li>
						<li><a href="crew">VISION 팀원 소개</a></li>
						<%
							} else {
						%>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">VISION PAY 기능 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="../card/card"><img src="/images/card.png"
										id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;카드</a></li>
								<li><a href="../account/account"><img src="/images/account.png"
										id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;계좌</a></li>
								<li><a href="#"><img
										src="/images/membership.png" id="imagepreview"
										style="width: 30px; height: 20px">&nbsp;&nbsp;멤버쉽</a></li>
								<li><a href="../plan/planList"><img
										src="/images/planner.png" id="imagepreview"
										style="width: 30px; height: 20px">&nbsp;&nbsp;플래너</a></li>
								<li><a href="../recommend/myRecommendCard"><img
										src="/images/cardRecommend.png" id="imagepreview"
										style="width: 30px; height: 20px">&nbsp;&nbsp;카드 추천</a></li>
								<li><a href="#"><img src="/images/reward.png"
										id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;리워즈</a></li>
							</ul></li>
						<li><a href="../pay/payment">VISION 결제</a></li>

						<%
							}
						%>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false" style="background-color: black;"> <img
								src="/images/login.png" style="width: 20px; height: 20px"><span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<%
									//로그아웃인 경우
									if (mem_id == null) {
								%>
								<li><a href="../member/login">로그인</a></li>
								<li><a href="../member/register">회원가입</a></li>
								<%
									} else {
								%>
								<li><a href="#">내계정</a></li>
								<li><a href="logout">로그아웃</a></li>
								<%
									}
								%>
							</ul></li>
					</ul>
					<form class="navbar-form navbar-right">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="내용을 입력하세요.">
						</div>
						<label for="#"></label>
						<button type="submit" class="btn btn-default">검색</button>
					</form>
				</h4>
			</div>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	<!-- 메인 화면 시작 -->
	<div class="container">
		<%
			//로그아웃인 경우
			if (mem_id == null) {
		%>
		<!-- 점보트론 시작 -->
		<div class="jumbotron">
			<p class="text-center">
				<a><IMG SRC="/images/vision_pay.png" ID="IMAGEPREVIEW"
					style="width: 200px; height: 70px"></a>
			</p>
			<p class="text-center">스마트한 당신의 지갑 경험해 보세요.</p>
			<p class="text-center">
			</p>
		</div>
		<!-- 점보트론 끝 -->
		<%
			} else {
		%>
		<div>
			<!-- 캐러셀 시작 -->
			<div width="100%">
				<h2>플래너</h2>
				<div id="mainCar" style="width: 100%; height: 290px"></div>
			</div>
			<br>
			<!-- 캐러셀 끝 -->

			<div class="row">
			<div class="col-md-4">
				<p>
					<a>
						<button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal"
							style="background-color: white; color: black; border-color: white;">
							추천 카드</button>
					</a>
				</p>
			</div>
				<div class="col-md-4">
					<h2>지갑</h2>
					<p>
						<a class="btn btn-default btn-lg" style="border-color: white; width:20%;"
							href="../card/card"><%=r_card%><br>카드</a> <a>|</a> <a
							class="btn btn-default btn-lg" style="border-color: white; width:20%;"
							href="../account/account"><%=r_account%><br>계좌</a>
						<a>|</a> <a class="btn btn-default btn-lg"
							style="border-color: white; width:25%;" href="#"><%=r_mship%><br>멤버쉽</a>
						<a>|</a> <a class="btn btn-default btn-lg"
							style="border-color: white; width:20%;" href="#"><%=r_coupon%><br>쿠폰
						</a>
					</p>
				</div>
				<div class="col-md-4">
					<h2>리워즈</h2>
					<p> 
					<h1><%=r_point%>point
					</h1>
					<br> <a class="btn btn-default btn-lg" href="../rewards/couponShop">사용하기</a>
					<a>|</a> <a class="btn btn-default btn-lg" href="../rewards/couponInven">쿠폰함</a>
					</p>
				</div>

			</div>
			<%
				}
			%>
			<hr>
		</div>
	</div>
	<!-- 메인 화면 끝 -->
	<!-- 푸터 시작 -->
	<footer style="background-color: #000000;">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3">
					<h4 style="text-align: left;">사이트맵</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">VISION팀 정보</a> <a
							href="crew" class="list-group-item">VISION팀원 정보</a> <a
							href="#" class="list-group-item">공지사항</a> <a
							href="#" class="list-group-item">FAQ</a>
					</div>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: left;">고객 문의</h4>
					<a href="#" class="list-group-item">이메일 문의</a>
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
							src="/images/top_logo.gif"></a> <a
							href="http://www.moel.go.kr/index.do" class="list-group-item"
							style="width: 190px; background-color: #ffffff;"> <img
							src="/images/logo.png"></a>
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
						<img src="/images/VISION4.png" id="imagepreview"
							style="width: 150px; height: 80px; margin-right: 10px"
							align="left"> (주)비전소프트웨어(123-456) 서울시 금천구 가산동 426-5 월드메르디앙
						2차 311호 5강의실 <br> 비전주식회사 대표이사 황희상 사업자등록번호 123-456-78910
						대표번호:010-423-9948
					</h4>
				</div>
				<!--    <div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok">&nbsp; by 현석</span></h4> -->
			</div>
		</div>
	</footer>
	<!-- 푸터 끝 -->
	<!-- 모달 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">추천 카드</h4>
				</div>
				<div class="modal-body">
					삼성 카드<br> <img src="/images/AAP1266.png" id="imagepreview"
						style="width: 256px; height: 150px">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<script src="/js/bootstrap.js"></script>
</body>
</html>