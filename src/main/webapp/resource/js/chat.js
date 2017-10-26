/**
 * 
 */

window.addEventListener("load", function() {
		var submitButton = document
				.querySelector('.chat-message input[type="button"]');
		var template = document.querySelector('.chat-wrapper template');
		var chatWindow = document.querySelector('.chat-wrapper');
		var firstCheck = false;
		var data = null;
		const ws = new WebSocket("ws://211.238.142.93/web/echo");

		ws.onopen = function(e) {
			
		};

		//서버로부터 메시지 수신
		ws.onmessage = function(e) {
			var data = JSON.parse(e.data);
			var str = location.pathname;	
			//if(!str.indexOf("/member/chat")){
			//잠시 notification 설정을 위해 조건문 바꿈
			
				if (!"Notification" in window) {
					alert("This browser does not support desktop notification");
				} else if (Notification.permission === "granted") {
					var notification = new Notification(data.content);
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
			//}
			//else {
			if(str.indexOf("/member/chat")){
				if ('content' in template) {
					var clone = document.importNode(template.content, true);
	
					var row = clone.querySelector(".row");
					row.querySelector("h5").textContent = data.role;
					var div = row.querySelector("div");
	
					div.querySelector("p").textContent = data.content;
					var regDate = new Date(data.date);
					div.querySelector("span").textContent = regDate.getHours()+":"+(regDate.getMinutes()>=10 ? regDate.getMinutes() : "0"+regDate.getMinutes());
					chatWindow.appendChild(clone);
					chatWindow.scrollTop = chatWindow.scrollHeight;
				}
			}
		};

		ws.onerror = function(event) {
			console.log("Server error message: ", event.data);
		}
		
			submitButton.onclick = function(e) {
				var chatMessage = document.querySelector(".chat-message").firstElementChild.value;
				if(chatMessage ==  ""){
					alert("내용을 입력해주세요");
					e.preventDefault();
				} else{
					console.log(chatMessage);
					var json = {
						id : "test",
						classId : "c",
						content : chatMessage,
						role : "학생",
						date : Date.now()
					};
					ws.send(JSON.stringify(json));
				}
				document.querySelector(".chat-message").firstElementChild.value = "";
			}
});