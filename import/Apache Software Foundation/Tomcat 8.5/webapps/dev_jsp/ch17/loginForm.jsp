<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	function login(){
		$("#f_login").attr("method","post");
		/* $("#f_login").attr("action","loginAction.jsp"); */
		/* $("#f_login").attr("action","login.do"); */
		$("#f_login").attr("action","login2.nhn");
		$("#f_login").submit();
	}
</script>
</head>
<body>
<form id="f_login">
<!-- <form id="f_login" method="get|post" action="목적지.jsp|XXX.do"> -->
	아이디 : <input type="text" id="mem_id" name="mem_id" size="10"><br>
	비밀번호 : <input type="text" id="mem_pw" name="mem_pw" size="10"><br>
	<input type="button" id="btn_login" value="로그인" onClick="login()"><br>
</form>
</body>
</html>