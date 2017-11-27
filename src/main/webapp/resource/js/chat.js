/**
 * 
 */

window.addEventListener("load", function() {
		var submitButton = document
				.querySelector('.chat-message input[type="button"]');
		var template = document.querySelector('template');
		var chatWindow = document.querySelector('.chat-wrapper');
		var firstCheck = false;
		var notification = null;
		var data = null;
		if(chatWindow != null)
			chatWindow.scrollTop = chatWindow.scrollHeight;
		var str = location.pathname;	
		const ws = new WebSocket("ws://211.238.142.93/web/echo");
		//const ws = new WebSocket("ws://211.238.142.93/web/resource/chat-server");
		//const ws = new WebSocket("ws://localhost/web/echo");
		
		function getContextPath(){
		    var offset=location.href.indexOf(location.host)+location.host.length;
		    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
		    return ctxPath;
		}

		var notificationWindow = function(data, role){
			notification = document.createElement("div");
			notification.id = "chat-notifi";
			var notiIdImg = document.createElement("div");
			notiIdImg.className = "chat-img-wrapper";
			var notiText = document.createElement("div");
			notiText.className = "chat-text-container";
		
			var notification = document.createElement("div");
			notification.id = "chat-notifi";
			var notiImgContainer = document.createElement("div");
			notiImgContainer.className = "chat-img-wrapper";
			var notiText = document.createElement("div");
			notiText.className = "chat-text-container";
			
			var notiImg = document.createElement("img");
			console.log(getContextPath()+"/resource/images/student-icon.png");
			if(role == "선생님")
				notiImg.src = getContextPath()+"/resource/images/teacher-icon.png";
			if(role == "학생")
				notiImg.src = getContextPath()+"/resource/images/student-icon.png";
			notiImg.style.width="50px";
			notiImgContainer.appendChild(notiImg);
			
			var notiRoleContainer = document.createElement("span");
			var notiContentContainer = document.createElement("span");
			notiRoleContainer.textContent = role;
			notiContentContainer.textContent = data.content;
			notiText.appendChild(notiRoleContainer);
			notiText.appendChild(notiContentContainer);
			
			
			notification.appendChild(notiImgContainer);
			notification.appendChild(notiText);
			document.body.appendChild(notification);
			setTimeout(
					function() {
						notification.style.height="0px";
/*						notification.style.opacity="0";*/
						setTimeout(function() {document.body.removeChild(notification)}, 1000);
					}
					, 3000);
			notification.onclick = function(evt) {
				location.href=getContextPath()+"/member/chat";
				document.body.removeChild(notification);
			}
		}
		
		
		
		ws.onopen = function(e) {
/*			setTimeout(function(), 3000);*/

		};

		//서버로부터 메시지 수신
		ws.onmessage = function(e) {
			var data = JSON.parse(e.data);
			//if(!str.indexOf("/member/chat")){
			//잠시 notification 설정을 위해 조건문 바꿈
			var role;
			if(data.role == "ROLE_TEACHER")
				role = "선생님";
			if(data.role == "ROLE_STUDENT")
				role = "학생";
			
			
			notificationWindow(data, role);
			

			/*if (!("Notification" in window)) {
				alert("This browser does not support desktop notification");
			} else if (Notification.permission === "granted") {
				var n = new Notification(data.content);
				console.log(data.content);
				setTimeout(n.close.bind(n), 4000);
			} else if (Notification.permission !== 'denied') {
				Notification.requestPermission(function(permission) {

					if (!('permission' in Notification)) {
						Notification.permission = permission;
					}

					if (permission === "granted") {
						var n = new Notification(data.content);
						//var n = new Notification(e.data);
						setTimeout(n.close.bind(n), 4000);
					}
				});
			} */
			//}
			//else {
			if(str.indexOf("/member/chat")){
				var prevRegDates = chatWindow.querySelectorAll(".row.chat-date");
				prevRegDate = prevRegDates[prevRegDates.length-1].firstElementChild.textContent;
				prevRegDate = prevRegDate.replace( /(\s*)/g, "");

				console.log(prevRegDate);
				var regDate = new Date(data.date);
				var rd = regDate.getHours()+":"+(regDate.getMinutes()>=10 ? regDate.getMinutes() : "0"+regDate.getMinutes());

				if(prevRegDate != (regDate.getMonth()+1)+"월"+regDate.getDate()+"일"){
					var row = document.createElement("div");
					row.classList.add( 'row', 'chat-date' );
					var p = document.createElement("p");
					p.textContent = (regDate.getMonth()+1)+"월 "+regDate.getDate()+"일";
					row.appendChild(p);
					chatWindow.appendChild(row);
				}
				
				if ('content' in template) {
					var clone = document.importNode(template.content, true);
					
					var row = clone.querySelector(".row");
					
					row.querySelector("h5").textContent = role;
					var div = row.querySelector("div");
	
					//div.querySelector("p").textContent = data.content;
					div.querySelector("p").innerHTML = data.content;
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