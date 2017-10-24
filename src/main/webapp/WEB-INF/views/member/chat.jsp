<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main class="main">
<div class="chat-container">
	<span>C class</span>
	<div class="chat-wrapper">
		<div class="row chat-date">
			<p>10월 20일</p>
		</div>
		<div class="row">
			<h5>학생</h5>
			<div>
				<p>아 어떻게 해야 이쁠지 상상이 안가… 어떻게 해야하는 걸까</p>
				<span>15:27</span>
			</div>
		</div>
		<div class="row">
			<h5>학생</h5>
			<div>
				<p>아 어떻게 해야 이쁠지 상상이 안가… 어떻게 해야하는 걸까</p>
				<span>15:27</span>
			</div>
		</div>
		<template>
		<div class="row">
			<h5></h5>
			<div>
				<p></p>
				<span></span>
			</div>
		</div>
		</template>
	</div>
	<div class="chat-message">
		<textarea rows="5" cols="55"></textarea>
		<input type="button" value="전송" />
	</div>
	<script>
		var submitButton = document
				.querySelector('.chat-message input[type="button"]');
		var template = document.querySelector('.chat-wrapper template');
		var chatWindow = document.querySelector('.chat-wrapper');
		var firstCheck = false;
		var data = null;
		const ws = new WebSocket("ws://localhost:8080");

		ws.onopen = function(e) {
			ws.send("first");
		};

		//서버로부터 메시지 수신
		ws.onmessage = function(e) {
			if (firstCheck == false) {
				data = JSON.parse(e.data);
				for(var i=0; i<data.length; i++){
					if ('content' in template) {
						var clone = document.importNode(template.content, true);
	
						var row = clone.querySelector(".row");
						if(data[i].role == "ROLE_TEACHER")
							row.querySelector("h5").textContent = "선생님";
						else
							row.querySelector("h5").textContent = "학생";
						var div = row.querySelector("div");
	
						div.querySelector("p").textContent = data[i].content;
						div.querySelector("span").textContent = data[i].regDate;
						chatWindow.appendChild(clone);
					}
				}
				firstCheck = true;
			} else {
				if (!"Notification" in window) {
					alert("This browser does not support desktop notification");
				} else if (Notification.permission === "granted") {
					var notification = new Notification(e.data);
				} else if (Notification.permission !== 'denied') {
					Notification.requestPermission(function(permission) {

						if (!('permission' in Notification)) {
							Notification.permission = permission;
						}

						if (permission === "granted") {
							var notification = new Notification(e.data);
						}
					});
				}
			}
		};

		ws.onerror = function(event) {
			console.log("Server error message: ", event.data);
		}

		submitButton.onclick = function(e) {
			if ('content' in template) {
				var clone = document.importNode(template.content, true);

				var row = clone.querySelector(".row");
				row.querySelector("h5").textContent = "선생님";
				var div = row.querySelector("div");

				div.querySelector("p").textContent = "저런";
				div.querySelector("span").textContent = "15:30";
				chatWindow.appendChild(clone);
			}
		}
	</script>
</div>
</main>