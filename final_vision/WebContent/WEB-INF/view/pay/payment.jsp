<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	String card_num = (String)request.getAttribute("cardInfo");
	String card_image = (String)request.getAttribute("card_image");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<title>결제 페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/bin.css">
<script type="text/javascript">
function payPwMove(){
	$("#c_pass").attr("action","paymentPW")
	$("#c_pass").submit();
}
</script>
</head>
<body>
<form action="complete" method="POST" id="c_pass">
	<input type="hidden" name="card_num" value="<%=card_num%>">
</form>
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
<%
	if(card_num!=null){
%>
<!-- 결제 화면 시작 -->
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="col-md-1"></div>
			<div class="col-md-11">
				<h3>
					<p>
						<img src="/images/<%=card_image %>.png" style="width: 250px; height: 150px; margin-right: 30px" align="left"> 
						<br><%=card_num %> 
						<br><p>
							<button id="payPwMove" name="payPwMove" type="button" onClick="payPwMove()" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="background-color: white; color: black; border-color: white;">
							비밀번호  
							</button>
					</p>
				</h3>
			</div>
		</div>
	</div>
	<hr>
</div>
<!-- 결제 화면 끝 -->
<%
	}
%>
<%@ include file="../include/footer.jsp" %>	
</body>
</html>