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
			<a href="${ctx}/teacher/student/seat" class="mypage-title"> 좌석으로 보기 </a>		
			<a href="${ctx}/teacher/student/list" class="mypage-title"> 목록으로 보기 </a>		
	</div>
<h3 style="font-size:21px;"> <span>${c.className}</span> 클래스 학생 관리 <span class="title-info">**기본 클래스로 설정된 클래스의 학생만 불러옵니다.</span></h3>


<div class="board-style">
	<div class="table-container">
		<div class="table-wrapper">
			<form method="post">
			<div class="board-table">
				<div class="row table-header">
					<div class="cell w60"></div>
					<div class="cell w100">등급</div>
					<div class="cell w130">아이디</div>
					<div class="cell w130">이름</div>
					<div class="cell w100">Class</div>
					<div class="cell w100">자리</div>
					<div class="cell ">이메일</div>
					<!-- <div class="cell ">ip</div> -->
				</div>
				
				<c:forEach begin="0" end="14" items="${list}" var="m">
					<div class="row">
						<c:set value="학생" var="role" />
						<c:if test="${m.memberRole eq 'ROLE_TEACHER'}">
							<c:set value="선생님" var="role" />
						</c:if>
						<c:if test="${m.memberRole eq 'ROLE_CLASSPRESIDENT'}">
							<c:set value="반장" var="role" />
						</c:if>
						<div class="cell"><input type="radio" name="updateId" value="${m.memberId}"></div>
						<div class="cell">${role}</div>
						<div class="cell">${m.memberId}</a></div>
						<div class="cell">${m.memberName}</div>
						<div class="cell">${m.className}</div>
						<div class="cell">${m.seatNo}</div>
						<div class="cell">${m.memberEmail}</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="btn-container">
					<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
					<input type="submit" value="반장으로 등급 상승" class="btn roleUpButton"/>
			</div>
			</form>
			<div class="search-form-container">
				<form method="get" class="search-form">
					<select name="f">
						<option value="memberId">아이디</option>
						<option value="memberName">이름</option>						
					</select> <input type="search" name="q" /> <input type="submit"
						class="search search-btn-img" />
				</form>
			</div>
			<c:set var="page" value="${param.p}" />
					<c:set var="startNum" value="${page-(page-1)%10}" />
					<c:set var="lastNum"
						value="${fn:substringBefore((count%15 == 0 ? (count/15) : (count/15)+1) , '.')}" />
					<div class="paging-container clearfix">
						<div>
							<c:if test="${startNum<=10 || startNum == null}">
								<a href="?p=1">◀</a>
							</c:if>
							<c:if test="${startNum>10}">
								<a href="?p=${startNum-10}">◀</a>
							</c:if>
						</div>

						<ul>
							<%-- <c:forEach varStatus="page" begin="1" end="5">
						<li><a href="?p=${page.current}">${page.current}</a></li>
					</c:forEach> --%>
							<c:forEach var="i" begin="0" end="9">
								<c:set var="present" value="" />
								<c:if test="${(startNum+i) == page || (page == null && i == 0)}">
									<c:set var="present" value="page-present" />
								</c:if>
								<c:if test="${startNum + i <= lastNum}">
									<li><a class="${present}" href="?p=${startNum+i}">${startNum+i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<div>
							<%-- <c:if test="${startNum < lastNum < startNum+5}"> --%>
							<c:if test="${lastNum >= startNum+10}">
								<a href="?p=${startNum+10}">▶</a>
							</c:if>
							<c:if test="${lastNum < startNum+10}">
								<a href="?p=${lastNum}">▶</a>
							</c:if>
						</div>
					</div>
					
		</div>
	</div>
</div>

</main>