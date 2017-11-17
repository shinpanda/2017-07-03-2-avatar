<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main id="main" class="main del-body">
<div class="board-style">
<form method="post" action="" name="del-form">
	<div class="simple-container">
		<div>내용 : ${b.content}</div>
		<div>글쓴이 : ${b.writerId}</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="boardNo" value="${b.boardNo}" />
		<div>
			<span>삭제하시겠습니까?</span> <input type="submit" class="btn" value="삭제">
		</div>
	</div>

</form>
</div>
</main>