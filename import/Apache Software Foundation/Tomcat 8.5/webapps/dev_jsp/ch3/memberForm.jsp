<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<!--
 단위테스트를 위해서는 항상 get방식으로 처리할 것. 테스트 후 post방식으로 전환하기
 요청을 서블릿이 받도록 코딩하면 이것이 MVC패턴(모델2)의 기본 
  -->
<form method="get" id="f_member" action="xxx.do">
아이디 : <input type="text" id="mem_id" name="mem_id" size=10>
비번 :
이름 :
주소 :
우편번호 :
</form>
<!-- 이런 경우는 모델 1 -->
<form id="f_memo" method="get" action="xxx.jsp">

</form>
</body>
</html>