<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="param" value="${pageContext.request.requestURL }"/>

<!DOCTYPE html>
<html>
<head>
<title>AVATAR CHAT</title>
<link href="${ctx}/resource/css/joinstyle.css" type="text/css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	
	$('#user-pw').keyup(function() {
		$('font[name=check]').text('');
	}); //#user_pass.keyup	
	$('#user-pw-repeat').keyup(
					function() {
						if ($('#user-pw').val() != $('#user-pw-repeat')
								.val()) {
							$('font[name=check]').text('');
							$('font[name=check]')
									.html("<span style='color:red'>**패스워드가 같지 않습니다.<\/span><input type='hidden' name='pwd-check' value='no'>");

						} else {
							$('font[name=check]').text('');
							$('font[name=check]')
									.html("<span style='color:blue'>**올바른 비밀번호를 입력하였습니다.<\/span><input type='hidden' name='pwd-check' value='yes'>");
						}
					}); 		
}

</script>
</head>

<body>
	<div id="formWrapper">

		<div id="form">
			<form action="?${_csrf.parameterName}=${_csrf.token}" method="post">
			<h1 class="logo">
				<img src="${ctx}/resource/images/join.png" alt="join" style="width: 150px; padding-left: 33%;" />
			</h1>
			<div class="form-item">
			<div class="form-title">이름</div>
				<input type="text" name="name" class="form-style" placeholder="이름 입력해주세요" />
			</div>
			<div class="form-item">
			<div class="form-title">아이디</div>
				<input type="text" name="id" class="form-style" placeholder="아이디를 입력해주세요" />
			</div>

			<div class="form-item">
			<div class="form-title">비밀번호</div>
				<div class="half">
					<input type="password" id="user-pw" name="pwd" class="form-style" placeholder="비밀번호" />
					<input type="password" id="user-pw-repeat" name="pwd-re" class="form-style" placeholder="비밀번호 확인" />
					
				</div>
					<div>
						<div class="string optional pw-check" style="text-align: right;"> <font name="check" size="2"></font> </div>
					</div>
			</div>
			
			<div class="form-item">
			<div class="form-title">이메일</div>
				<input type="email" name="email" class="form-style" placeholder="이메일을 입력해주세요" />
			</div>
			<div class="form-item">
			<div class="form-title">등급</div>
				<div class="form-style" >${param.role} </div>
			</div>
			<div class="form-item">
			<div class="form-title">클래스이름</div>
				<select name="class-name" class="form-style">
				<c:forEach var="n" items="${list}">	
					<option value="${n.name}">${n.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-item">
			<div class="form-title">클래스비밀번호</div>
				<input type="password" name="pwd" class="form-style" placeholder="클래스 비밀번호를 입력해주세요" />
			</div>
			<div class="form-item">
				<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<input type="submit" class="login pull-right" value="Sign In">
				<div class="clear-fix"></div>
			</div>
			</form>
		</div>
	</div>
	
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="${ctx}/resource/js/login.js"></script>
</body>
</html>


