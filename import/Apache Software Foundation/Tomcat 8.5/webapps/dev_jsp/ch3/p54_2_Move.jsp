<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.vo.DeptVO"%>
<%
	DeptVO dvo2 = (DeptVO)session.getAttribute("dvo2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p54_2_Move.jsp페이지</title>
</head>
<body>
<%=dvo2.getDeptno() %>
<br>
<%=dvo2.getDname() %>
<br>
<%=dvo2.getLoc() %>
</body>
</html>