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
						value="${b.regDate}" pattern="YY-MM-dd HH:MM" var="regDate" />${regDate}</span></span>
			</div>
			<div class="wch-info clearfix">
				<span class="writer"></span>
				<div class="ch-wrapper">
					<span class="comment-num">댓글 수 ${b.countCmt} </span> <span
						class="hit">조회수 ${b.hit}</span>
				</div>
			</div>
			<div class="detail-content">${fn:replace(b.content, cn, br)}</div>
			<div>
				<a href="../question" class="btn">목록</a>
				<div class="ed-wrapper">
				 	<sec:authentication property="principal.username" var="username" />
					<c:if test="${username.equals(b.writerId)}">
						<a href="edit?no=${b.no}" class="btn">수정</a>
						<a href="del?no=${b.no}" class="btn">삭제</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="cmt-container">
		<c:if test="${b.countCmt==0}">
			<br />
		</c:if>
		<form method="post">
			<c:forEach items="${cmtList}" var="c" varStatus="i">
				<div class="cmt-row">
					<div class="cmt-info">
						<span><b>${i.count}. </b></span><span><fmt:formatDate
								value="${c.regDate}" pattern="YY-MM-dd HH:MM" var="regDate" />${regDate}</span>
						<c:if test="${username.equals(c.writerId)}">
							<div class="cmt-btn-wrapper">
								<span> <a href="cmt-edit?no=${c.no}" class="btn-a">수정</a>
									<a href="cmt-del?no=${c.no}" class="btn-a">삭제</a>
								</span>
							</div>
						</c:if>
					</div>
					<div class="cmt-content-container">${fn:replace(c.content, cn, br)}
					</div>
				</div>
			</c:forEach>
			<div class="cmt-reg">
				<textarea name="content"></textarea>
				<input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="submit" name="cmt-btn" value="등록"
					class="btn comment-btn">
			</div>
		</form>
	</div>
</div>
</main>

