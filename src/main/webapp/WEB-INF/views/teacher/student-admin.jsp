<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now}" pattern="MM.dd" var="nowTime" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />  
<link href="${ctx}/resource/css/memprofile.css" type="text/css" rel="stylesheet">	
<main class="main">
	<div class="mypage-form" style="margin:0px;">
			<a href="${ctx}/teacher/student-admin" class="mypage-title"> 반장 설정 </a>		
			<a href="${ctx}/teacher/student-list" class="mypage-title"> 학생 목록 </a>		
	</div>
	
	
<h3>반장 설정</h3>

<div class="board-style">
	<div class="class-seat-container">
		<div class="class-seat-wrapper">
			<c:forEach items="${list}" begin="0" end="${list[0].row*list[0].col-1}" step="${list[0].col}" varStatus="status">
				<div>
					<c:forEach begin="${status.index}" end="${status.index+list[0].col-1}" var="i">
						<c:if test="${list[i].memberRole eq 'ROLE_STUDENT'}">
							<span class="seat" id="${list[i].memberId}">${list[i].memberName}</span>
						</c:if>
						<c:if test="${list[i].memberRole ne 'ROLE_STUDENT'}">
						<span class="seat" id="${list[i].memberId}" style="color:red;">${list[i].memberName}</span>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="student-info-container" style="display:none;">
		<div class="student-info-wrapper">
			<div>
				<span>이름 : </span><span></span>
			</div>
			<div>
				<span>역할 : </span><span></span>
			</div>
			<div class="btn-container">
				<input type="button" value="반장으로 등급 상승" class="btn"/>
			</div>
		</div>
	</div>
	<script>
		var studentInfo = document.querySelector(".student-info-wrapper");
		var classSeatContainer = document.querySelector(".class-seat-wrapper");
		classSeatContainer.onclick = function(e){
			if(e.target.nodeName=="SPAN"){
				var xhr = new XMLHttpRequest();
				xhr.onload = function(evt){
					var data = JSON.parse(xhr.responseText);
					
					studentInfo.firstElementChild.lastElementChild.textContent = data.memberName;
					var role = (data.memberRole=="ROLE_STUDENT"? "학생":"반장");
					console.log(role);
					studentInfo.firstElementChild.nextElementSibling.lastElementChild.textContent = role;
					studentInfo.querySelector('input[type="button"]').id = data.memberId;
					if(role == "반장")
						studentInfo.querySelector('input[type="button"]').value = "일반학생으로 변경";
					else
						studentInfo.querySelector('input[type="button"]').value = "반장으로 등급 상승";
					studentInfo.parentElement.style.display = "unset";
				}
				xhr.open("GET", "student-info?memberId="+e.target.id);
				xhr.send(); 
			}
		};
		
		studentInfo.onclick = function(e) {
			if(e.target.nodeName=="INPUT"){
				var json = {
					memberId : e.target.id,
					role : ""
				};
				
				if(e.target.value =="반장으로 등급 상승")
					json.role = "ROLE_CLASSPRESIDENT";
				else
					json.role = "ROLE_STUDENT";
				

				var formData = new FormData();
				formData.append("studentInfo", JSON.stringify(json));
				
				var xhr = new XMLHttpRequest();
				xhr.onload = function(evt){
					location.reload();
				}
				xhr.open("POST", "student-update?${_csrf.parameterName}=${_csrf.token}");
				xhr.send(formData);
			}
		}
	</script>
</div>
</main>