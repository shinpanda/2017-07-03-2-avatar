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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>










</head>
<body>
	<div id="body">
		<div class="content-container">
			<main class="main">

			<div class="middle">
				<h1>클래스 설정</h1>
				<div class="new-class">
					<a href="#" class="modal-trigger" data-modal="modal-name"> <img
						class="add-img" src="${ctx}/resource/images/add.png" alt="클래스 생성" />
					</a>
				</div>
				<!-- class list  -->
				<form action="?${_csrf.parameterName}=${_csrf.token}" method="post">
					<div class="classset" >
						<c:forEach var="cl" items="${clist}">
							<div class="class-row" id="${cl.id}">
								<label> 
									<input type="radio" class="radio"
									name="class-id" id="class-id" value="${cl.id}" /> <!--checked   -->
									<span class="front-end box"> <span> ${cl.name}
											CLASS</span>

								</span>
								</label>
								<div class="class-cell">
									<span class="class-info"> <b>과정명 :</b> <span
										class="class-course">${cl.course}</span> <br /> <b>기간 :</b> <fmt:formatDate
											pattern="yyyy-MM-dd" value="${cl.openDate }" /> ~ <fmt:formatDate
											pattern="yyyy-MM-dd" value="${cl.completeDate }" />
										<input type="hidden" 
									name="c-id" id="c-id" value="${cl.id}" />	
											
									</span>
									<div class="delete-button">

										<a href="#" class="modal-trigger2" data-modal="modal-name2">
											<img class="delete-img"
											src="${ctx}/resource/images/delete.png" alt="클래스 삭제" />
										</a> <a href="#" class="modal-trigger3" data-modal="modal-name3">
											<img class="delete-img" src="${ctx}/resource/images/edit.png"
											alt="클래스 수정" />
										</a>
									</div>
								</div>
							</div>

						</c:forEach>
						<input type="submit" value="기본 클래스 변경" />
					</div>
				</form>



				<!-- Modal -->
				<div class="modal" id="modal-name">
					<div class="modal-sandbox"></div>
					<div class="modal-box">
						<div class="modal-header">
							<div class="close-modal">&#10006;</div>
							<h1 style="margin-top: auto;">클래스생성</h1>
						</div>
						<form action="new-class?${_csrf.parameterName}=${_csrf.token}"
							method="post">
							<div class="modal-body center">

								<p>클래스 생성을 누르면 새로운 클래스가 생성됩니다.</p>

								<div class="dc-name mem-fixed set title">
									<span class="class-name">과정명 : </span> <input type="text"
										class="content-box dc-name cell" name="course" />
								</div>
								<div class="table">
									<div class="dc-name mem-fixed set">
										<span class="class-name cell">클래스 이름 : </span> <input
											type="text" class="content-box dc-name class cell"
											name="name"> <span class="class-name cell">클래스
											비밀번호 : </span> <input type="password"
											class="content-box dc-name class  cell" name="pwd">
									</div>
									<div class="dc-name mem-fixed set">
										<span class="class-name cell">시작일 : </span> <input type="date"
											class="content-box dc-name class cell" name="openDate">
										<span class="class-name cell">수료일 : </span> <input type="date"
											class="content-box dc-name class cell" name="completeDate">
									</div>
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
							<h1 style="margin-top: auto;">클래스삭제</h1>
						</div>
						<form action="?${_csrf.parameterName}=${_csrf.token}"
							method="post">
							<div class="modal-body center">

								<p>클래스 삭제를 누르면 클래스가 삭제됩니다.</p>

								<div class="dc-name mem-fixed set title">
									<span class="class-name">과정명 : </span> <input type="text"
										class="content-box dc-name cell" name="course" />
								</div>

								<div class="table">
									<div class="dc-name mem-fixed set">
										<span class="class-name cell">클래스 이름 : </span> <input
											type="text" class="content-box dc-name class cell"
											name="name"> <span class="class-name cell">클래스
											비밀번호 : </span> <input type="password"
											class="content-box dc-name class  cell" name="pwd">
									</div>
									<div class="dc-name mem-fixed set">
										<span class="class-name cell">시작일 : </span> <input type="date"
											class="content-box dc-name class cell" name="openDate">
										<span class="class-name cell">수료일 : </span> <input type="date"
											class="content-box dc-name class cell" name="completeDate">
									</div>
								</div>

								<br /> <br /> <input class="btn-modal" type="submit"
									value="클래스 생성">
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
								<div class="dc-name mem-fixed set title">
									<span class="class-name">과정명 : </span> <input type="text"
										class="content-box dc-name cell" name="edit-course" value="" />
									<input type="hidden" class="content-box dc-name cell"
										name="edit-id" value="" />

								</div>

								<div class="table">
									<div class="dc-name mem-fixed set">
										<span class="class-name cell">클래스 이름 : </span> <input
											type="text" class="content-box dc-name class cell"
											name="edit-name"> <span class="class-name cell">클래스
											비밀번호 : </span> <input type="password"
											class="content-box dc-name class cell" name="edit-pwd">
									</div>
									<div class="dc-name mem-fixed set">
										<span class="class-name cell">시작일 : </span> <input type="date"
											class="content-box dc-name class cell" name="edit-openDate">
										<span class="class-name cell">수료일 : </span> <input type="date"
											class="content-box dc-name class cell"
											name="edit-completeDate">
									</div>
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



	<script
		src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
	<script>
	$(document).ready(function(){
		/* 추가 */
		$(".modal-trigger").click(function(e) {
			e.preventDefault();
			dataModal = $(this).attr("data-modal");
			$("#" + dataModal).css({
				"display" : "block"
			});
		});

		$(".close-modal, .modal-sandbox").click(function() {
			$(".modal").css({
				"display" : "none"
			});
		});
		/* 삭제2 */
		$(".modal-trigger2").click(function(e) {
			e.preventDefault();
			$(".modal2").css({
				"display" : "block"
			});
		});

		$(".close-modal2, .modal-sandbox2").click(function() {
			$(".modal2").css({
				"display" : "none"
			});
		});

		/* 수정 3*/
		
		$(".modal-trigger3")
				.click(
						function(e) {
							e.preventDefault();
							/* console.log($(e.target).parents('.class-row').attr('id')); */
							
							$
									.get(
											
											
											
											"../member/class-list?${_csrf.parameterName}=${_csrf.token}&classId="
													+ $(e.target).parents('.class-row').attr('id'),
											function(result) {
												var c = JSON.parse(result);
												/* var openDate = c['openDate']; */
												var ope = new Date(
														c['openDate']);
												var complete = new Date(
														c['completeDate']);
												var openDate = ope
														.getFullYear()
														+ "-"
														+ ((ope.getMonth() + 1) >= 10 ? (ope
																.getMonth() + 1)
																: "0"
																		+ (ope
																				.getMonth() + 1))
														+ "-" + ope.getDate();
												var completeDate = complete
														.getFullYear()
														+ "-"
														+ ((complete.getMonth() + 1) >= 10 ? (complete
																.getMonth() + 1)
																: "0"
																		+ (complete
																				.getMonth() + 1))
														+ "-"
														+ complete.getDate();
												$('input[name=edit-id]').attr(
														'value', c['id']);
												$('input[name=edit-course]')
														.attr('value',
																c['course']);
												$('input[name=edit-name]')
														.attr('value',
																c['name']);
												$('input[name=edit-pwd]').attr(
														'value', c['pwd']);
												$('input[name=edit-openDate]')
														.attr('value', openDate);
												$(
														'input[name=edit-completeDate]')
														.attr('value',
																completeDate);

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
	});
	</script>
</body>