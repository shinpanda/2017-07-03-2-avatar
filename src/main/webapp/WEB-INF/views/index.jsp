<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now}" pattern="MM.dd" var="nowTime" />

<main class="main">
<div class="widget-container">
	<div class="widgets row">
		<div class="widget cell">
			<h3>공지</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${noticeList}" var="b">
					<div class="row">
						<div class="cell title">
							<a href="#">${b.title}</a>
						</div>
						<div class="cell w45">
							<fmt:formatDate value="${b.regDate}" pattern="MM.dd"
										var="regDate" />
							<div class="cell">
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
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="widget cell">
			<h3>달력</h3>
			<hr />
			<div class="widget-board">
				<div class="row">
					<div class="cell title">
						<jsp:include page="/WEB-INF/views/test/calendar.jsp" flush="flash" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="widgets row">
		<div class="widget cell">
			<h3>질문게시판</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${questionList}" var="b">
					<div class="row">
						<div class="cell title">
							<a href="#">${b.title}</a>
						</div>
						<div class="cell w45">
							<fmt:formatDate value="${b.regDate}" pattern="MM.dd"
										var="regDate" />
							<div class="cell">
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
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="widget cell">
			<h3>정보 공유</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${infomationList}" var="b">
					<div class="row">
						<div class="cell title">
							<a href="#">${b.title}</a>
						</div>
						<div class="cell w45">
							<fmt:formatDate value="${b.regDate}" pattern="MM.dd"
										var="regDate" />
							<div class="cell">
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
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</main>
