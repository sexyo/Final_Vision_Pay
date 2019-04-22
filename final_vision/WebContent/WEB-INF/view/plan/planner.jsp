<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.vo.PlanVO"%>
<!DOCTYPE HTML>
<html>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1"></mata>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
<script src="/js/bootstrap.js"></script>
<%
	PlanVO planVO = (PlanVO) session.getAttribute("planVO");
	String mem_id= (String) session.getAttribute("mem_id");
	planVO.setMem_id(mem_id);

	List<String> p_date = new ArrayList<String>();
	Calendar cal = Calendar.getInstance();
	for (int i = 1; i < 7; i++) {
		p_date.add((cal.get(Calendar.YEAR) + "/"
				+ (((cal.get(Calendar.MONTH) + 1) > 9)
						? (cal.get(Calendar.MONTH) + 1)
						: "0" + (cal.get(Calendar.MONTH) + 1))
				+ "/" + "01"));
		cal.add(Calendar.MONTH, -1);
	}
%>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>플래너 페이지</title>
<script type="text/javascript">
var mem_id ="<%=mem_id%>"
	$(function() {
		$("#mydd a").click(
				function() {
					$("#dropdownMenu1").html($(this).text() + '<span class="caret"></span>');
					
					var month = $(this).attr('value');
					var date;
					switch(month){
					case "1" : date="<%=p_date.get(0).toString()%>"; 
							break;
					case "2" : date="<%=p_date.get(1).toString()%>"; 
							break;
					case "3" : date="<%=p_date.get(2).toString()%>"; 
							break;
					case "4" : date="<%=p_date.get(3).toString()%>"; 
							break;
					case "5" : date="<%=p_date.get(4).toString()%>"; 
							break;
					case "6" : date="<%=p_date.get(5).toString()%>"; 
							break;
					};
					$.ajax({
					    type: "POST",
					    url : "/plan/spendingMonth",
					    data : { p_date : month},
						dataType : "HTML",
					    success : function(data){
						    $("#spendingMonth").html(data);  
					    }
					});
					$.ajax({
					    type: "POST",
					    url : "/plan/spendingCategory",
					    data : { p_date : month},
						dataType : "HTML",
					    success : function(data){
						    $("#spendingCategory").html(data);  
					    }
					});
					$.ajax({
					    type: "POST",
					    url : "/plan/total_Week",
					    data : { p_date : month},
						dataType : "HTML",
					    success : function(data){
						    $("#total_Week").html(data);  
					    }
					});
					$.ajax({
					    type: "POST",
					    url : "/plan/total_Day",
					    data : { p_date : month},
						dataType : "HTML",
					    success : function(data){
						    $("#total_Day").html(data);  
					    }
					});

					$.ajax({
					    type: "POST",
					    url : "/plan/spendingStore",
					    data : { mem_id : mem_id,
					             p_date : date
						        },
						dataType : "HTML",
					    success : function(data){
						    $("#spendingStore").html(data);  
					    }
					});

	});
	});
	$(document).ready(function() {
		$.ajax({
		    type: "POST",
		    url : "/plan/spendingMonth",
		    data : { p_date : "1"},
			dataType : "HTML",
		    success : function(data){
			    $("#spendingMonth").html(data);  
		    }
		});
		$.ajax({
		    type: "POST",
		    url : "/plan/spendingCategory",
		    data : { p_date : "1"},
			dataType : "HTML",
		    success : function(data){
			    $("#spendingCategory").html(data);  
		    }
		});
		$.ajax({
		    type: "POST",
		    url : "/plan/total_Week",
		    data : { p_date : "1"},
			dataType : "HTML",
		    success : function(data){
			    $("#total_Week").html(data);  
		    }
		});
		$.ajax({
		    type: "POST",
		    url : "/plan/total_Day",
		    data : { p_date : "1"},
			dataType : "HTML",
		    success : function(data){
			    $("#total_Day").html(data);  
		    }
		});
		$.ajax({
		    type: "POST",
		    url : "/plan/spendingStore",
		    data : { mem_id : mem_id,
		             p_date : "<%=p_date.get(0).toString()%>"
			},
			dataType : "HTML",
			success : function(data) {
				$("#spendingStore").html(data);
			}
		});

	});
</script>
</head>
<body>
	<!-- 네비게이션 바 시작 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<h4>
					<a class="navbar-brand" style="color: #ffffff; height: 25px"
						href="../member/index"><</a> <a class="navbar-brand" href="../plan/planList">
						<img src="/images/VISION2.png" id="imagepreview"
						style="width: 110px; height: 35px" align="left">&nbsp;플래너
					</a>
					<form class="navbar-brand navbar-right">
						<!-- 드롭다운 시작 -->
						<div class="dropdown" id="mydropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								<%=p_date.get(0).toString().substring(5, 7)+"월"%><span
									class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1" id="mydd">
								<li role="presentation"><a role="menuitem action"
									tabindex="-1" href="#" value="1"><%=p_date.get(0).toString().substring(5, 7)+" 월"%></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#" value="2"><%=p_date.get(1).toString().substring(5, 7) + " 월"%></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#" value="3"><%=p_date.get(2).toString().substring(5, 7) + " 월"%></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#" value="4"><%=p_date.get(3).toString().substring(5, 7) + " 월"%></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#" value="5"><%=p_date.get(4).toString().substring(5, 7) + " 월"%></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#" value="6"><%=p_date.get(5).toString().substring(5, 7) + " 월"%></a></li>
							</ul>
						</div>
						<!-- 드롭다운 끝 -->
					</form>
				</h4>
			</div>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	<!-- 플래너2 시작 -->
	
<div class="container">
	<div class="row">
	<div class="bs-docs-grid">
		<div class="col-md-6" >
		<div class="row-fluid show-grid">
			<div class="span12" style="padding: 10px"></div>
			<div id="spendingMonth" class="span12"
				style="width: 455px; height: 290px"></div>
		</div>
		</div>
		<div class="col-md-6">
		<div class="row-fluid show-grid">
			<div class="span12" style="padding: 10px;"></div>
			<div id="spendingCategory" class="span12"
				style="width: 455px; height: 290px"></div>
		</div>
		</div>
		<div class="col-md-6">
		<div class="row-fluid show-grid">
			<div class="span12" style="padding: 10px;"></div>
			<div id="total_Week" class="span12"
			style="width: 455px; height: 290px;"></div>
		</div>
		</div>
		<div class="col-md-6">
		<div class="row-fluid show-grid">
			<div class="span12" style="padding: 10px;"></div>
			<div id="total_Day" class="span12"
				style="width: 455px; height: 290px;"></div>
		</div>
		</div>
		<div class="col-md-6" style="border-color: #">
		<div class="row-fluid show-grid">
			<div class="span12" style="padding: 10px;"></div>
			<div id="spendingStore" class="span12"
				style="width: 455px; height: 290px;"></div>
		</div>
		</div>
	</div> 
	</div>
</div>
<br>
<br>
<br>

	<!-- 플래너2 끝 -->
	<!-- 푸터 시작 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
</body>
</html>