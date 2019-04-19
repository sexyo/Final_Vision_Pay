<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.vo.DeptVO"%>
<jsp:useBean id="dvo2" scope="request" class="com.vo.DeptVO"/>
<% 
	//아래 인스턴스화에는 scope가 담겨있지 않다.
	DeptVO dvo = new DeptVO();
	dvo.setDeptno(10);
	dvo.setDname("이순신");
	dvo.setLoc("조선");
	//페이지 이동으로 url이 변경되었을 경우의 상황을 확인해 보기.
	//scope만 설정했다고 해서 값이 자동으로 담기는게 아님.
	//반드시 따로 담아주는 코드가 필요함.
	request.setAttribute("dvo2",dvo);
	//페이지 이동 후 그 값을 유지하는지에 대한 실습이므로 페이지 이동을 한다.
	//response.sendRedirect("./p54_Move.jsp");
	RequestDispatcher view = request.getRequestDispatcher("./p54_Move.jsp");
	view.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>