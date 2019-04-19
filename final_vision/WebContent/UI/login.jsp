<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script   src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<head>
<meta charset="UTF-8">
<title>login 화면</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bin.css">
</head>
<body >
	<div class="wrapper" align="center">
		<form class="form-signin">
			<h4 class="form-signin-heading">
				<div class="form-signin-header">
					<a href="main.jsp"><button type="button" class="close">&times;</button></a>
					<br><br>
				</div>
				<a><img src="images/vision.png" id="imagepreview" 
				        style="width: 100px; height: 30px;">
				</a> 
				<br>계정LOGIN
			</h4>
			<input type="text" class="form-control" name="username"
				   placeholder="아이디" required="" autofocus="" /> 
			<input type="password" class="form-control" name="password"
				   placeholder="페스워드" required="" /> 
		    <label class="checkbox"> 
		    	<input type="checkbox" value="remember-me" id="rememberMe"
					   name="rememberMe">아이디 기억하기
			</label>
			<button class="btn btn-primary btn-lg btn-block" type="submit"
				style="border-color: black; background-color: white; color: black;">로그인</button>
			<div class="text-center" >
				<h6>
					<a href="sachPassword.jsp" >ID 및 비밀번호 찾기</a> 
					<br>또는&nbsp; 
					<a href="register.jsp">회원가입</a>
				</h6>
			</div>
		</form>
	</div>
</body>
</html>