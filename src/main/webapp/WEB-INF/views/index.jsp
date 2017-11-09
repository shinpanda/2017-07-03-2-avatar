<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main class="main">
<div class="widget-container">
	<div class="widgets row">
		<div class="widget cell">
			<h3>공지</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${noticeList}" var="n">
					<div class="row">
						<div class="cell title">
							<a href="#">${n.title}</a>
						</div>
						<div class="cell w45">11-07</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="widget cell">
			<h3>달력</h3>
			<hr />
		</div>
	</div>
	<div class="widgets row">
		<div class="widget cell">
			<h3>질문게시판</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${noticeList}" var="n">
					<div class="row">
						<div class="cell title">
							<a href="#">${n.title}</a>
						</div>
						<div class="cell w45">11-07</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="widget cell">
			<h3>정보 공유</h3>
			<hr />
			<div class="widget-board">
				<c:forEach items="${noticeList}" var="n">
					<div class="row">
						<div class="cell title">
							<a href="#">${n.title}</a>
						</div>
						<div class="cell w45">11-07</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</main>
