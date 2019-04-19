<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.vo.MemberVO"%>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1"></mata>
<head>
<title>조원소계 페이지</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
</head>
<body>
<%
//로그인시 mem_id라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
String mem_id = null;
if (session.getAttribute("mem_id") != null) {
	mem_id = (String) session.getAttribute("mem_id");
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
			
			<div class="navbar-header"><h4>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navber-collapse-1" aria-expanded="false">
					<span class="sr-only"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index">
					<img src="/images/vision_pay.png" id="imagepreview" style="width: 150px; height: 30px">
				</a></h4>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navber-collapse-1"><h4>
				<ul class="nav navbar-nav">
<%
if (mem_id == null) {//로그아웃인 경우
%>
					<li class="active">
						<a href="index">VISION PAY 소개 
							<span class="sr-only"></span>
						</a>
					</li>
					<li><a href="crew">VISION 팀원 소개</a></li>
<%
} else {//로그인인 경우
%>
     				<li class="dropdown">
						<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">VISION PAY 기능
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="../card/card"><img src="/images/card.png" id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;카드</a></li>
							<li><a href="../account/account?mem_id=<%=mem_id%>"><img src="/images/account.png" id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;계좌</a></li>
							<li><a href="#"><img src="/images/membership.png" id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;멤버쉽</a></li>
							<li><a href="../plan/planList"><img src="/images/planner.png" id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;플래너</a></li>
							<li><a href="#"><img src="/images/cardRecommend.png" id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;카드 추천</a></li>
							<li><a href="../rewards/myPoint"><img src="/images/reward.png" id="imagepreview" style="width: 30px; height: 20px">&nbsp;&nbsp;리워즈</a></li>
						</ul>
					</li>
					<li><a href="card">VISION 결제</a></li>
					 
<%
}
%>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color: black;">
							<img src="/images/login.png" style="width: 20px; height: 20px"><span class="caret"></span></a>
						<ul class="dropdown-menu">
<%
if (mem_id == null) {//로그아웃인 경우
%>
							<li><a href="login">로그인</a></li>
							<li><a href="register">회원가입</a></li>
<%
} else {//로그인인 경우
   %>
				    		<li><a href="myInfo.jsp">내계정</a></li>
							<li><a href="logout">로그아웃</a></li>
<%
}
%>
						</ul>
					</li>
				</ul>
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="내용을 입력하세요.">
					</div>
						<label for="#"></label>
					    <button type="submit" class="btn btn-default">검색</button>
				</form></h4>
			</div>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	<!-- 조원 소개 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="panel panel-primary">
					<div class="panel-headig">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-tags"></span> &nbsp;&nbsp;크루 소개
						</h3>
					</div>
					<div class="panel-body">
						<div class="media">
							<div class="media-left" data-toggle="modal" data-target="#myModal1">
								<a> <img class="media-object" src="/images/희상.jpg"
									style="width: 200px; height: 200px">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">황희상</h4>
								<br>Full-stack : 클래서 설계 
								<br>"술과 음식만 있다면 나는 행복하다."
							</div>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
							    <th>직책</th>
								<th>이름</th>
								<th>주소</th>
								<th>생년월일</th>
				
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>PE</td>
								<td>황희상</td>
								<td>인천시</td>
								<td>1988.07.15</td>
							</tr>
						</tbody>
					</table>
					
					<div class="panel-body">
						<div class="media">
							<div class="media-left" data-toggle="modal" data-target="#myModal2">
								<a href="#"> <img class="media-object" src="/images/형원.jpg"
									style="width: 200px; height: 200px">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">최형원</h4>
								<br>Full-stack : 형상관리(GITHUB)
								<br>"인생을 즐겁게..."
								<br>GIFHUB 마스터
							</div>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>직책</th>
								<th>이름</th>
								<th>주소</th>
								<th>생년월일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>PE</td>
								<td>최형원</td>
								<td>성남시</td>
								<td>1993.06.21</td>
							</tr>
						</tbody>
					</table>
					<div class="panel-body">
						<div class="media">
							<div class="media-left" data-toggle="modal" data-target="#myModal3">
								<a href="#"> <img class="media-object" src="/images/현석.jpg"
									style="width: 200px; height: 200px">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">김현석</h4>
								<br>Full-stack : 클래스설계, DB연동, UI연동
								<br>"Sexy oh~!"
								<br>메인 개발자
							</div>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>직책</th>
								<th>이름</th>
								<th>주소</th>
								<th>생년월일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>PL</td>
								<td>김현석</td>
								<td>수원시</td>
								<td>1991.10.16</td>
							</tr>
						</tbody>
					</table>
					
					<div class="panel-body">
						<div class="media">
							<div class="media-left" data-toggle="modal" data-target="#myModal4">
								<a href="#"> <img class="media-object" src="/images/승만.jpg"
									style="width: 200px; height: 200px">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">주승만</h4>
								<br>Back-end : DB설계, 프로시적개발  
								<br>"그죠?"
								<br>프로시저 마스터
							</div>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>직책</th>
								<th>이름</th>
								<th>주소</th>
								<th>생년월일</th>
								<th>전화번호</th>
								<th>카카오톡</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>PL</td>
								<td>주승만</td>
								<td>여수시</td>
								<td>1993.01.18</td>
							</tr>
						</tbody>
					</table>
					
					<div class="panel-body">
						<div class="media">
							<div class="media-left" data-toggle="modal" data-target="#myModal5">
								<a href="#"> <img class="media-object" src="/images/성빈.jpg"
									style="width: 200px; height: 200px">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">최성빈</h4>
								<br>Front-end : UI설계
								<br>"..."
								<br>이상 무
							</div>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>직책</th>
								<th>이름</th>
								<th>주소</th>
								<th>생년월일</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>PM,</td>
								<td>최성빈</td>
								<td>부천시</td>
								<td>1986.04.18</td>
							</tr>
						</tbody>
					</table>				
				</div>
			</div>
		</div>
	</div>
	<!-- 조원 소개 끝 -->
	<!-- 푸터 시작 -->
	<footer style="background-color: #000000;">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3">
					<h4 style="text-align: left;">사이트맵</h4>
					<div class="list-group">
						<a href="index" class="list-group-item">VISION팀 정보</a> 
						<a href="crew" class="list-group-item">VISION팀원 정보</a> 
						<a href="notice.jsp" class="list-group-item">공지사항</a> 
						<a href="FAQ.jsp" class="list-group-item">FAQ</a>
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
						<a href="https://www.kakaocorp.com/service/KakaoTalk" class="list-group-item">카카오톡</a> 
						<a href="https://ko-kr.facebook.com/" class="list-group-item">페이스북</a>
					</div>
					<h5 style="text-align: left;">협력 업체</h5>
					<div class="list-group">
						<a href="http://www.ikosmo.co.kr/" class="list-group-item" style="width: 190px; background-color: #ffffff;">
							<img src="/images/top_logo.gif"></a> 
						<a href="http://www.moel.go.kr/index.do" class="list-group-item" style="width: 190px; background-color: #ffffff;">
							<img src="/images/logo.png"></a>
					</div>
				</div>
				<div class="col-sm-12" style="height: 30px;">
					<h5 style="text-align: left;">Copyright &copy; 2018-2019
						HEESANG All Rights Reserved.</h5>
				</div>
				<div class="col-sm-12"><hr></div>
					<div class="col-sm-12">
					<h4 style="text-align: centar;">
						<img src="/images/VISION4.png" id="imagepreview"
							style="width: 150px; height: 80px; margin-right: 10px" align="left">
						(주)비전소프트웨어(123-456) 서울시 금천구 가산동 426-5 월드메르디앙 2차 311호 5강의실
						<br> 비전주식회사 대표이사 황희상 사업자등록번호 123-456-78910 대표번호:010-423-9948
					</h4>
				    </div>
					<!--    <div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok">&nbsp; by 현석</span></h4> -->
				</div>
			</div>
	</footer>
	<!-- 푸터 끝 -->
	<!-- 모달 시작-->
	<div class="modal fade" id="myModal1" role="dialog" tabindex="-1">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">황희상</h4><br>
					<a>담당 업무 : 클래서 설계 </a><br>
					<a>H.P : 010-4234-9948</a><br>
					<a>SNS(카카오톡ID) : gmltkd0715</a><br>
				</div>
				<div class="modal-body">
					<img src="/images/희상1.jpg" id="imagepreview"
						style="width: 100%; height: 100%"><br>먹이를 노리는 그의 눈빛
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">최형원</h4><br>
					<a>담당 업무 : 형상관리(GITHUB) </a><br>
					<a>H.P : 010-4633-0985</a><br>
					<a>SNS(카카오톡ID) : hungwooni</a><br>
				</div>
				<div class="modal-body">
					<img src="/images/형원.jpg" id="imagepreview"
						style="width: 100%; height: 100%"><br>귀염둥이
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">김현석</h4><br>
					<a>담당 업무 : 클래서 설계 </a><br>
					<a>H.P : 010-9222-1143</a><br>
					<a>SNS(카카오톡ID) : elesex</a><br>
				</div>
				<div class="modal-body">
					<img src="/images/현석1.jpg" id="imagepreview"
						style="width: 100%; height: 100%"><br>Sexy hero~!
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal4" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">주승만</h4><br>
					<a>담당 업무 : DB 설계,프로시적개발 </a><br>
					<a>H.P : 010-3929-3077</a><br>
					<a>SNS(카카오톡ID) : jsm1572</a><br>
				</div>
				<div class="modal-body">
					<img src="/images/승만.jpg" id="imagepreview"
						style="width: 100%; height: 100%"><br>DB는 이제 그만!
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal5" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">최성빈</h4><br>
					<a>담당 업무 : UI 개발 </a><br>
					<a>H.P : </a><br>
					<a>SNS(카카오톡ID) : </a><br>
				</div>
				<div class="modal-body">
					<img src="/images/성빈.jpg" id="imagepreview"
						style="width: 100%; height: 100%"><br>....
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
</body>
</html>