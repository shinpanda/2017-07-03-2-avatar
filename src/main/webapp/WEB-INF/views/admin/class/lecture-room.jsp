<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now}" pattern="MM.dd" var="nowTime" />
<main class="main">
<h3>강의실 관리</h3>

<div class="board-style">
	<div class="box-container">
		<div class="box-row">
			<c:forEach begin="0" end="4">
				<div class="box" id="1">
					<h5>강의실  : C</h5> 
					<div>총 좌석 수 : 24석 </div>
					<div>가로x세로 : 8x3</div>
					<div class="box-btn-container">
						<input type="button" value="수정" class="btn" />
						<input type="button" value="삭제" class="btn" />
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div>
	
	</div>
</div>
</main>