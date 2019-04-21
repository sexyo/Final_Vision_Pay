<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.* , java.util.*" %>    
<%
	Map<String,Object> store = (Map<String,Object>)request.getAttribute("store");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GS칼텍스 구매 페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bin.css">
<script type="text/javascript">
function payInfoPass(){
	$("#f_pass").submit();
}
</script>
</head>
<body>
<form action="complete" method="POST" id="f_pass">
	<input type="hidden" name="store_name" value="<%=store.get("store_name")%>">
	<input type="hidden" name="product" value="<%=store.get("product")%>">
	<input type="hidden" name="amount" value="<%=store.get("amount")%>">
	<input type="hidden" name="brand_name" value="<%=store.get("BRAND_NAME")%>">
	<input type="hidden" name=cate_name value="<%=store.get("CATE_NAME")%>">
	<input type="hidden" name="card_num" value="<%=store.get("card_num")%>">
	<input type="hidden" name="store_num" value="<%=store.get("STORE_NUM")%>">
</form>
	<div class="content">
		<div class="header" style="text-align: center;">
			<div id="store_name" class="modal-title" style="font-size: 100px">
				<%=store.get("store_name")%>
				<%--       <%=wmap.get("store_name") %> --%>
			</div>
		</div>
		<div class="body" style="text-align: center; font-size: 50px">
			<%=store.get("product")%>
			<%--       <%=wmap.get("product") %> --%>
			<br> <img src="images/cgv구로.png" id="imagepreview"
				style="width: 80%; height: 80%"> <br>
			<div style="font-size: 50px"><%=store.get("amount")%></div>
			<%--          <%=wmap.get("amount") %> --%>
		</div>
		<div class="footer" style="text-align: center; font-size: 50px">
			<h2>
				<button id="btn_paybutton" name="btn_paybutton" type="button" onClick="payInfoPass()" class="btn btn-default"
					style="width: 150px; height: 100px; font-size: 50px">결제</button>
					
				<button type="button" class="btn btn-default"
					style="width: 150px; height: 100px; font-size: 50px">취소</button>
			</h2>
		</div>
	</div>
</body>
</html>