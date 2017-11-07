<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="param" value="${pageContext.request.requestURL }"/>

<!DOCTYPE html>
<html>
<head>
<title>AVATAR CHAT</title>
<link href="${ctx}/resource/css/joinstyle.css" type="text/css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>

<body>
	<div id="formWrapper">
		
		<div id="form" style="margin-top:-300px;">
			<form action="${ctx}/check" method="post">
			<h1 class="logo">
				<img src="${ctx}/resource/images/join.png" alt="join" style="width: 150px; padding-left: 33%;" />
			</h1>

			
			<div class="form-item">
			<div class="form-title">등급</div>
				<div class="form-style" >${param.role} </div>
			</div>
			
			<!-- <div class="student-form" style="display:none;"> -->
			
			<div class="form-item">
			<div class="form-title">클래스이름</div>
				<select name="class-name" class="form-style">
				<c:forEach var="c" items="${classList}">	
					<option value="${c.id}" name="class-id">${c.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-item">
			<div class="form-title">클래스비밀번호</div>
				<input type="password" name="class-pwd" class="form-style" placeholder="클래스 비밀번호를 입력해주세요" />
			</div>
			
			<!-- </div> -->
			
			
			<div class="form-item">
				<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<input type="submit" class="login pull-right" value="클래스 등록">
				<div class="clear-fix"></div>
			</div>
			</form>
		</div>
	</div>
	
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="${ctx}/resource/js/login.js"></script>
</body>
</html>


