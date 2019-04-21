<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>비밀번호 찾기</title>
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
	 $('#reset_password_submit').on('click', function(){
	        $.ajax({
	               type: 'POST',
	               url: 'findPw_idcheck',
	               data: {
	                   "mem_id" : document.getElementById("mem_id").value,
	               },
	               success: function(data){
	                   if(data != 0){
		                   location.href="../member/findPw_cert";
	                   }
	                   else if(data == 0){
	                      alert("존재하지 않는 ID입니다.");
	                   }
	               }
	        });   
	    });/*end of ajax*/
	
	});

</script>
<div id="container">
	<div id="service-idpwfind" class="contents service-idpwfind">
		<ul class="list-page-location">
	<li class="list-page-location__item"><a class="list-page-location__link list-page-location__link--home" href="../member/index">홈</a><span class="list-page-location__icon sprite-idpwfind">&gt;</span><a class="list-page-location__link" href="https://signinssl.gmarket.co.kr/Login/Login">로그인</a><span class="list-page-location__icon sprite-idpwfind">&gt;</span><span class="list-page-location__link">비밀번호 재설정</span></li>
</ul>
		<div id="box-tab-idpwfind" class="box-tab-idpwfind uxetabs">
			<ul class="box-tab-idpwfind__navigation">
			<li class="box-tab-idpwfind__navigation-item"><a class="box-tab-idpwfind__navigation-link" href="../member/findId">아이디 찾기</a></li>
			<li class="box-tab-idpwfind__navigation-item box-tab-idpwfind__navigation-item--active"><a class="box-tab-idpwfind__navigation-link" href="../member/findPw">비밀번호 재설정</a></li>
</ul>
			<!-- #box-tab-find-id -->
			<div id="box-tab-find-id" class="box-tab-idpwfind__contents">
				<h2 class="forA11y">비밀번호 재설정</h2>
			</div>
			<!-- //#box-tab-find-id -->
			<!-- #box-tab-find-pw -->
			<div id="box-tab-find-pw" class="box-tab-idpwfind__contents box-tab-idpwfind__contents--active">
				<h2 class="forA11y">비밀번호 재설정</h2>
					<div id="section-idpwfind-pw-reset-id-search" class="section-idpwfind-results section-idpwfind-pw-reset-id-search">
						<fieldset>
							<legend class="forA11y">비밀번호 재설정 폼</legend>
							<p class="text-idpw-search">아이디 확인 후 비밀번호를 재설정 할 수 있습니다.</p>
							<ul class="list-inputs-setting-pw">
								<li class="list-inputs-setting-pw__item">
									<input type="text" class="form-input-search-id" placeholder="아이디" title="아이디 입력" maxlength="10" 
										   id="mem_id" name="mem_id"/>
								</li>
							</ul>
							<div class="box-buttons">
								<button id="reset_password_submit" class="button-idpw button-idpw-primary">확인</button>
							</div>
						</fieldset>
					</div>
					<input type="hidden" id="hdn_target_url" name="hdn_target_url" value="" />
			</div>
			<!-- //#box-tab-find-pw -->
		</div>
		<!-- //.box-tab-idpwfind -->
	</div>
</div>

</body>
</html>