<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, java.util.List" %>        
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<head>
<title>계좌 페이지</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
</head>
<body>

<%
String mem_id = (String)session.getAttribute("mem_id");
%>
<script type="text/javascript">
$(document).ready(function(){
    $('#btn_accountAdd').on('click', function(){
        $.ajax({
            type: 'POST',
            url: '../account/accountAdd',
            data: {
                "mem_id" : "<%=mem_id%>",
                "acc_num" : document.getElementById("acc_num").value,
                "acc_bank" : document.getElementById("acc_bank").value,
                "acc_name" : document.getElementById("acc_name").value,
            },
            success: function(data){
                if(data == 0){
                   alert("계좌 추가 실패");
                }
                else{
                   alert("계좌 추가 성공");
                   location.href="account";
                }
            }
        });    //end ajax    
    });    //end on    
});
  
</script>
<script type="text/javascript">
$(document).on('click', '.dropdown-menu li a', function() {
    $('#datebox').val($(this).html());
}); 
</script>
<!-- 네비게이션 바 시작 -->

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h4>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="index"><</a>
					<a href="account" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;계좌</a>
					<span style="margin-left: 150px;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#m_accountAdd" img src="/images/card.png">&nbsp;계좌추가</a></span>
				</div>
			</h4>
			<br>
		</div>
	</nav>
<!-- <table class="dg_accountList" style="width:400px;height:250px"
        data-options="url:'account/accountList?mem_id=elesex',fitColumns:true,singleSelect:true">
    <thead>
        <tr>
            <th data-options="field:'ACC_BANK',width:100">Code</th>
            <th data-options="field:'ACC_NAME',width:100">Name</th>
            <th data-options="field:'ACC_NUM',width:100,align:'right'">Price</th>
        </tr>
    </thead>
</table> -->
<iframe src="http://192.168.0.10:9000/account/accountList?mem_id=<%=mem_id%>" weight="600px" height="1000px" align="middle"></iframe>			


	<!-- 계좌 화면 끝 -->
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
					<div class="col-sm-3">
						<h1 style="text-align: centar;">
							<img src="/images/VISION4.png" id="imagepreview" style="width: 150px; height: 80px">
						</h1>
					</div>
					<div class="col-sm-9">
						<h4 style="text-align: centar;">
							<br>(주)비전소프트웨어(123-456) 서울시 금천구 가산동 426-5 월드메르디앙 2차 311호 5강의실 <br>
							비전주식회사 대표이사 황희상 사업자등록번호 123-456-78910 대표번호:010-423-9948
						</h4>
					</div>
					<!--    <div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok">&nbsp; by 현석</span></h4> -->
				</div>
			</div>
	</footer>
	<!-- 푸터 끝 -->


<!-- Modal -->
<div class="modal fade" id="m_accountAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">계좌 추가하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group"> <label for="foo">계좌이름</label> <input type="text" class="form-control" id="acc_name" name="acc_name"> </div>
 	   </select>
 	   <div class="form-group">
            <select class="combobox form-control" id="acc_bank" name="acc_bank">
              <option value="은행선택" selected="selected">은행선택</option>
              <option value="농협">농협</option>
              <option value="신한은행">신한은행</option>
              <option value="국민은행">국민은행</option>
              <option value="우리은행">우리은행</option>
              <option value="하나은행">하나은행</option>
              <option value="기업은행">IBK기업은행</option>
              <option value="우체국">우체국</option>
              <option value="새마을금고">새마을금고</option>
              <option value="축협">축협</option>
              <option value="수협">수협</option>
            </select>
          </div>
       <div class="form-group"> <label for="foo">계좌번호</label> <input type="text" class="form-control" id="acc_num" name="acc_num"> </div>
      </div>
      <div class="modal-footer">
        <button id="btn_accountAdd" name="btn_accountAdd" type="button" class="btn btn-primary">추가</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</body>
</html>