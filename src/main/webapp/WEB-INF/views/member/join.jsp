<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="param" value="${pageContext.request.requestURL }"/>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowTime" />

<!DOCTYPE html>
<html>
<head>
<title>AVATAR CHAT</title>
<link href="${ctx}/resource/css/joinstyle.css" type="text/css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

<script type="text/javascript">
$(function(){
	var signButton = $("#sign");
    
	$('#user-pw').keyup(function() {
		$('font[name=check]').text('');
	}); //#user_pass.keyup	
	$('#user-pw-repeat').keyup(
					function() {
						if ($('#user-pw').val() != $('#user-pw-repeat')
								.val()) {
							$('font[name=check]').text('');
							$('font[name=check]')
									.html("<span style='color:red'>**패스워드가 같지 않습니다.<\/span><input type='hidden' id='pwd-check' value='no'>");
						} else {
							$('font[name=check]').text('');
							$('font[name=check]')
									.html("<span style='color:blue'>**올바른 비밀번호를 입력하였습니다.<\/span><input type='hidden' id='pwd-check' value='yes'>");
						}
					}); 		

//아이디 체크하여 가입버튼 비활성화, 중복확인.
	$("#id").change(function(){
		 //console.log($("#id").val());
		$.get("../member/idCheck?${_csrf.parameterName}=${_csrf.token}&id="+$("#id").val() ,function(result){
//			   alert(result);
			if(result == 0)
				$('font[name=check-id]')
				.html("<span style='color:blue'>**사용가능한 아이디입니다.<\/span><input type='hidden' id='id-check' name='id-check' value='yes'>");
				else
				$('font[name=check-id]')
					.html("<span style='color:red'>**사용불가능한 아이디입니다.<\/span><input type='hidden' id='id-check' name='id-check' value='no'>");
		});
	});
	$("#email").change(function(){
	//	 console.log($("#email").val());
		$.get("../member/emailCheck?${_csrf.parameterName}=${_csrf.token}&email="+$("#email").val() ,function(result){
//			   alert(result);
			if(result == 0)
				$('font[name=check-email]')
				.html("<span style='color:blue'>**사용가능한 이메일입니다.<\/span><input type='hidden' id='email-check' name='email-check' value='yes'>");
				else
				$('font[name=check-email]')
					.html("<span style='color:red'>**사용불가능한 이메일입니다.<\/span><input type='hidden'id='email-check' name='email-check' value='no'>");
		});
	});
	$("#classPwd").change(function(){
		//	 console.log($("#email").val());
			$.get("../member/checkPw?${_csrf.parameterName}=${_csrf.token}&classId="+$("#classId").val()+"&classPwd="+$("#classPwd").val() ,function(result){
//				   alert(result);
				if(result == 1)
					$('font[name=check-classPwd]')
					.html("<span style='color:blue'>**올바른 비밀번호입니다.<\/span><input type='hidden' id='classPwd-check' name='classPwd-check' value='yes'>");
					else
					$('font[name=check-classPwd]')
						.html("<span style='color:red'>**비밀번호를 확인해주세요.<\/span><input type='hidden'id='classPwd-check' name='classPwd-check' value='no'>");
			});
		});
	 signButton.click(function(e){
			if ($("#name").val() == "") {
				alert("이름을 입력해주세요.");
				e.preventDefault();
			}else if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				e.preventDefault();
			}else if ($("#id-check").val() == "no") {
				alert("아이디를 확인해주세요.");
				e.preventDefault();
			}else if ($("#user-pw").val() == "") {
				alert("비밀번호를 입력해주세요.")
				e.preventDefault();
			}else if ($("#user-pw-repeat").val() == "") {
				alert("비밀번호를 확인을 입력해주세요.")
				e.preventDefault();
			}else if ($("#pwd-check").val() == "no") {
				alert("비밀번호를 확인해주세요.");
				e.preventDefault();
			}else if ($("#email").val() == "") {
				alert("이메일을 입력해주세요.")
				e.preventDefault();
			}else if ($("#email-check").val() == "no") {
				alert("이메일을 확인해주세요.")
				e.preventDefault();
			}else if ($("#classPwd").val() == "") {
				alert("클래스 비밀번호를 입력해주세요.")
				e.preventDefault();
			}else if ($("#classPwd-check").val() == "no") {
				alert("클래스 비밀번호를 확인주세요.")
				e.preventDefault();
			}
		})
	});
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
				<input type="text" id="name" name="name" class="form-style" placeholder="이름 입력해주세요" />
			</div>
			<div class="form-item">
			<div class="form-title">아이디</div>
				<input type="text" id="id" name="id" class="form-style" placeholder="아이디를 입력해주세요" "/>
				<div>
					<div class="string optional user-id" style="text-align: right;"> <font name="check-id" size="2"></font> </div>
				</div>
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
				<input type="email" id="email"name="email" class="form-style" placeholder="이메일을 입력해주세요" />
					<div>
						<div class="string optional user-email" style="text-align: right;"> <font name="check-email" size="2"></font> </div>
					</div>
				
			</div>
			<div class="form-item">
			<div class="form-title">등급</div>
				<div class="form-style" >${param.role} </div>
				<input type="hidden" name="role" value="${param.role}"/>
			</div>
				<c:if test="${param.role eq 'student' }">
				
			 <div class="student-form">
				<div class="form-item">
				<div class="form-title">클래스이름 </div>
					<select class="form-style" id="classId" name="classId">
					<c:forEach var="c" items="${classList}">
				 	<fmt:formatDate pattern="yyyyMMdd" value="${c.completeDate }" var="completeD"/>
					<c:if test="${ nowTime <= completeD}">
						<option value="${c.id}">${c.name} (과정명: ${c.course} ) : 
					<fmt:formatDate pattern="yyyy-MM-dd" value="${c.openDate }" /> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${c.openDate }" /> 
						</option>
					</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="form-item">
				<div class="form-title">클래스비밀번호</div>
					<input type="password" id="classPwd" name="classPwd" class="form-style" placeholder="클래스 비밀번호를 입력해주세요" />
					
					<div>
						<div class="string optional user-classPwd" style="text-align: right;"> <font name="check-classPwd" size="2"></font> </div>
					</div>
					
					
				</div>
			
			 </div>
			 </c:if>
			 
			<div class="form-item">
				<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				<input type="submit" class="login pull-right" id="sign" value="Sign In" />
				<div class="clear-fix"></div>
			</div>
			</form>
		</div>
	</div>
	
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="${ctx}/resource/js/login.js"></script>
</body>
</html>


