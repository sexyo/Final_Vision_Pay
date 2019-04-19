<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String mem_id = (String)request.getAttribute("mem_id");
	out.print(mem_id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
<script type="text/javascript">
	function previous(){
		
		history.go(-1); //-숫자 만큼 전 페이지로 이동한다.
// 		history.back();  하나 이전으로 간다
	}
</script>
</head>
<body>
여기는 b.jsp<br>
<input type="button" value="이전" onClick="previous()">
</body>
</html>