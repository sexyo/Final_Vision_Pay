<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.vo.PlanVO, java.text.DecimalFormat"%>
<%
	PlanVO planVO = (PlanVO) request.getAttribute("planVO");
	List<Map<String, Object>> r_store_sum = planVO.getR_store_sum();
	List<Map<String, Object>> r_store_cnt = planVO.getR_store_cnt();
	int store_size = 0;
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1"></mata>
<title>Insert title here</title>
<script type="text/javascript" src="../canvasjs/jquery.canvasjs.min.js"></script>
<script type="text/javascript" src="../canvasjs/canvasjs.min.js"></script>
</head>
<body>
	<div id="spendingStore" class="span12"
		style="width: 100%; height: 300px;">
		<div class="bs-example bs-example-tabs" role="tabpanel"
			data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"
					style="width: 50%; text-align: center;"><a href="#cnt_pane"
					id="cnt-tab" role="tab" data-toggle="tab" aria-controls="home"
					aria-expanded="true">결제많은 순</a></li>
				<li role="presentation" style="width: 50%; text-align: center"><a
					href="#sum_pane" role="tab" id="sum-tab" data-toggle="tab"
					aria-controls="profile">지출 순</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="cnt_pane"
					aria-labelledBy="cnt-tab">
					<div class="container-fluid">
						<div class="bs-example" data-example-id="table-within-panel">
							<div class="panel panel-default">
								<!-- Table -->
								<table class="table">
									<tbody>
										<%
											if (r_store_cnt.size() > 0) {
												store_size = r_store_cnt.size();
												for (int i = 0; i < store_size; i++) {
										%>
										<tr>
											<th scope="row"><%=i + 1%></th>
											<td><%=r_store_cnt.get(i).get("STORE_NAME")%> <br>
												<%=r_store_cnt.get(i).get("CNT_PRI") + " 건 / ￦  "
							+ dc.format(r_store_cnt.get(i).get("SUM_PRI")) + " 원"%>
											</td>
										</tr>
										<%
											}
											} else {
										%>
										<tr>
											<td>지출 없음</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="sum_pane"
					aria-labelledBy="sum-tab">
					<div class="container-fluid">
						<div class="bs-example"  data-example-id="table-within-panel">
							<div class="panel panel-default">
								<!-- Table -->
								<table class="table">
									<tbody>
										<%
											if (r_store_sum.size() > 0) {
												store_size = r_store_sum.size();
												for (int i = 0; i < store_size; i++) {
										%>
										<tr>
											<th scope="row"><%=i + 1%></th>
											<td><%=r_store_sum.get(i).get("STORE_NAME")%> <br>
												<%="￦ " + dc.format(r_store_cnt.get(i).get("SUM_PRI")) + " 원 / "
							+ r_store_cnt.get(i).get("CNT_PRI") + " 건"%>
											</td>
										</tr>
										<%
											}
											} else {
										%>
										<tr>
											<td>지출 없음</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>