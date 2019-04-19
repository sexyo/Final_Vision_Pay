<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, com.google.gson.Gson" %>
<%
	List<Map<String,Object>> memberList = (List<Map<String,Object>>)request.getAttribute("memberList");
	Gson g = new Gson();
	String memberJson = g.toJson(memberList);
	out.print(memberJson);
%>