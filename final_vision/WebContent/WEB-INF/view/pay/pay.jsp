 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%
	List<Map<String,Object>> allCard = (List<Map<String,Object>>)request.getAttribute("allCard");
%>
<html>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<head>
<title>카드 페이지</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
<style>
.detail_card{border:0}

</style>
</head>
<body>
<%
	String mem_id = (String)session.getAttribute("mem_id");
%>
  <!-- 네비게이션 바 시작 -->
   <nav class="navbar navbar-default">
      <div class="container-fluid">
         <div class="navbar-header">
            <h4>
               <a class="navbar-brand" style="color: #ffffff; height: 25px"
                  href="../member/index"><</a> <a class="navbar-brand" href="../pay/pay">
                  <img src="/images/VISION2.png" id="imagepreview"
                  style="width: 110px; height: 35px" align="left">&nbsp;결제
               </a>
            </h4>
         </div>
         <div class="collapse navbar-collapse "
            id="bs-example-navber-collapse-1">
            <h4>
            </h4>
         </div>
      </div>
   </nav>
   <!-- 네비게이션 바 끝 -->
	
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

<div id="all">
<%

	if(allCard!=null){
		for(int i=0;i<allCard.size();i++){
%>
<div class="media">
<div class="media-left">
</div>
<div class="media-body">
<h4 class="media-heading"></h4>
<form id="all_card" name="all_card" method="post" action="../pay/payment?card_num=<%=allCard.get(i).get("CARD_NUM") %>&bin_company=<%=allCard.get(i).get("BIN_COMPANY") %>">
<table style="width:40%">
	<tr>
	 <td rowspan="3"> <input type="image"  img src="/images/<%=allCard.get(i).get("BIN_COMPANY") %>.png" style="width: 150px; height: 100px" value="<%=allCard.get(i).get("CARD_NUM") %>">
	 <td colspan="2" align=center style="color:orange; font-size:120%; background-color:grey">
	 <%=allCard.get(i).get("BIN_NAME") %></td>
	</tr>
	<tr>
		<td colspan="2" align=center style="color:orange; background-color:#D8D8D8" height="40px"><%=allCard.get(i).get("BIN_COMPANY") %></td>
	</tr>
	<tr>
		<td colspan="2" align=center>카드번호:&nbsp;&nbsp;<%=allCard.get(i).get("CARD_NUM") %></td>
 	</tr> 
</table>
</form>
</div> 
</div>

<%			
		}
	}
%>
</div>
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
</body>
</html>
