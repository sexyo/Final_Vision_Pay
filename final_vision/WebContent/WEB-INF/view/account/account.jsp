<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List" %>        
<%
String mem_id = (String)session.getAttribute("mem_id");
List<Map<String,Object>> accountList = (List<Map<String,Object>>)request.getAttribute("accountList");
%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<head>
<title>계좌 페이지</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
</head>

<body>
<!-- 네비게이션 바 시작 -->
<script type="text/javascript">
$(document).ready(function(){
	var acc_from;

    $('#btn_accountAdd').on('click', function(){
        $.ajax({
            type: 'POST',
            url: 'accountAdd',
            data: {
                "p_mem_id" : "<%=mem_id%>",
                "p_acc_num" : document.getElementById("acc_num").value,
                "p_acc_bank" : document.getElementById("acc_bank").value,
                "p_acc_name" : document.getElementById("acc_name").value,
            },
            success: function(data){
                if(data == 1){
                   alert("계좌 추가 완료");
                }
                else if(data == 2){
                    alert("계좌번호를 다시 확인해주세요");
                 }
                else if(data == 3){
                    alert("은행을 다시 확인해주세요");
                 }
                else if(data == 4){
                    alert("본인명의 계좌만 추가할 수 있습니다");
                 }
                else if(data == 5){
                    alert("이미 사용중인 계좌입니다");
                 }
                location.href="../account/account";
            }
        });     
    });
   
    $("[id^=btnn]").on('click', function(event){
         var id = $(this).attr("id");
          acc_from = id.replace("btnn", ""); //test 
          });

    $("#m_accountAdd").on('shown.bs.modal', function(){
        $(this).find('#acc_name').focus();
    });
    $('#btn_accTransfer').on('click', function(){
    	 $.ajax({
    	        type: 'POST',
    	        url: 'accTransfer',
    	        data: {
    	            "acc_from" : acc_from,
    	            "acc_to" : document.getElementById("p_acc_to").value,
    	            "acc_price" : document.getElementById("p_acc_price").value,
    	            "acc_bank" : document.getElementById("p_acc_bank").value,
    	        },
    	        success: function(data){
    	            if(data == 1){
    	               alert("이체 완료");
    	            }
    	            else if(data == -1){
    	               alert("이체에 실패하였습니다");
    	            }
    	            else if(data == 2){
    	               alert("잔액이 부족합니다");
    	            }
    	            else if(data == 3){
    	               alert("은행을 다시 확인해주세요");
    	            }
    	            else if(data == 4){
    	               alert("계좌번호를 다시 확인해주세요");
    	            }
    	            else if(data == 5){
    	               alert("해시 에러");
    	            }
    	            location.href="../account/account";
    	        }
    	 });   
    });
});
  
</script>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<br>
			<h5>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="../member/index"><</a>
					<a href="../member/account" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;계좌</a>
					<span style="margin-left: 100px;"><a type="button" data-toggle="modal" data-target="#m_accountAdd"style="background-color: #000000; color: #ffffff; border-color: #000000"><img src="/images/account.png">추가</a></span>
				</div>
			</h5>
			<br>
		</div>
	</nav>

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
<!-- 계좌이체 추가  -->
<div class="modal fade" id="m_accounTransfer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">실시간 이체하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="group row"><div class="col-md-6 form-group"> <label for="foo">계좌번호</label> <input type="text" class="form-control" id="p_acc_to" name="p_acc_to"> </div>
 	  </div><br>
 	   <div class="group row">
 	   <div class="col-md-4">
            <select class="combobox form-control" id="p_acc_bank" name="p_acc_bank">
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
       <div class="group row"><div class="col-md-6 form-group"><label for="foo">이체할 금액</label> <input type="text" class="form-control" id="p_acc_price" name="p_acc_price"></div>
      </div>
      </div>
      <div class="modal-footer">
        <button id="btn_accTransfer" name="btn_accTransfer" type="button" class="btn btn-primary">이체하기</button>
        </form>
      </div>
    </div>
  </div>
</div>		
<!-- 계좌이체 끝  -->	
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="col-md-1"></div>
				<div class="col-md-11">
					<h3>
						<p>
						<br>
						<br>
							<h3>
						<p>
							<br>
							<button type="button" class="btn" style="width:325px">계좌리스트</button>
						</p>
					</h3>
					
<%
	if(accountList!=null){
		for(int i=0;i<accountList.size();i++){
%>

<div class="media" style="width:100%;">
<div class="media-left">
<a href="#"> <img class="media-object" src="/images/<%=accountList.get(i).get("ACC_BANK") %>.PNG" style="width: 100px; height: 70px">
</a>
</div>
<div class="media-body">
<h4 class="media-heading"></h4>
<form id="accList" name="accList" method="post" action="accHistory?&acc_num=<%=accountList.get(i).get("ACC_NUM") %>">
	<table>
	<tr>
		<td id="p_acc_from" colspan="2" style="color:orange; font-size:120%; background-color:#D8D8D8"><%=accountList.get(i).get("ACC_NUM") %></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;&nbsp;<%=accountList.get(i).get("ACC_BANK") %></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;&nbsp;<%=accountList.get(i).get("ACC_NAME") %></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;최종거래일</td>
		<td style="text-align:right"><%=accountList.get(i).get("ACC_DATE") %></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;잔액</td>
		<td style="text-align:right; color:blue;"><%=accountList.get(i).get("ACC_BALANCE") %><s2>원</s2></td>
	</tr>
	<tr>
		<td><button id="btn_acc_history" name="btn_acc_history" type="submit" class="btn" >거래내역</button></td>
		<td><button id="btnn<%=accountList.get(i).get("ACC_NUM") %>" name="btn_sendMoney" type="button" class="btn" data-toggle="modal" data-target="#m_accounTransfer" value="<%=accountList.get(i).get("ACC_NUM") %>">&nbsp;이체&nbsp;</button></td>
	<tr>	
	</table>
</form>
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
<!-- Modal -->


			


	<!-- 계좌 화면 끝 -->
	<!-- 푸터 시작 -->
<%@ include file="../include/footer.jsp" %>	
	<!-- 푸터 끝 -->
</body>
</html>