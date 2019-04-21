<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%
	List<Map<String,Object>> mshipAllList = (List<Map<String,Object>>)request.getAttribute("mshipAllList");
     String mem_id = (String)session.getAttribute("mem_id");
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
	function mship_num(mship_num){
		var param="mship_num="+mship_num+"&mem_id=<%=mem_id%>";
		$.ajax({
			  url: "mshipAdd",
			  method: "POST",
			  data: param,
			  success:function(result){
				  if(result==0){
					  alert("카드추가 실패");
				  }
				  else if(result==1){
					  location.href="./mshipAllList";
			      }
				  else{
					  alert("이미 보유하신 카드입니다");
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
	if(mshipAllList!=null){
		for(int i=0;i<mshipAllList.size();i++){
			
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
	 &nbsp;&nbsp;<%=mshipAllList.get(i).get("MSHIP_NAME") %></td>
	</tr>
	<tr>
		<td colspan="2" align=center>소모 포인트 : <%=mshipAllList.get(i).get("MSHIP_NUM")%>Point</td>
	</tr> 
	 <tr>
</table>
 <input type="button" id="mship_num"<%=i %> name="mship_num"  class="btn btn-primary" value="추가하기" onClick="mship_num('<%=mshipAllList.get(i).get("MSHIP_NUM")%>');">
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