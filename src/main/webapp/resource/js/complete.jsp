<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${ctx}/resource/css/common-style.css" type="text/css"
	rel="stylesheet">
<link href="${ctx}/resource/css/push-window.css" type="text/css"
	rel="stylesheet">
<title>Avatar</title>
</head>
<body>
	<div class="push-window">
		<div class="push-window-container">
			<h3>Complete?</h3>
			<div>
				현재 수행 완료시<br> 아래 버튼을 눌러주세요
			</div>

			<input type="button" value="다했어요" class="btn complete-btn" />
			<input type="hidden" value='<security:authentication property="name"/>' />
		</div>
	</div>
</body>
<script>

//11
	var search = location.search.substring(12);
	console.log(search);

	const ws = new WebSocket("ws://211.238.142.93/web/echo");
	var completeButton = document.querySelector('.btn.complete-btn');
	var memberId = document.querySelector(".push-window-container").querySelector('input[type="hidden"]').value;
	console.log(memberId);
	completeButton.onclick = function() {
		var time = new Date(Date.now());
		//time = time - document.getElementById("start-time").value;
		console.log(time);
		var json = {
			content : "complete",
			msgType : "push",
			role : "student",
			memberId : memberId,
			date : time
		}
		ws.send(JSON.stringify(json));
		self.close();
	}
</script>
</html>



