 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<%
	List<Map<String,Object>> cardAllList = (List<Map<String,Object>>)request.getAttribute("cardAllList");
	List<Map<String,Object>> allCard = (List<Map<String,Object>>)request.getAttribute("allCard");
	List<Map<String,Object>> detail_card = (List<Map<String,Object>>)request.getAttribute("detail_card");
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
<script type="text/javascript">
var frame; //iframe을 담아둘 변수
        function SetElements() {
            frame = document.getElementById("Contents"); //iframe 가져오기
            SetHeight(); //SetHeight 함수 실행
        }

        function SetHeight() {
            var fBody = frame.contentWindow || frame.contentDocument;
            if (fBody.document) fBody = fBody.document.body; //iframe의 body 가져오기
            frame.height = fBody.scrollHeight + (fBody.offsetHeight - fBody.clientHeight); //iframe 높이 크기 조절
            frame.width = fBody.scrollWidth + (fBody.offsetWidth - fBody.clientWidth); //iframe 너비 크기 조절
            scrollTo(0,0); //최상단으로 스크롤 이동

        }
        function keyCheck(objName,objSize,nextObjName){
    		if(objName.value.length==objSize){
	    		nextObjName.focus();
	    		return;
    		}
		
    	}       
</script>   
<style>
.detail_card{border:0}

</style>
</head>
<body>
<%
	String mem_id = (String)session.getAttribute("mem_id");
%>

<script type="text/javascript">
$(document).ready(function(){
	$(this).find('#acc_name').focus();
    $('#btn_cardAdd').on('click', function(){
		var cardnum = $("#cardnum1").val()
		             +""+$("#cardnum2").val()
		             +""+$("#cardnum3").val()
		             +""+$("#cardnum4").val();
        var pwnum = $("#pwnum").val();
        var param = "mem_id=<%=mem_id%>";
            param+= "&cardnum="+cardnum+"&pwnum="+pwnum;
            
        $.ajax({
            type: 'POST',
            url: '../card/cardAdd',
            data:param,
            success: function(data){
                if(data == 0){
                   alert("카드 추가 실패");
                }
                else{
                   alert("카드 추가 성공");
                   location.href="../card/card?mem_id=<%=mem_id%>";
                }
            },
            
       
        });      
    });   

    $("#exampleModal").on('shown.bs.modal', function(){
        $(this).find('#cardnum1').focus();
    });

});
</script>
<script type="text/javascript">
 $(document).ready(function(){
var v_usecard = document.getElementById("use");
var v_allcard = document.getElementById("all");


v_usecard.style.display = 'block';
v_allcard.style.display = 'none';


	$("#btn_useCard").click(function(){
		v_usecard.style.display = 'block';
		v_allcard.style.display = 'none';

	  });
	  $("#btn_allCard").click(function(){
			v_usecard.style.display = 'none';
			v_allcard.style.display = 'block';

	  });
	/*   $("#detail_card").click(function(){
		  var i = document.getElementById("detail_card").value;
		  location.href="detail_card?card_num="+i;
		
	  }); */
	  
	}); 
</script>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h5>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="../member/index"><</a>
					<a href="../card/card" style="color: white">&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;카드</a>
					<span style="margin-left: 100px;">
						<a type="button" data-toggle="modal" data-target="#exampleModal"style="background-color: #000000; color: #ffffff; border-color: #000000">
							<img src="/images/card.png">
							추가
						</a>
					</span>
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
					<button id="btn_useCard" name="btn_useCard" type="button" class="btn" style="width:150px">이번 달 사용카드</button></td>
	             	<button id="btn_allCard" name="btn_allCard" type="button" class="btn" style="width:150px">나의 카드 목록</button></td>
							<br>
							<br>
							<br>
						</p>
					</h3>
<div id="use">
<%
	if(cardAllList!=null){
		for(int i=0;i<cardAllList.size();i++){
%>
<div class="media">
<div class="media-left">
</div>
<div class="media-body">
<h4 class="media-heading"></h4>
<form id="detail_card" name="detail_card" method="post" action="detail_card?card_num=<%=cardAllList.get(i).get("CARD_NUM") %>">
<table style="width:40%">
	 <td rowspan="3"><button type="submit" id="detail_card"  value="<%=cardAllList.get(i).get("CARD_NUM") %>"><img src="/images/<%=cardAllList.get(i).get("BIN_COMPANY") %>.png"  style="width: 150px; height: 100px; border:0; "></button>
	 <td align=center colspan="2" style="color:orange; font-size:120%; background-color:grey">
	         <%=cardAllList.get(i).get("BIN_NAME") %></td>
	</tr>
	<tr>
		<td align=center style="color:orange; background-color:#D8D8D8" height="40px" colspan="2"><%=cardAllList.get(i).get("BIN_COMPANY")%></td>
	</tr>
	<tr>
		<td colspan="2"  align=center>카드번호:&nbsp;&nbsp;<%=cardAllList.get(i).get("CARD_NUM") %></td>
 	</tr> 
	<tr>
		<td colspan="2"  align=left>이번달 사용금액<%=cardAllList.get(i).get("PH_PRICE")%>원</td>
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
<form id="all_card" name="all_card" method="post" action="../pay/payment?card_num=<%=allCard.get(i).get("CARD_NUM") %>">
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
	<!-- 푸터 끝 -->
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          &times;
        </button>
        <h5 class="modal-title" id="exampleModalLabel">카드 추가하기</h5>
      </div>
	<div class="modal-body">
       <div class="form-group"> <label for="foo">카드번호</label></div>
        <div class="form-group row">
            <div class="col-md-3">
                <input type="text" class="form-control focusedInput" id="cardnum1" size="4" maxlength="4" onkeyup="javascript:keyCheck(this,this.size,document.getElementById('cardnum2'));">
            </div>
            <div class="col-md-3">
                <input type="text"  class="form-control" id="cardnum2" size="4" maxlength="4" onkeyup="javascript:keyCheck(this,this.size,document.getElementById('cardnum3'));">
            </div>
            <div class="col-md-3">
                <input type="text"  class="form-control" id="cardnum3" size="4" maxlength="4"  onkeyup="javascript:keyCheck(this,this.size,document.getElementById('cardnum4'));">
            </div>
            <div class="col-md-3">
                <input type="text"  class="form-control" id="cardnum4" size="4" maxlength="4" onkeyup="javascript:keyCheck(this,this.size,document.getElementById('pwnum'));">
            </div>
       </div>   	  		<br>
       
       <div class="form-group"><label for="foo">카드비밀번호(6자리)</label></div> 
               <div class="form-group row">
       
         
	        <div class="col-md-3">
	                    <input type="text"  class="form-control" id="pwnum" size="6" maxlength="6">
	                </div> 
	        <div class="col-md-3">
	                </div> 
	        <div class="col-md-3">
	                </div> 
	        <div class="col-md-3">
	                </div> 
	         
        </div>
         <div class="modal-footer">
         <button id="btn_cardAdd" name="btn_cardAdd" type="button" class="btn btn-primary">추가</button>
      </div>
	</div>
     
    </div>
  </div>
</div>
</body>
</html>
