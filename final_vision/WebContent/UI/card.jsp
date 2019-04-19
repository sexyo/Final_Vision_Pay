<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>ī�� ������</title>
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
                   alert("ī�� �߰� ����");
                }
                else{
                   alert("ī�� �߰� ����");
                   location.href="card";
                }
            }
        });    //end ajax    
    });    //end on    
});
  
</script>
	<!-- �׺���̼� �� ���� -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h4>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="index"><</a>
					<a href="card" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;ī��</a>
					<span style="margin-left: 150px;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" img src="/images/card.png">&nbsp;�߰�</a></span>
				</div>
			</h4>
			<br>
		</div>
	</nav>
	<!-- �׺���̼� �� �� -->
	<!-- ī�� ȭ�� ���� -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="col-md-1"></div>
				<div class="col-md-11">
					<h3>
						<p>
							<img src="/images/AAP1266.png" style="width: 250px; height: 150px; margin-right: 20px" align="left"> 
							<br>�Ｚī�� 
							<br>3�� ���� 
							<br>3,000
						</p>
					</h3>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<!-- ī�� ȭ�� �� -->
	<!-- Ǫ�� ���� -->
	<footer style="background-color: #000000;">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3">
					<h4 style="text-align: left;">����Ʈ��</h4>
					<div class="list-group">
						<a href="index" class="list-group-item">VISION�� ����</a> <a
							href="crew" class="list-group-item">VISION���� ����</a> <a
							href="notice.jsp" class="list-group-item">��������</a> <a
							href="FAQ.jsp" class="list-group-item">FAQ</a>
					</div>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: left;">�� ����</h4>
					<a href="email.jsp" class="list-group-item">�̸��� ����</a>
				</div>
				<div class="col-sm-4"></div>
				<div class="col-sm-3">
					<h4 style="text-align: left;">sns</h4>
					<div class="list-group">
						<a href="https://www.kakaocorp.com/service/KakaoTalk"
							class="list-group-item">īī����</a> <a
							href="https://ko-kr.facebook.com/" class="list-group-item">���̽���</a>
					</div>
					<h5 style="text-align: left;">���� ��ü</h5>
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
						(��)��������Ʈ����(123-456) ����� ��õ�� ���굿 426-5 ����޸���� 2�� 311ȣ 5���ǽ�
						<br> �����ֽ�ȸ�� ��ǥ�̻� Ȳ��� ����ڵ�Ϲ�ȣ 123-456-78910 ��ǥ��ȣ:010-423-9948
					</h4>
				</div>
			</div>
		</div>
	</footer>
	<!-- Ǫ�� �� -->
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ī�� �߰��ϱ�</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group"> <label for="foo">���¹�ȣ</label> <input type="text" class="form-control" id="cardnum" name="cardnum"> </div>

      </div>
      <div class="modal-footer">
         <button id="btn_cardAdd" name="btn_cardAdd" type="button" class="btn btn-primary">�߰�</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>