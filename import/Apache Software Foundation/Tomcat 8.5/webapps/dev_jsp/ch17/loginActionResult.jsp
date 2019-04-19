<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 확인 페이지</title>
</head>
<body>
<%
	String mem_name= request.getParameter("mem_name");
	out.print(mem_name+"님 환영합니다");
%>
</body>
</html>