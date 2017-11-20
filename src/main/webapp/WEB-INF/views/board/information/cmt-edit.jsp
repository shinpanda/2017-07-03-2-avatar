<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main id="main" class="main">
<div class="board-style">
	<div class="reg-container">
		<form action="" method="post" name="reg-form" class="reg-form">
			<textarea rows="25" cols="35" name="content">${b.content}</textarea>
			<div class="reg-btn-container">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /><input type="hidden" name="boardNo" value="${b.boardNo}" /><input type="submit" class="btn reg-btn"
					value="등록" />
				<button type="button" onclick="history.back()"
					class="btn reg-btn reg-cancel">취소</button>
			</div>
		</form>
	</div>
</div>
</main>
