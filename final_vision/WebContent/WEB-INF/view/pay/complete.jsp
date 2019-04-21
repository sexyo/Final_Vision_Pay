<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	Map<String,Object> info = (Map<String,Object>)request.getAttribute("info");
	Cookie[] cookies = request.getCookies() ;
	out.print(cookies);
	if(cookies != null){
	    for(int i=0; i < cookies.length; i++){
	        Cookie c = cookies[i] ;
	        // 저장된 쿠키 이름을 가져온다
	        String cName = c.getName();
	        out.print("<br>");
	        out.print(cName);
	        // 쿠키값을 가져온다
	        String cValue = c.getValue() ;
	        StringTokenizer st = new StringTokenizer(cValue,"!");
	        out.print("<br>");
	        out.print(st.nextToken());
	        out.print("<br>");
	        out.print(cValue);
	        out.print("<br>");
	    }
	}
	
// 	Cookie[] cookies = request.getCookies();
// 	if(cookies != null){
// 	for(int i=0; i< cookies.length; i++){
// 	cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
// 	response.addCookie(cookies[i]); // 응답 헤더에 추가
// 	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결제완료
</body>
</html>