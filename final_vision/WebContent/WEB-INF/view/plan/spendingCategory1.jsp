<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.vo.PlanVO"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%
	//R_cnt1~R_cnt6 : 건수
	//R_sum1~R_sum6 : 합계금액
	// 교통 01 09 10
	// 편의점 및 마트 08 14
	// 건강 및 의료 16 17
	// 외식 03
	// 커피 및 디저트 11
	// 생활 04 12 13
	// 쇼핑 15 19
	// 뷰티 18
	// 레저 및 여가 생활 02 05 06 07 20
	// 기타 00 
	PlanVO planVO = (PlanVO) session.getAttribute("planVO");
	String month = (String) request.getAttribute("month");
	String r_cate_cnt = (String) planVO.getR_cate().get(0).get("R_CNT" + month);
	String r_cate_sum = (String) planVO.getR_cate().get(0).get("R_SUM" + month);

	String[] r_sums = r_cate_sum.split("/");
	String[] r_cnts = r_cate_cnt.split("/");

	Gson gsonObj = new Gson();
	Map<Object, Object> map1 = null;
	Map<Object, Object> map2 = null;
	List<Map<Object, Object>> list1 = new ArrayList<Map<Object, Object>>();
	List<Map<Object, Object>> list2 = new ArrayList<Map<Object, Object>>();

	int sum_sum = 0;
	int sum_cnt = 0;
	for (int i = 1; i < r_sums.length; i++) {

		if (!"0".equals(r_sums[i])) {

			switch (i) {
				case 1 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "교통");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "교통");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 2 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "편의점 및 마트");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "편의점 및 마트");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 3 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "건강 및 의료");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "건강 및 의료");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 4 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "외식");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "외식");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 5 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "커피 및 디저트");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "커피 및 디저트");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 6 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "생활");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "생활");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 7 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "쇼핑");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "쇼핑");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 8 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "뷰티");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "뷰티");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 9 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "레저 및 여가싱활");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "레저 및 여가싱활");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
				case 10 :
					map1 = new HashMap<Object, Object>();
					map1.put("label", "기타");
					map1.put("y", Integer.parseInt(r_sums[i]));
					list1.add(map1);
					map2 = new HashMap<Object, Object>();
					map2.put("label", "기타");
					map2.put("y", Integer.parseInt(r_cnts[i]));
					list2.add(map2);
					break;
			}////////////////////////////////////////end case;
			sum_sum = sum_sum + Integer.parseInt(r_sums[i]);
			sum_cnt = sum_cnt + Integer.parseInt(r_cnts[i]);
		} ////////////////////////////////////////////end if;
	} //end of for;
	String center_sum = "";
	String center_cnt = "";
	if (list1.size() == 0) {
		map1 = new HashMap<Object, Object>();
		map1.put("label", "지출 없음");
		map1.put("y", 0);
		list1.add(map1);
		center_sum = "지출 없음";
		center_cnt = "지출 없음";
	} else {
		center_sum = "￦ " + Integer.toString(sum_sum);
		center_cnt = Integer.toString(sum_cnt) + " 건";
	}

	String data_sum = gsonObj.toJson(list1);
	String data_cnt = gsonObj.toJson(list2);
%>

<!DOCTYPE HTML>
<html>
<script type="text/javascript" src="../canvasjs/jquery.canvasjs.min.js"></script>
<script type="text/javascript" src="../canvasjs/canvasjs.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1"></mata>
<script type="text/javascript">
$(document).ready(function(){
 
var chart_sum = new CanvasJS.Chart("cate_drop_sum", {
	width: "425",
	height: "250",
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
		text: "<%=center_sum%>",
		verticalAlign: "center",
		fontSize: 24,
		dockInsidePlotArea: true
	}],
	
	data: [{
		type: "doughnut",
		showInLegend: true,
		legendText: "{label} : ￦ {y} 원",
		indexLabel: "{label}",
		toolTipContent: "<b>{label}</b>: ￦ {y} 원",
		dataPoints : <%out.print(data_sum);%>
	}]
	
});
var chart_cnt = new CanvasJS.Chart("cate_drop_cnt", {
	width:"425",
	height: "250",
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
		text: "<%=center_cnt%>"
	,
				verticalAlign : "center",
				fontSize : 24,
				dockInsidePlotArea : true
			} ],

			data : [ {
				type : "doughnut",
				showInLegend : true,
				legendText : "{label} : {y} 건",
				indexLabel : "{label}",
				toolTipContent : "<b>{label}</b>: {y} 건",
				dataPoints :
				<%out.print(data_cnt);%>
					} ]

		});
		chart_sum.render();
		chart_cnt.render();

	});
</script>
</head>
<body>
	<div id="spendingMonth" class="span12">
		<div class="bs-example bs-example-tabs" role="tabpanel"
			data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active" style="width: 50%; text-align: center;">
					<a  href="#cate_sum_pane" id="cate_sum-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
					합계순
					</a>
				</li>
				<li role="presentation" style="width: 50%; text-align: center">
					<a href="#cate_cnt_pane" role="tab" id="cate_cnt-tab" data-toggle="tab" aria-controls="profile">
					건수 순
					</a>
				</li>
			</ul>
			<div id="myTabContent" class="tab-content" align="center" >
				<div role="tabpanel" class="tab-pane fade in active" id="cate_sum_pane" aria-labelledBy="cate_sum-tab">
					<div class="container-fluid">
						<div id="cate_drop_sum" style="width:100%; height:100%"></div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="cate_cnt_pane" aria-labelledBy="cate_cnt-tab">
					<div class="container-fluid">
						<div id="cate_drop_cnt" style="width:100%; height:100%"></div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>