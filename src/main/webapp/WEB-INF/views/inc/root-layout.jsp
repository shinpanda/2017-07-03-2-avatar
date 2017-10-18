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
<link href="${ctx}/resource/css/common-style.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<div class="body">
		<div>
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="main" />
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>