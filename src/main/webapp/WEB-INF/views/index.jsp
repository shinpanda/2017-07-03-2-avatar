<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Avatar</title>
<link href="${ctx}/resource/css/common-style.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<div class="body">
		<header class="header">
			<h1 class="logo">
				<a href="">Avatar</a>
			</h1>

			<div class="member-info-container">
				<div class="member-info-wrapper">
					<h2 class="hidden">멤버 정보</h2>
					<div>STUDENT</div>
					<div>
						<div>C class</div>
						<div>2017.07.03</div>
					</div>
				</div>
			</div>
			<section class="menu-container">
				<h1 class="hidden">메뉴</h1>
				<nav class="menu-wrapper">
					<h1 class="hidden">메인메뉴</h1>
					<ul class="main-menu">
						<li><a href="">질문게시판</a></li>
						<li><a href="">정보공유</a></li>
						<li><a href="">자리바꾸기</a></li>
					</ul>
					<ul class="main-menu btn-container">
						<li><a href="">채팅방 입장</a>
						<li><a href="">Complete</a>
					</ul>
				</nav>
				<nav id="member-menu" class="member-menu">
					<h1 class="hidden">회원메뉴</h1>
					<ul>
						<li><a href="">마이페이지</a></li>
						<li><a href="">로그아웃</a></li>
					</ul>
				</nav>
			</section>
		</header>
		<main class="main">
		<div class="widget-container">
			<div class="widgets">
				<div>공지</div>
				<div>달력</div>
			</div>
			<div class="widgets">
				<div>질문게시판</div>
				<div>정보 공유</div>
			</div>
		</div>	
		</main>
	</div>
	<footer>
		<h2>아바타</h2>
		<br />
		<div>
			<p>관리자 이메일:avatarAdmin@gmail.com</p>
		</div>
		<p>Copyright ⓒ avatar.com 2017-2017 All Right Reserved. Contact
			admin@avatar.com for more information</p>
	</footer>
</body>
</html>