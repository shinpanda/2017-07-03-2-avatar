<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now}" pattern="MM.dd" var="nowTime" />
<main class="main">
<h3>게시판 관리</h3>

<div class="board-style">
	<div class="table-container">
		<div class="table-wrapper">
			<div class="board-table">
				<div class="row table-header">
				<div class="cell w80">Class</div>
					<div class="cell w80">게시판</div>
					<div class="cell w60">no</div>					
					<div class="cell">제목</div>
					<div class="cell w80">작성자</div>
					<div class="cell w120">작성날짜</div>
					<div class="cell w80">조회수</div>
				</div>
				<c:forEach begin="0" end="14" items="${list}" var="b">
					<div class="row">
					<c:if test="${b.boardId=='q'}">
						<c:set var="board" value="질문"/>
					</c:if>
					<c:if test="${b.boardId=='i'}">
						<c:set var="board" value="정보공유"/>
					</c:if>
						<div class="cell">${b.classId}</div>
						<div class="cell">${board}</div>
						<div class="cell">${b.no}</div>
						
						<div class="cell title">
							<a href="./board/${b.adminBoardId}">${b.title}  [${b.countCmt}]</a>
						</div>						
						<div class="cell">${b.writerId}</div>
						<fmt:formatDate value="${b.regDate}" pattern="MM.dd" var="regDate" />
						<div class="cell">
							<c:if test="${nowTime ne regDate}">
									${regDate}
							</c:if>
							<c:if test="${nowTime eq regDate}">
								<fmt:formatDate value="${b.regDate}" pattern="HH:MM"
									var="regDate" />
									${regDate}
							</c:if>
						</div>
						<div class="cell">${b.hit}</div>
					</div>
				</c:forEach>
			</div>
			<div class="search-form-container">
				<form method="get" class="search-form">
					<select name="f">
						<option value="title">제목</option>
						<option value="title-content">제목 + 내용</option>
						<option value="content">내용</option>
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