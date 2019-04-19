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
<title>���� ������</title>
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
                   alert("���� �߰� ����");
                }
                else{
                   alert("���� �߰� ����");
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
<!-- �׺���̼� �� ���� -->

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h4>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="index"><</a>
					<a href="account" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;����</a>
					<span style="margin-left: 150px;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#m_accountAdd" img src="/images/card.png">&nbsp;�����߰�</a></span>
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


	<!-- ���� ȭ�� �� -->
	<!-- Ǫ�� ���� -->
	<footer style="background-color: #000000;">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3">
					<h4 style="text-align: left;">����Ʈ��</h4>
					<div class="list-group">
						<a href="index" class="list-group-item">VISION�� ����</a> 
						<a href="crew" class="list-group-item">VISION���� ����</a> 
						<a href="notice.jsp" class="list-group-item">��������</a> 
						<a href="FAQ.jsp" class="list-group-item">FAQ</a>
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
						<a href="https://www.kakaocorp.com/service/KakaoTalk" class="list-group-item">īī����</a> 
						<a href="https://ko-kr.facebook.com/" class="list-group-item">���̽���</a>
					</div>
					<h5 style="text-align: left;">���� ��ü</h5>
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
							<br>(��)��������Ʈ����(123-456) ����� ��õ�� ���굿 426-5 ����޸���� 2�� 311ȣ 5���ǽ� <br>
							�����ֽ�ȸ�� ��ǥ�̻� Ȳ��� ����ڵ�Ϲ�ȣ 123-456-78910 ��ǥ��ȣ:010-423-9948
						</h4>
					</div>
					<!--    <div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok">&nbsp; by ����</span></h4> -->
				</div>
			</div>
	</footer>
	<!-- Ǫ�� �� -->


<!-- Modal -->
<div class="modal fade" id="m_accountAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">���� �߰��ϱ�</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group"> <label for="foo">�����̸�</label> <input type="text" class="form-control" id="acc_name" name="acc_name"> </div>
 	   </select>
 	   <div class="form-group">
            <select class="combobox form-control" id="acc_bank" name="acc_bank">
              <option value="���༱��" selected="selected">���༱��</option>
              <option value="����">����</option>
              <option value="��������">��������</option>
              <option value="��������">��������</option>
              <option value="�츮����">�츮����</option>
              <option value="�ϳ�����">�ϳ�����</option>
              <option value="�������">IBK�������</option>
              <option value="��ü��">��ü��</option>
              <option value="�������ݰ�">�������ݰ�</option>
              <option value="����">����</option>
              <option value="����">����</option>
            </select>
          </div>
       <div class="form-group"> <label for="foo">���¹�ȣ</label> <input type="text" class="form-control" id="acc_num" name="acc_num"> </div>
      </div>
      <div class="modal-footer">
        <button id="btn_accountAdd" name="btn_accountAdd" type="button" class="btn btn-primary">�߰�</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</body>
</html>