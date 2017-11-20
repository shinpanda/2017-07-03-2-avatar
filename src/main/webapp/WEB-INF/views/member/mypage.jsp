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
				<div class="mem-information"><h1 class="mypage"><img src="${ctx}/resource/images/profile2.png" alt="회원정보조회/수정" style="width: 150px; padding-left: 33%;" /></h1></div>
				
				<%-- <div class="mem-information"><h1 class="mypage"><img src="${ctx}/resource/images/withdraw2.png" alt="회원탈퇴" style="width: 150px; padding-left: 33%;" /></h1></div>
				<div class="mem-information"><h1 class="mypage"><img src="${ctx}/resource/images/classedit2.png" alt="클래스설정" style="width: 150px; padding-left: 33%;" /></h1></div> --%>
			</main>
			
		</div>
	</div>
</body>