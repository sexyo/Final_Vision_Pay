<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.net.URLDecoder" %>   
<%
	String paypw = (String)request.getAttribute("card_pw");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>
		결제 보안 키보드
	</title>
	<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.1.1/flatly/bootstrap.min.css">
	<style>
	body{
background-color: #e0f2f1;
	}
	.container { margin: 150px auto; 
	 }
	 .cryxpad-container{ background-color: #e0f2f1;
	 }
</style>
<script type="text/javascript">
function passwordCheck(){
	var pass1 = document.getElementById("cryxpad-input-field").value;
	var pass2 = <%= paypw %>;
	if(pass1 == pass2){
		alert("비밀번호가 확인되었습니다.");
		location.href="naversearchapp://search?qmenu=qrcode&version=3"
	}else{
		alert("비밀번호를 다시 입력해주세요.");
	}
}
</script>
</head>
<body>
<form action="complete" method="POST" id="c_pass">
	<input type="hidden" name="card_num" value="<%=paypw%>">
</form>
<div class="jquery-script-center">
<script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
<div class="jquery-script-clear"></div>
	<div class="container">
		<div id="cryxpad-clavier" style="position: absolute;left: 50%;">
			<div class="row" style="left: -50%;position: relative; ">
				<div class="col">
					<div class="form-group">
						<h5 class="text-center"><label for="cryxpad-input-field"><a href="main2.jsp"><</a>&nbsp;&nbsp;결제 비밀번호 입력
						</label></h5>
						<small id="cryxpad-input-field-help" class="form-text text-muted">카드 비밀번호를 입력하세요.</small>
						<input type="password" class="form-control" id="cryxpad-input-field" aria-describedby="cryxpad-input-field-help" placeholder="비밀번호" style="width: 99%;">
					</div>
				</div>
			</div>
		<div class="cryxpad-container" ></div>
		<div class="cryxpad-clavier">
			<div class="row" style="left: -50%;position: relative;margin-top: 20px;">
				<div class="col">
					<button id="cryxpad-validate-btn" name="cryxpad-validate-btn" class="btn btn-primary" type="button" onClick="passwordCheck()" style="width: 100px" >입력</button>
					<button id="cryxpad-remove-btn" type="button" class="btn btn-danger" style="width: 100px ">삭제</button>
				</div>
			</div>
<!-- <a href="naversearchapp://search?qmenu=qrcode&version=3"> -->
<!-- <button type="button" class="btn btn-info">카메라</button> -->
<!-- </a> -->
		</div>			
		</div>
	</div>
</body>

<!-- <script  src="jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script  src="js/jquery.cryxpad.js"></script>
<script type="text/javascript">
	$(function(){
		//Appel par défaut du plug-in
		$('.cryxpad-container').cryxpad({
			'inputFormId':'cryxpad-input-field',
			'removeButtonId':'cryxpad-remove-btn',
			'validateButtonId':'cryxpad-validate-btn',
			'carreaux':4, // nombre de carreaux sur une ligne du clavier
			'width':50, // longeur d'un bouton
			'height':40, // hauteur d'un bouton
		});
	});

	setTimeout(function () {
		location.reload();
	}, 180* 1000);

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>

</html>
