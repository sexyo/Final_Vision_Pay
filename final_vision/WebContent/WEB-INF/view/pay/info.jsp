<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	Map<String,Object> idcard = (Map<String,Object>)request.getAttribute("idcard");
	Cookie[] cookies = request.getCookies();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(cookies != null){
    for(int i=0; i < cookies.length; i++){
        Cookie c = cookies[i] ;
//         c.setMaxAge(0);
        // 저장된 쿠키 이름을 가져온다
        String cName = c.getName();
        out.print("<br>");
        out.print(cName);
        // 쿠키값을 가져온다
        String cValue = c.getValue() ;
        String addValue[] =new String[cookies.length]; 
        addValue[i]=cValue; 
        String valuetoken[] = cValue.split("!");
%>
<table border="1">
<%
        for(int y=0;y<valuetoken.length;y++){
        	if(valuetoken.length>5){
        		System.out.println(valuetoken[y]);

%>				

	<tr>
	<td>
		<%= valuetoken[y] %>,<br>
<%-- 		<%= valuetoken[2] %> --%>
<%-- 		<%= valuetoken[3] %> --%>
<%-- 		<%= valuetoken[4] %> --%>
<%-- 		<%= valuetoken[5] %> --%>
	</td>
	</tr>

<%
			}
		}
%>
</table>
<%

		out.print("<br>");
	}
}
%>

</body>
</html>