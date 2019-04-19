<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../WEB-INF/view/common/UI_common.jsp"></jsp:include>
<%
	String test = "teste";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){
	$("#aja").load("./spendingMonth.jsp", {month:"1"}); 
	
});

  $(function () {
             $("#mydd a").click(function () {
               $("#dropdownMenu1").html($(this).text() + ' <span class="caret"></span>');
               var mem_id2=$("#dropdownMenu1").text();
               var month= $(this).attr('value');

	 			alert(furuitSrc); 
//                $("#aja").load("./test1.jsp", { name: "이순신", grade: "A+" }); 
             });
            });
</script>
</head>
<body>

	<button class="btn btn-default dropdown-toggle"
		style='wdith: 50px;' id="dropdownMenu1" data-toggle="dropdown">
		 4월<span class="caret"></span>
	</button>
	<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="mydd">
		<li><a href="#" value="1"><span style='font-size: 16px;'>naver.com</span></a></li>
		<li><a href="#"><span style='font-size: 16px;'>gmail.com</span></a></li>
		<li><a href="#"><span style='font-size: 16px;'>daum.net</span></a></li>
		<li><a href="#"><span style='font-size: 16px;'>yahoo.co.kr</span></a></li>
	</ul>
	
	<div id="aja" class="span12" style=" padding:10px;">여기떠라</div>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
</body>
</html>