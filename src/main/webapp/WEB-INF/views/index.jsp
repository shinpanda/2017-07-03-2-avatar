<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:importAttribute name="memberRole" />
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now}" pattern="MM.dd" var="nowTime" />

<main class="main">
<div class="widget-container">
	<div class="widgets row">
		<div class="widget cell">
			<c:set value="board/notice" var="noticeLink" />
			<c:if test="${memberRole eq 'ROLE_TEACHER'}">
				<c:set value="teacher/notice" var="noticeLink" />
			</c:if>
			<h3>
				<a href="${noticeLink}">공지 <span>▶ more</span></a>
			</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${noticeList}" var="b">
					<div class="row">
						<div class="cell title">
							<a href="${noticeLink}/${b.no}">${b.title}</a>
						</div>
						<div class="cell w45 center">
							<fmt:formatDate value="${b.regDate}" pattern="MM.dd"
								var="regDate" />

							<c:if test="${nowTime!=regDate}">
									${regDate}
								</c:if>
							<c:if test="${nowTime==regDate}">
								<fmt:formatDate value="${b.regDate}" pattern="HH:MM"
									var="regDate" />
														${regDate}
								</c:if>

						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="widget cell">
			<h3>달력</h3>
			<hr />
			<div class="widget-board">
				<jsp:include page="/WEB-INF/views/main/calendar.jsp" flush="flash" />


			</div>
		</div>
	</div>
	<div class="widgets row">
		<div class="widget cell">
			<h3>
				<a href="board/question">질문게시판 <span>▶ more</span></a>
			</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${questionList}" var="b">
					<div class="row">
						<div class="cell title">
							<a href="board/question/${b.no}">${b.title}</a>
						</div>
						<div class="cell w45 center">
							<fmt:formatDate value="${b.regDate}" pattern="MM.dd"
								var="regDate" />

							<c:if test="${nowTime!=regDate}">
									${regDate}
								</c:if>
							<c:if test="${nowTime==regDate}">
								<fmt:formatDate value="${b.regDate}" pattern="HH:MM"
									var="regDate" />
														${regDate}
								</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="widget cell">
			<h3>
				<a href="board/information">정보 공유 <span>▶ more</span></a>
			</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${infomationList}" var="b">
					<div class="row">
						<div class="cell title">
							<a href="board/information/${b.no}">${b.title}</a>
						</div>
						<div class="cell w45 center">
							<fmt:formatDate value="${b.regDate}" pattern="MM.dd"
								var="regDate" />
							<c:if test="${nowTime!=regDate}">
									${regDate}
								</c:if>
							<c:if test="${nowTime==regDate}">
								<fmt:formatDate value="${b.regDate}" pattern="HH:MM"
									var="regDate" />
														${regDate}
								</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</main>
