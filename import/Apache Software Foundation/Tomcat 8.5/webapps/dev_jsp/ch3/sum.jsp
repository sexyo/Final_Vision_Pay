<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sum=0; //지역변수
	sum=10;
	String name = "이순신";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var v_sum = <%=sum%>;
	//alert(v_sum)
	function methodA(param){
		alert("methodA param:"+param);
	}
	function methodB(param){
		alert("methodB param:"+param);
	}
</script>
</head>
<body>
<%=sum %>
<input type="button" value="전송" onClick="methodA(<%=sum%>)">
<br>
<!-- 자바스크립트 함수에 파라미터 처리시 문자열인 경우 반드시 '(싱글퀘터에션) 붙여야 한다.
	왜냐하면 브라우저가 변수 취급하기 때문이다. -->
<input type="button" value="전송" onClick="methodB('<%=name%>')">
</body>
</html>