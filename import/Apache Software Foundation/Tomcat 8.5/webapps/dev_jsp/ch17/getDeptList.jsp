<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.vo.DeptVO" %>
<%
	List<DeptVO> deptList = (List<DeptVO>)request.getAttribute("deptList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서목록</title>
</head>
<body>
<table border="1" width="400">
<%
//아래 라인은 NullPointerException에 대해 안전하다.|안전하지 않다.|
	if(deptList!=null){ // 조회 결과가 있어?
	for(int i=0;i<deptList.size();i++){
		DeptVO dvo = deptList.get(i);
%>
	<tr>
		<td><%out.print(dvo.getDeptno()); %></td>
		<td><%out.print(dvo.getDname()); %></td>
		<td><%out.print(dvo.getLoc()); %></td>
	<tr>
<%
		}///////end of for
	}//////////end of if
	else{
%>
	<tr>
		<td colspan="1">검색결과가 존재하지 않습니다 </td>
	<tr>
<%
	}
%>	
</table>
</body>
</html>