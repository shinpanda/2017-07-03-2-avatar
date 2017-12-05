<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />    
		<div class="content-container">
			<main class="main">
			<div class="mem-information resume"><h3>회원정보조회/수정</h3></div>
			<form action="?${_csrf.parameterName}=${_csrf.token}" method="post">
				<div class="self-certification-check">
					<div class="self">
					<div class="application-form-wrapper clearfix">
						<div class="title-box">아이디</div>
						<label class="content-box dc-name mem-fixed" name="id">${member.id}</label>
					</div>
					</div>
					<div class="self">
					<div class="application-form-wrapper clearfix">
						<div class="title-box">이름</div>
						<input type="text" class="content-box dc-name" name="name" value="${member.name}">
					</div>
					</div>
					<div class="self">
					<div class="application-form-wrapper clearfix">
						<div class="title-box dc-name">비밀번호</div>
						<input type="password" class="content-box dc-name" name="pwd" value="${member.pwd}">
					</div>
					</div>
					<div class="self">
					<div class="application-form-wrapper clearfix">
						<div class="title-box dc-name">이메일</div>
						<input type="email" class="content-box dc-name" name="email" value="${member.email}">
					</div>
					</div>
					<div class="self">
					
					<c:if test="${c.memberRole eq 'ROLE_STUDENT' }">
					<c:set var="openDate">
					<fmt:formatDate value="${c.classOpenDate}" pattern="yyyy-MM-dd"/>
					</c:set>
					<div class="application-form-wrapper clearfix">
						<div class="title-box dc-name">클래스 이름</div>
						<label class="content-box dc-name mem-fixed" id="class-name">${c.className} 
					(${openDate})
						</label>
					</div>
					</c:if>
					
					<div class="application-form-wrapper clearfix">
						<div class="title-box dc-name">등급</div>
						
						<label class="content-box dc-name mem-fixed" id="grade">${c.memberRole} </label>
					</div>
					</div>
					<div class="self">
					<div class="clearfix">
					<div class="simform-actions">
						<input type="submit" class="submit" value="수정"/>
						</div>
					</div>
					</div>
				</div>

			</form>
			
		
		</main>
			
		</div>
