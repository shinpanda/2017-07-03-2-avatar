<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />  
      
<main class="main">
	<h3>현재 클래스 상황</h3>
	<br/>
	<br/>
	<div class="class-seat-container">
		<div class="is-complete-event-container">
			<div class="is-complete-event-btn-container">
				<input type="button" value="시작" class="btn is-complete-button" id="is-complete-button"/>
				<input type="button" value="끝" class="btn is-complete-button" id="complete-button"/>
			</div>
			<div class="event-label-box">
				<label>이벤트 발생 시각 : <span></span></label><br/>
				<label>경과 시간 : <span></span></label><br/>
				<label>성공한 사람 : <span></span>명</label>			 
			</div>
		</div>
		<br/>
		<div class="class-seat-wrapper">
		<c:forEach begin="0" end="2">
			<div>
				<c:forEach begin="0" end="7">
					<span class="seat">이새미</span>	
				</c:forEach>			
			</div>
		</c:forEach>
		</div>
	</div>
	
	<script>
		var startEvent = document.querySelector("#is-complete-button");
		var endEvent = document.querySelector("#complete-button");
		
		startEvent.onclick = function() {
			var eventLabel = document.querySelector(".event-label-box").querySelectorAll("label");
			var eventGenTime = new Date(Date.now());
			eventLabel[0].firstElementChild.textContent = eventGenTime.getHours() + ":"+ (eventGenTime.getMinutes()>10?eventGenTime.getMinutes():"0"+eventGenTime.getMinutes());
			eventLabel[2].firstElementChild.textContent = "0";
		}	
		
		
	</script>
<!-- 
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

 -->
</main>