<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
// 	Cookie[] cookies = request.getCookies() ;
// 	if(cookies != null){
// 	    for(int i=0; i < cookies.length; i++){
// 	        Cookie c = cookies[i] ;
	        // 저장된 쿠키 이름을 가져온다
// 	        String cName = c.getName();
	        // 쿠키값을 가져온다
// 	        String cValue = c.getValue() ;
// 	        StringTokenizer st = new StringTokenizer(cValue,"!");
// 	        out.print("<br>");
// 	        out.print(st.nextToken());
// 	        out.print("<br>");
// 	        out.print(cValue);
// 	        out.print("<br>");
// 	    }
// 	}
	
// 	Cookie[] cookies = request.getCookies();
// 	if(cookies != null){
// 	for(int i=0; i< cookies.length; i++){
// 	cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
// 	response.addCookie(cookies[i]); // 응답 헤더에 추가
// 	}
// 	}

%>    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<head>
<title>결제 완료</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
</head>
<body>
<script type="text/javascript">
	function gogo(){
	location.href="../member/index";
		}
</script>
        결제완료
<button id="complete" onClick="gogo();" style="background-color: #000000; color: #ffffff; border-color: #000000">확인</button>
</body>
</html>