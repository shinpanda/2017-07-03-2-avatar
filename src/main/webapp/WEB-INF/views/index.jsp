<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:importAttribute name="memberRole" />
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now}" pattern="MM.dd" var="nowTime" />
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
				<div class="widget-schedule schedule">
					<div>일정</div>
					<div>- 달력 완성</div>
				</div>
				<div class="widget-schedule" id="widget-schedule-edit" >
					<div>
						<input type="text" readonly="readonly" value="" id="year"
							class="schedule_day"> <select>
							<c:forEach begin="0" end="23" var="hour">
								<c:if test="${hour<10}">
									<option value="${hour}">0${hour}</option>
								</c:if>
								<c:if test="${!(hour<10)}">
									<option value="${hour}">${hour}</option>
								</c:if>
							</c:forEach>
						</select>&nbsp;시 <select>
							<c:forEach begin="0" end="59" var="minutes">
								<c:if test="${minutes<10}">
									<option value="${minutes}">0${minutes}</option>
								</c:if>
								<c:if test="${!(minutes<10)}">
									<option value="${minutes}">${minutes}</option>
								</c:if>
							</c:forEach>
						</select>&nbsp;분
					</div>
					<div>
						<input type="text" class="schedule-subject">
					</div>
					<div>
						<textarea></textarea>
						<input type="button" value="등록" />
					</div>
				</div>
				<script>
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
								day ++;
							}
							row.appendChild(cell);						
						}
						calendar.appendChild(row);
					}
					$(document).ready(function(){
						$("#year").val(currentYear);
					});
					
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
