<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String mem_id = (String)session.getAttribute("mem_id");
%>
<script type="text/javascript">
$(document).ready(function(){

    $('#btn_accountAdd').on('click', function(){
        $.ajax({
            type: 'POST',
            url: '../account/accountAdd',
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
                   location.href="account";
                }
            }
        });    //end ajax    
    });    //end on    

    $("#m_accountAdd").on('shown.bs.modal', function(){
        $(this).find('#acc_name').focus();
    });
});
  
</script>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<br>
			<h4>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="../member/index"><</a>
					<a href="account" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;계좌</a>
					<span style="margin-left: 150px;"><button type="button" data-toggle="modal" data-target="#m_accountAdd"style="background-color: #000000; color: #ffffff; border-color: #000000"><img src="/images/account.png">추가</a></span>
				</div>
			</h4>
			<br>
		</div>
	</nav>

<div class="modal fade" id="m_accountAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">계좌 추가하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
</body>

</html>