<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
// 	Cookie[] cookies = request.getCookies() ;
// 	if(cookies != null){
// 	    for(int i=0; i < cookies.length; i++){
// 	        Cookie c = cookies[i] ;
	        // 저장된 쿠키 이름을 가져온다
// 	        String cName = c.getName();
	        // 쿠키값을 가져온다
// 	        String cValue = c.getValue() ;
// 	        StringTokenizer st = new StringTokenizer(cValue,"!");
// 	        out.print("<br>");
// 	        out.print(st.nextToken());
// 	        out.print("<br>");
// 	        out.print(cValue);
// 	        out.print("<br>");
// 	    }
// 	}
	
// 	Cookie[] cookies = request.getCookies();
// 	if(cookies != null){
// 	for(int i=0; i< cookies.length; i++){
// 	cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
// 	response.addCookie(cookies[i]); // 응답 헤더에 추가
// 	}
// 	}

%>    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<mata name="viewport" content="width=device-width" , inital-scale="1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<head>
<title>결제 완료</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bin.css">
</head>
<body>
<script type="text/javascript">
	function gogo(){
	location.href="../member/index";
		}
</script>
  <!-- 네비게이션 바 시작 -->
   <nav class="navbar navbar-default">
      <div class="container-fluid">
         <div class="navbar-header">
            <h4>
               <a class="navbar-brand" style="color: #ffffff; height: 25px"
                  href="../member/index"><</a> <a class="navbar-brand" href="../account/account">
                  <img src="/images/VISION2.png" id="imagepreview"
                  style="width: 110px; height: 35px" align="left">&nbsp;계좌
               </a>
               <button type="button" class="navbar-toggle collapsed"
                  data-toggle="modal" data-target="#m_accountAdd"
                  style="background-color: #000000; color: #ffffff; border-color: #000000">
                  <img src="/images/account.png"> 추가
               </button>
            </h4>
         </div>
         <div class="collapse navbar-collapse "
            id="bs-example-navber-collapse-1">
            <h4>
               <form class="navbar-form navbar-right">
                  <button type="button" data-toggle="modal"
                     data-target="#m_accountAdd"
                     style="background-color: #000000; color: #ffffff; border-color: #000000">
                     <img src="/images/account.png">추가
                  </button>
               </form>
            </h4>
         </div>
      </div>
   </nav>
   <!-- 네비게이션 바 끝 -->
        
결제완료<button id="complete" onClick="gogo();">확인</button>

<%@ include file="../include/footer.jsp" %>   
</body>
</html>