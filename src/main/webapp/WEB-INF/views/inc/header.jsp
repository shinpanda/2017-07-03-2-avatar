<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />


<tiles:importAttribute name="memberRole"/>

<header class="header">
			<h1 class="logo">
				<a href="${ctx}/index">Avatar</a>
			</h1>
			<c:set value="학생" var="role" />
			<c:if test="${memberRole eq 'ROLE_TEACHER'}">
				<c:set value="선생님" var="role" />
			</c:if>
			<c:if test="${memberRole eq 'ROLE_ADMIN'}">
				<c:set value="관리자" var="role" />
			</c:if>
			<div class="member-info-container">
				<div class="member-info-wrapper">
					<h2 class="hidden">멤버 정보</h2>
					<div>${role}</div>
					<div>
					<c:if test="${memberRole ne 'ROLE_ADMIN'}">
						<tiles:importAttribute name="classInfo"/>
						<div>${classInfo.className} class</div>
						<div>
						<fmt:formatDate value="${classInfo.classOpenDate}" pattern="yyyy.MM.dd" /></div>
					</c:if>
					</div>
				</div>
			</div>
			<section class="menu-container">
				<h1 class="hidden">메뉴</h1>
				<c:if test="${memberRole ne 'ROLE_ADMIN'}">
				<nav class="menu-wrapper">
					<h1 class="hidden">메인메뉴</h1>
					<ul class="main-menu">
						<li><a href="${ctx}/board/question">질문게시판</a></li>
						<li><a href="${ctx}/board/information">정보공유</a></li>
						<c:if test="${memberRole ne 'ROLE_TEACHER'}">
						<li><a href="${ctx}/student/seat-change">자리바꾸기</a></li>
						</c:if>
					</ul>
					<ul class="main-menu btn-container">
						<li><a href="${ctx}/member/chat">채팅방 입장</a></li>
						<c:if test="${memberRole eq 'ROLE_TEACHER'}">
							<li><a href="${ctx}/teacher/is-complete">Complete</a></li>
						</c:if>
					</ul>
				</nav>
				</c:if>
				<nav id="member-menu" class="member-menu">
					<h1 class="hidden">회원메뉴</h1>
					<ul>
						<li><a href="${ctx}/member/mypage">마이페이지</a></li>
						<li><form action="${ctx}/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="submit" value="로그아웃" class="logout-btn"/>
							
							</form></li>
						
					</ul>
				</nav>
			</section>
		</header>