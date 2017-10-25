<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>AVATAR CHAT</title>
      <link rel="stylesheet" href="css/style.css">
      <link href="${ctx}/resource/css/loginstyle.css" type="text/css" rel="stylesheet">
	  <script src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
</head>

<body>
<div id="formWrapper">
	<video id="videobcg" preload="auto" autoplay="autoplay" loop="loop">
		<source src="${ctx}/resource/images/video.mp4" type="video/mp4">
	</video>
	
<div id="form">
<h1 class="logo">
	<a href="${ctx}/index"><img src="${ctx}/resource/images/logo2.png" alt="avatar" style="width: 200px; padding-left: 75px;"/></a>
</h1>
		<div class="form-item">
			<!-- <p class="formLabel">Email</p> -->
			<input type="email" name="email" id="email" class="form-style" placeholder="이메일을 입력해주세요" autocomplete="off" />
		</div>
		<div class="form-item">
			<!-- <p class="formLabel">Password</p> -->
			<input type="password" name="password" id="password" class="form-style" placeholder="비밀번호를 입력해주세요" />
			<!-- <div class="pw-view"><i class="fa fa-eye"></i></div> -->
			<p><a href="#" ><small>Forgot Password ?</small></a></p>	
		</div>
		<div class="form-item">
		<p class="pull-left"><a href="#"><small>Register</small></a></p>
		<input type="submit" class="login pull-right" value="Log In">
		<div class="clear-fix"></div>
		</div>
		
</div>
</div>

    <script src="${ctx}/resource/js/index.js"></script>
    
</body>
</html>
  

