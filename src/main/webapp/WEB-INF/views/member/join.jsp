<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVATAR CHAT</title>
<link href="${ctx}/resource/css/joinstyle.css" type="text/css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>

<body>
	<div id="formWrapper">

		<div id="form">
			<form action="?${_csrf.parameterName}=${_csrf.token}" method="post">
			<h1 class="logo">
				<img src="${ctx}/resource/images/join.png" alt="join" style="width: 200px; padding-left: 95px;" />
			</h1>
			<div class="form-item">
			<div class="form-title">이름</div>
				<input type="text" name="name" class="form-style" placeholder="이름 입력해주세요" />
			</div>
			<div class="form-item">
			<div class="form-title">아이디</div>
				<input type="text" name="id" class="form-style" placeholder="아이디를 입력해주세요" />
			</div>

			<div class="form-item">
			<div class="form-title">비밀번호</div>
				<input type="password" name="pwd" class="form-style" placeholder="비밀번호를 입력해주세요" />
			</div>
			
			<div class="form-item">
			<div class="form-title">이메일</div>
				<input type="email" name="email" class="form-style" placeholder="이메일을 입력해주세요" />
			</div>
			
			<div class="form-item">
				<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<input type="submit" class="login pull-right" value="Sign In">
				<div class="clear-fix"></div>
			</div>
			</form>
		</div>
	</div>
	
	
<script src="${ctx}/resource/js/login.js"></script>
</body>
</html>


