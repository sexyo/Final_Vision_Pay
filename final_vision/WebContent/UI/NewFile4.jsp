<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String sumgap = "지출 없음";
map = new HashMap<Object,Object>(); map.put("label", "지출 없음"); map.put("y", 0); list.add(map);

/* map = new HashMap<Object,Object>(); map.put("label", "교통"); map.put("y", 47000); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "편의점 및 마트"); map.put("y", 32500); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "건강 및 의료"); map.put("y", 19300); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "외식"); map.put("y", 19000); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "커피 및 디저트"); map.put("y", 9800); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "생활"); map.put("y", 5500); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "쇼핑"); map.put("y", 5300); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "뷰티"); map.put("y", 15060); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "레저 및 여가싱활"); map.put("y", 15060); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "기타"); map.put("y", 0); list.add(map);
 
 */

String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true, 
	theme: "light",
	title: {
		text: "카테고리별 지출"
	},
	legend: {
		verticalAlign: "center",
		horizontalAlign: "left"
	},
	subtitles: [{
		text: "<%=sumgap%>",
		verticalAlign: "center",
		fontSize: 24,
		dockInsidePlotArea: true
	}],
	
	data: [{
		type: "doughnut",
		showInLegend: true,
		legendText: "{label} : ￦{y}",
		indexLabel: "{label}",
 		indexLabelPlacement: "inside", 
		toolTipContent: "<b>{label}</b>: ￦{y}",
		dataPoints : <%out.print(dataPoints);%>
	}]
	
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
