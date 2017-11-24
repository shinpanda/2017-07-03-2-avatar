<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<link href="${ctx}/resource/css/memprofile.css" type="text/css" rel="stylesheet">
<link href="${ctx}/resource/css/classsetting.css" rel="stylesheet" type="text/css" >
<title>Avatar</title>
</head>
<body>
<div id="body">
		<div class="content-container">
		
			<main class="main">
			
			<form method="post">
				<div class="middle">
					<h1>클래스 설정</h1>
					<div class="classset">
					<label> <input type="radio" name="radio" />
					<!--checked   -->
						<span class="front-end box">
							<span>C(2017-11-11)</span>
						</span>
					</label> <label> <input type="radio" name="radio" />
						<span class="back-end box">
							<span>Back-end</span>
						</span>
					</label>
					
					</div>
					
				</div>

			</form>
			
		</main>
			
		</div>
	</div>

</body>