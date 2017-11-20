<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<main class="main">
<div class="board-style">
	<div class="detail-container">
		<div class="info-container">
			<div class="tr-info clearfix">
				<span class="title">${b.title}</span> <span class="reg-date"><fmt:formatDate
						value="${b.regDate}" pattern="YY-MM-dd HH:MM" var="regDate" />${regDate}</span>
			</div>
			<div class="wch-info clearfix">
				<span class="writer">${b.writerId}</span>
				<div class="ch-wrapper">
					<span class="comment-num"></span> <span
						class="hit">조회수 ${b.hit}</span>
				</div>
			</div>
			<div class="detail-content">${fn:replace(b.content, cn, br)}</div>
			<div>
				<a href="../notice" class="btn">목록</a>
				<div class="ed-wrapper">
				 	<sec:authentication property="principal.username" var="username" />
					<c:if test="${username.equals(b.writerId)}">
						<a href="../../teacher/notice/edit?no=${b.no}" class="btn">수정</a>
						<a href="../../teacher/notice/del?no=${b.no}" class="btn">삭제</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
</main>

