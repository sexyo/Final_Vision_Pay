<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.vo.PlanVO" %>
<jsp:include page="../WEB-INF/view/common/UI_common.jsp"></jsp:include>

<!DOCTYPE HTML>
<html>
<head>
<%
PlanVO planVO = (PlanVO)session.getAttribute("planVO");
String mem_id = planVO.getMem_id();

List<String> p_date = new ArrayList<String>();
Calendar cal = Calendar.getInstance();
for (int i = 1; i < 7; i++) {
		p_date.add((cal.get(Calendar.YEAR) + "/"
				+ (((cal.get(Calendar.MONTH) + 1) > 9) ? (cal.get(Calendar.MONTH) + 1)
						: "0" + (cal.get(Calendar.MONTH) + 1))
				+ "/" + "01"));	
	cal.add(Calendar.MONTH, -1);
}
%>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>플래너 페이지</title>
<script type="text/javascript">
var mem_id ="<%=mem_id%>"
	$(function() {
		$("#mydd a").click(
				function() {
					$("#dropdownMenu1").html(
					$(this).text() + '<span class="caret"></span>');
					var month = $(this).attr('value');
					alert(month);
					var date;
					switch(month){
					case 1 : date="<%=p_date.get(0).toString()%>"; break;
					case 2 : date="<%=p_date.get(1).toString()%>"; break;
					case 3 : date="<%=p_date.get(2).toString()%>"; break;
					case 4 : date="<%=p_date.get(3).toString()%>"; break;
					case 5 : date="<%=p_date.get(4).toString()%>"; break;
					case 6 : date="<%=p_date.get(5).toString()%>"; break;
					};
					$("#spendingMonth").load("./spendingMonth.jsp", {
						month : month
					});
					$("#spendingCategory").load("./spendingCategory.jsp", {
						month : month
					});
					$("#total_Week").load("./total_Week.jsp", {
						month : month
					});
					$("#total_Day").load("./total_Day.jsp", {
						month : month
					});
					$("#spendingStore").ajax({
					    type: "GET",
					    url : "http://localhost:9000/UI/spendingStore",
					    data : { mem_id : "<%=mem_id%>" 
					            ,p_date : date
					           },
					    success : function(){
						    alert("성공");
						    location.href="./spendingStore.jsp";  
					    },error:function(jqXHR, exception){
						    alert('실패');
				            if (jqXHR.status === 0) {
				                alert('Not connect.\n Verify Network.');
				            }
				            else if (jqXHR.status == 400) {
				                alert('Server understood the request, but request content was invalid. [400]');
				            }
				            else if (jqXHR.status == 401) {
				                alert('Unauthorized access. [401]');
				            }
				            else if (jqXHR.status == 403) {
				                alert('Forbidden resource can not be accessed. [403]');
				            }
				            else if (jqXHR.status == 404) {
				                alert('Requested page not found. [404]');
				            }
				            else if (jqXHR.status == 500) {
				                alert('Internal server error. [500]');
				            }
				            else if (jqXHR.status == 503) {
				                alert('Service unavailable. [503]');
				            }
				            else if (exception === 'parsererror') {
				                alert('Requested JSON parse failed. [Failed]');
				            }
				            else if (exception === 'timeout') {
				                alert('Time out error. [Timeout]');
				            }
				            else if (exception === 'abort') {
				                alert('Ajax request aborted. [Aborted]');
				            }
				            else {
				                alert('Uncaught Error.n' + jqXHR.responseText);
				            }

					    }
					});
	});
	});
	$(document).ready(function() {
		$("#spendingMonth").load("./spendingMonth.jsp", {
			month : "1"
		});
		$("#spendingCategory").load("./spendingCategory.jsp", {
			month : "1"
		});
		$("#total_Week").load("./total_Week.jsp", {
			month : "1"
		});
		$("#total_Day").load("./total_Day.jsp", {
			month : "1"
		});
		$.ajax({
		    type: "GET",
		    url : "http://localhost:9000/UI/spendingStore",
		    data : { mem_id : "<%=mem_id%>",
		             p_date : "<%=p_date.get(0).toString()%>"
			        },
			dataType : "HTML",
		    success : function(data){
			    $("#spendingStore").html(data);  
		    }
		 	,error:function(jqXHR, exception){
			    alert('실패');
	            if (jqXHR.status === 0) {
	                alert('Not connect.\n Verify Network.');
	            }
	            else if (jqXHR.status == 400) {
	                alert('Server understood the request, but request content was invalid. [400]');
	            }
	            else if (jqXHR.status == 401) {
	                alert('Unauthorized access. [401]');
	            }
	            else if (jqXHR.status == 403) {
	                alert('Forbidden resource can not be accessed. [403]');
	            }
	            else if (jqXHR.status == 404) {
	                alert('Requested page not found. [404]');
	            }
	            else if (jqXHR.status == 500) {
	                alert('Internal server error. [500]');
	            }
	            else if (jqXHR.status == 503) {
	                alert('Service unavailable. [503]');
	            }
	            else if (exception === 'parsererror') {
	                alert('Requested JSON parse failed. [Failed]');
	            }
	            else if (exception === 'timeout') {
	                alert('Time out error. [Timeout]');
	            }
	            else if (exception === 'abort') {
	                alert('Ajax request aborted. [Aborted]');
	            }
	            else {
	                alert('Uncaught Error.n' + jqXHR.responseText);
	            }
		    }
		});

	});
	
</script>
</head>
<body>

<!-- 네비게이션 바 시작 -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navber-collapse-1" aria-expanded="false">
				<span class="sr-only"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">
				<img src="images/vision_pay.png" id="imagepreview" style="width: 150px; height: 30px">
			</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navber-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="main.jsp">VISION PAY 소개 
						<span class="sr-only"></span>
					</a>
				</li>
				<li><a href="crew.jsp">VISION 팀원 소개</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"	data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">VISION PAY 기능
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="card.jsp"><img src="images/card.png" id="imagepreview" style="width: 30px; height: 20px">카드</a></li>
						<li><a href="account.jsp"><img src="images/account.png" id="imagepreview" style="width: 30px; height: 20px">계좌</a></li>
						<li><a href="membership.jsp"><img src="images/membership.png" id="imagepreview" style="width: 30px; height: 20px">멤버쉽</a></li>
						<li><a href="planner.jsp"><img src="images/planner.png" id="imagepreview" style="width: 30px; height: 20px">플레너</a></li>
						<li><a href="cardRecommend.jsp"><img src="images/cardRecommend.png" id="imagepreview" style="width: 30px; height: 20px">카드 추천</a></li>
						<li><a href="reward.jsp"><img src="images/reward.png" id="imagepreview" style="width: 30px; height: 20px">리워즈</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color: black;">
						<img src="images/login.png" style="width: 20px; height: 20px"><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="memberJoin.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="내용을 입력하세요.">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
		</div>
	</div>
</nav>
<!-- 네비게이션 바 끝 -->

<!-- 드롭다운 시작 -->
<div class="dropdown" id="mydropdown">
	<button class="btn btn-default dropdown-toggle" type="button"
		id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
		<%=p_date.get(0).toString().substring(5, 7)+" 월"%> <span class="caret"></span>
	</button>
	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="mydd">
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#" value="1"><%=p_date.get(0).toString().substring(5,7)+" 월"%></a></li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#" value="2"><%=p_date.get(1).toString().substring(5,7)+" 월"%></a></li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#" value="3"><%=p_date.get(2).toString().substring(5,7)+" 월"%></a></li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#" value="4"><%=p_date.get(3).toString().substring(5,7)+" 월"%></a></li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#" value="5"><%=p_date.get(4).toString().substring(5,7)+" 월"%></a></li>
		<li role="presentation"><a role="menuitem" tabindex="-1" href="#" value="6"><%=p_date.get(5).toString().substring(5,7)+" 월"%></a></li>
	</ul>
</div>
<!-- 드롭다운 끝 -->
<!-- 플래너2 시작 -->
	<div class="bs-docs-grid">
		<div class="row-fluid show-grid">
			<div class="span12" style=" padding:10px;">한달기준 지출내역</div>
			<div id="spendingMonth" class="span12" style="width: 100%; height:300px">
			</div>
		</div>
		<div class="row-fluid show-grid">
			<div class="span12" style=" padding:10px;">카테고리별 지출 내역</div>
			<div id="spendingCategory" class="span12" style="width: 100%; height:500px">
			</div>
		</div>
 		<div class="row-fluid show-grid">
			<div class="span12" style="padding:10px;" >매장별 지출</div>
			<div id="spendingStore" class="span12" style="width: 100%; height:300px;">
			</div>
		</div>
		<div class="row-fluid show-grid">
			<div class="span12" style="padding:10px;" >주일별 지출</div>
			<div id="total_Week" class="span12" style="width: 100%; height:500px;">
			</div>
		</div>
		<div class="row-fluid show-grid">
			<div class="span12" style="padding:10px;" >시간별 지출</div>
			<div id="total_Day" class="span12" style="width: 100%; height:500px;">
			</div>
		</div>
	</div>
<!-- 플래너2 끝 -->
	<!-- 푸터 시작 -->
	 <footer style="background-color: #000000;">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3">
					<h4 style="text-align: left;">사이트맵</h4>
					<div class="list-group">
						<a href="main.jsp" class="list-group-item">VISION팀 정보</a> 
						<a href="crew.jsp" class="list-group-item">VISION팀원 정보</a> 
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
							<img src="images/top_logo.gif"></a> 
						<a href="http://www.moel.go.kr/index.do" class="list-group-item" style="width: 190px; background-color: #ffffff;">
							<img src="images/logo.png"></a>
					</div>
				</div>
				<div class="col-sm-12" style="height: 30px;">
					<h5 style="text-align: left;">Copyright &copy; 2018-2019
						HEESANG All Rights Reserved.</h5>
				</div>
				
				<div class="col-sm-12"><hr></div>
					<div class="col-sm-3">
						<h1 style="text-align: centar;">
							<img src="images/VISION4.png" id="imagepreview" style="width: 150px; height: 80px">
						</h1>
					</div>
					<div class="col-sm-9">
						<h4 style="text-align: centar;">
							<br>(주)비전소프트웨어(123-456) 서울시 금천구 가산동 426-5 월드메르디앙 2차 311호 5강의실 <br>
							비전주식회사 대표이사 황희상 사업자등록번호 123-456-78910 대표번호:010-423-9948
						</h4>
					</div>
					   <div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok">&nbsp; by 현석</span></h4>
				</div>
			</div>
	</footer>
	<!-- 푸터 끝 -->
</body>
</html>