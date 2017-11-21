/**
 * 
 */

window.addEventListener("load", function() {
		var submitButton = document
				.querySelector('.chat-message input[type="button"]');
		var template = document.querySelector('template');
		var chatWindow = document.querySelector('.chat-wrapper');
		var firstCheck = false;
		var data = null;
		if(chatWindow != null)
			chatWindow.scrollTop = chatWindow.scrollHeight;
		var str = location.pathname;	
		const ws = new WebSocket("ws://211.238.142.93/web/echo");
		
		ws.onopen = function(e) {
			
		};

		//서버로부터 메시지 수신
		ws.onmessage = function(e) {
			var data = JSON.parse(e.data);
			//if(!str.indexOf("/member/chat")){
			//잠시 notification 설정을 위해 조건문 바꿈
			
				if (!"Notification" in window) {
					alert("This browser does not support desktop notification");
				} else if (Notification.permission === "granted") {
					var n = new Notification(data.content);
					/*setTimeout(n.close.bind(n), 4000);*/
				} else if (Notification.permission !== 'denied') {
					Notification.requestPermission(function(permission) {
	
						if (!('permission' in Notification)) {
							Notification.permission = permission;
						}
	
						if (permission === "granted") {
							var n = new Notification(data.content);
							//var n = new Notification(e.data);
							/*setTimeout(n.close.bind(n), 4000);*/
						}
					});
				}
			//}
			//else {
			if(str.indexOf("/member/chat")){
				var prevRegDate = chatWindow.lastElementChild.querySelector("span");
				var regDate = new Date(data.date);
				var rd = regDate.getHours()+":"+(regDate.getMinutes()>=10 ? regDate.getMinutes() : "0"+regDate.getMinutes());
				if(prevRegDate.textContent != rd){
					var row = document.createElement("div");
					row.classList.add( 'row', 'chat-date' );
					var p = document.createElement("p");
					p.textContent = regDate.getMonth()+"월"+regDate.getDate()+"일";
				}
				
				if ('content' in template) {
					var clone = document.importNode(template.content, true);
					
					var row = clone.querySelector(".row");
					var role;
					if(data.role == "ROLE_TEACHER")
						role = "선생님";
					if(data.role == "ROLE_STUDENT")
						role = "학생";
					
					row.querySelector("h5").textContent = role;
					var div = row.querySelector("div");
	
					div.querySelector("p").textContent = data.content;
					div.querySelector("span").textContent = rd;
					chatWindow.appendChild(clone);
					chatWindow.scrollTop = chatWindow.scrollHeight;
				}
			}
		};

		ws.onerror = function(event) {
			console.log("Server error message: ", event.data);
		}
		
		if(submitButton!=null){
			submitButton.onclick = function(e) {
				var chatMessage = document.querySelector(".chat-message").firstElementChild;
				var mr = chatMessage.nextElementSibling;
				if(chatMessage ==  ""){
					alert("내용을 입력해주세요");
					e.preventDefault();
				} else{
					var json = {
						/*<security:authentication property="name"/>*/	
						content : chatMessage.value,
						role : mr.value,
						date : Date.now()
					};
					ws.send(JSON.stringify(json));
				}
				document.querySelector(".chat-message").firstElementChild.value = "";
			}
		}
});