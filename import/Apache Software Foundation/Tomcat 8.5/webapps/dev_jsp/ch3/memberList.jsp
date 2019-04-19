<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
    
<%
//getAttribute의 리턴타입은 Object이다.
	List<Map<String,Object>> memberList = (List<Map<String,Object>>)request.getAttribute("memberList");
//NullPointerException을 예방하는 코드를 작성하는 방법
/*
	1.DB와 연동하는 자바클래스에서 List에 대한 구현체 클래스를 인스턴스화 하기
	2.화면에서 null체크 하기
*/
	int size = 0;
	if(memberList!=null){
		size = memberList.size();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
<script type="text/javascript">
	function xmlType(){
		location.href="./memberMgr.do?command=sel&type=xml"
	}
	function jsonType(){
		location.href="./memberMgr.do?command=sel@type=json"
	}
</script>
</head>
<body>
<input type="button" value="xml포맷" onClick="xmlType()">
<input type="button" value="json포맷" onClick="jsonType()">
<%
	if(size==0){//검색결과가 없는 경우
%>
<!-- 화면코드가 삽입되는 곳 -->
조회결과가 없는 경우
<%
	}
	else if(size>0){//검색결과가 있는 경우
		
%>
조회결과가 있는 경우
<%
	}
%>
</body>
</html>