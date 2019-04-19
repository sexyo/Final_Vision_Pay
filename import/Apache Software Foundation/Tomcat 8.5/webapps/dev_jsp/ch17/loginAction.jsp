<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
이 페이지는 로그인화면에서 사용자가 로그인 버튼을 눌렀을 때 호출 
로그인 요청에 대한 처리를 담당하는 페이지 이니까.....html태그는 필요없다.
-->
<%
	//스크립틀릿
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	out.print("사용자가 화면[loginForm.jsp]에 입력한 아이디 : "+mem_id);
	out.print("<br>");
	out.print("사용자가 화면[loginForm.jsp]에 입력한 비밀번호 : "+mem_pw);	
%>