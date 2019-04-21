<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.vo.PlanVO"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%
	PlanVO planVO = (PlanVO) session.getAttribute("planVO");
	Map<Object, Object> map1 = null;
	Map<Object, Object> map2 = null;
	String dataPoints = "";
	String dataPoints2 = "";
	List<Map<Object, Object>> list1 = new ArrayList<Map<Object, Object>>();
	List<Map<Object, Object>> list2 = new ArrayList<Map<Object, Object>>();
	String month = (String) request.getAttribute("month");
	if (planVO.getR_day().size() > 0) {
		String r_cnts = (String) planVO.getR_day().get(0).get("R_CNT" + month);
		String r_sums = (String) planVO.getR_day().get(0).get("R_SUM" + month);

		if (r_cnts != null && r_cnts.length() > 1) {

			String[] r_cnt = r_cnts.split("/");
			String[] r_sum = r_sums.split("/");
			int y = 2;
			for (int i = 0; i < r_cnt.length; i++) {
				map1 = new HashMap<Object, Object>();
				map2 = new HashMap<Object, Object>();
				map1.put("x", y);
				map2.put("x", y);
				map1.put("y", Integer.parseInt(r_cnt[i]));
				map2.put("y", Integer.parseInt(r_sum[i]));
				list1.add(map1);
				list2.add(map2);
				y = y + 2;
			}
		}
		Gson gsonObj = new Gson();

		dataPoints = gsonObj.toJson(list2);

		dataPoints2 = gsonObj.toJson(list1);
	}
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset=UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1"></mata>
<script type="text/javascript" src="../canvasjs/jquery.canvasjs.min.js"></script>
<script type="text/javascript" src="../canvasjs/canvasjs.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var chart1 = new CanvasJS.Chart("day_sum", {
			width: 425,
			height: "250",
			animationEnabled : true,
			theme : "light2", // "light1", "light2", "dark1", "dark2"
			title : {
				text : "시간기준"
			},
			axisY : {
				title : "금액"
			},
			data : [ {
				type : "column",
				showInLegend : true,
				legendMarkerColor : "grey",
				yValueFormatString : "￦ ##,##0 원",
				legendText : "금액 기준",
				dataPoints :
			<%out.print(dataPoints);%>
			} ]
		});
		var chart2 = new CanvasJS.Chart("day_cnt", {
			width: "425",
			height: "250",
			animationEnabled : true,
			theme : "light2", // "light1", "light2", "dark1", "dark2"
			title : {
				text : "시간기준"
			},
			axisY : {
				title : "건수"
			},
			data : [ {
				type : "column",
				showInLegend : true,
				legendMarkerColor : "grey",
				yValueFormatString : "##0 건",
				legendText : "건수 기준",
				dataPoints :
			<%out.print(dataPoints2);%>
				} ]
		});

		chart2.render();
		chart1.render();

	});
</script>

</head>
<body>
	<div id="total_Day" class="span12">
		<div class="bs-example bs-example-tabs" role="tabpanel"
			data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"
					style="width: 50%; text-align: center;"><a
					href="#day_sum_pane" id="day_sum-tab" role="tab" data-toggle="tab"
					aria-controls="home" aria-expanded="true">합계순</a></li>
				<li role="presentation" style="width: 50%; text-align: center"><a
					href="#day_cnt_pane" role="tab" id="day_cnt-tab" data-toggle="tab"
					aria-controls="profile">건수 순</a></li>
			</ul>
			<div id="myTabContent" align="center" class="tab-content">
				<div role="tabpanel" align="center" class="tab-pane fade in active" id="day_sum_pane" aria-labelledBy="day_sum-tab">
					<div class="container-fluid">
						<div id="day_sum" style="width: 100%; height: 100%;"></div>
					</div>
				</div>
				<div role="tabpanel" align="center" class="tab-pane fade" id="day_cnt_pane" aria-labelledBy="day_cnt-tab">
					<div class="container-fluid">
						<div id="day_cnt" style="width: 100%; height: 100%;"></div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>