<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	function postTest(){
		$("#f_post").attr("metod","POST");
		$("#f_post").attr("action","./HelloServlet.do");
		$("#f_post").submit();
	}
</script>
</head>
<body>
<form id="f_post">
<input type="button" value="전송" onClick="postTest()">
</form>
</body>
</html>