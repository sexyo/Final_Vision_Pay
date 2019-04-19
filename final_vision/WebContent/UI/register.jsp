<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy/mm/dd",
			language : "kr"
		});
	});
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
	width: 380px;
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
	<div id="login-page" class="row">
		<div class="col s12 z-depth-4 card-panel">
			<form class="login-form">
				<div class="row">
					<div class="input-field col s1 center">
						<h5>
							<a href="main.jsp"><</a>
						</h5>
					</div>
					<div class="input-field col s11 center">
						<h6>
							<img src="images/vision.png" id="imagepreview"
								style="width: 150px; height: 30px">계정 만들기
						</h6>
						<p class="center">지금 바로 가입해 보세요!</p>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s8">
						<i class="material-icons prefix">account_circle</i> 
						<input id="id" name="id" type="text" style="cursor: auto;" /> 
						<label for="id"	data-error="경고" class="center-align" data-success="성공">&nbsp;&nbsp;&nbsp;아이디</label>
					</div>
					<div class="input-field col s4">
						<span class="input-group-btn">
							<button id="uid" type="button" class="btn btn-success">중복검사</button>
							<input type="hidden" id="uid" value="no" />
						</span>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="material-icons prefix">face</i> <input id="name"
							name="name" type="text" /> <label for="name" data-error="경고"
							class="center-align" data-success="성공">&nbsp;&nbsp;&nbsp;이름</label>
					</div>
				</div>

				<div class="row margin">
					<div class="input-field col s1">
						<i class="material-icons prefix">stay_primary_portrait</i> 
					</div>
				
					<div class="col s3" >
						<br>
						<select class="form-control" name="phon1" id="phon1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>
					<div class="input-field col s1">
						-
					</div>
					<div class="input-field col s3">
						<input id="phon2" name="phon2" type="text" maxlength="4"/> 
						<label for="phon2" data-error="경고" class="center-align" data-success="성공">&nbsp;&nbsp;&nbsp;앞자리</label>
					</div>
					<div class="input-field col s1">
						-
					</div>
					
					<div class="input-field col s3">
						<input id="phon3" name="phon3" type="text" maxlength="4"/> 
						<label for="phon3" data-error="경고" class="center-align" data-success="성공">&nbsp;&nbsp;&nbsp;뒷자리</label>
					</div>
				</div>
				
				<div class="row margin">
					<div class="input-field col s6">
						<i class="material-icons prefix">place</i>
						<input type="text" id="sample2_postcode" name="sample2_postcode" placeholder="&nbsp;&nbsp;&nbsp;우편번호" > 
					</div>
					<div class="input-field col s6">
					  	<button type="button"  class="btn btn-default" onclick="sample2_execDaumPostcode();" style="width: 140px">
					    <i class="fa fa-search"></i>우편번호찾기</button>    
					</div>
 					<div class="input-field col s12"> 
						<input type="text" id="sample2_address" name="sample2_address" placeholder="&nbsp;&nbsp;&nbsp;주소"><br>
						<label for="sample2_address" data-error="경고" class="center-align" data-success="성공"></label>
					</div>
 					<div class="input-field col s12"> 
						<input type="text" id="sample2_detailAddress" name="sample2_detailAddress">
						<label for="sample2_detailAddress" data-error="경고" class="center-align" data-success="성공">&nbsp;&nbsp;&nbsp;상세주소</label>
					</div>
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style=" cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
				</div>
				
				<div class="row">
					<div class="input-field col s4">
						<i class="material-icons prefix">wc</i> 
						<input type="radio" id="man" name="chk_info" value="남"/>
						<label for="man" class="pointer-events" data-error="경고" class="center-align" data-success="성공">남</label>
					</div>
					<div class="input-field col s8 ">
						<input type="radio" id="woman" name="chk_info" value="여" /> <label
							for="woman" class="pointer-events">여</label>
					</div>
				</div>

				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-social-person-outline prefix"></i> <i
							class="material-icons prefix">email</i> <input id="email"
							name="email" type="text" style="cursor: auto;" /> <label
							for="email" data-error="경고" class="center-align"
							data-success="성공">&nbsp;&nbsp;&nbsp;이메일</label>
					</div>
				</div>
				
				<div class="row margin">
					<div class="input-field col s12">
						<div class="input-group date">
							<i class="material-icons prefix">cake</i> 
							<input id="birth" name="birth" type="text" class="form-control"/> 
							<label for="birth" data-error="경고" class="center-align" data-success="성공">생년월일</label> 
							<span class="input-group-addon"	style="background-color: #ffffff; border-color: #ffffff">
								<i class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
					</div>
				</div>
				
				<div class="row margin">
					<div class="input-field col s12">
						<i class="material-icons prefix">vpn_key</i> <input id="password"
							name="password" type="password" /> <label for="password">&nbsp;&nbsp;&nbsp;비밀번호</label>
					</div>
				</div>

				<div class="row margin">
					<div class="input-field col s12">
						<!-- <i class="mdi-action-lock-outline prefix"></i> -->
						<i class="material-icons prefix">vpn_key</i> <input
							id="password_a" name="cpassword" type="password" /> <label
							for="password_a" data-error="경고" class="center-align"
							data-success="성공">&nbsp;&nbsp;&nbsp;비밀번호 확인</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<button type="submit" class="btn waves-effect waves-light col s12">회원
							가입</button>

					</div>
					<div class="input-field col s12">
						<p class="margin center medium-small sign-up">
							계정을 있으신가요? <a href="loginForm.jsp">로그인</a>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(".login-form").validate({
			rules : {
				id : {
					required : true,
					minlength : 4
				},
				name : {
					required : true,
					minlength : 3
				},
				phon2 : {
					required : true,
					minlength : 3
				},
				phon3 : {
					required : true,
				},
				sample2_postcode : {
					required : true
				},
				sample2_address : {
					required : true
				},
				sample2_detailAddress : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				birth : {
					required : true
				},

				password : {
					required : true,
					minlength : 5
				},
				cpassword : {
					required : true,
					minlength : 5,
					equalTo : "#password"
				}
			},
			//For custom messages
			messages : {
				id : {
					required : "아이디를 입력하세요.",
					minlength : "4자 이상 입력하세요."
				},
				name : {
					required : "이름을 입력하세요.",
					minlength : "3자 이상 입력하세요."
				},
				phon2: {
					required : "입력하세요.",
				},
				phon3: {
					required : "입력하세요.",
				},
				sample2_postcode : {
					required : "우편번호를 입력하세요."
				},
				sample2_address : {
					required : "주소를 입력하세요."
				},

				sample2_detailAddress : {
					required : "상세주소를 입력하세요."
				},
				email : {
					required : "이메일을 입력하세요.",
					email : "정확히 입력하세요."
				},
				birth : {
					required : "생년월일을 입력하세요.",
				},
				password : {
					required : "비밀번호를 입력하세요.",
					minlength : "5자 이상 입력하세요."
				},
				cpassword : {
					required : "비밀번호를 확인하세요.",
					minlength : "5자 이상 입력하세요.",
					equalTo : "비밀번호가 다릅니다."
				}
			},
			errorElement : 'div',
			errorPlacement : function(error, element) {
				var placement = $(element).data('error');
				if (placement) {
					$(placement).append(error)
				} else {
					error.insertAfter(element);
				}
			}
		});
	</script>
	<script type="text/javascript">
		;
		(function($) {
			$.fn.datepicker.dates['kr'] = {
				days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일" ],
				daysShort : [ "일", "월", "화", "수", "목", "금", "토", "일" ],
				daysMin : [ "일", "월", "화", "수", "목", "금", "토", "일" ],
				months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ]
			};
		}(jQuery));
	</script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
//                 if(data.userSelectedType === 'R'){
//                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
//                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
//                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
//                         extraAddr += data.bname;
//                     }
//                     // 건물명이 있고, 공동주택일 경우 추가한다.
//                     if(data.buildingName !== '' && data.apartment === 'Y'){
//                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
//                     }
//                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
//                     if(extraAddr !== ''){
//                         extraAddr = ' (' + extraAddr + ')';
//                     }
//                     // 조합된 참고항목을 해당 필드에 넣는다.
//                     document.getElementById("sample2_extraAddress").value = extraAddr;
                
//                 } else {
//                     document.getElementById("sample2_extraAddress").value = '';
//                 }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
</body>
</html>