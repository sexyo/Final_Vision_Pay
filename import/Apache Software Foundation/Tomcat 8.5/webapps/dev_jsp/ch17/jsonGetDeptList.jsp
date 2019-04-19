<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.vo.DeptVO, com.google.gson.Gson" %>
<%
//test 시나리오
/*
	데이터를 생성한 클래스는 DeptSevrlet.java이다.
	getDeptList.nhn를 요청하면 DeptServlet의 doGet메소드를 호출 - 데이터 생성(List) - request
	-이동할 페이지 이름을 정함(getDeptList.jsp -> jsonGetDeptList.jsp로 바꿨음) - forward - 
*/
//스크립틀릿
	List<DeptVO> deptList = (List<DeptVO>)request.getAttribute("deptList");
	Gson gson = new Gson();
	 //압축을 풀어서 경로를 확인해서 Gson을 찾는다.
	String jsonDept = gson.toJson(deptList);
	out.print(jsonDept);
	
%>
