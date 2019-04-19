<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id="test"; //sevice()[doGet,doPost]안에 들어가있어서 - 지역변수이다.
	//문제
	//a.jsp 페이지에서 생성한 객체 mem_id를 b.jsp에서 사용하고 싶다.
	//어떻하지?
/* 
	페이지 이동시(a.jsp에서) location.href를 사용하면 새로운 페이지(b.jsp)로 이동할 수 있다.
	이 때 주소창에 a.jsp에서 b.jsp로 변화되었음을 알 수 있다. 기존에 요청이 끊어지고 새로운 요청이 들어왔다는 의미
	따라서 요청이 유지되지 않고 있다.
	이런경우 값을 유지할 수 없다.
	그래서 query string 사용하였다.
	
	3번(forward)
	url이 바뀌지 않는다.
	톰캣서버가 요청이 계속 유지되고 있는것으로 판단
	페이지 내용이 바뀐다.
	
	1번과 2번의 경우에는 url이 바뀐다.
	요청이 끊어졌다가 다음페이지로 이동할 때 새로 연결이 이루어짐.
	(처리[java,servlet,jsp]된 결과[html,js,css-다운로드])
*/	
%>
<!DOCTYPE html>
<!-- 
1)먼저 주소창에 a.jsp페이지를 요청함.
2)버튼을 클릭하면 b.jsp페이지로 이동함.
3)b.jsp페이지의 내용이 출력됨.
4)url이 변경되었음.
	:기존 요청이 끊어지고 새로운 요청이 발생함.
	:a.jsp페이지에서 담은 정보를 b.jsp페이지에서 사용할 수 없음.
	
이전 페이지로 이동하기
location.go(-1);

다음 페이지로 이동하기
location.go(1);
 -->
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp</title>
<script type="text/javascript">
	function move(){
/*
 *자바코드와 자바스크립트는 형제관계인가? 아니면 남남인가?
	남남이라면 어떻게 코드를 같이 사용할 수 있을까?
 */

		location.href="b.jsp?mem_id=<%out.print(mem_id);%>";
	}
	function nextPage(){
		history.go(1);
	}
</script>
</head>
<body>
여기는 a.jsp<br>
<input type="button" value="b.jsp이동" onClick="move()">
<input type="button" value="다음" onClick="nextPage()">
</body>
</html>