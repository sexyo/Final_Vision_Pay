<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxMemeberList.jsp 페이지</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		var param ="command=sel";
		$.ajax({
			type:"post"
			,url:"/ch3/memberMgr.do"
			,data:param
			,success:function(result){
// 				alert("xml형식문서:"+result);
				var html;
				html="<table border='1'>";
				$(result).find('record').each(function(){
					var $entry = $(this);//this-> <record>...</record>
					html+="<tr>";
					html+="<td>";
					html+=$entry.find('id').text();
					html+="</td>";
					html+="<td>";
					html+=$entry.find('name').text();
					html+="</td>";
					html+="<td>";
					html+=$entry.find('address').text();
					html+="</td>";
					html+="</tr>";
				});
				$("#d_member").html(html);
			}
		});
	});
</script>
<div id="d_member"></div>
</body>
</html>