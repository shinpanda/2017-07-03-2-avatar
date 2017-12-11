<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<main class="main">
<h3>현재 클래스 상황</h3>
<br />
<br />
<div class="class-seat-container">
	<div class="is-complete-event-container">
		<div class="is-complete-event-btn-container">
			<input type="button" value="시작" class="btn is-complete-button"
				id="is-complete-button"/> <input type="button" value="끝"
				class="btn is-complete-button" id="complete-button" />
		</div>
		<div class="event-label-box">
			<label>이벤트 발생 시각 : <span></span></label><br /> <label>경과 시간 :
				<span></span>
			</label><br /> <label>성공한 사람 : <span></span>명
			</label>
		</div>
	</div>
	<br />
	<c:if test="${list[0].row*list[0].col-1>0}">
	<div class="class-seat-wrapper">
		<c:forEach items="${list}" begin="0" end="${list[0].row*list[0].col-1}" step="${list[0].col}" varStatus="status">
			<div>
				<c:forEach begin="${status.index}" end="${status.index+list[0].col-1}" var="i">
					<span class="seat" id="${list[i].memberId}"><c:if test="${list[i].memberRole eq 'ROLE_CLASSPRESIDENT'}">[반장]</c:if>${list[i].memberName}</span>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
	</c:if>
</div>

<script>
	window.addEventListener("load", function() {
		var timer = null;
		function timerStart(target, startTime) {
			timer = setInterval(function() {
				var currentTime = new Date(Date.now());
				var time = new Date(currentTime - startTime);
				target.textContent = (time.getMinutes() >= 10 ? time
						.getMinutes() : "0" + time.getMinutes())
						+ ":"
						+ (time.getSeconds() >= 10 ? time.getSeconds() : "0"
								+ time.getSeconds());
			}, 1000);
		}

		var startEvent = document.querySelector("#is-complete-button");
		var endEvent = document.querySelector("#complete-button");

		startEvent.onclick = function() {
			var eventLabel = document.querySelector(".event-label-box")
					.querySelectorAll("label");
			var eventGenTime = new Date(Date.now());

			/* 서버에 메시지 보냄 */

			var json = {
				content : "start",
				msgType : "push",
				role : "teacher",
				date : eventGenTime
			}
			ws.send(JSON.stringify(json));

			eventLabel[0].firstElementChild.textContent = eventGenTime
					.getHours()
					+ ":"
					+ (eventGenTime.getMinutes() >= 10 ? eventGenTime
							.getMinutes() : "0" + eventGenTime.getMinutes());
			eventLabel[2].firstElementChild.textContent = "0";
			timerStart(eventLabel[1].firstElementChild, eventGenTime);
			startEvent.disabled = true;
		}

		endEvent.onclick = function() {
			clearInterval(timer);
			timer = null;
			startEvent.disabled = false;
			
			var eventGenTime = new Date(Date.now());
			var json = {
				content : "stop",
				msgType : "push",
				role : "teacher",
				date : eventGenTime
			}
			ws.send(JSON.stringify(json));
		}

	});
</script> <!-- 
for(j=1; j<=b2; j++){
	var div = document.createElement("div");
	
	container.appendChild(div);
		for (i = 1; i <= b1; i++) {								
			var li = document.createElement("span");									 
			li.className = "seat";
			div.appendChild(li);
		}	
}

 				 
var spans = container.querySelectorAll("span");
var index = Math.floor(Math.random()*spans.length);
spans[index].style.background="url('${ctx}/resource/images/redmonitor.png')";

 --> </main>