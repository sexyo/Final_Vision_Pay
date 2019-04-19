<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>카드 페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
</head>
<body>
<%
	String mem_id = (String)session.getAttribute("mem_id");
%>
<script type="text/javascript">
$(document).ready(function(){
    $('#btn_cardAdd').on('click', function(){
        $.ajax({
            type: 'POST',
            url: '../card/cardAdd',
            data: {
                "mem_id" : "<%=mem_id%>",
                "cardnum" : document.getElementById("cardnum").value
            },
            success: function(data){
                if(data == 0){
                   alert("카드 추가 실패");
                }
                else{
                   alert("카드 추가 성공");
                   location.href="card";
                }
            }
        });    //end ajax    
    });    //end on    
});
  
</script>
	<!-- 네비게이션 바 시작 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h4>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="index"><</a>
					<a href="card" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;카드</a>
					<span style="margin-left: 150px;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" img src="/images/card.png">&nbsp;추가</a></span>
				</div>
			</h4>
			<br>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	<!-- 카드 화면 시작 -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="col-md-1"></div>
				<div class="col-md-11">
					<h3>
						<p>
							<img src="/images/AAP1266.png" style="width: 250px; height: 150px; margin-right: 20px" align="left"> 
							<br>삼성카드 
							<br>3월 지출 
							<br>3,000
						</p>
					</h3>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<!-- 카드 화면 끝 -->
	<!-- 푸터 시작 -->
	<footer style="background-color: #000000;">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3">
					<h4 style="text-align: left;">사이트맵</h4>
					<div class="list-group">
						<a href="index" class="list-group-item">VISION팀 정보</a> <a
							href="crew" class="list-group-item">VISION팀원 정보</a> <a
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
							style="width: 150px; height: 80px; margin-right: 10px" align="left">
						(주)비전소프트웨어(123-456) 서울시 금천구 가산동 426-5 월드메르디앙 2차 311호 5강의실
						<br> 비전주식회사 대표이사 황희상 사업자등록번호 123-456-78910 대표번호:010-423-9948
					</h4>
				</div>
			</div>
		</div>
	</footer>
	<!-- 푸터 끝 -->
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">카드 추가하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group"> <label for="foo">계좌번호</label> <input type="text" class="form-control" id="cardnum" name="cardnum"> </div>

      </div>
      <div class="modal-footer">
         <button id="btn_cardAdd" name="btn_cardAdd" type="button" class="btn btn-primary">추가</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>