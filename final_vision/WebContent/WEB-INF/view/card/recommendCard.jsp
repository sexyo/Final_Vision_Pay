<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<head>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1"></mata>
<title>모든 카드 추천 페이지</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
<style>
	#rc_container{
	padding:10px 5% 10px 5%;
	background-color:#bebebe;
	margin: auto;
	text-align: justify;
	width:80%;
	margin-bottom: 25px;
	
	
	}
	.media{
	padding:1%;
	width:100%;
	display: inline-block;
	background-color:#E2CFAA;
	
	}
	h1{
	text-align:center;
	}
	.media-body{
	padding-left: 5%;
	}

</style>
<script type="text/javascript">
var acc_num_sel;
$(document).ready(function() {
	$.ajax({ 
	    type: "POST",
	    url : "/account/accountList3",
		dataType : "json",
	    success : function(data) {
		     var v1 = JSON.stringify(data);
		     var v2 = JSON.parse(v1);
	    	console.log("stringify"+v1);
	    	console.log("parse"+v2);
	    	console.log("길이 : "+v2.length);
	    	console.log(v2[0].ACC_BANK+"  "+v2[0].ACC_NUM+"  "+v2[0].ACC_NAME);
	    	$.each(data , function( key, val){
	              var acc = val.ACC_BANK+"  "+val.ACC_NUM+"  "+val.ACC_NAME;
	              num = val.ACC_NUM;
	              var append = "<li><a class='a_seled' href='javascript:acc_sel("+num+");'><span style='font-size:16px;'>"+acc+"</span></a></li>"
	                   //$('#mydd').empty();
	                   $('.dropdown-menu').append(append);
	                   $(".a_seled").click(function () {
	                         $(".dropdown-toggle").html($(this).html() + ' <span class="caret"></span>');
	                       });
	          });
	    }
    	, error:function(request,status,error){
			alert("실패");
                console.log("error");
        }
	});
});
function acc_sel(sel_num){//계좌선택
	acc_num_sel = sel_num;
	//alert(sel_num);
	
}
function reclear(){//modal 내부 값들 초기화
	$('.ip_cl').val('');
	$('.dropdown-toggle').html('계좌 <span class="caret"></span>');
	acc_num_sel=null;
};
function cdRequest(in_name,p_bin){//카드 추가 시도
	in_name = in_name;
	cd_pw = String($('#'+in_name).val());
	cd_day = $('#'+in_name+"_day").val();
	alert(cd_pw.length);
	if(acc_num_sel==null){
		alert(" 계좌를 선택하여 주세요. ");
		}
	else if(cd_pw.length != 6){
		alert(" 비밀번호는 6자리를 맞춰주세요. ");
		}
	else if(cd_day < 1 || cd_day > 29){
		alert(" 매달 청구일은 1일부터 29 이내로 입력하여 주세요. ");
		}
	else{//여기에 카드추가 코드 넣을 것
		alert("카드추가 시도");
		p_pw = String(cd_pw);
		$.ajax({ 
		    type: "POST",
		    url : "/card/visionCardAdd",
		    data : { p_bin : p_bin,
	             	 p_acc_num : acc_num_sel,
	             	 p_vi_day : cd_day,
	             	 p_pw : p_pw
	        },
		    success : function(data) {
                if(data == 0){
                    alert("카드 추가 실패");
                 }
                 else{
                    alert("카드 추가 성공");
                    location.href="../card/card"
                 }
		    }
	    	, error:function(){
				alert("실패");
	                console.log("error");
	        }
		});
		
	$('.modal').modal('hide');
	reclear();
		}
};
</script>
<style type="text/css">
.modal-footer{
text-align: center;
}
input::placeholder {
  color: red;
  font-style: italic;
}
</style>
</head>
<body>
	<!-- 네비게이션 바 시작 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<br>
			<h4>
				<div class="navbar-header">
					<a style="color: #ffffff; height: 25px" href="../member/index"><</a>
					<a href="../member/index" style="color: white" >&nbsp;<img src="/images/VISION2.png" id="imagepreview" style="width: 80px; height: 20px;">&nbsp;<span style="font-size:2em;">&nbsp;모든&nbsp;VISION&nbsp;카드</span></a>
				</div>
			</h4>
			<br>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	<!-- 모든 카드 시작 -->
	<div class="container" id="rc_container">
		<div class="row">
			<div class="col-12">
					<div class="media" id="487123">
						<div class="media-left" data-toggle="modal" data-target="#mod_487123">
							<a> <img class="media-object" src="/images/487123.png"
								style="width: 350px; height: 210px">
							</a>
						</div>
						<div class="media-body">
							<h1 class="media-heading rec_head">청소년 카드</h1><br>
							<h4> 카페  - 할인 5%</h4> 
							<h4> 편의점 및 마트  - 할인 5%</h4> 
							<h4> 교통  - 적립 5%</h4> 
						</div>
					</div>
					<div class="media" id="487159">
						<div class="media-left" data-toggle="modal" data-target="#mod_487159">
							<a href="#"> <img class="media-object" src="/images/487159.png"
								style="width: 350px; height: 210px">
							</a>
						</div>
						<div class="media-body">
							<h1 class="media-heading rec_head">쇼핑 카드</h1><br>
							<h4> 쇼핑 & 온라인 쇼핑  - 적립 5%</h4> 
							<h4> 생활  - 적립 5%</h4> 
							<h4> 뷰티  - 할인 5%</h4>
						</div>
					</div>
					<div class="media" id="587456">
						<div class="media-left" data-toggle="modal" data-target="#mod_587456">
							<a href="#"> <img class="media-object" src="/images/587456.png"
								style="width: 350px; height: 210px">
							</a>
						</div>
						<div class="media-body">
							<h1 class="media-heading rec_head">아저씨 카드</h1><br>
							<h4>건강 및 의료  - 할인 5%</h4> 
							<h4>생활 및 통신  - 적립 5%</h4> 
							<h4>교통  - 적립 5%</h4>
						</div>
					</div>
					<div class="media" id="587753">
						<div class="media-left" data-toggle="modal" data-target="#mod_587753">
							<a href="#"> <img class="media-object" src="/images/587753.png"
								style="width: 350px; height: 210px">
							</a>
						</div>
						<div class="media-body">
							<h1 class="media-heading rec_head">짐승 카드</h1><br>
							<h4>편의점 및 마트  - 할인 5%</h4> 
							<h4>문화  - 적립 5%</h4> 
							<h4>외식  - 적립 5%</h4>
						</div>
					</div>
					<div class="media" id="987183">
						<div class="media-left" data-toggle="modal" data-target="#mod_987183">
							<a href="#"> <img class="media-object" src="/images/987183.png"
								style="width: 350px; height: 210px">
							</a>
						</div>
						<div class="media-body">
							<h1 class="media-heading rec_head">꽃 카드</h1><br>
							<h4>온라인 쇼핑 및 쇼핑  - 적립 5%</h4> 
							<h4>카페  - 적립 5%</h4> 
							<h4>뷰티  - 할인 5%</h4>
						</div>
					</div>
					<div class="media" id="987789">
						<div class="media-left" data-toggle="modal" data-target="#mod_987789">
							<a href="#"> <img class="media-object" src="/images/987789.png"
								style="width: 350px; height: 210px">
							</a>
						</div>
						<div class="media-body">
							<h1 class="media-heading rec_head">실버 카드</h1><br>
							<h4>건강 및 의료  - 할인 5%</h4> 
							<h4>생활  - 할인 5%</h4> 
							<h4>외식  - 적립 5%</h4>
						</div>
					</div>
				</div>		
		</div>
	</div>
	<!-- 모든 카드 끝 -->
	<!-- 푸터 시작 -->
	<%@ include file="../include/footer.jsp" %>
	<!-- 푸터 끝 -->
	<!-- 모달 시작-->
	<div class="modal fade" id="mod_487123" role="dialog"  tabindex="-1" >
		<div class="modal-dialog"style="width:400px; height:auto;">
			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header" style="text-align:center;">
					<button type="button" class="close" data-dismiss="modal"onclick="reclear();">&times;</button>
					<h1 style="font-weight: bold;">청소년 카드</h1>
					<img src="/images/487123.png" id="imagepreview"
					style="width: 350px; height: 210px;">
				</div>
				<div class="modal-body">
					
					<h4 class="modal-title">모든 사람에게 적합한 공용 카드!</h4>
					<li>카페 할인</li>
					<div>커피 전문점  - 5% 할인</div>
					<li>편의점 할인</li>	
					<div>편의점  - 5% 할인</div>
					<div>마트  - 5% 할인</div>
					<li>교통 적립</li>	
					<div>대중교통  - 5% 적립</div>
					<div>주유 관련  - 5% 적립</div>
					<div>자동차 관련 매장  - 5% 적립</div>
				</div>
				<div class="modal-footer">
					<a href="#" class="list-group-item"style="text-align: center; background-color:#FF8E99; margin-bottom:5px;"><span style="color:#000000; font-weight: bold;">계좌 추가하러 가기</span></a> 
					<button class="btn btn-default dropdown-toggle form-control"
						style='width: 100%;' id="dropdownMenu1" data-toggle="dropdown">
						계좌 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1" ></ul>
					<h4 style="text-align: center;">
						VISION카드를 발급받으시려면 <br>결제비밀번호 <span style="color: red;"><U>6자리 숫자</U></span>와 <span style="color: red;"><U>청구일</U></span>을
						입력하여 주세요.
					</h4>
					<div class="row"><span>비 밀 번 호&nbsp;</span>	
					<input id="mod1"type="number" placeholder=" 비 밀 번 호" style="cursor:auto;border-radius:10px; border: 2px solid red; margin-bottom: 5px;" class="ip_cl"/>
					</div>
					
					<div class="row"><span>매달 청구일 &nbsp;</span>
					<input id="mod1_day" placeholder=" 청 구 일" type="number" style="cursor: auto;border-radius:10px;  border: 2px solid red; margin-bottom: 5px;"class="ip_cl" /></div> 	<!-- 결제날짜 -->

					<button type="button" class="btn btn-primary" data-toggle="modal"
						onclick="cdRequest('mod1','487123');">카드신청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"onclick="reclear();">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mod_487159" role="dialog"  tabindex="-1" >
		<div class="modal-dialog"style="width:400px; height:auto;">
			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header" style="text-align:center;">
					<button type="button" class="close" data-dismiss="modal"onclick="reclear();">&times;</button>
					<h1 style="font-weight: bold;">쇼핑 카드</h1>
					<img src="/images/487159.png" id="imagepreview"
					style="width: 350px; height: 210px;">
				</div>
				<div class="modal-body">
					<h4 class="modal-title">쇼핑 적립을 위한 카드!</h4>
					<li>쇼핑 적립</li>
					<div>쇼핑 매장 - 5% 적립</div>
					<div>온라인 쇼핑 - 5% 적립</div>
					<li>생활 적립</li>
					<div>생활 용품 매장 - 5% 적립</div>
					<div>통신 - 5% 적립</div>
					<div>금융 - 5% 적립</div>
					<li>뷰티 할인</li>
					<div>뷰티 관련 매장 - 5% 할인</div>
				</div>
				<div class="modal-footer">
					<a href="#" class="list-group-item"style="text-align: center; background-color:#FF8E99; margin-bottom:5px;"><span style="color:#000000; font-weight: bold;">계좌 추가하러 가기</span></a>
					<button class="btn btn-default dropdown-toggle form-control"
						style='width: 100%;' id="dropdownMenu1" data-toggle="dropdown">
						계좌 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" ></ul>
					<h4 style="text-align: center;">
						VISION카드를 발급받으시려면 <br>결제비밀번호 <span style="color: red;"><U>6자리 숫자</U></span>와 <span style="color: red;"><U>청구일</U></span>을
						입력하여 주세요.
					</h4>
					<div class="row"><span>비 밀 번 호&nbsp;</span>	
					<input id="mod2"type="number" placeholder=" 비 밀 번 호" style="cursor:auto;border-radius:10px; border: 2px solid red; margin-bottom: 5px;" class="ip_cl"/>
					</div>
					
					<div class="row"><span>매달 청구일 &nbsp;</span>
					<input id="mod2_day" placeholder=" 청 구 일" type="number" style="cursor: auto;border-radius:10px;  border: 2px solid red; margin-bottom: 5px;"class="ip_cl" /></div> 	<!-- 결제날짜 -->

					<button type="button" class="btn btn-primary" data-toggle="modal"
						onclick="cdRequest('mod2','487159');">카드신청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"onclick="reclear();">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mod_587456" role="dialog"  tabindex="-1" >
		<div class="modal-dialog"style="width:400px; height:auto;">
			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header" style="text-align:center;">
					<button type="button" class="close" data-dismiss="modal"onclick="reclear();">&times;</button>
					<h1 style="font-weight: bold;">아저씨 카드</h1>
					<img src="/images/587456.png" id="imagepreview"
					style="width: 350px; height: 210px;">
				</div>
				<div class="modal-body">
					<h4 class="modal-title">건강한 생활을 위한 카드!</h4>
					<li>건강 할인</li>
					<div>헬스 및 건강 관련 매장 - 5% 할인</div>
					<div>의료 관련 지출 - 5% 할인</div>
					<li>생활 할인</li>
					<div>생활 용품 매장 - 5% 할인</div>
					<div>통신 - 5% 할인</div>
					<div>금융 - 5% 할인</div>
					<li>교통 적립</li>	
					<div>대중교통  - 5% 적립</div>
					<div>주유 관련  - 5% 적립</div>
					<div>자동차 관련 매장  - 5% 적립</div>
				</div>
				<div class="modal-footer">
					<a href="#" class="list-group-item"style="text-align: center; background-color:#FF8E99; margin-bottom:5px;"><span style="color:#000000; font-weight: bold;">계좌 추가하러 가기</span></a>
					<button class="btn btn-default dropdown-toggle form-control"
						style='width: 100%;' id="dropdownMenu1" data-toggle="dropdown">
						계좌 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" ></ul>
					<h4 style="text-align: center;">
						VISION카드를 발급받으시려면 <br>결제비밀번호 <span style="color: red;"><U>6자리 숫자</U></span>와 <span style="color: red;"><U>청구일</U></span>을
						입력하여 주세요.
					</h4>
					<div class="row"><span>비 밀 번 호&nbsp;</span>	
					<input id="mod3"type="number" placeholder=" 비 밀 번 호" style="cursor:auto;border-radius:10px; border: 2px solid red; margin-bottom: 5px;" class="ip_cl"/>
					</div>
					
					<div class="row"><span>매달 청구일 &nbsp;</span>
					<input id="mod3_day" placeholder=" 청 구 일" type="number" style="cursor: auto;border-radius:10px;  border: 2px solid red; margin-bottom: 5px;"class="ip_cl" /></div> 	<!-- 결제날짜 -->

					<button type="button" class="btn btn-primary" data-toggle="modal"
						onclick="cdRequest('mod3','587456');">카드신청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"onclick="reclear();">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mod_587753" role="dialog"  tabindex="-1" >
		<div class="modal-dialog"style="width:400px; height:auto;">
			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header" style="text-align:center;">
					<button type="button" class="close" data-dismiss="modal"onclick="reclear();">&times;</button>
					<h1 style="font-weight: bold;">짐승 카드</h1>
					<img src="/images/587753.png" id="imagepreview"
					style="width: 350px; height: 210px;">
				</div>
				<div class="modal-body">
					<h4 class="modal-title">즐기는 삶을 위한 카드!</h4>
					<li>편의점 할인</li>	
					<div>편의점  - 5% 할인</div>
					<div>마트  - 5% 할인</div>
					<li>레저 적립</li>
					<div>문화  - 5% 적립</div>
					<div>공연  - 5% 적립</div>
					<div>레저  - 5% 적립</div>
					<div>여행  - 5% 적립</div>
					<div>영화  - 5% 적립</div>
					<li>외식 적립</li>
					<div>외식 - 5% 적립</div>
				</div>
				<div class="modal-footer">
					<a href="#" class="list-group-item"style="text-align: center; background-color:#FF8E99; margin-bottom:5px;"><span style="color:#000000; font-weight: bold;">계좌 추가하러 가기</span></a>
					<button class="btn btn-default dropdown-toggle form-control"
						style='width: 100%;' id="dropdownMenu1" data-toggle="dropdown">
						계좌 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" ></ul>
					<h4 style="text-align: center;">
						VISION카드를 발급받으시려면 <br>결제비밀번호 <span style="color: red;"><U>6자리 숫자</U></span>와 <span style="color: red;"><U>청구일</U></span>을
						입력하여 주세요.
					</h4>
					<div class="row"><span>비 밀 번 호&nbsp;</span>	
					<input id="mod4"type="number" placeholder=" 비 밀 번 호" style="cursor:auto;border-radius:10px; border: 2px solid red; margin-bottom: 5px;" class="ip_cl"/>
					</div>
					
					<div class="row"><span>매달 청구일 &nbsp;</span>
					<input id="mod4_day" placeholder=" 청 구 일" type="number" style="cursor: auto;border-radius:10px;  border: 2px solid red; margin-bottom: 5px;"class="ip_cl" /></div> 	<!-- 결제날짜 -->

					<button type="button" class="btn btn-primary" data-toggle="modal"
						onclick="cdRequest('mod4','587753');">카드신청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"onclick="reclear();">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mod_987183" role="dialog"  tabindex="-1" >
		<div class="modal-dialog"style="width:400px; height:auto;">
			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header" style="text-align:center;">
					<button type="button" class="close" data-dismiss="modal"onclick="reclear();">&times;</button>
					<h1 style="font-weight: bold;">아저씨 카드</h1>
					<img src="/images/987183.png" id="imagepreview"
					style="width: 350px; height: 210px;">
				</div>
				<div class="modal-body">
					
					<h4 class="modal-title">건강한 생활을 위한 카드!</h4>
					<li>건강 할인</li>
					<div>헬스 및 건강 관련 매장 - 5% 할인</div>
					<div>의료 관련 지출 - 5% 할인</div>
					<li>생활 할인</li>
					<div>생활 용품 매장 - 5% 할인</div>
					<div>통신 - 5% 할인</div>
					<div>금융 - 5% 할인</div>
					<li>교통 적립</li>	
					<div>대중교통  - 5% 적립</div>
					<div>주유 관련  - 5% 적립</div>
					<div>자동차 관련 매장  - 5% 적립</div>
				</div>
				<div class="modal-footer">
					<a href="#" class="list-group-item"style="text-align: center; background-color:#FF8E99; margin-bottom:5px;"><span style="color:#000000; font-weight: bold;">계좌 추가하러 가기</span></a>
					<button class="btn btn-default dropdown-toggle form-control"
						style='width: 100%;' id="dropdownMenu1" data-toggle="dropdown">
						계좌 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" ></ul>
					<h4 style="text-align: center;">
						VISION카드를 발급받으시려면 <br>결제비밀번호 <span style="color: red;"><U>6자리 숫자</U></span>와 <span style="color: red;"><U>청구일</U></span>을
						입력하여 주세요.
					</h4>
					<div class="row"><span>비 밀 번 호&nbsp;</span>	
					<input id="mod5"type="number" placeholder=" 비 밀 번 호" style="cursor:auto;border-radius:10px; border: 2px solid red; margin-bottom: 5px;" class="ip_cl"/>
					</div>
					
					<div class="row"><span>매달 청구일 &nbsp;</span>
					<input id="mod5_day" placeholder=" 청 구 일" type="number" style="cursor: auto;border-radius:10px;  border: 2px solid red; margin-bottom: 5px;"class="ip_cl" /></div> 	<!-- 결제날짜 -->

					<button type="button" class="btn btn-primary" data-toggle="modal"
						onclick="cdRequest('mod5','987183');">카드신청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"onclick="reclear();">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mod_987789" role="dialog"  tabindex="-1" >
		<div class="modal-dialog"style="width:400px; height:auto;">
			<!-- Modal content-->
			<div class="modal-content" >
				<div class="modal-header" style="text-align:center;">
					<button type="button" class="close" data-dismiss="modal"onclick="reclear();">&times;</button>
					<h1 style="font-weight: bold;">실버 카드</h1>
					<img src="/images/987789.png" id="imagepreview"
					style="width: 350px; height: 210px;">
				</div>
				<div class="modal-body">
					<h4 class="modal-title">편안한 삶을 위한 카드!</h4>
					<li>건강 할인</li>
					<div>헬스 및 건강 관련 매장 - 5% 할인</div>
					<div>의료 관련 지출 - 5% 할인</div>
					<li>생활 할인</li>
					<div>생활 용품 매장 - 5% 할인</div>
					<div>통신 - 5% 할인</div>
					<div>금융 - 5% 할인</div>
					<li>외식 적립</li>	
					<div>외식  - 5% 적립</div>
				</div>
				<div class="modal-footer">
					<a href="#" class="list-group-item"style="text-align: center; background-color:#FF8E99; margin-bottom:5px;"><span style="color:#000000; font-weight: bold;">계좌 추가하러 가기</span></a>
					<button class="btn btn-default dropdown-toggle form-control"
						 id="dropdownMenu1" data-toggle="dropdown">
						계좌 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1" ></ul>
					<h4 style="text-align: center;">
						VISION카드를 발급받으시려면 <br>결제비밀번호 <span style="color: red;"><U>6자리 숫자</U></span>와 <span style="color: red;"><U>청구일</U></span>을
						입력하여 주세요.
					</h4>
					<div class="row"><span>비 밀 번 호&nbsp;</span>	
					<input id="mod6"type="number" placeholder=" 비 밀 번 호" style="cursor:auto;border-radius:10px; border: 2px solid red; margin-bottom: 5px;" class="ip_cl"/>
					</div>
					
					<div class="row"><span>매달 청구일 &nbsp;</span>
					<input id="mod6_day" placeholder=" 청 구 일" type="number" style="cursor: auto;border-radius:10px;  border: 2px solid red; margin-bottom: 5px;"class="ip_cl" /></div> 	<!-- 결제날짜 -->
					
					<button type="button" class="btn btn-primary" data-toggle="modal"
						onclick="cdRequest('mod6','987789');">카드신청</button>
					<button type="button" class="btn btn-default bt_close" data-dismiss="modal"onclick="reclear();">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
</body>
</html>