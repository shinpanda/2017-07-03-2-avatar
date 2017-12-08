<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="${ctx}/resource/css/memprofile.css" type="text/css"
	rel="stylesheet">
<link href="${ctx}/resource/css/classsetting.css" rel="stylesheet"
	type="text/css">

<title>Avatar</title>
<!-- // jQuery 기본 js파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div id="body">
		<div class="content-container">
			<main class="main">

			<div class="middle">
				<h1>클래스 설정</h1>
				<div class="new-class">
					<a href="#" class="modal-trigger4" data-modal="modal-name4"> <img
						class="add-img" src="${ctx}/resource/images/add.png" alt="클래스 생성" />
					</a>
				</div>
				<!-- class list  -->
				<form action="update-default-class?${_csrf.parameterName}=${_csrf.token}" method="post">
					<div class="classset" >
						<c:forEach var="cl" items="${clist}">
							<div class="class-row" id="${cl.id}">
								<label> 
									<input type="radio" class="radio"
									name="class-id" id="${cl.id}" value="${cl.id}" /> <!--checked   -->
									<span class="front-end box"> <span> ${cl.name} 
											CLASS</span>
									</span>
								</label>
								<div class="class-cell">
									<span class="class-info"> <b>과정명 :</b> <span
										class="class-course">${cl.course}</span> <br /> <b>기간 :</b> <fmt:formatDate
											pattern="yyyy-MM-dd" value="${cl.openDate }" /> ~ <fmt:formatDate
											pattern="yyyy-MM-dd" value="${cl.completeDate }" />
										<input type="hidden" name="c-id"value="${cl.id}" />	
										<input type="hidden" name="default-change">	
									</span>
									<div class="icon-button">
										<a href="#" class="modal-trigger2" data-modal="modal-name2">
											<img class="delete-img" src="${ctx}/resource/images/delete.png" alt="클래스 삭제" />
										</a> 
										<a href="#" class="modal-trigger3" data-modal="modal-name3">
											<img class="delete-img" src="${ctx}/resource/images/edit.png" alt="클래스 수정" />
										</a>
									</div>
									
								</div>
							</div>

						</c:forEach>
						<input class="change-default" type="submit" value="기본 클래스 등록" />
					</div>
				</form>



				<!-- Modal -->
				<div class="modal4" id="modal-name">
					<div class="modal-sandbox4"></div>
					<div class="modal-box">
						<div class="modal-header">
							<div class="close-modal4">&#10006;</div>
							<h1 style="margin-top: auto;">클래스생성</h1>
						</div>
						<form action="new-class?${_csrf.parameterName}=${_csrf.token}"
							method="post">
							<div class="modal-body center">

								<p>클래스 생성을 누르면 새로운 클래스가 생성됩니다.</p>

							<div class="class-name mem-fixed set title">
									<span class="class-name">과정명 </span> 
									<input type="text" class="content-box class-input cell" name="course" />
									<span class="class-name">클래스 이름  </span> 
									<input type="text" class="content-box class-input cell" name="name"> 
									<span class="class-name">클래스 비밀번호  </span> 
									<input type="password" class="content-box class-input cell" name="pwd">
									<span class="class-name">시작일  </span> 
									<input type="date" class="content-box class-input cell" name="openDate">
									<span class="class-name">수료일  </span> 
									<input type="date" class="content-box class-input  cell" name="completeDate">
									<span class="class-name">클래스 룸 선택  </span> 
									<select name="lectureRoom" id="lectureRoom" class="content-box class">
									 <option value="">강의실을 선택해주세요.(row x column)</option>
								    <c:forEach var="room" items="${room}">
								    <option value="${room.id}">${room.id}강의실 (${room.row} X ${room.col})</option>
								    </c:forEach>
								  </select>
							</div>

								<br /> <br /> <input class="btn-modal" type="submit"
									value="클래스 생성">
							</div>
						</form>
					</div>
				</div>
				<!-- Modal2 삭제 -->
				<div class="modal2" id="modal-name">
					<div class="modal-sandbox2"></div>
					<div class="modal-box">
						<div class="modal-header">
							<div class="close-modal2">&#10006;</div>
							<h1 style="margin-top: auto;" id="del-name"></h1>
						</div>
						<form action="delete-class?${_csrf.parameterName}=${_csrf.token}"
							method="post">
							<div class="modal-body center">
								
								<div class="class-name mem-fixed set title">
									<span class="class-name">과정명 : 
										<span id="del-course" style="font-variant: all-small-caps; font-size: 27px;"></span></span>
									<input type="hidden" id="del-id" name="del-id"/>
								</div>
								
								<p style="color:red;">**클래스 삭제를 원하시면 클래스에 학생에 존재하지 않아야 합니다.</p>
								<p id="student-num"> </p>
								<p>클래스 비밀번호 입력 후 삭제를 누르면 클래스가 삭제됩니다.</p>
								<p>클래스 비밀번호가 올바르면 클래스 삭제버튼이 활성화됩니다.</p>
								<div class="table">
									<div class="class-name mem-fixed set pwd-hide">
										<span class="class-name cell">비밀번호 : 
											<input type="password" class="content-box class-input cell" id="del-pwd" name="del-pwd">
										</span> 
									</div>
								</div>
								<div class="del-cl" id="delete-cl" style="display:none;" >
								<p style="color:blue;">**올바른 비밀번호를 입력하였습니다.</p>
								<input class="btn-modal" type="submit" id="delete-class-btn" value="클래스 삭제">
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- 수정 Modal3 -->
				<div class="modal3" id="modal-name">
					<div class="modal-sandbox3"></div>
					<div class="modal-box">
						<div class="modal-header">
							<div class="close-modal3">&#10006;</div>
							<h1 style="margin-top: auto;">클래스수정</h1>
						</div>
						<form action="edit-class?${_csrf.parameterName}=${_csrf.token}"
							method="post">
							<div class="modal-body center">
								<p>클래스 수정을 누르면 클래스가 수정됩니다.</p>
								<div class="class-name mem-fixed set title">
									<span class="class-name">과정명 : </span> 
									<input type="text" class="content-box class-input cell" name="edit-course" />
									<input type="hidden" class="content-box class-input cell" name="edit-id" />
										<span class="class-name cell">클래스 이름  </span> <input
											type="text" class="content-box class-input cell"
											name="edit-name"> <span class="class-name cell">클래스
											비밀번호 </span> <input type="password"
											class="content-box class-input cell" name="edit-pwd">
											<span class="class-name cell">클래스 룸
											 </span> 
											<select name="edit-lectureRoom" class="content-box class">
										<c:forEach var="room" items="${room}">
											<option value="${room.id}">${room.id}강의실 (${room.row} X ${room.col})</option>
										</c:forEach>
									</select> <span class="class-name cell">시작일 </span> <input type="date"
											class="content-box class-input cell" name="edit-openDate">
										<span class="class-name cell">수료일 </span> <input type="date"
											class="content-box class-input cell"
											name="edit-completeDate">



								</div>

									
								<br /> <br /> <input class="btn-modal" type="submit"
									value="클래스 수정">
							</div>
						</form>
					</div>
				</div>

			</div>
			</main>
		</div>
	</div>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
	<script>
	$(function()  {
		$.get("../member/get-default-class?${_csrf.parameterName}=${_csrf.token}", 
				function(result) {
				if(result != 0){
					$("input[id='"+result+"']").attr("checked",true);
				}
				  $("input[type='radio']").change(function(){
						var changeValue = $("input[type='radio']:checked").val();
					 	$('input[name=default-change]').attr('value',changeValue);
				})  
				
				
		});
		
	});
	
		/* 추가 */
		$(".modal-trigger4").click(function(e) {
			e.preventDefault();
			$(".modal4").css({
				"display" : "block"
			});
		});

		$(".close-modal4, .modal-sandbox4").click(function() {
			$(".modal4").css({
				"display" : "none"
			});
		});
		/* 2.삭제 */
		
		var clPwd = null;
		$(".modal-trigger2").click(function(e) {
			$.get("../member/class-list?${_csrf.parameterName}=${_csrf.token}&classId=" 
					+ $(e.target).parents('.class-row').attr('id'), function(result) {
								var c = JSON.parse(result);
								clPwd = c['pwd'];
								$('input[name=del-id]').attr('value',c['id']);
								$('h1[id=del-name]').text(c['name']+" 클래스 삭제");
								$('span[id=del-name]').text(c['name']);
								$('span[id=del-course]').text(c['course']);	
			})
			$.get("../member/student-count?${_csrf.parameterName}=${_csrf.token}&classId=" 
					+ $(e.target).parents('.class-row').attr('id'), function(result) {
						$('#student-num').append("현재 클래스 인원: "+result+"명 ");	 
						if(result == 0){
							$('#student-num').append("<strong> (현재 클래스 삭제가 가능합니다.)</strong>");
							$(".pwd-hide").show();
						}else{
							$('#student-num').append("<strong style='color:red;'>(현재 클래스 삭제가 불가능합니다.)</strong> ");
							$(".pwd-hide").hide();
						}
			})
			$("#del-pwd").change(function(){
				if($("#del-pwd").val() == clPwd){
					$("#delete-cl").css({
						"display" : "block"
					});
					$("#delete-class-btn").css({
						"display" : "unset"
					});
					/* <p style="color:blue;">**올바른 비밀번호를 입력하였습니다.</p> */
					$("#delete-cl").children('p').text("**올바른 비밀번호를 입력하였습니다.");
					$("#delete-cl").children('p').css({"color":"blue"});
				}else {
					$("#delete-cl").css({
						"display" : "block"
					});
					/* <span style='color:red;'>올바른비밀번호를입력해주세요</span> */
					$("#delete-cl").children('p').text("올바른비밀번호를입력해주세요");
					$("#delete-cl").children('p').css({"color":"red"});
					$("#delete-class-btn").css({
						"display" : "none"
					});
					
				}
			});
			$(".modal2").css({
				"display" : "block"
			});
		});
		$(".close-modal2, .modal-sandbox2").click(function() {
			$(".modal2").css({
				"display" : "none"
			});
			$("#del-pwd").val('');
			$("#delete-cl").css({
				"display" : "none"
			});
			
			//modal학생수 초기화 .empty()
			$("#student-num").empty();
		
			
		});
		
		/* 3.수정 */
		
			$(".modal-trigger3").click(function(e) {
							e.preventDefault();
							/* console.log($(e.target).parents('.class-row').attr('id')); */
							$.get("../member/class-list?${_csrf.parameterName}=${_csrf.token}&classId=" 
									+ $(e.target).parents('.class-row').attr('id'), function(result) {
												var c = JSON.parse(result);
												/* var openDate = c['openDate']; */
												var ope = new Date(
														c['openDate']);
												var complete = new Date(
														c['completeDate']);
												var openDate = ope
														.getFullYear()
														+ "-"
														+ ((ope.getMonth() + 1) >= 10 ? (ope.getMonth() + 1) : "0"
														+ (ope.getMonth() + 1))
														+ "-" 
														+ (ope.getDate() >= 10 ? "" : "0")
														+ ope.getDate();
												var completeDate = complete.getFullYear() 
														+ "-"
														+ ((complete.getMonth() + 1) >= 10 ? (complete.getMonth() + 1): "0"
														+ (complete.getMonth() + 1))
														+ "-"
														+ (complete.getDate() >= 10 ? "" : "0")
														+ complete.getDate();
												$('input[name=edit-id]').attr('value', c['id']);
												$('input[name=edit-course]').attr('value', c['course']);
												$('input[name=edit-name]').attr('value', c['name']);
												$('input[name=edit-pwd]').attr('value', c['pwd']);
												$('select[name=edit-lectureRoom]').val(c['lectureRoom']);
												$('input[name=edit-openDate]').attr('value', openDate);
												$('input[name=edit-completeDate]').attr('value', completeDate);
											})
							$(".modal3").css({
								"display" : "block"
							});
						});

		$(".close-modal3, .modal-sandbox3").click(function() {
			$(".modal3").css({
				"display" : "none"
			});
		});
	</script>
</body>