<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<header class="header">
			<h1 class="logo">
				<a href="${ctx}/index">Avatar</a>
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
						<li><a href="${ctx}/board/question">질문게시판</a></li>
						<li><a href="${ctx}/board/information">정보공유</a></li>
						<li><a href="${ctx}/student/sit-change">자리바꾸기</a></li>
					</ul>
					<ul class="main-menu btn-container">
						<li><a href="${ctx}/member/chat">채팅방 입장</a>
						<li><a href="">Complete</a>
					</ul>
				</nav>
				<nav id="member-menu" class="member-menu">
					<h1 class="hidden">회원메뉴</h1>
					<ul>
						<li><a href="${ctx}/member/home">마이페이지</a></li>
						<li><form action="${ctx}/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="submit" value="로그아웃">
							
							</form></li>
						
					</ul>
				</nav>
			</section>
		</header>