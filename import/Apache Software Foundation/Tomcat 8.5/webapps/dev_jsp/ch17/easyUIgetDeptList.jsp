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
<%@ include file = "../common/easyui_common.jsp" %>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#dg_dept').datagrid({
		    url:'getDeptList.nhn',
		    //url:'dept.json',
		    method:'get',
		    columns:[[
		        {field:'deptno',title:'부서번호',width:100},
		        {field:'dname',title:'부서명',width:100},
		        {field:'loc',title:'지역',width:100,align:'right'}
		    ]],
		    onLoadSuccess:function(data){
		    	alert("success!!!")
		    }
		});
	});
</script>
<table id="dg_dept" class="easyui_datagrid" border="1" width="400">
</table>
</body>
</html>