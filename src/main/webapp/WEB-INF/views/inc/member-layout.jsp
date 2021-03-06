<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Avatar</title>
<link href="${ctx}/resource/css/common-style.css" type="text/css" rel="stylesheet">
<script src="${ctx}/resource/js/chat.js"></script>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
<c:if test="${not empty board}">
	<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
	<script src="${ctx}/resource/js/editor.js"></script>
</c:if>
</head>
<body>
	<div class="body">
		<div>
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="mypage" />
			<tiles:insertAttribute name="main" />
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>