<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:importAttribute name="memberRole" />
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now}" pattern="MM.dd" var="nowTime" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
					<div class="row board-row">
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
								<fmt:formatDate value="${b.regDate}" pattern="HH:mm"
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
				달력 <span></span>
			</h3>
			<hr />
			<div class="widget-board-container">
				<div class="widget-board calendar">
				
					<div class="row week">
						<div class="cell day sun">일</div>
						<div class="cell day">월</div>
						<div class="cell day">화</div>
						<div class="cell day">수</div>
						<div class="cell day">목</div>
						<div class="cell day">금</div>
						<div class="cell day sat">토</div>
					</div>
				</div>
				<div class="widget-schedule schedule" id="widget-schedule-list" style="display:none;">
					<div>일정<span id="schedule-add-button">+추가</span></div>
					
				</div>
				<div class="widget-schedule schedule-edit" id="widget-schedule-edit" style="display:none;" >
					<div>
						<input type="text" readonly="readonly" value="" id="schedule-day"
							class="schedule_day"> <select id="schedule-hour">
							<c:forEach begin="0" end="23" var="hour">
								<c:if test="${hour<10}">
									<option value="${hour}">0${hour}</option>
								</c:if>
								<c:if test="${!(hour<10)}">
									<option value="${hour}">${hour}</option>
								</c:if>
							</c:forEach>
						</select>&nbsp;시 <select id="schedule-minutes">
							<c:forEach begin="0" end="59" var="minutes">
								<c:if test="${minutes<10}">
									<option value="${minutes}">0${minutes}</option>
								</c:if>
								<c:if test="${!(minutes<10)}">
									<option value="${minutes}">${minutes}</option>
								</c:if>
							</c:forEach>
						</select>&nbsp;분
						<img src="${ctx}/resource/images/cancel-music-gray.png" alt="스케줄 추가 취소" id="edit-cancel-button" style="display:none"/>
					</div>
					<div>
						<input type="text" class="schedule-subject">
					</div>
					<div>
						<textarea></textarea>
						<input type="button" value="등록" id= "schedule-submit"/>
					</div>
				</div>
				<script>
					var scheduleEdit = document.querySelector("#widget-schedule-edit");
					var scheduleList = document.querySelector("#widget-schedule-list");
					var scheduleAddButton = document.querySelector("#schedule-add-button");
					/* calendar 용 변수  */
					var calendar = document.querySelector(".widget-board.calendar");
					var date = new Date();
					var currentYear = date.getFullYear();
					var currentMonth = date.getMonth() +1; // 0~11 0:1월
					
					/* date : 일 day: 요일 */
					var currentDate = date.getDate();
					date.setDate(1);
					var currentMonthFirstDay = date.getDay();
					var lastDay = new Date(currentYear, currentMonth, 0).getDate();
					var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
					var currentMonthWeek = Math.ceil( ( currentMonthFirstDay + lastDay ) / 7 );
					
					var day = 1;
					/* -------------------- */
					for(var j = 0; j<currentMonthWeek; j++){
						var row = document.createElement("div");
						row.classList.add( 'row', 'week' );
						for(var i=0; i<7; i++){
							var cell = document.createElement("div");
							if(i==0)
								cell.classList.add( 'cell', 'day', 'sun');
							else if(i==6)
								cell.classList.add( 'cell', 'day', 'sat' );
							else
								cell.classList.add( 'cell', 'day' );
							
							if((j==0&&i<currentMonthFirstDay)||(j==(currentMonthWeek-1)&&day>lastDay)){
								cell.textContent = " ";
							}else{
								if(day == currentDate)
									cell.classList.add( 'today' );
								cell.textContent = day;
								cell.id = currentYear+"-"+(currentMonth>=10?currentMonth:"0"+currentMonth)+"-"+(day>=10?day:"0"+day);
								cell.style.cursor = "pointer";
								day ++;
							}
							row.appendChild(cell);						
						}
						calendar.appendChild(row);
					}
					calendar.onclick = function(e){
						if(e.target.id != ""){
							if(scheduleList.style.display == "flex"){
								console.log("들어오는 것인가");
								while(scheduleList.firstElementChild != scheduleList.lastElementChild)
									scheduleList.removeChild(scheduleList.lastElementChild);	
								scheduleList.style.display = "none";
							}
							if(scheduleEdit.style.display == "flex")
								scheduleEdit.style.display = "none";
							
							var schduleDay = e.target.id;
							console.log(e.target.id);
							// 일정이 있는지 체크 일정이 있다면 일정창이 뜰 수 있도록 함
							var xhr = new XMLHttpRequest();
							
							xhr.onload = function(e){
								var schedule = JSON.parse(xhr.responseText);
								
								if(schedule.length!=0){
									
									for(var i=0; i<schedule.length; i++){
										var div = document.createElement("div");
										div.textContent = "- "+schedule[i].subject;
										div.className = "schedule-subject";
										var span = document.createElement("span");
										var date = new Date(schedule[i].dateTime);
										span.textContent = "["+(date.getHours()>=10?date.getHours():"0"+date.getHours())+"시 "+(date.getMinutes()>=10?date.getMinutes():"0"+date.getMinutes())+"분까지]";
										div.appendChild(span); 
										var img = document.createElement("img");
										img.src = "${ctx}/resource/images/cancel-music-gray.png";
										img.style.width = "7px";
										img.style["margin-left"] = "5px";
										img.style["margin-top"] = "1px";
										img.style.display = "none";
										div.appendChild(img);
										var content = document.createElement("div");
										content.className = "schedule-content";
										content.style.display = "none";
										content.style.height = "0px";
										content.textContent = schedule[i].content;
										
										scheduleList.appendChild(div);
										scheduleList.appendChild(content);
									}
									
									scheduleList.style.display="flex";
									document.querySelector("#schedule-day").value = schduleDay;
								
								}
								else{
									scheduleEdit.style.display="flex";
									document.querySelector("#schedule-day").value = schduleDay;
								}
									
							}
							xhr.open("GET", "schedule-check?date="+e.target.id);
							xhr.send(); 
							// 일정이 없으면 수정하도록 창이 뜨게 하고 readonly에 현재 날짜를 받아올 수 있도록 함
							/* schedule_day
							
							
							edit-table #widget-schedule-edit */
						}
					}
					
					scheduleAddButton.onclick = function(){
						while(scheduleList.firstElementChild != scheduleList.lastElementChild)
							scheduleList.removeChild(scheduleList.lastElementChild);
						scheduleList.style.display = "none";
						scheduleEdit.style.display = "flex";
					}
					
					var contentDisplay = false;
					var prevElement = null;
					scheduleList.onmouseover = function(e){
						
					}
					scheduleList.onmouseleave = function(e){
						var content = e.target;
						(e.target.parentElement.className == "schedule-subject")
							content = e.target.parentElement;
						content.querySelector("img").style.display = "none";
					}
					
					
					scheduleList.onclick = function(e){
						var content = e.target;
						if(e.target.parentElement.className == "schedule-subject")
							content = e.target.parentElement;
						if(content.className == "schedule-subject"){
							if(contentDisplay == false){
								content.nextElementSibling.style.display="block";
								content.nextElementSibling.style.height = "fit-content";
								contentDisplay = true;
							}
							else{
								content.nextElementSibling.style.display="none";
								content.nextElementSibling.style.height = "0px";
								contentDisplay = false;
							}
						}
					}
					
					var editSubmit = document.querySelector("#schedule-submit");
					editSubmit.onclick = function(){
						var day = scheduleEdit.querySelector("#schedule-day").value;
						var hour = scheduleEdit.querySelector("#schedule-hour").value;
						var minutes = scheduleEdit.querySelector("#schedule-minutes").value;
						var subject = scheduleEdit.querySelector(".schedule-subject").value;
						var content = scheduleEdit.querySelector("textarea").value;
						
						var json = {
								date : day+" "+(hour>=10?hour:"0"+hour)+":"+(minutes>=10?minutes:"0"+minutes)+":00",
								subject : subject,
								content : content
						};
						var formData = new FormData();
						formData.append("json", JSON.stringify(json));
						var xhr = new XMLHttpRequest();
						
						xhr.onload = function(e){
							
						}
						xhr.open("POST", "schedule-upload?${_csrf.parameterName}=${_csrf.token}");
						xhr.send(formData); 
						
						scheduleEdit.querySelector("#schedule-hour").value ="";
						scheduleEdit.querySelector("#schedule-minutes").value="";
						scheduleEdit.querySelector(".schedule-subject").value="";
						scheduleEdit.querySelector("textarea").value="";
						scheduleEdit.style.display = "none";
					}
					
					var editCancelButton = document.querySelector("#edit-cancel-button");
					editCancelButton.onmouseover = function(){
						editCancelButton.src = "${ctx}/resource/images/cancel-music.png";
					}
					editCancelButton.onmouseleave = function(){
						editCancelButton.src = "${ctx}/resource/images/cancel-music-gray.png";
					}
					editCancelButton.onclick = function(){
						scheduleEdit.querySelector("#schedule-hour").value ="";
						scheduleEdit.querySelector("#schedule-minutes").value="";
						scheduleEdit.querySelector(".schedule-subject").value="";
						scheduleEdit.querySelector("textarea").value="";
						scheduleEdit.style.display = "none";
					}
					
					
					scheduleEdit.onmouseover = function(){
						editCancelButton.style.display = "unset";
					}
					
					scheduleEdit.onmouseleave = function(){
						editCancelButton.style.display = "none";
					}
					
					
					
				</script>
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
					<div class="row board-row">
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
								<fmt:formatDate value="${b.regDate}" pattern="HH:mm"
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
					<div class="row board-row">
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
								<fmt:formatDate value="${b.regDate}" pattern="HH:mm"
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
