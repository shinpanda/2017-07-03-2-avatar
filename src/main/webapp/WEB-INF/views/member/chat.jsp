<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:importAttribute name="memberRole" />
<main class="main">
<div class="chat-container">
	<span>${list[0].className} class</span>
	<div class="chat-wrapper">
		<c:forEach items="${list}" var="n" varStatus="status">
			<c:if test="${status.index-1>0}">
				<fmt:formatDate value="${n.regDate}" pattern="YY.MM.dd"
					var="regDate" />
				<fmt:formatDate value="${list[status.index-1].regDate}"
					pattern="YY.MM.dd" var="prevRegDate" />
				<c:if test="${prevRegDate != regDate}">
					<div class="row chat-date">
						<p>
							<fmt:formatDate value="${n.regDate}" pattern="MM월 dd일" />
						</p>
					</div>
				</c:if>
			</c:if>
			<c:if test="${status.index == 0}">
				<div class="row chat-date">
					<p>
						<fmt:formatDate value="${n.regDate}" pattern="MM월 dd일" />
					</p>
				</div>
			</c:if>
			<div class="row">
				<h5>
					<c:if test="${n.role eq 'ROLE_STUDENT'}">학생</c:if>
					<c:if test="${n.role eq 'ROLE_CLASSPRESIDENT'}">학생</c:if>
					<c:if test="${n.role eq 'ROLE_TEACHER'}">선생님</c:if>
				</h5>
				<div>
					<p>${n.content}</p>
					<span><fmt:formatDate value="${n.regDate}" pattern="HH:mm" /></span>
				</div>
			</div>
		</c:forEach>
	</div>
	<template>
	<div class="row">
		<h5></h5>
		<div>
			<p></p>
			<span></span>
		</div>
	</div>
	</template>
	<div class="chat-message">
		<textarea rows="5" cols="55"></textarea>
		<input type="hidden" value="${memberRole}"> <input
			type="button" value="전송" />
	</div>
	<script>
		
	</script>
</div>
</main>