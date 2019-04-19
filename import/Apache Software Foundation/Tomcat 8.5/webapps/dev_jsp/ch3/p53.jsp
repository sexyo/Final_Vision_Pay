<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	//디클러레이션에 선언한면 전변이됨.
	String mem_name = "이순신"; // 전역변수가 된다.
	// 이렇게 사용하지 말것 - 이유는? 해당 jsp문서는 자바코드로 변환이 일어나는데 서버제품마다 그 명명규칙이 다르므로 인스턴스화를 할 수 없다. - 재사용성이 떨어짐.
	//단 예외인 상황은 - UI솔루션과 연계할 때 사용한다.
	public int methodA(int i){
		i=i+2;
		return i;
	}
%>
<%
//실행주체가 브라우저이다.
	int i =10;// 지역변수이다. service()메소드 안에 선언되있어서
	out.println("i="+i); 
	out.println("<br>");
	i= methodA(i);
%>
<!-- 아래 문장은 지역변수 -->
<%="i2="+i %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>