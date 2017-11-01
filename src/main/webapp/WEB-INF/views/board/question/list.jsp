<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="main">
<h3>질문게시판</h3>

<div class="board-style">
	<div class="table-container">
		<div class="table-wrapper">
			<div class="board-table">
				<div class="row table-header">
					<div class="cell w60">no</div>
					<div class="cell">제목</div>
					<div class="cell w120">작성날짜</div>
					<div class="cell w80">조회수</div>
				</div>
				<c:forEach begin="0" end="14" items="${list}" var="n">
					<div class="row">
						<div class="cell">${n.no}</div>
						<div class="cell title">test</div>
						<div class="cell">2017.10.18</div>
						<div class="cell">0</div>
					</div>
				</c:forEach>
			</div>
			<div class="search-form-container">
				<form action="" method="get" class="search-form">
					<select name="search-sel">
						<option value="title">제목</option>
						<option value="title-content">제목 + 내용</option>
						<option value="content">내용</option>
					</select> <input type="search" name="search" /> <input type="submit"
						class="search search-btn-img" />
				</form>
			</div>
		</div>
		<div class="btn reg-btn">
			<a href="./question/reg">쓰기</a>
		</div>
	</div>
</div>
</main>