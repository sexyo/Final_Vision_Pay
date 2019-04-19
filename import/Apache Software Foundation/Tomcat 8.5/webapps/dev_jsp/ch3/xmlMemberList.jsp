<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	List<Map<String,Object>> memberList = (List<Map<String,Object>>)request.getAttribute("memberList");
	response.setContentType("text/xml;charset=utf-8");
	StringBuilder sb = new StringBuilder();
	sb.append("<records>");
	for(int i=0;i<memberList.size();i++){//한개 로우를 꺼내서 <record>태그에 출력하기
		Map<String,Object> rMap = memberList.get(i);
		sb.append("<record>");
		sb.append("<id>"+rMap.get("mem_id")+"</id>\n");
		sb.append("<name>"+rMap.get("mem_name")+"</name>\n");
		sb.append("<address>"+rMap.get("mem_address")+"</address>\n");
		sb.append("</record>");
	}
	sb.append("</records>");
	out.print(sb.toString());
%>