<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>아이디 찾기</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<script type='text/javascript' src='https://www.gmarket.co.kr/challenge/neo_include/favicon_net.js'></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/json2.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-ui-1.8.17.min.js"></script>
    <script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery.popupwindow.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/dimmed.js"></script>
	<script type='text/javascript' src='https://script.gmkt.kr/_Net/js/gmkt.js?dummy=2012091327262'></script>
	<script type='text/javascript' defer='defer' src='https://script.gmkt.kr/_Net/js/impression.js'></script>
	<script type='text/javascript' src='https://script.gmkt.kr/_Net/js/CommonHeader.js'></script>
	
	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/common.css" />	
	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/member_join.css" />
    
	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/idpw-find.css" />

</head>
<body>
    
<script type="text/javascript">
$(document).ready(function(){
	var cert_num;
	 $('#cert_send').on('click', function(){
	        $.ajax({
	               type: 'POST',
	               url: 'cert',
	               data: {
	                   "mem_phone" : document.getElementById("mem_phone").value,
	                   "mem_name" : document.getElementById("mem_name").value,
	               },
	               success: function(data){
	                   if(data != 0){
	                      alert("인증번호를 발송하였습니다.");
	                      cert_num = data;
	                      alert(cert_num);
	                   }
	                   else if(data == 0){
	                      alert("입력한 정보를 다시 확인해주세요.");
	                   }
	               }
	        });   
	    });/*end of ajax*/
		 $('#sms_auth_submit').on('click', function(){
			 	if(cert_num==document.getElementById("p_cert_num").value){
		        $.ajax({
		               type: 'POST',
		               url: 'cert_findId',
		               data: {
		                   "mem_phone" : document.getElementById("mem_phone").value,
		                   "mem_name" : document.getElementById("mem_name").value,
		               },
		               success: function(data){
		                      alert("회원님의 아이디는 [ "+data+" ] 입니다.");
		                   }
		        	   });   
		 		}
			 	else{	alert("인증번호를 다시 확인해주세요.");
				 	}
		    	});/*end of ajax*/
		
	
	});

</script>
<div id="container">
	<div id="service-idpwfind" class="contents service-idpwfind">
		<ul class="list-page-location">
	<li class="list-page-location__item"><a class="list-page-location__link list-page-location__link--home" href="../member/index">홈</a><span class="list-page-location__icon sprite-idpwfind">&gt;</span><a class="list-page-location__link" href="../member/login">로그인</a><span class="list-page-location__icon sprite-idpwfind">&gt;</span><span class="list-page-location__link">아이디 찾기</span></li>
</ul>
		<div id="box-tab-idpwfind" class="box-tab-idpwfind uxetabs">
			<ul class="box-tab-idpwfind__navigation">
			<li class="box-tab-idpwfind__navigation-item box-tab-idpwfind__navigation-item--active"><a class="box-tab-idpwfind__navigation-link" href="../member/findId">아이디 찾기</a></li>
			<li class="box-tab-idpwfind__navigation-item"><a class="box-tab-idpwfind__navigation-link" href="../member/findPw">비밀번호 재설정</a></li>
</ul>
			<!-- #box-tab-find-id -->
			<div id="box-tab-find-id" class="box-tab-idpwfind__contents box-tab-idpwfind__contents--active">
				<h2 class="forA11y">아이디 찾기</h2>
					<ul class="list-method-idpwfind uxeslide">
						<li class="list-method-idpwfind__item list-method-idpwfind__item--active" id="sms">
							<span class="list-method-idpwfind__icon sprite-idpwfind">&nbsp;</span>
<button class="list-method-idpwfind__button">휴대폰으로 찾기</button>
<div class="list-method-idpwfind__content list-method-idpwfind__content--active">
	<fieldset>
		<legend class="forA11y">휴대폰으로 찾기 폼</legend>
		<ul class="list-idpwform">
			<li class="list-idpwform__item">
				<div class="box-form-input">
					<input type="text" class="form-input__idpwfind" placeholder="이름" title="이름을 입력해주세요" 
						   onclick="smsAuth.event.clearMessages('name');" 
						   onkeyup="smsAuth.event.clearMessages('name'); smsAuth.event.checkValues('name');"  
						   onchange="smsAuth.event.clearMessages('name'); smsAuth.event.checkValues('name');" 
						   id="mem_name" name="mem_name"/>
				</div>
				<p class="text-validation-error" id="sms_auth_name_err">이름을 입력해주세요.</p>
			</li>
			<li class="list-idpwform__item">
				<div class="box-form-input">
					<input type="text" class="form-input__idpwfind" placeholder="휴대폰번호(숫자만 입력)" title="휴대폰번호" maxlength="13" 
						   onKeyup="autoHypenPhone(this);"
						   id="mem_phone" name="mem_phone"/>
					<button class="button-oninput button-get-code" id="cert_send">인증번호 받기</button>
				</div>
				<p class="text-validation-error" id="sms_auth_cell_phone_err">휴대폰번호를 입력해주세요.</p>
			</li>
			<li class="list-idpwform__item">
				<label class="label-list-idpwform label-list-idpwform--varification" for="sms_auth_authkey_txt" maxlength="6">인증번호</label>
				<div class="box-form-input">
					<input type="text" id="p_cert_num" name="p_cert_num" class="form-input__idpwfind form-input__idpwfind--verification-code" maxlength="6" placeholder="6자리 숫자 입력"/>
					<span class="box-form-input__time-limit" id="sms_auth_time_txt"></span>
				</div>
				<p class="text-validation-error" id="cert_num">휴대폰으로 발송된 인증번호를 입력해주세요.</p>
			</li>
		</ul>
		<div class="box-buttons">
			<button class="button-idpw button-idpw-primary" id="sms_auth_submit">아이디찾기</button>
		</div>
	</fieldset>
</div>
<input type="hidden" id="hdn_request_token_by_sms" name="hdn_request_token_by_sms"/>

<script type="text/javascript">

</script>


</body>
</html>