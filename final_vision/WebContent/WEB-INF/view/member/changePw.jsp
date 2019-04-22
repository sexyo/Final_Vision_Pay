<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String r_mem_id = (String)session.getAttribute("r_mem_id");
%>
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
	function gogo(){
		var new_pw = $('#new_password').val();
		var new_pw_re = $('#new_password_retype').val();
		if(new_pw==new_pw_re){
			 $.ajax({
	             type: 'POST',
	             url: 'pwChange',
	             data: {
	                 "P_MEM_PW" : new_pw,
	             },
	             success: function(data){
	                 if(data != 0){
	                    alert("비밀번호가 변경되었습니다.");
	                    location.href="../member/login";
	                 }
	                 else if(data == 0){
	                    alert("입력한 정보를 다시 확인해주세요.");
	                 }
	             }
	      });   
		}
	else if(new_pw!=new_pw_re){
	alert("비밀번호를 다시 확인해주세요.");
		}
		}
</script>
<div id="container">
	<div id="service-idpwfind" class="contents service-idpwfind">
		<ul class="list-page-location">
	<li class="list-page-location__item"><a class="list-page-location__link list-page-location__link--home" href="http://www.gmarket.co.kr">홈</a><span class="list-page-location__icon sprite-idpwfind">&gt;</span><a class="list-page-location__link" href="../member/login">로그인</a><span class="list-page-location__icon sprite-idpwfind">&gt;</span><span class="list-page-location__link">비밀번호 재설정</span></li>
</ul>
		<div id="box-tab-idpwfind" class="box-tab-idpwfind uxetabs">
			<ul class="box-tab-idpwfind__navigation">
			<li class="box-tab-idpwfind__navigation-item"><a class="box-tab-idpwfind__navigation-link" href="https://sslmember2.gmarket.co.kr/FindID/FindID">아이디 찾기</a></li>
			<li class="box-tab-idpwfind__navigation-item box-tab-idpwfind__navigation-item--active"><a class="box-tab-idpwfind__navigation-link" href="https://sslmember2.gmarket.co.kr/FindPW/FindPW">비밀번호 재설정</a></li>
</ul>
			<!-- #box-tab-find-id -->
			<div id="box-tab-find-id" class="box-tab-idpwfind__contents">
				<h2 class="forA11y">비밀번호 재설정</h2>
			</div>
			<!-- //#box-tab-find-id -->
			<!-- #box-tab-find-pw -->
			<div id="box-tab-find-pw" class="box-tab-idpwfind__contents box-tab-idpwfind__contents--active">
				<h2 class="forA11y">비밀번호 재설정</h2>
					<div id="section-idpwfind-pw-reset" class="section-idpwfind-results section-idpwfind-pw-reset">
						<fieldset>
							<legend class="forA11y">비밀번호 재설정 폼</legend>
							<p class="text-search-result-list"><strong class="text-emphasis"><%=r_mem_id %></strong>님 새 비밀번호를 입력해 주세요.</p>
							<ul class="list-inputs-setting-pw">
								<li class="list-inputs-setting-pw__item">
									<input type="password" class="form-input-set-pw" placeholder="새 비밀번호 (5~15자)" title="새 비밀번호 입력" id="new_password" name="new_password" maxlength="15""/>
									<p class="text-validation-error">비밀번호가 적합하지 않습니다.</p>
								</li>
								<li class="list-inputs-setting-pw__item">
									<input type="password" class="form-input-set-pw" placeholder="새 비밀번호 확인" title="새 비밀번호 확인 입력" id="new_password_retype" name="new_password_retype""/>
									<p class="text-validation-error">비밀번호가 서로 일치하지 않습니다.</p>
								</li>
							</ul>
							<ul class="list-pw-set-caution">
								<li class="list-pw-set-caution__item">
									<span class="list-pw-set-caution__item-icon">&nbsp;</span>5~15자의 영문 대/소문자, 숫자, 특수문자
									<span class="list-pw-set-caution__text-sub">사용가능 특수문자: ! “ $ % &amp; ‘ () * + , - . / : ; &lt; &gt; = ? @ # [] ₩ ^ _`{} ~ |</span>
								</li>
								<li class="list-pw-set-caution__item"><span class="list-pw-set-caution__item-icon">&nbsp;</span>동일하거나 연속된 4자리 이상의 숫자/영문 반복 사용불가</li>
								<li class="list-pw-set-caution__item"><span class="list-pw-set-caution__item-icon">&nbsp;</span>아이디, 생일, 전화번호 등 개인정보 사용불가</li>
							</ul>
								<div class="box-buttons">
								<button type="button" class="button-idpw button-idpw-primary" id="gogo" onClick="gogo();">비밀번호 변경</button>
							</div>
						</fieldset>
					</div>
			</div>
			<!-- //#box-tab-find-pw -->
		</div>
		<!-- //.box-tab-idpwfind -->
	</div>
</div>

</body>
</html>