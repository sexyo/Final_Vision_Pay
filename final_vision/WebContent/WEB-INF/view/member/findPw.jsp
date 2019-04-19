<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>비밀번호 찾기</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel='shortcut icon' href='https://sslimage.gmarket.co.kr/_Net/MyG/favicon/gmarket.ico' />
	<link rel="apple-touch-icon-precomposed" href='https://sslimage.gmarket.co.kr/_Net/apple-touch-icon-precomposed.png'/>
    <link rel="apple-touch-icon" href='https://sslimage.gmarket.co.kr/_Net/apple-touch-icon.png'/>
	
	<script type='text/javascript' src='https://www.gmarket.co.kr/challenge/neo_include/favicon_net.js'></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/json2.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-ui-1.8.17.min.js"></script>
    <script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery.popupwindow.js"></script>
	<script type="text/javascript">
		$(document).jsErrorHandler();
		var _ContentUrls = ["http://script.gmkt.kr/_Net/css/myg/","http://image.gmarket.co.kr/_Net/","http://script.gmkt.kr/_Net/","https://script.gmkt.kr/_Net/css/myg/ssl/","https://sslimage.gmarket.co.kr/_Net/","https://script.gmkt.kr/_Net/","http://myg.gmarket.co.kr/","https://myg.gmarket.co.kr/","http://member.gmarket.co.kr/","https://member.gmarket.co.kr/","http://gbank.gmarket.co.kr/","https://gbank.gmarket.co.kr/","http://claim.gmarket.co.kr/","https://claim.gmarket.co.kr/","http://escrow.gmarket.co.kr/","https://sslescrow.gmarket.co.kr/","http://diary.gmarket.co.kr/","http://event.gmarket.co.kr/","http://sns.gmarket.co.kr/","http://www.gmarket.co.kr/","https://www.gmarket.co.kr/","http://item.gmarket.co.kr/","http://shop.gmarket.co.kr/","http://member2.gmarket.co.kr/","https://sslmember2.gmarket.co.kr/","http://promotion.gmarket.co.kr/","http://diary2.gmarket.co.kr/","http://eventnet.gmarket.co.kr/","http://ebay.gmarket.co.kr/","http://www.g9.co.kr/","http://signin.gmarket.co.kr/","https://signinssl.gmarket.co.kr/","http://english.gmarket.co.kr/","https://english.gmarket.co.kr/","http://pics.gmkt.kr/","https://pics.gmkt.kr/","/","/","/","/","/","/","/","/",];

    </script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/dimmed.js"></script>
	<script type='text/javascript' src='https://script.gmkt.kr/_Net/js/gmkt.js?dummy=2012091327262'></script>
	<script type='text/javascript' defer='defer' src='https://script.gmkt.kr/_Net/js/impression.js'></script>
	<script type='text/javascript' src='https://script.gmkt.kr/_Net/js/CommonHeader.js'></script>
	<!--[if IE 6]>
		<script src="https://script.gmkt.kr/_Net/js/DD_belatedPNG.js"></script>
		<script>
			DD_belatedPNG.fix('#main_menu .menu_list span');
			DD_belatedPNG.fix('#main_menu .menu_list p');
		</script>
	<![endif]-->
	
	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/common.css" />	
	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/member_join.css" />
    
	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/idpw-find.css" />
<!--[if lte IE 7]>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/json2.js"></script>
<![endif]-->


</head>
<body>
<div id="container">
	<div id="service-idpwfind" class="contents service-idpwfind">
		<ul class="list-page-location">
	<li class="list-page-location__item"><a class="list-page-location__link list-page-location__link--home" href="http://www.gmarket.co.kr">홈</a><span class="list-page-location__icon sprite-idpwfind">&gt;</span><a class="list-page-location__link" href="https://signinssl.gmarket.co.kr/Login/Login">로그인</a><span class="list-page-location__icon sprite-idpwfind">&gt;</span><span class="list-page-location__link">비밀번호 재설정</span></li>
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
				<form id="findPwForm" action="/FindPW/GetAuthMethod/" method="post">
					<div id="section-idpwfind-pw-reset-id-search" class="section-idpwfind-results section-idpwfind-pw-reset-id-search">
						<fieldset>
							<legend class="forA11y">비밀번호 재설정 폼</legend>
							<p class="text-idpw-search">아이디 확인 후 비밀번호를 재설정 할 수 있습니다.</p>
							<ul class="list-inputs-setting-pw">
								<li class="list-inputs-setting-pw__item">
									<input type="text" class="form-input-search-id" placeholder="아이디" title="아이디 입력" maxlength="10" 
										   onkeyup="findPW.func.setResetPasswordButton();" onchange="findPW.func.setResetPasswordButton();"
										   id="loginid" name="loginid"/>
								</li>
							</ul>
							<div class="box-buttons">
								<button id="reset_password_submit" class="button-idpw button-idpw-primary" onclick="return false;">확인</button>
							</div>
						</fieldset>
					</div>
					<input type="hidden" id="hdn_target_url" name="hdn_target_url" value="" />
				</form>
			</div>
			<!-- //#box-tab-find-pw -->
		</div>
		<!-- //.box-tab-idpwfind -->
	</div>
</div>

</body>
</html>