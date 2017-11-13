window
		.addEventListener(
				"load",
				function() {
					var btnHtml = document
							.querySelector('.reg-style-btn-wrapper input[value="html"]');
					var check = false;
					btnHtml.onclick = function() {
						var content = document.querySelector('#content');
						if (check == false) {
							content.textContent = content.innerHTML;
							check = true;
						} else {
							content.innerHTML = content.textContent;
							check = false;
						}
					};

					var fontSize = document.querySelector(".font-size");
					fontSize.onchange = function() {
						if (check == true)
							return;
						// console.log(fontSize.value);
						// document.execCommand('fontSize', false,
						// fontSize.value);
						var span = document.createElement("span");
						span.textContent = document.getSelection();
						span.style.fontSize = fontSize.value + "pt";
						exec('insertHTML', span.outerHTML);
					}

					var sortButton = document
							.querySelector(".sort-btn-wrapper");

					sortButton.onclick = function(e) {
						if (check == true)
							return;
						var select = "";
						var id = e.target.id;
						if (e.target.nodeName != 'IMG') {
							id = e.target.querySelector('IMG').id;
						}
						document.execCommand(id, false, null);
					}

					var imgButton = document.querySelector('#pic');
					var imgProxy = document.querySelector('#pic-btn');

					imgProxy.onclick = function(e) {
						if (check == true)
							return;
						var event = new MouseEvent("click", {
							'view' : window,
							'bubbles' : true,
							'cancelable' : true
						});
						imgButton.dispatchEvent(event);
						imgButton.onchange = function(e) {
							if (check == true)
								return;
							var file = imgButton.files[0];
							var d = Date.now();
							var csrfParameter = document.querySelector("meta[name='_csrf_parameter']").content;
							var csrfToken = document.querySelector("meta[name='_csrf']").content;

							var formData = new FormData();
							formData.append("now", "" + d);
							formData.append("file", file);

							var xhr = new XMLHttpRequest(); // XML을 HTTP으로 요청을
															// 보내고 응답을 받을 수 있는
															// 도구
							xhr.upload.onprogress = function(e) {

							};

							xhr.upload.onloadend = function(e) {
								var content = document
										.querySelector('#content');
								var img = document.createElement('img');
								// img.src =
								// 'http://i.huffpost.com/gen/5524070/thumbs/o-THE-570.jpg?3'+d+file.name;
								// img.src =
								// 'http://i.huffpost.com/gen/5524070/thumbs/o-THE-570.jpg?3';
								img.src = '../../resource/upload/' + d
										+ file.name;
								content.appendChild(img);
							}

							xhr.upload.onload = function(e) {
							};

							xhr.onerror = function(e) {
								alert("예기치 못한 오류가 발생하였습니다.");
							};
							xhr.open("POST", "../../upload?"+csrfParameter+"="+csrfToken,
											true); // 데이터를 요청하기 위한 설정 // 세번째
							/* "../../upload?${_csrf.parameterName}=${_csrf.token}" */
													// 파라메터 -> 비동기(true) or
													// 동기(false)
							// 설정
							xhr.send(formData);
						};
					};

					function exec(value, param) {
						document.execCommand(value, false, param);
					}
					;

					/*
					 * function createLink() {
					 * 
					 * var url =;
					 * 
					 * if (url) document.execCommand(“createlink”, false, url); }
					 */

					var linkBtn = document.querySelector('#link');
					var linkReg = document.querySelector("#link-reg");
					var text = "";
					var selection = {
						anchorNode : null,
						anchorOffset : null,
						focusNode : null,
						focusOffset : null
					};
					linkBtn.onclick = function() {
						selection = {
							anchorNode : document.getSelection().anchorNode,
							anchorOffset : document.getSelection().anchorOffset,
							focusNode : document.getSelection().focusNode,
							focusOffset : document.getSelection().focusOffset
						};// .anchorNode;
						console.log(selection);
						text = document.getSelection().toString();

						document.getElementById("linkbox").style.display = "flex";
					}

					linkReg.onclick = function() {
						var url = document.querySelector("#link-url");
						var aTag = document.createElement("a");

						if (document.getSelection().anchorNode.nodeName == "DIV") {
							document.getSelection().setBaseAndExtent(
									selection.anchorNode,
									selection.anchorOffset,
									selection.focusNode, selection.focusOffset);
							aTag.textContent = text;
						}
						aTag.textContent = document.getSelection();
						aTag.href = url.value;
						exec('insertHTML', aTag.outerHTML);
						document.getElementById("linkbox").style.display = "none";

					}

					var foreColorBtn = document
							.querySelector("#fore-color-btn");
					var foreColorBtnWrapper = document
							.querySelector(".color-btn.fore-color");
					var foreColor = "red";
					foreColorBtnWrapper.onclick = function() {
						var event = new MouseEvent("click", {
							'view' : window,
							'bubbles' : true,
							'cancelable' : true
						});

						foreColorBtn.dispatchEvent(event);
						foreColorBtn.onchange = function(e) {
							var btn = document
									.querySelector(".reg-style-btn.fore-color");
							foreColor = foreColorBtn.value;
							btn.style.color = foreColor;
							exec('foreColor', foreColor);
						}
					}

					var backColor = "yellow";
					var backColorBtn = document
							.querySelector("#back-color-btn");
					var foreColorBtnWrapper = document
							.querySelector(".color-btn.back-color");
					foreColorBtnWrapper.onclick = function(e) {
						var event = new MouseEvent("click", {
							'view' : window,
							'bubbles' : true,
							'cancelable' : true
						});
						backColorBtn.dispatchEvent(event);
						backColorBtn.onchange = function() {
							var btn = document
									.querySelector(".reg-style-btn.back-color");
							backColor = backColorBtn.value;
							btn.style.background = backColor;
							exec('backColor', foreColor);
						}
					}

					var btnWrapper = document
							.querySelector('.reg-style-btn-ul1');
					btnWrapper.onclick = function(e) {
						if (check == true)
							return;
						var value = e.target.value;
						if (e.target.nodeName != 'BUTTON') {
							value = e.target.parentNode.value;
						}
						document.execCommand(value, false, null);
					};

					var btnWrapper2 = document
							.querySelector('.reg-style-btn-ul2');
					btnWrapper2.onclick = function(e) {
						if (check == true)
							return;
						var value = e.target.value;
						if (e.target.nodeName != 'BUTTON') {
							value = e.target.parentNode.value;
						}

						if (value == "foreColor")
							exec(value, foreColor);
						else
							exec(value, backColor);
					};

					var sb = document
							.querySelector('.reg-btn-container input[type="submit"]');

					sb.onclick = function(e) {
						var input = document
								.querySelector('input[name="content"]');
						// var content = document.querySelector("#content");
						if (content.innerHTML == "") {
							alert("내용을 입력하세요.");
							e.preventDefault();
						}
						if (check == true)
							content.innerHTML = content.textContent;
						input.value = content.innerHTML;
					};

				});