/**
 * 
 */

const ws = new WebSocket("ws://211.238.142.93/web/echo");
window.addEventListener("load", function() {

					var submitButton = document
							.querySelector('.chat-message input[type="button"]');
					var template = document.querySelector('template');
					var chatWindow = document.querySelector('.chat-wrapper');
					var firstCheck = false;
					var notification = null;
					var data = null;
					var win = null;
					if (chatWindow != null)
						chatWindow.scrollTop = chatWindow.scrollHeight;
					var str = location.pathname;
					// const ws = new
					// WebSocket("ws://211.238.142.93/web/resource/chat-server");
					// const ws = new WebSocket("ws://localhost/web/echo");

					function getContextPath() {
						var offset = location.href.indexOf(location.host)
								+ location.host.length;
						var ctxPath = location.href.substring(offset,
								location.href.indexOf('/', offset + 1));
						return ctxPath;
					}

					var notificationWindow = function(data, role) {
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
						console.log(getContextPath()
								+ "/resource/images/student-icon.png");
						if (role == "선생님")
							notiImg.src = getContextPath()
									+ "/resource/images/teacher-icon.png";
						if (role == "학생")
							notiImg.src = getContextPath()
									+ "/resource/images/student-icon.png";
						notiImg.style.width = "50px";
						notiImgContainer.appendChild(notiImg);

						var notiRoleContainer = document.createElement("span");
						var notiContentContainer = document
								.createElement("span");
						var content = data.content;
						notiRoleContainer.textContent = role;
						notiContentContainer.textContent = content.replace(
								/[<]br[/][>]/gi, " ");
						notiText.appendChild(notiRoleContainer);
						notiText.appendChild(notiContentContainer);

						notification.appendChild(notiImgContainer);
						notification.appendChild(notiText);
						document.body.appendChild(notification);
						setTimeout(function() {
							notification.style.height = "0px";
							/* notification.style.opacity="0"; */
							setTimeout(function() {
								document.body.removeChild(notification)
							}, 1000);
						}, 3000);
						notification.onclick = function(evt) {
							location.href = getContextPath() + "/member/chat";
							document.body.removeChild(notification);
						}
					}

					ws.onopen = function(e) {
						/* setTimeout(function(), 3000); */

					};

					// 서버로부터 메시지 수신
					ws.onmessage = function(e) {
						var data = JSON.parse(e.data);
						// if(!str.indexOf("/member/chat")){
						// 잠시 notification 설정을 위해 조건문 바꿈
						
						var msgType = data.msgType;
						console.log(msgType);
						if(msgType == "chat"){
							var role;
							if (data.role == "ROLE_TEACHER")
								role = "선생님";
							if (data.role == "ROLE_STUDENT" || data.role == "ROLE_CLASSPRESIDENT")
								role = "학생";

							notificationWindow(data, role);
	
							/*
							 * if (!("Notification" in window)) { alert("This
							 * browser does not support desktop notification"); }
							 * else if (Notification.permission === "granted") { var
							 * n = new Notification(data.content);
							 * console.log(data.content);
							 * setTimeout(n.close.bind(n), 4000); } else if
							 * (Notification.permission !== 'denied') {
							 * Notification.requestPermission(function(permission) {
							 * 
							 * if (!('permission' in Notification)) {
							 * Notification.permission = permission; }
							 * 
							 * if (permission === "granted") { var n = new
							 * Notification(data.content); //var n = new
							 * Notification(e.data); setTimeout(n.close.bind(n),
							 * 4000); } }); }
							 */
							// }
							// else {
							
							if (str.indexOf("/member/chat")>0) {
								var prevRegDates = chatWindow
										.querySelectorAll(".row.chat-date");
								if(prevRegDates.length>0)
									prevRegDate = prevRegDates[prevRegDates.length - 1].firstElementChild.textContent;
								else
									prevRegDate = prevRegDates[0].firstElementChild.textContent;
								prevRegDate = prevRegDate.replace(/(\s*)/g, "");
	
								console.log(prevRegDate);
								var regDate = new Date(data.date);
								var rd = regDate.getHours()
										+ ":"
										+ (regDate.getMinutes() >= 10 ? regDate
												.getMinutes() : "0"
												+ regDate.getMinutes());
	
								if (prevRegDate != (regDate.getMonth() + 1) + "월"
										+(regDate.getDate() >= 10 ? regDate
												.getDate() : "0"
													+ regDate.getDate()) + "일") {
									var row = document.createElement("div");
									row.classList.add('row', 'chat-date');
									var p = document.createElement("p");
									p.textContent = (regDate.getMonth() + 1) + "월 "
											+ regDate.getDate() + "일";
									row.appendChild(p);
									chatWindow.appendChild(row);
								}
	
								if ('content' in template) {
									var clone = document.importNode(
											template.content, true);
	
									var row = clone.querySelector(".row");
	
									row.querySelector("h5").textContent = role;
									var div = row.querySelector("div");
	
									// div.querySelector("p").textContent =
									// data.content;
									div.querySelector("p").innerHTML = data.content;
									div.querySelector("span").textContent = rd;
									chatWindow.appendChild(clone);
									chatWindow.scrollTop = chatWindow.scrollHeight;
								}
							}
						}
						if(msgType == "push"){
							if(data.role == "teacher"){
								if(data.content == "start"){
									if (win == null)
										win = open(getContextPath() + "/resource/js/complete.jsp?start-time="+Date.parse(data.date), "_blank", "width=400px, height=300px, menubar=no, toolbar=0, location=no, status=no, scrollbars=0, resizable=no");
								}
								else {
									console.log("창 꺼라");
									win.close();
								}
							}
							if(data.role == "student"){
								console.log("학생에게서 온 메시지");
								var eventLabel = document.querySelector(".event-label-box")
								.querySelectorAll("label");
								eventLabel[2].firstElementChild.textContent = parseInt(eventLabel[2].firstElementChild.textContent)+1;
								var seat = document.querySelector("#"+data.memberId);
								seat.style.background="url('"+getContextPath()+"/resource/images/completemonitor.png')";
								seat.style.color = "#990b0d";
							}
							//child.document.getElementById("start-time").value = data.date;
							/*console.log(win.document.getElementById("start-time"));*/
						}
					};

					ws.onerror = function(event) {
						console.log("Server error message: ", event.data);
					}

					if (submitButton != null) {
						var chatMessage = document
								.querySelector(".chat-message").firstElementChild;
						function chatSend(evt) {
							var mr = chatMessage.nextElementSibling;

							var json = {
								/* <security:authentication property="name"/> */
								content : chatMessage.value,
								role : mr.value,
								msgType : "chat",
								date : Date.now()
							};
							ws.send(JSON.stringify(json)); // JSON 객체를 문자열로 바꾸는
															// 것

							document.querySelector(".chat-message").firstElementChild.value = "";
						}
						submitButton.onclick = function(e) {
							if (chatMessage.value == "") {
								alert("내용을 입력해주세요");
								e.preventDefault();
							} else {
								chatSend(e);
							}
						}

						chatMessage.onkeyup = function(e) {
							if (window.event.keyCode == 13) {
								if (chatMessage.value == "\n") {
									alert("내용을 입력해주세요");
									e.preventDefault();
								} else {
									chatSend(e);
								}
							}
						}

					}
});