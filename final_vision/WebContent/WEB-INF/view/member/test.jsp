<script type="text/javascript">
	var smsAuth = {
		data:{
			auth_from_type: "FFID",  //인증경로
			form:{
				id: "findIdForm"
			},
			getLoginId: function () {
				var loginIdObj = $("#hdn_login_id");
				return loginIdObj ? loginIdObj.val() : "";
			},
			getCustNo: function () {
				var custNoObj = $("#hdn_cust_no");
				return custNoObj ? custNoObj.val() : "";
			}
		},
		ui: {
			name_input: {
				id: "sms_auth_name_txt",
				placehoder: "이름",
				err_msg_obj: "sms_auth_name_err",
				err_msg_on_empty: "이름을 입력해주세요.",
				err_msg_on_invalid: "이름을 입력해주세요."
			},
			cell_phone_input: {
				id: "sms_auth_cell_phone_txt",
				placehoder: "휴대폰번호(숫자만 입력)",
				err_msg_obj: "sms_auth_cell_phone_err",
				err_msg_on_empty: "휴대폰번호를 입력해주세요.",
				err_msg_on_invalid: "휴대폰번호를 정확히 입력해주세요."
			},
			authkey_input: {
				id: "sms_auth_authkey_txt",
				placehoder: "6자리 숫자 입력",
				err_msg_obj: "sms_auth_auth_key_err",
				err_msg_on_empty: "휴대폰으로 발송된 인증번호를 입력해주세요.",
				err_msg_on_invalid: "인증번호를 정확히 입력해주세요.",
				err_msg_on_format: "인증번호는 6자리 숫자입니다. 휴대폰으로 발송된 인증번호를 확인해주세요.",
				err_msg_on_timeout: "인증번호를 다시 요청해주세요."
			},
			authkey_request_btn: {
				id: "sms_auth_authkey_request"
			},
			authkey_timer_description: {
				id: "sms_auth_time_txt"
			},
			authkey_submit_btn: {
				id: "sms_auth_submit"
			},
			authkey_token_hdn: {
				id: "hdn_request_token_by_sms"
			}
		},
		validation: {
			//<!--D: 크로스브라우징을 위해 placeholder 기능을 스크립트로 처리해 놓았습니다. 벨리데이션 체크시 placholder값과 value 값이 같을 경우는 체크 에러 처리해야 합니다. -->
			isEmpty: function (value, phvalue) {
				if (!value || value == "" || value.replace(/(\s*)/g, "") == "" || value == phvalue) {
					return true;
				} else {
					return false;
				}
			},

			isDigitsOnly: function (value) {
				if (characterUtils) {
					return characterUtils.isNumberOnly(value);
				}
				else {
					return false;
				}
			},
			
			isValidNameFormat: function (value, phvalue) {
				return !smsAuth.validation.isEmpty(value, phvalue);
			},

			isValidCellPhoneFormat: function (value, phvalue) {
				//하이픈 포함하고 검사
				if (!characterUtils.isValidCellphoneFormat(value)) {
					return false;
				}
				//하이픈 제거하고 검사
				value = value.replace(/-/g, '');
				if (smsAuth.validation.isEmpty(value, phvalue)) {
					return false;
				}

				if (!smsAuth.validation.isDigitsOnly(value)) {
					return false;
				}

				if (value.length != 10 && value.length != 11) {
					return false;
				}

				return true;
			},


			isValidAuthKeyFormat: function (value, phvalue) {
				if (smsAuth.validation.isEmpty(value, phvalue)) {
					return false;
				}

				if (!smsAuth.validation.isDigitsOnly(value)) {
					return false;
				}

				if (value.length != smsAuth.authKeyRule.length) {
					return false;
				}

				return true;
			},

			isValidAuthKey: function (requestToken, authKey) {
				var result = false;
				var succHandler = function (data) {
					if (data.ReturnCode == 0) {
						result = true;
					} else {
						var txtObj = $("#" + smsAuth.ui.authkey_input.id);
						var errDisplayObj = $("#" + smsAuth.ui.authkey_input.err_msg_obj);

						if (data.ReturnCode == -4 || data.ReturnCode == -5 || data.ReturnCode == -7 || data.ReturnCode == -8) { //인증 번호 다시 받아야함, 이 경우 timer가 의미 없으므로 timer 삭제해준다
							smsAuth.event.clearTimer(); //timer 삭제
						}

						//오류 메세지 노출
						errDisplayObj.text(data.Message);
						if (!errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
							errDisplayObj.parent().addClass("list-idpwform__item--error");
						}

						//인증번호 입력 초기화
						txtObj.text("");
						txtObj.val("");

						//인증번호 영역 focus
						txtObj.focus();

						result = false;
					}
				}

				var failHandler = function () {
					result = false;
				}

				smsAuth.ajaxCall.verifyAuthKey(requestToken, authKey, succHandler, failHandler, "smsAuth.ajaxCall.errHandler");
				return result;
			}
		},
		event: {},
		timer: undefined,
		ajaxCall: {
			getSmsAuthKey: function (name, cellPhoneNo, succHandler, failHandler, errorHandler) {
				var param = [
					{ name: 'name', value: name }
				   , { name: 'cellPhoneNo', value: cellPhoneNo }
				   , { name: 'authFromType', value: smsAuth.data.auth_from_type }
				   , { name: 'maxSearchResult', value: 2 },
				   , { name: 'loginID', value: smsAuth.data.getLoginId() },
				   , { name: 'custNo', value: smsAuth.data.getCustNo() }
				];

				var apiUrl = Member2SslLink("SmsEmailAuth/JsonGetSmsAuthKey");
				var apiResponse = AjaxHelper.GetDataToPostService(apiUrl, param, errorHandler);
				if (apiResponse.status == "200") {
					var data = JSON.parse(apiResponse.responseText);
					succHandler(data);
				} else {
					failHandler();
				}
			},
			verifyAuthKey: function (requestToken, authKey, succHandler, failHandler, errorHandler) {
				var param = [
					{ name: 'requestToken', value: requestToken }
				   , { name: 'authKey', value: authKey }
				   , { name: 'certType', value: "S" }
				];

				var apiUrl = Member2SslLink("SmsEmailAuth/JsonGetVerifyAuthKeyResult");
				var apiResponse = AjaxHelper.GetDataToPostService(apiUrl, param, errorHandler);
				if (apiResponse.status == "200") {
					var data = JSON.parse(apiResponse.responseText);
					succHandler(data);
				} else {
					failHandler();
				}
			},
			errHandler: function (err) {
				if (err && err.Message) {
					alert(err.Message);
				} else {
					alert("처리 중 오류가 발생했습니다.");
				}
			}
		},
		authKeyRule: {
			length: 6,
			timeLimitInMinutes: 2,
			timerCycleInMs: 1000
		}
	};

	smsAuth.event.clearMessages = function (type) {
		if (type == "name") {
			var errDisplayObj = $("#" + smsAuth.ui.name_input.err_msg_obj);
			if (errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
				errDisplayObj.parent().removeClass("list-idpwform__item--error");
			}
		}

		if (type == "cellphone") {
			var errDisplayObj = $("#" + smsAuth.ui.cell_phone_input.err_msg_obj);
			if (errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
				errDisplayObj.parent().removeClass("list-idpwform__item--error");
			}
		}

		if (type == "authkey") {
			var errDisplayObj = $("#" + smsAuth.ui.authkey_input.err_msg_obj);
			if (errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
				errDisplayObj.parent().removeClass("list-idpwform__item--error");
			}
		}
	}

	smsAuth.event.checkValues = function (type) {
		if (type == "name") {
			var txtObj = $("#" + smsAuth.ui.name_input.id);
			var errDisplayObj = $("#" + smsAuth.ui.name_input.err_msg_obj);

			var name = txtObj.val();
			var namePlaceholder = txtObj.attr("placeholder");
			var isValidName = smsAuth.validation.isValidNameFormat(name, namePlaceholder);

			if (!isValidName) {
				//오류 메세지 노출
				errDisplayObj.text(smsAuth.ui.name_input.err_msg_on_empty);
				if (!errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
					errDisplayObj.parent().addClass("list-idpwform__item--error");
				}
			}

			//이름, 휴대폰 번호 모두 입력되었으면 인증번호 받기 버튼을 Active 시킨다.
			var cellphone = $("#" + smsAuth.ui.cell_phone_input.id).val();
			var cellphonePlaceholder = $("#" + smsAuth.ui.cell_phone_input.id).attr("placeholder");
			var isValidCellphone = smsAuth.validation.isValidCellPhoneFormat(cellphone, cellphonePlaceholder);
			if (isValidName && isValidCellphone) {
				smsAuth.event.activeGetAuthKey();
			} else {
				smsAuth.event.disableGetAuthKey();
			}
		}

		if (type == "cellphone") {
			var txtObj = $("#" + smsAuth.ui.cell_phone_input.id);
			var errDisplayObj = $("#" + smsAuth.ui.cell_phone_input.err_msg_obj);

			//하이픈 자동 추가
			var tmpCellphone = txtObj.val().replace(/-/g, '');
			if (tmpCellphone.length <= 6) {
				txtObj.val(tmpCellphone.replace(/^([0-9]{3})([0-9]+)/, "$1-$2"));
			} else if (tmpCellphone.length <= 10) {
				txtObj.val(tmpCellphone.replace(/^([0-9]{3})([0-9]{3})([0-9]+)/, "$1-$2-$3"));
			} else {
				txtObj.val(tmpCellphone.replace(/^([0-9]{3})([0-9]{4})([0-9]{4})/, "$1-$2-$3"));
			}

			//유효성 체크 하기 전에 하이픈 자동 추가 먼저 해준다
			var cellphone = txtObj.val();
			var cellphonePlaceholder = txtObj.attr("placeholder");
			var isValidCellphone = smsAuth.validation.isValidCellPhoneFormat(cellphone, cellphonePlaceholder);

			if (!isValidCellphone) {
				if (smsAuth.validation.isEmpty(cellphone, cellphonePlaceholder)) {
					//오류 메세지 노출
					errDisplayObj.text(smsAuth.ui.cell_phone_input.err_msg_on_empty);
					if (!errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
						errDisplayObj.parent().addClass("list-idpwform__item--error");
					}
				}
				else
				{
					//오류 메세지 노출
					errDisplayObj.text(smsAuth.ui.cell_phone_input.err_msg_on_invalid);
					if (!errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
						errDisplayObj.parent().addClass("list-idpwform__item--error");
					}
				}
			}

			//이름, 휴대폰 번호 모두 입력되었으면 인증번호 받기 버튼을 Active 시킨다.
			var name = $("#" + smsAuth.ui.name_input.id).val();
			var namePlaceholder = $("#" + smsAuth.ui.name_input.id).attr("placeholder");
			var isValidName = smsAuth.validation.isValidNameFormat(name, namePlaceholder);
			if (isValidCellphone && isValidName) {
				smsAuth.event.activeGetAuthKey();
			} else {
				smsAuth.event.disableGetAuthKey();
			}
		}

		if (type == "authkey") {
			var txtObj = $("#" + smsAuth.ui.authkey_input.id);
			var errDisplayObj = $("#" + smsAuth.ui.authkey_input.err_msg_obj);
			var authKey = txtObj.val();
			var authKeyPlaceholder = txtObj.attr("placeholder");
			var isValidAuthKey = smsAuth.validation.isValidAuthKeyFormat(authKey, authKeyPlaceholder);

			if (!isValidAuthKey) {
				if (smsAuth.validation.isEmpty(authKey, authKeyPlaceholder)) {
					//오류 메세지 노출
					errDisplayObj.text(smsAuth.ui.authkey_input.err_msg_on_empty);
					if (!errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
						errDisplayObj.parent().addClass("list-idpwform__item--error");
					}
				}
				else
				{
					//오류 메세지 노출
					errDisplayObj.text(smsAuth.ui.authkey_input.err_msg_on_format);
					if (!errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
						errDisplayObj.parent().addClass("list-idpwform__item--error");
					}
				}
			}

			//submit버튼 설정
			if (isValidAuthKey) {
				var btnObj = $("#" + smsAuth.ui.authkey_submit_btn.id);
				if (!btnObj.hasClass("button-idpw-primary--active")) {
					btnObj.addClass("button-idpw-primary--active");
				}
			} else {
				var btnObj = $("#" + smsAuth.ui.authkey_submit_btn.id);
				if (btnObj.hasClass("button-idpw-primary--active")) {
					btnObj.removeClass("button-idpw-primary--active");
				}
			}
		}
	}

	smsAuth.event.disableGetAuthKey = function () {
		var btnObj = $("#" + smsAuth.ui.authkey_request_btn.id);
		if (btnObj.hasClass("button-get-code--active")) {
			btnObj.removeClass("button-get-code--active");
		}

		btnObj.attr("onclick", "return false;");
	}

	smsAuth.event.activeGetAuthKey = function () {
		var btnObj = $("#" + smsAuth.ui.authkey_request_btn.id);
		if (!btnObj.hasClass("button-get-code--active")) {
			btnObj.addClass("button-get-code--active");
		}

		btnObj.attr("onclick", "smsAuth.event.sendAuthKey(); return false;");
	}

	smsAuth.event.clearTimer = function () {
		var timerObj = $("#" + smsAuth.ui.authkey_timer_description.id);

		clearInterval(smsAuth.timer); //timer 삭제
		timerObj.text(""); //남은 시간 안내 문구 삭제

		//남은 시간 안내 문구 표시하는 줄도 삭제
		var authKeyField = $("#" + smsAuth.ui.authkey_input.id);
		var parent = authKeyField.parent().parent();
		if (parent.hasClass("list-idpwform__item--counting")) {
			parent.removeClass("list-idpwform__item--counting");
		}
	}

	smsAuth.event.setTimer = function () {
		var count = smsAuth.authKeyRule.timeLimitInMinutes * 60;

		smsAuth.timer = setInterval(function () {
			var timerObj = $("#" + smsAuth.ui.authkey_timer_description.id);
			count = count - (smsAuth.authKeyRule.timerCycleInMs / 1000);

			var m = Math.floor(count / 60);
			var s = count % 60;

			timerObj.text(m + "분 " + s + "초 남았습니다.");

			if (m == 0 && s == 0) { //시간 만료
				smsAuth.event.clearTimer(); //timer 삭제

				var hdnTokenObj = $("#" + smsAuth.ui.authkey_token_hdn.id);
				var txtObj = $("#" + smsAuth.ui.authkey_input.id);
				var errDisplayObj = $("#" + smsAuth.ui.authkey_input.err_msg_obj);

				//인증토큰 초기화
				hdnTokenObj.val("");

				//인증번호 입력 초기화
				txtObj.val("");

				//인증번호 영역 focus
				txtObj.focus();
				
				//인증번호 오류 메세지 노출
				errDisplayObj.text(smsAuth.ui.authkey_input.err_msg_on_timeout);
				if (!errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
					errDisplayObj.parent().addClass("list-idpwform__item--error");
				}
			}
		}, smsAuth.authKeyRule.timerCycleInMs);
	}

	smsAuth.event.sendAuthKeySuccess = function (data) {
		if (data.ReturnCode == 0) {

			var loginId = smsAuth.data.getLoginId();
			if (loginId && loginId.length > 0) {
				alert("인증번호 발송 요청이 완료되었습니다.\n인증번호가 오지 않는 경우, " + loginId + "님의 입력한 이름/휴대폰번호를 확인 후 다시 요청해주세요.");
			} else {
				alert("인증번호 발송 요청이 완료되었습니다.\n인증번호가 오지 않는 경우, 입력한 이름/휴대폰번호를 확인 후 다시 요청해주세요.");
			}

			//token 설정
			$("#" + smsAuth.ui.authkey_token_hdn.id).val(data.RequestToken);

			//start timer
			clearInterval(smsAuth.timer);
			smsAuth.event.setTimer();

			//ui settings
			smsAuth.event.activeGetAuthKey();
			
			//오류 메세지 삭제
			var errDisplayObj = $("#" + smsAuth.ui.authkey_input.err_msg_obj);
			errDisplayObj.text("");
			if (errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
				errDisplayObj.parent().removeClass("list-idpwform__item--error");
			}

			//timer class 설정
			var authKeyField = $("#" + smsAuth.ui.authkey_input.id);
			var parent = authKeyField.parent().parent();
			if (!parent.hasClass("list-idpwform__item--counting")) {
				parent.addClass("list-idpwform__item--counting");
			}
		}
		else
		{
			smsAuth.ajaxCall.errHandler(data);
		}
	}

	smsAuth.event.sendAuthKey = function () {
		//input check
		smsAuth.event.checkValues("name");
		smsAuth.event.checkValues("cellphone");

		//인증번호 영역 초기화 및 focus
		var hdnTokenObj = $("#" + smsAuth.ui.authkey_token_hdn.id);
		var authKeyField = $("#" + smsAuth.ui.authkey_input.id);
		var btnObj = $("#" + smsAuth.ui.authkey_request_btn.id);
		hdnTokenObj.val("");
		authKeyField.val("");
		btnObj.text("인증번호 다시받기");

		//call ajax
		var name = $("#" + smsAuth.ui.name_input.id).val();
		var cellPhoneNo = $("#" + smsAuth.ui.cell_phone_input.id).val();
		smsAuth.ajaxCall.getSmsAuthKey(name, cellPhoneNo, smsAuth.event.sendAuthKeySuccess, smsAuth.ajaxCall.errHandler, "smsAuth.ajaxCall.errHandler");
	}

	smsAuth.event.VerifyAuthKey = function () {
		//input validation
		//ajax call
		var errDisplayObj = $("#" + smsAuth.ui.authkey_input.err_msg_obj);
		var authKey = $("#" + smsAuth.ui.authkey_input.id).val();
		var authKeyPlaceholder = $("#" + smsAuth.ui.authkey_input.id).attr("placeholder");
		var requestToken = $("#" + smsAuth.ui.authkey_token_hdn.id).val();
		var isValidFormat = smsAuth.validation.isValidAuthKeyFormat(authKey, authKeyPlaceholder);
		var isValidValue = smsAuth.validation.isValidAuthKey(requestToken, authKey);

		if (isValidFormat && isValidValue) {
			//오류 메세지 삭제
			errDisplayObj.text("");
			if (errDisplayObj.parent().hasClass("list-idpwform__item--error")) {
				errDisplayObj.parent().removeClass("list-idpwform__item--error");
			}

			//form submit
			var formObj = $("#" + smsAuth.data.form.id);
			formObj.submit();
		}
		else {
			//prevent form submit
			var eventObject = event || window.event;
			if (eventObject) {
				eventObject.preventDefault ? eventObject.preventDefault() : (eventObject.returnValue = false);
			} else {
				return false;
			}
		}
	}