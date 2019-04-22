<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	Map<String, List<Map<String, Object>>> accHistory = (Map<String, List<Map<String, Object>>>)request.getAttribute("accHistory");
	String mem_id = (String)session.getAttribute("mem_id");

%>
<%
Date today = new Date();         
SimpleDateFormat date = new SimpleDateFormat("yyyy년 MM월 dd일"); 
String toDay = date.format(today);
Calendar threeDay = Calendar.getInstance();
threeDay.add(Calendar.DATE , -3);
String threeDayago = new java.text.SimpleDateFormat("yyyy년 MM월 dd일").format(threeDay.getTime());
Calendar oneMon = Calendar.getInstance();
oneMon.add(Calendar.MONTH , -1);
String oneMonth = new java.text.SimpleDateFormat("yyyy년 MM월 dd일").format(oneMon.getTime());
Calendar threeMon = Calendar.getInstance();
threeMon.add(Calendar.MONTH , -3);
String threeMonth = new java.text.SimpleDateFormat("yyyy년 MM월 dd일").format(threeMon.getTime());
Calendar sixMon = Calendar.getInstance();
sixMon.add(Calendar.MONTH , -6);
String sixMonth = new java.text.SimpleDateFormat("yyyy년 MM월 dd일").format(sixMon.getTime());
Calendar oneYear = Calendar.getInstance();
oneYear.add(Calendar.MONTH , -12);
String oneYearago = new java.text.SimpleDateFormat("yyyy년 MM월 dd일").format(oneYear.getTime());
DecimalFormat formatter = new DecimalFormat("##,###,###,###");
%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>계좌 페이지</title>
<style type="text/css">
s1 {
  color: orange;
  font-size: 110%;
} 
s2 {
  color: black;
} 
s3 {
  color: red;
  text-align: right;	
}
n1 {
} 
</style>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
<script type="text/javascript">
$(document).ready(function(){

    $('#btn_accountAdd').on('click', function(){
        $.ajax({
            type: 'POST',
            url: 'accountAdd',
            data: {
                "mem_id" : "<%=mem_id%>",
                "acc_num" : document.getElementById("acc_num").value,
                "acc_bank" : document.getElementById("acc_bank").value,
                "acc_name" : document.getElementById("acc_name").value,
            },
            success: function(data){
                if(data == 0){
                   alert("계좌 추가 실패");
                }
                else{
                   alert("계좌 추가 성공");
                   location.href="account?mem_id=<%=mem_id%>";
                }
            }
        });    //end ajax    
    });    //end on    

    $("#m_accountAdd").on('shown.bs.modal', function(){
        $(this).find('#acc_name').focus();
    });
});
  
</script>
	<!-- 네비게이션 바 시작 -->
   <nav class="navbar navbar-default">
      <div class="container-fluid">
         <div class="navbar-header">
            <h4>
               <a class="navbar-brand" style="color: #ffffff; height: 25px"
                  href="../member/index"><</a> <a class="navbar-brand" href="../account/account">
                  <img src="/images/VISION2.png" id="imagepreview"
                  style="width: 110px; height: 35px" align="left">&nbsp;계좌
               </a>
               <button type="button" class="navbar-toggle collapsed"
                  data-toggle="modal" data-target="#m_accountAdd"
                  style="background-color: #000000; color: #ffffff; border-color: #000000">
                  <img src="/images/account.png"> 추가
               </button>
            </h4>
         </div>
         <div class="collapse navbar-collapse "
            id="bs-example-navber-collapse-1">
            <h4>
               <form class="navbar-form navbar-right">
                  <button type="button" data-toggle="modal"
                     data-target="#m_accountAdd"
                     style="background-color: #000000; color: #ffffff; border-color: #000000">
                     <img src="/images/account.png">추가
                  </button>
               </form>
            </h4>
         </div>
      </div>
   </nav>
   <!-- 네비게이션 바 끝 -->

<div class="modal fade" id="m_accountAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          &times;
        </button>
        <h5 class="modal-title" id="exampleModalLabel">계좌 추가하기</h5>
      </div>
      <div class="modal-body">
       <div class="group row"><div class="col-md-6 form-group"> <label for="foo">계좌이름</label> <input type="text" class="form-control" id="acc_name" name="acc_name"> </div>
 	  </div><br>
 	   <div class="group row">
 	   <div class="col-md-4">
            <select class="combobox form-control" id="acc_bank" name="acc_bank">
              <option value="은행선택" selected="selected">은행선택</option>
              <option value="농협">농협</option>
              <option value="신한은행">신한은행</option>
              <option value="국민은행">국민은행</option>
              <option value="우리은행">우리은행</option>
              <option value="하나은행">하나은행</option>
              <option value="기업은행">IBK기업은행</option>
              <option value="우체국">우체국</option>
              <option value="새마을금고">새마을금고</option>
              <option value="축협">축협</option>
              <option value="수협">수협</option>
            </select>
          </div>
       </div><br>   
       <div class="group row"><div class="col-md-6 form-group"><label for="foo">계좌번호</label> <input type="text" class="form-control" id="acc_num" name="acc_num"></div>
      </div>
      </div>
      <div class="modal-footer">
        <button id="btn_accountAdd" name="btn_accountAdd" type="button" class="btn btn-primary">추가</button>
        </form>
      </div>
    </div>
  </div>
</div>	
<script type="text/javascript">
$(document).ready(function(){
var v_1month = document.getElementById("d_1month");
var v_3month = document.getElementById("d_3month");
var v_6month = document.getElementById("d_6month");
var v_12month = document.getElementById("d_12month");
var v_today = document.getElementById("d_today");
var v_3day = document.getElementById("d_3day");

v_12month.style.display = 'none';
v_6month.style.display = 'none';
v_3month.style.display = 'none';
v_today.style.display = 'none';
v_1month.style.display = 'none';
v_3day.style.display = 'block';

	$("#btn_1month").click(function(){
		v_3day.style.display = 'none';
		v_12month.style.display = 'none';
		v_6month.style.display = 'none';
		v_3month.style.display = 'none';
		v_today.style.display = 'none';
		v_1month.style.display = 'block';
	  });
	  $("#btn_3month").click(function(){
		  v_3day.style.display = 'none';
		  v_1month.style.display = 'none';
		  v_12month.style.display = 'none';
		  v_6month.style.display = 'none';
		  v_today.style.display = 'none';
		  v_3month.style.display = 'block';
	  });
	  $("#btn_6month").click(function(){
		  v_3day.style.display = 'none';
		  v_1month.style.display = 'none';
		  v_12month.style.display = 'none';
		  v_3month.style.display = 'none';
		  v_today.style.display = 'none';
		  v_6month.style.display = 'block';
	  });
	  $("#btn_12month").click(function(){
		  v_3day.style.display = 'none';
		  v_1month.style.display = 'none';
		  v_6month.style.display = 'none';
		  v_3month.style.display = 'none';
		  v_today.style.display = 'none';
		  v_12month.style.display = 'block';
	  });
	  $("#btn_today").click(function(){
		  v_3day.style.display = 'none';
		  v_1month.style.display = 'none';
		  v_12month.style.display = 'none';
		  v_6month.style.display = 'none';
		  v_3month.style.display = 'none';
		  v_today.style.display = 'block';
	  });
	});
</script>
<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="col-md-1"></div>
				<div class="col-md-11">
					<h3>
							<br>
							<button type="button" class="btn" style="width:325px"><%=accHistory.get("12").get(0).get("ACC_NUM") %>&nbsp;거래내역</button>
							<br>
					</h3>

	<button type="button" class="btn btn-primary" id="btn_today" name="btn_today">&nbsp;당일&nbsp;</button>		
	<button type="button" class="btn btn-primary" id="btn_1month" name="btn_1month">1개월</button>		
	<button type="button" class="btn btn-primary" id="btn_3month" name="btn_3month">3개월</button>		
	<button type="button" class="btn btn-primary" id="btn_6month" name="btn_6month">6개월</button>		
	<button type="button" class="btn btn-primary" id="btn_12month" name="btn_12month">&nbsp;1년&nbsp;</button>
    <div id="d_3day"><table id="t_3day" name="t_3day" style="font-size:120%; " width="325px" >
    <h5><%=threeDayago %>~<%=toDay %></h5>
<%
if(accHistory.get("3day").size()>0){
	for(int i=0;i<accHistory.get("3day").size();i++){
%>      
      	<tr>
      		<td style="color:orange; background-color:#D8D8D8" height="40px">&nbsp;<%=accHistory.get("3day").get(i).get("ACC_DATE") %>&nbsp;<%=accHistory.get("3day").get(i).get("ACC_TIME") %></td>
      		<td></td>
      	</tr>
      	<tr>
      		<td colspan="2"><%=accHistory.get("12").get(i).get("ACC_CONTENT") %></td>
      	<tr>
<%
	if(accHistory.get("3day").get(i).get("ACC_INOUT").equals("입금")){
%>		
      		<td style="text-align:right; color:blue;" colspan="2"><%=accHistory.get("3day").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("3day").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%	
	}else if(accHistory.get("3day").get(i).get("ACC_INOUT").equals("출금")){
%>
      		<td style="text-align:right; color:red;" colspan="2"><%=accHistory.get("3day").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("3day").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%		
	}
%>      	
      	</tr>
      	<tr>
      		<td style="text-align:right; colspan="2">잔액&nbsp;<%=formatter.format(accHistory.get("3day").get(i).get("ACC_BALANCE")) %>원</td>
      	</tr>
<% 
	}
}
%>
		<tr>
			<td>&nbsp;</td>
		</tr>
      </table></div>			
    <div id="d_12month"><table id="t_12month" name="t_12month" style="font-size:120%; " width="325px" >
    <h5><%=oneYearago %>~<%=toDay %></h5>
<%
if(accHistory.get("12").size()>0){
	for(int i=0;i<accHistory.get("12").size();i++){
%>      
      	<tr>
      		<td style="color:orange; background-color:#D8D8D8" height="40px">&nbsp;<%=accHistory.get("12").get(i).get("ACC_DATE") %>&nbsp;<%=accHistory.get("12").get(i).get("ACC_TIME") %></td>
      		<td></td>
      	</tr>
      	<tr>
      		<td colspan="2"><%=accHistory.get("12").get(i).get("ACC_CONTENT") %></td>
      	<tr>
<%
	if(accHistory.get("12").get(i).get("ACC_INOUT").equals("입금")){
%>		
      		<td style="text-align:right; color:blue;" colspan="2"><%=accHistory.get("12").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("12").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%	
	}else if(accHistory.get("12").get(i).get("ACC_INOUT").equals("출금")){
%>
      		<td style="text-align:right; color:red;" colspan="2"><%=accHistory.get("12").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("12").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%		
	}
%>      	
      	</tr>
      	<tr>
      		<td style="text-align:right; colspan="2">잔액&nbsp;<%=formatter.format(accHistory.get("12").get(i).get("ACC_BALANCE")) %>원</td>
      	</tr>
<% 
	}
}	
%>
		<tr>
			<td>&nbsp;</td>
		</tr>
      </table></div>
      <div id="d_1month"><table id="t_1month" name="t_1month" style="font-size:120%" width="325px">
      <h5><%=oneMonth %>~<%=toDay %></h5>
<%
if(accHistory.get("1").size()>0){
	for(int i=0;i<accHistory.get("1").size();i++){
%>      
      	<tr>
      		<td style="color:orange; background-color:#D8D8D8" height="40px">&nbsp;<%=accHistory.get("1").get(i).get("ACC_DATE") %>&nbsp;<%=accHistory.get("1").get(i).get("ACC_TIME") %></td>
      		<td></td>
      	</tr>
      	<tr>
      		<td colspan="2"><%=accHistory.get("1").get(i).get("ACC_CONTENT") %></td>
      	<tr>
<%
	if(accHistory.get("1").get(i).get("ACC_INOUT").equals("입금")){
%>		
      		<td style="text-align:right; color:blue;" colspan="2"><%=accHistory.get("1").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("1").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%	
	}else if(accHistory.get("1").get(i).get("ACC_INOUT").equals("출금")){
%>
      		<td style="text-align:right; color:red;" colspan="2"><%=accHistory.get("1").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("1").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%		
	}
%>      	
      	</tr>
      	<tr>
      		<td style="text-align:right; colspan="2">잔액&nbsp;<%=formatter.format(accHistory.get("1").get(i).get("ACC_BALANCE")) %>원</td>
      	</tr>
<% 
	}
}	
%>
		<tr>
			<td>&nbsp;</td>
		</tr>
      </table></div>
      <div id="d_3month"><table id="t_3month" name="t_3month" style="font-size:120%" width="325px">
      <h5><%=threeMonth %>~<%=toDay %></h5>
<%
if(accHistory.get("3").size()>0){
	for(int i=0;i<accHistory.get("3").size();i++){
%>      
     	<tr>
      		<td style="color:orange; background-color:#D8D8D8" height="40px">&nbsp;<%=accHistory.get("3").get(i).get("ACC_DATE") %>&nbsp;<%=accHistory.get("3").get(i).get("ACC_TIME") %></td>
      		<td></td>
      	</tr>
      	<tr>
      		<td colspan="2"><%=accHistory.get("3").get(i).get("ACC_CONTENT") %></td>
      	<tr>
<%
	if(accHistory.get("3").get(i).get("ACC_INOUT").equals("입금")){
%>		
      		<td style="text-align:right; color:blue;" colspan="2"><%=accHistory.get("3").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("3").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%	
	}else if(accHistory.get("3").get(i).get("ACC_INOUT").equals("출금")){
%>
      		<td style="text-align:right; color:red;" colspan="2"><%=accHistory.get("3").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("3").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%		
	}
%>         	
      	</tr>
      	<tr>
      		<td style="text-align:right; colspan="2">잔액&nbsp;<%=formatter.format(accHistory.get("3").get(i).get("ACC_BALANCE")) %>원</td>
      	</tr>
<% 
	}
}	
%>
		<tr>
			<td>&nbsp;</td>
		</tr>
      </table></div>
      <div id="d_6month"><table id="t_6month" name="t_6month" style="font-size:120%" width="325px" >
      <h5><%=sixMonth %>~<%=toDay %></h5>
<%
if(accHistory.get("6").size()>0){
	for(int i=0;i<accHistory.get("6").size();i++){
%>      
     	<tr>
      		<td style="color:orange; background-color:#D8D8D8" height="40px">&nbsp;<%=accHistory.get("6").get(i).get("ACC_DATE") %>&nbsp;<%=accHistory.get("12").get(i).get("ACC_TIME") %></td>
      		<td></td>
      	</tr>
      	<tr>
      		<td colspan="2"><%=accHistory.get("6").get(i).get("ACC_CONTENT") %></td>
      	<tr>
<%
	if(accHistory.get("6").get(i).get("ACC_INOUT").equals("입금")){
%>		
      		<td style="text-align:right; color:blue;" colspan="2"><%=accHistory.get("6").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("6").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%	
	}else if(accHistory.get("6").get(i).get("ACC_INOUT").equals("출금")){
%>
      		<td style="text-align:right; color:red;" colspan="2"><%=accHistory.get("6").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("6").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%		
	}
%>         	
      	</tr>
      	<tr>
      		<td style="text-align:right; colspan="2">잔액&nbsp;<%=formatter.format(accHistory.get("6").get(i).get("ACC_BALANCE")) %>원</td>
      	</tr>
<% 
	}
}	
%>
		<tr>
			<td>&nbsp;</td>
		</tr>
      </table></div>
      <div id="d_today"><table id="t_today" name="t_today" style="font-size:120%" width="325px">
      <h5><%=toDay %>~<%=toDay %></h5>
<%
if(accHistory.get("today").size()>0){
	for(int i=0;i<accHistory.get("today").size();i++){
%>      
     	<tr>
      		<td style="color:orange; background-color:#D8D8D8"  height="40px">&nbsp;<%=accHistory.get("today").get(i).get("ACC_DATE") %>&nbsp;<%=accHistory.get("today").get(i).get("ACC_TIME") %></td>
      		<td></td>
      	</tr>
      	<tr>
      		<td colspan="2"><%=accHistory.get("today").get(i).get("ACC_CONTENT") %></td>
      	<tr>
<%
	if(accHistory.get("today").get(i).get("ACC_INOUT").equals("입금")){
%>		
      		<td style="text-align:right; color:blue;" colspan="2"><%=accHistory.get("today").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("today").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%	
	}else if(accHistory.get("today").get(i).get("ACC_INOUT").equals("출금")){
%>
      		<td style="text-align:right; color:red;" colspan="2"><%=accHistory.get("today").get(i).get("ACC_INOUT") %>&nbsp;<%=formatter.format(accHistory.get("today").get(i).get("ACC_PRICE")) %><s2>원</s2></td>
<%		
	}
%>         	
      	</tr>
      	<tr>
      		<td style="text-align:right; colspan="2">잔액&nbsp;<%=formatter.format(accHistory.get("today").get(i).get("ACC_BALANCE")) %>원</td>
      	</tr>
<%
	}
	
}	
%>
		<tr>
			<td>&nbsp;</td>
		</tr>
      </table></div>
		</p>
					</h3>
				</div>
			</div>
		</div>
		<hr>
	</div>
	      
<%@ include file="../include/footer.jsp" %>	
</body>
</html>