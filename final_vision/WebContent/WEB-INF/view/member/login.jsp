<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1"></mata>
<title>로그인 페이지</title>
<%-- <%@ include file="../common/UI_common.jsp" %> --%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript">

</script>
<style type="text/css">
      body {
         display: table-cell;
         vertical-align: middle;
         background-color: #e0f2f1 !important;
      }
      html {
         display: table;
         margin: auto;
      }
      html, body {
         height: 100%;
      }
      .medium-small {
         font-size: 0.9rem;
         margin: 0;
         padding: 0;
      }
      .login-form {
         width: 280px;
      }
      .login-form-text {
         text-transform: uppercase;
         letter-spacing: 2px;
         font-size: 0.8rem;
      }
      .login-text {
         margin-top: -6px;
         margin-left: -6px !important;
      }
      .margin {
         margin: 0 !important;
      }
      .pointer-events {
         pointer-events: auto !important;
      }
      .input-field>.material-icons {
         padding-top: 10px;
      }
      .input-field div.error {
         position: relative;
         top: -1rem;
         left: 3rem;
         font-size: 0.8rem;
         color: #FF4081;
         -webkit-transform: translateY(0%);
         -ms-transform: translateY(0%);
         -o-transform: translateY(0%);
         transform: translateY(0%);
      }
</style>
</head>
<body>


<script type="text/javascript">
$(document).ready(function(){
	$("#mem_id").keydown(function(){
		if (window.event.keyCode == 13) {
	        $.ajax({
	            type: 'POST',
	            url: 'com',
	            data: {
	                "mem_id" : $('#mem_id').val(),
	                "mem_pw" : $('#mem_pw').val(),
	            },
	            success: function(data){
	                if(data == 1){
	                   location.href="../member/index";
	                }
	                else{
	                   alert("정보를 다시 입력하세요");
	                    //location.href="../member/login";
	                }
	            }
	        });
		}
	})
	$("#mem_pw").keydown(function(){
		if (window.event.keyCode == 13) {
	        $.ajax({
	            type: 'POST',
	            url: 'com',
	            data: {
	                "mem_id" : $('#mem_id').val(),
	                "mem_pw" : $('#mem_pw').val(),
	            },
	            success: function(data){
	                if(data == 1){
	                   location.href="../member/index";
	                }
	                else{
	                   alert("정보를 다시 입력하세요");
	                   location.href="../member/login";
	                }
	            }
	        });
		}
	})
    $('#btn_login').on('click', function(){
        $.ajax({
            type: 'POST',
            url: 'com',
            data: {
                "mem_id" : $('#mem_id').val(),
                "mem_pw" : $('#mem_pw').val(),
            },
            success: function(data){
                if(data == 1){
                   location.href="../member/index";
                }
                else{
                   alert("정보를 다시 입력하세요");
                   location.href="../member/login";
                }
            }
        });    //end ajax    
    });    //end on

        
});
</script>
  
<div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">
        <div class="row">
          <div class="input-field col s1 center">
				<h5><a href="../member/index"><</a></h5>
		  </div>
          <div class="input-field col s11 center">
            <h6><img src="/images/vision.png" id="imagepreview" style="width: 150px; height: 30px">&nbsp;로그인</h6>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="material-icons prefix">account_circle</i>
            <input id="mem_id" name="mem_id" type="text" style=" cursor: auto;"/>
            <label for="id" class="center-align" >아이디</label>            
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="material-icons prefix">vpn_key</i>
            <input id="mem_pw" name="mem_pw" type="password" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=&quot;);"/>
            <label for="password"  class="center-align" >비밀번호</label>
          </div>
        </div>
        <div class="row">          
          <div class="input-field col s12 login-text">                   
              <input type="checkbox" id="test6" checked="checked" />
              <label for="test6" class="pointer-events">아이디 기억하기</label>
          </div>
        </div>
        <div class="row" >
          <div class="input-field col s12">
            <button id="btn_login" name="btn_login" class="btn waves-effect waves-light col s12">로그인</button>
				
       </div>
        </div>
        <div class="row">
          <div class="input-field col s12 " >
            <p class="margin center-align medium-small" >         
            <a href="#">  ID찾기 및 비밀번호 재설정</a><br>            
          &nbsp;또는&nbsp;<a href="../member/register">회원가입</a></p>
          </div>          
        </div>
      </form>
    </div>
  </div>
  


  <script type="text/javascript">
     $(".login-form").validate({
        rules: {
          id: {
            required: true,
            minlength: 4
          },            
          password: {
            required: true,
            minlength: 5
          }
        },
        //For custom messages
        messages: {
          id:{
            required: "아이디를 입력하세요.",
            minlength: "4자 이상 입력하세요."
          },
          password:{
           required: "비밀번호를 입력하세요.",
           minlength: "5자 이상 입력하세요."
         }
        },
        errorElement : 'div',
        errorPlacement: function(error, element) {
          var placement = $(element).data('error');
          if (placement) {
            $(placement).append(error)
          } else {
            error.insertAfter(element);
          }
        }
//         buttons: [{
//             text:'저장',
//             iconCls:'icon-ok',
//             handler:function(){
//                 alert('저장');
// //                 $("#f_boardIns").attr("method","post");
// //                 $("#f_boardIns").attr("action","./boardINS");
// //                 $("#f_boardIns").submit();
//             }
//         },{
//             text:'닫기',
//             iconCls:'icon-no',
//             handler:function(){
// //                 alert('닫기');;
//                 $("#dlg_boardIns").dialog('close');
//             }
//         }]
//   });
      });
  </script>
</body>
</html>