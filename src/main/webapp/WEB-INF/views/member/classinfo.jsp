<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />    
		<div class="content-container">
			<main class="main">
			<div class="mem-information" style="padding-left:0px;"><h3> ${ci.name} 클래스 정보</h3></div>
				 <div class="self-certification-check">
				
					<div class="self">
					<div class="application-form-wrapper clearfix">
						<div class="title-box">클래스 이름</div>
						<label class="content-box dc-name mem-fixed" name="id">${ci.name}</label>
					</div>
					</div>
				 	<div class="self">
					<div class="application-form-wrapper clearfix">
						<div class="title-box">클래스 과정</div>
						<label class="content-box dc-name mem-fixed" name="course">${ci.course}</label>
					</div>
					</div>
					<div class="self">
					<div class="application-form-wrapper clearfix">
						<div class="title-box dc-name">클래스 룸</div>
						<label class="content-box dc-name mem-fixed" name="course">${ci.lectureRoom}</label>
					</div>
					</div> 
					
					 <div class="self">
					<c:set var="openDate">
					<fmt:formatDate value="${ci.openDate}" pattern="yyyy-MM-dd"/>
					</c:set>
					<div class="application-form-wrapper clearfix">
						<div class="title-box dc-name">클래스 시작일</div>
						<label class="content-box dc-name mem-fixed" id="class-name">${openDate}
						</label>
					</div>
					</div>
					<div class="self">
					<c:set var="completeDate">
					<fmt:formatDate value="${ci.completeDate}" pattern="yyyy-MM-dd"/>
					</c:set>
					<div class="application-form-wrapper clearfix">
						<div class="title-box dc-name">클래스 수료일</div>
						<label class="content-box dc-name mem-fixed" id="class-name">${completeDate} 
						</label>
					</div>
					</div> 
					
				</div>
		
		</main>
			
		</div>
