<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
	    url : "/plan/spendingCategory1",
	    data : { p_date : "1"},
		dataType : "HTML",
	    success : function(data){
		    $("#spendingCategory").html(data);  
	    }
	});
	$.ajax({
	    type: "POST",
	    url : "/plan/total_Week1",
	    data : { p_date : "1"},
		dataType : "HTML",
	    success : function(data){
		    $("#total_Week").html(data);  
	    }
	});
});

</script>
</head>
<body>
	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		style="width: 100%; height: 100%">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0"
				style="background-color: #585858" class="active" ></li>
			<li data-target="#myCarousel" data-slide-to="1"
				style="background-color: #585858"></li>
			<li data-target="#myCarousel" data-slide-to="2"
				style="background-color: #585858"></li>
		</ol>
		<div class="carousel-inner" role="listbox"
			style="width: 100%; height: 100%;">
			<div class="item active">
				<div id="spendingMonth" style="width: 100%; height: 100%;"></div>
			</div>
			<div class="item">
				<div id="spendingCategory" style="width: 100%; height: 100%;"></div>
			</div>
			<div class="item">
				<div id="total_Week" style="width: 100%; height: 100%;"></div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
			<span class="glyphicon glyphicon-chevron-left"aria-hidden="true"></span> 
			<span class="sr-only">Previous</span>
		</a> 
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</body>
</html>