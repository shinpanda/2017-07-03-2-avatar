<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<link href="${ctx}/resource/css/memprofile.css" type="text/css" rel="stylesheet">
<title>Avatar</title>
</head>
<body>
<div id="body">
		<div class="content-container">
		
			<main class="main">
		
		
			<div class="mem-information"><h3>클래스 설정</h3></div>
			
			<form method="post">
				<div class="self-certification-check">
					클래스 불러오기
					클래스 생성
					클래스 삭제
				</div>

			</form>
			
		</main>
			
		</div>
	</div>

</body>