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
		
		
			<div class="mem-information"><h3>회원정보조회/수정</h3></div>
			
			<form method="post">
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
					<div class="application-form-wrapper clearfix">
						<div class="title-box dc-name">등급</div>
						<label class="content-box dc-name mem-fixed">${grade}</label>
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
			
			
			<div class="mem-cancel"><h3>회원정보탈퇴신청</h3>
			<br>
			  <a href="#" class="modal-trigger" data-modal="modal-name">회원탈퇴</a> <!-- Trigger Modal. --></div>
		<!-- Modal -->
		<div class="modal" id="modal-name">
		  <div class="modal-sandbox"></div>
		  <div class="modal-box">
		    <div class="modal-header">
		      <div class="close-modal">&#10006;</div>
		      <h1>회원탈퇴</h1>
		    </div>
		    <form action="delete" method="post">
		    <div class="modal-body center">
		     
		      <p>회원탈퇴를 하시면 베품의 모든 자격이 상실됩니다.</p>
		      <p>회원탈퇴를 원하시면 비밀번호를 입력 후 아래의 탈퇴하기 버튼을 클릭해주세요.</p>
		      <p>회원탈퇴를 하셔도 등록한 글이나 매칭정보는 삭제되지 않을 수 있습니다.</p>
		      
		      <p>${member.id} 님 정말 탈퇴 하시겠습니까?</p>
		      
		     <div class="dc-name mem-fixed"> <span>비밀번호 입력 :</span> <input type="password" class="content-box dc-name" name="pwd" style="float: none;"/></div>
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