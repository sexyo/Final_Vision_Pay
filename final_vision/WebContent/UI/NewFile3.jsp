<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
List<Map<String, Object>> boardList = (List<Map<String, Object>>)request.getAttribute("boardList");
int size = 0;
if(boardList!=null){
	size = boardList.size();
}

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("x", 1); map.put("y", 1100); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 3); map.put("y", 6000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 5); map.put("y", 6000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 7); map.put("y", 6000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 9); map.put("y", 10000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 11); map.put("y", 10000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 13); map.put("y", 12000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 15); map.put("y", 12000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 17); map.put("y", 12500); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 19); map.put("y", 30000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 21); map.put("y", 48000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 23); map.put("y", 48000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 25); map.put("y", 48000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 27); map.put("y", 48000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 29); map.put("y", 48000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 31); map.put("y", 48000); list.add(map);
 
String dataPoints = gsonObj.toJson(list);

list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>(); map.put("x", 1); map.put("y", 100); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 3); map.put("y", 2000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 5); map.put("y", 2000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 7); map.put("y", 2000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 9); map.put("y", 8000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 11); map.put("y", 8000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 13); map.put("y", 10000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 15); map.put("y", 11000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 17); map.put("y", 11000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 19); map.put("y", 21000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 21); map.put("y", 21000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 23); map.put("y", 21000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 25); map.put("y", 21000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 27); map.put("y", 21000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 29); map.put("y", 21000); list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 31); map.put("y", 21000); list.add(map);
 
String dataPoints2 = gsonObj.toJson(list);

%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta charset=UTF-8">
<script type="text/javascript">
$(document).ready(function(){
 
var chart = new CanvasJS.Chart("chartContainer", { 
	animationEnabled: true, 
	theme: "light",
	title: {
		text: "지출 내역"
	},
	subtitles: [{
		text: "지출 총액:"
	}],
	axisX: {
		includeZero: false
	},
	axisY: {
		includeZero: false,
		prefix: ""
	},
	toolTip: {
		shared: true
	},
	legend:{
		cursor: "pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "stepArea",
		name: "평균 지출액",
		color: "#BDBDBD",
		showInLegend: true,
		yValueFormatString: "￦#,##0",
		dataPoints: <%out.print(dataPoints);%>
	},
	{
		type: "stepArea",
		name: "이번달 지출액",
		color: "#6799FF",
		showInLegend: true,
		indexLabel: "{y}",
		yValueFormatString: "￦#,##0",
		dataPoints: <%out.print(dataPoints2);%>
	}]
});
 
chart.render();
 
function toggleDataSeries(e){
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else{
		e.dataSeries.visible = true;
	}
	chart.render();
}
 
});
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>