<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%
	List<Map<String,Object>> couponShop = (List<Map<String,Object>>)request.getAttribute("couponShop");
%>
<%
		//로그인시 mem_id라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String mem_id = null;
		String r_point = null;
		if (session.getAttribute("mem_id") != null) {
			mem_id = (String) session.getAttribute("mem_id");
			r_point = (String) session.getAttribute("r_point");
			//out.print(r_point);
		}
	%>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>카드 페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
<script type="text/javascript">
	function couponUse(coupon_no){
		var param="coupon_num="+coupon_no+"&mem_id=<%=mem_id%>";
		$.ajax({
			  url: "exCoupon",
			  method: "POST",
			  data: param,
			  success:function(result){
				  if(result==1){
					  location.href="./couponInven";
				  }
				  else{
					  alert("포인트가 없습니다.");
			      }
			  }
			});
	}
</script>
</head>


<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h5>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="../member/index"></a>
					<a href="../member/index" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;카드</a>
					<span style="margin-left: 100px;"></span>
				</div>
			</h5>
			<br>
		</div>
	</nav>
<!--카드리스트 시작 ^^!!  -->
		<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="col-md-1"></div>
				<div class="col-md-11">
					<h3>
						<p>
						<h3>
						<p>
							<br>
							<br>
							<br>
						</p>
					</h3>


<%
	if(couponShop!=null){
		for(int i=0;i<couponShop.size();i++){
			
%>

<div class="media">
<div class="media-left">
</div>
<div class="media-body">
<h4 class="media-heading"></h4>
<table style="width:300px">
	<tr>
	 <td rowspan="3">
	 <td colspan="2" style="color:orange; font-size:120%; background-color:grey">
	 &nbsp;&nbsp;<%=couponShop.get(i).get("COUPON_NAME") %></td>
	</tr>
	<tr>
		<td colspan="2" align=center>소모 포인트 : <%=couponShop.get(i).get("COUPON_POINT")%>Point</td>
	</tr>
	
	 <tr>
</table>
 <input type="button" id="coupon_num"<%=i %> name="coupon_num"  class="btn btn-primary" value="사용하기" onClick="couponUse('<%=couponShop.get(i).get("COUPON_NUM")%>');">
</div>
</div>

<%			
		}
	}
%>
						</p>
					</h3>
				</div>
			</div>
		</div>
		<hr>
	</div>
			
<!--카드리스트 끗!!  -->
	<!-- 네비게이션 바 시작 -->
	<!-- 네비게이션 바 끝 -->
	
	<!-- 푸터 시작 -->
	<%@ include file="../include/footer.jsp" %>	
	<!-- 푸터 끝 -->
	<!-- Modal -->

</body>
</html>