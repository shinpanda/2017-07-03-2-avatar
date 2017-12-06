<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<main class="main">
<h3>강의실 관리</h3>

<div class="board-style">
	<div class="new-class clearfix">
		<div class="new-class-btn">
			<span>ADD</span> <span>+</span>
		</div>
	</div>
	<div class="box-container">
		<c:set var="rowNum" value="${count*4-1}" />
		<c:forEach  items="${list}" begin="0" end="${rowNum}" step="4" varStatus="status">
			<div class="box-row">
				<c:forEach begin="${status.index}" end="${status.index+3}" var="i">
					<c:if test="${!empty list[i]}">
						<div class="box" id="${list[i].id}">
							<h5>
								강의실 : <span>${list[i].id}</span>
							</h5>
							<div>총 좌석 수 : ${list[i].col*list[i].row}석</div>
							<div>
								가로x세로 : <span>${list[i].col}</span>x<span>${list[i].row}</span>
							</div>
							<div class="box-btn-container">
								<input type="button" value="수정" class="btn" id="room-edit-button" />
								<input type="button" value="삭제" class="btn" id="room-del-button" />
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
	<div class="room-popup hidden">
		<div class="room-add-container">
			<h4>강의실 추가/수정</h4>
			<div class="set-row">
				<label>강의실 이름 : </label><input type="text" id="room-name">
			</div>
			<div class="set-row">
				<label>가로 : </label><input type="text" class="w80" id="col">
				<label>세로 : </label><input type="text" class="w80" id="row">
			</div>
			<div class="box-btn-container">
				<input type="button" value="등록" class="btn" id="room-reg-button">
				<input type="button" value="취소" class="btn" id="room-cancel-button">
			</div>
		</div>
	</div>
	<div class="room-popup hidden">
		<div class="room-del-container">
			<div>정말 삭제하시겠습니까?</div>
			<div class="box-btn-container">
				<input type="button" value="삭제" class="btn" id="room-delete-button">
				<input type="button" value="취소" class="btn" id="room-cancel-button">
			</div>
		</div>
	</div>
	
	<script>
		var addButton = document.querySelector(".new-class-btn");
		var type = null;
		var boxContainer = document.querySelector(".box-container");
		var roomAdminContainer = document.querySelector(".room-add-container");
		var roomDelContainer = document.querySelector(".room-del-container");
		var targetBoxId = null;
		addButton.onclick = function(e) {
			roomAdminContainer.parentNode.classList.remove("hidden");
			type = "add";
		}

		boxContainer.onclick = function(e) {
			if (e.target.id == "room-edit-button") {
				var targetBox = e.target.parentNode.parentNode;
				console.log(targetBox.id);
				type = "edit";
				
				roomAdminContainer.parentNode.classList.remove("hidden");
				roomAdminContainer.querySelector('#room-name').value = targetBox.firstElementChild
						.querySelector("span").textContent;
				roomAdminContainer.querySelector('#col').value = targetBox.firstElementChild.nextElementSibling.nextElementSibling
						.querySelectorAll("span")[0].textContent;
				roomAdminContainer.querySelector('#row').value = targetBox.firstElementChild.nextElementSibling.nextElementSibling
						.querySelectorAll("span")[1].textContent;
			}
			if (e.target.id == "room-del-button") {
				targetBoxId = e.target.parentNode.parentNode.id;
				type="del";
				roomDelContainer.parentNode.classList.remove("hidden");
				
			}
		}

		roomAdminContainer.onclick = function(e) {
			if (e.target.id == "room-reg-button") {
				var formData = new FormData();
				
				var data = {
						id : roomAdminContainer.querySelector('#room-name').value,
						row : roomAdminContainer.querySelector('#row').value,  
						col : roomAdminContainer.querySelector('#col').value,
						type : type
				}
				formData.append("data", JSON.stringify(data));
				var xhr = new XMLHttpRequest();
				xhr.onload = function(e){
					location.reload();
				};

				xhr.open("POST", "lecture-admin?${_csrf.parameterName}=${_csrf.token}");
				xhr.send(formData);
			}
			if (e.target.id == "room-cancel-button") {
				e.target.parentNode.parentNode.parentNode.classList.add("hidden");
			}
		}
		
		roomDelContainer.onclick = function(e) {
			if (e.target.id == "room-delete-button") {

				var formData = new FormData();

				var data = {
					id : targetBoxId,
					type : type
				}
				formData.append("data", JSON.stringify(data));
				var xhr = new XMLHttpRequest();
				xhr.onload = function(e) {
					location.reload();
				};

				xhr.open("POST",
						"lecture-admin?${_csrf.parameterName}=${_csrf.token}");
				xhr.send(formData);

				location.reload();
			}
			if (e.target.id == "room-cancel-button") {
				e.target.parentNode.parentNode.parentNode.classList.add("hidden");
			}
		}
	</script>
</div>
</main>