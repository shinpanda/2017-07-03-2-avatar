<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>

<link href="${ctx}/resource/css/memprofile.css" type="text/css" rel="stylesheet">
<title>Avatar </title>
</head>
<body>
	<div id="body">
		<div class="content-container">
			
			<main class="main" style="display:flex;">
			<div class="mem-information">
				<h1 class="mypage">
					<a href="${ctx}/member/profile"> 
					<img src="${ctx}/resource/images/profile.png" alt="회원정보조회/수정" style="width: 200px;" />
					</a>
				</h1>
			</div>
			<div class="mem-information">
				<h1 class="mypage">
					<a href="#" class="modal-trigger" data-modal="modal-name"> 
						<img src="${ctx}/resource/images/withdraw.png" alt="회원탈퇴" style="width: 200px;" />
					</a>
				</h1>
			</div>
			<c:if test="${c.memberRole eq 'ROLE_TEACHER' }">
			<div class="mem-information">
				<h1 class="mypage">
					<a href="${ctx}/member/classsetting"> 
						<img src="${ctx}/resource/images/classedit.png" alt="클래스설정" style="width: 200px;" />
					</a>
				</h1>
			</div>
			</c:if>
			
			
		<!-- Modal -->
		<div class="modal" id="modal-name">
		  <div class="modal-sandbox"></div>
		  <div class="modal-box">
		    <div class="modal-header">
		      <div class="close-modal">&#10006;</div>
		      <h1 style="margin-top: auto;">회원탈퇴</h1>
		    </div>
		    <form action="?${_csrf.parameterName}=${_csrf.token}" method="post">
		    <div class="modal-body center">
		     
		      <p>회원탈퇴를 하시면 AVATAR의 모든 자격이 상실됩니다.</p>
		      <p>회원탈퇴를 원하시면 비밀번호를 입력 후 아래의 탈퇴하기 버튼을 클릭해주세요.</p>
		      <p>회원탈퇴를 하셔도 등록한 글이나 정보는 삭제되지 않을 수 있습니다.</p>
		      
		      <p> ${c.memberId} 님 정말 탈퇴 하시겠습니까?</p>
		      
		     <div class="dc-name mem-fixed"> <span>비밀번호 입력 :</span> <input type="password" class="content-box dc-name" name="checkpwd" style="float: none;"/></div>
		      <br/><br/>
		      <input class="btn-modal" type="submit" value="탈퇴하기" >
		    </div>
		    </form>
		  </div>
		</div>
		
			</main>
			
		</div>
	</div>
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script>
    $(".modal-trigger").click(function(e){
    	  e.preventDefault();
    	  dataModal = $(this).attr("data-modal");
    	  $("#" + dataModal).css({"display":"block"});
    	});

    	$(".close-modal, .modal-sandbox").click(function(){
    	  $(".modal").css({"display":"none"});
    	});
    
    </script>
</body>