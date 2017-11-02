<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="main">
<div class="chat-container">
	<span>C class</span>
	<div class="chat-wrapper">
		<c:forEach items="${list}" var="n" varStatus="status">
			<c:if test="${status.index-1>0}">
			<fmt:formatDate value="${n.regDate}" pattern="YY.MM.dd" var="regDate" />	
			<fmt:formatDate value="${list[status.index-1].regDate}" pattern="YY.MM.dd" var="prevRegDate" />
				<c:if test="${prevRegDate != regDate}">
				<div class="row chat-date">
					<p><fmt:formatDate value="${n.regDate}" pattern="MM월 dd일"/></p>
				</div>
				</c:if>
			</c:if>
			<div class="row">
				<h5>${n.role}</h5>
				<div>
					<p>${n.content}</p>
					<span><fmt:formatDate value="${n.regDate}" pattern="HH:mm" /></span>
				</div>
			</div>
		</c:forEach>
		<template>
		<div class="row">
			<h5></h5>
			<div>
				<p></p>
				<span></span>
			</div>
		</div>
		</template>
	</div>
	<div class="chat-message">
		<textarea rows="5" cols="55"></textarea>
		<input type="button" value="전송" />
	</div>
	<script>
		
	</script>
</div>
</main>