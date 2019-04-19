<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 확장자를  XXX.jsp로 저장했을 때 자바코드와 html코드를 같이 활용할 수 있다.
자바 코드를 작성할 땐 꼭 스크립틀릿을 선언한 후 그 안에 코드를 작성해야 됨.
작성하는 위치는 그렇게 중요하지가 않을것 같다.
왜냐하면 자바코드는 서버측에서 실행된 후 그 결과값만을 클라이언트 측에 다운로드 시키기 때문이다.
어느 위치에 작성을 하든지 서버측에서 먼저 처리가 된 다는 사실을 꼭 기억하자
실행된 결과는 html타입으로 처리가 된다는 것도 기억해야 된다.
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

window.history.forward()

</script>
</head>
<body>
<%
	String mem_id = request.getParameter("mem_id");
//자바어플리케이션에서는 모든 출력결과 내용은 시스템에 출력을 했으므로
//System.out.print()로 사용했지만
//브라우저에서는 시스템을 사용하는 대신 브라우저를 사용해서 클라이언트측에 다운로드 시킨후 서버측에서 처리된 결과를 html타입으로 받아서 출력하는 것이므로
//out이라는 내장객체를 사용해서 출력하면 된다.
	out.print(mem_id);
//줄바꿈 처리시에는 println이 아니라<br>태그를 사용해야 한다.
	out.print("<br>");
//대소문자를 반드시 구분해야 한다.
//구분하지 않았을 경우에는 그 값을 서버측에서 읽을 수가 없기 때문이다.
	String MEM_PW = request.getParameter("MEM_ID");
//아래 경우 대소문자를 구분하지 않았으므로 비번을 가져올 수가 없다.
	out.print("MEM_PW");//아무것도 출력되지 않음.
//한글의 경우 클라이언트측에서 서버측으로 전달될 때 별도로 한글처리가 필요하다.
//아래의 경우 입력된 한글 정보를 출력하는 것이므로 한글처리가 별도로 필요합니다.
//한글처리 방법에 대해서도 알아 봅시다.
//한글처리 방식에는 전송방식을 get방식으로 할때와 post방식으로 할 때
//두 경우가 다릅니다.
	out.print("<br>");
	String mem_name = request.getParameter("mem_name");
	out.print("mem_name");//이름이 출력되지만 한글처리는?????
//현재 테스트 시나리오에서는 한글을 직접 URL에 작성해서 깨지지 않는 것임
//보통의 경우 한글이 유니코드로 변환되어 전송되므로 form전송시에는 깨져서 보이게됨.
//현재 네이버나 구글등은 파라미터로 입력한 값을 한글 변화처리하여 넘겨주므로
//한글이 정상적으로 보이도록 처리하고 있다.
%>
</body>
</html>