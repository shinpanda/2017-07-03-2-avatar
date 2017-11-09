<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main class="main">
<div class="board-style">
	<form method="post">
		<div class="reg-container">
			<div class="reg-wrapper">
				<input type="text" name="title" placeholder="제목을 입력하세요" required>
				<div class="content-wrapper">
					<div class="reg-style-btn-container">
						<div class="reg-style-btn-wrapper">
							<ul>
								<li><select class="font-size">
										<option value="8">8pt</option>
										<option value="9">9pt</option>
										<option value="10">10pt</option>
										<option value="11">11pt</option>
										<option value="12">12pt</option>
										<option value="14" selected="selected">14pt</option>
										<option value="16">16pt</option>
										<option value="18">18pt</option>
										<option value="24">24pt</option>
										<option value="36">36pt</option>
								</select></li>
							</ul>
							<ul class="reg-style-btn-ul1">
								<li><button class="reg-style-btn" type="button"
										value="bold">
										<b>B</b>
									</button></li>
								<li><button class="reg-style-btn" type="button"
										value="italic">
										<i>i</i>
									</button></li>
								<li><button class="reg-style-btn" type="button"
										value="underline">
										<u>U</u>
									</button></li>
							</ul>
							<ul class="reg-style-btn-ul2">
								<li>
									<button class="reg-style-btn fore-color" type="button"
										value="foreColor" style="color: red">A</button> <input
									type="color" id="fore-color-btn" style="display: none" />
								</li>
								<li class="color-btn fore-color"><span>▼</span></li>

								<li>
									<button class="reg-style-btn back-color" type="button"
										value="backColor" style="background: yellow">A</button> <input
									type="color" id="back-color-btn" style="display: none" />
								</li>
								<li class="color-btn back-color"><span>▼</span></li>
							</ul>
							<ul class="sort-btn-wrapper">
								<li role="justifyLeft"><img
									src="../../resource/images/if_align-left_2561323 (1).png"
									class="img-btn" alt="왼쪽정렬" id="justifyLeft" /></li>
								<li value="justifyCenter"><img
									src="../../resource/images/if_align-center_2561319 (1).png"
									class="img-btn" alt="가운데정렬" id="justifyCenter" /></li>
								<li value="justifyRight"><img
									src="../../resource/images/if_align-right_2561324 (1).png"
									class="img-btn" alt="오른쪽정렬" id="justifyRight" /></li>
							</ul>
							<ul>
								<li><img
									src="../../resource/images/if_icon-image_211677.png"
									class="img-btn" id="pic-btn" /> <input type="file" id="pic"
									name="pic" accept=".jpg, .jpeg, .png" style="display: none;" /></li>
								<li>
								<img
									src="../../resource/images/if_icon_set_outlinder-12_2519681 (1).png"
									class="img-btn" id="link" />
									<div id="linkbox" class="link-box" style="display:none">
										<span>링크를 입력하세요</span> <input type="text" id="link-url"/>
										<input type="button" value="Link" id="link-reg" />
									</div>
								</li>

							</ul>
							<ul>
								<li><input type="button" value="html" class="html-btn"></li>
							</ul>

						</div>
					</div>
					<div id="content" class="reg-content" contenteditable="true"
						spellcheck="false" required></div>
				</div>
			</div>

			<div class="reg-btn-container">
				<input type="hidden" name="content" /> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}"> <input
					type="submit" class="btn reg-btn" value="등록" />
				<button type="button" onclick="history.back()"
					class="btn reg-btn reg-cancel">취소</button>
			</div>
		</div>

	</form>
	<script>
	
	

		 
		    
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
			//console.log(fontSize.value);
			//document.execCommand('fontSize', false, fontSize.value);
			var span = document.createElement("span");
			span.textContent = document.getSelection();
			span.style.fontSize = fontSize.value + "pt";
			exec('insertHTML', span.outerHTML);
		}

		var sortButton = document.querySelector(".sort-btn-wrapper");

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

				var formData = new FormData();
				formData.append("now", "" + d);
				formData.append("file", file);

				var xhr = new XMLHttpRequest(); // XML을 HTTP으로 요청을 보내고 응답을 받을 수 있는 도구
				xhr.upload.onprogress = function(e) {

				};

				xhr.upload.onloadend = function(e) {
					var content = document.querySelector('#content');
					var img = document.createElement('img');
					//img.src = 'http://i.huffpost.com/gen/5524070/thumbs/o-THE-570.jpg?3'+d+file.name;
					//img.src = 'http://i.huffpost.com/gen/5524070/thumbs/o-THE-570.jpg?3';
					img.src = '../../resource/upload/' + d + file.name;
					content.appendChild(img);
				}

				xhr.upload.onload = function(e) {
				};

				xhr.onerror = function(e) {
					alert("예기치 못한 오류가 발생하였습니다.");
				};
				xhr.open("POST",
						"../../upload?${_csrf.parameterName}=${_csrf.token}",
						true); // 데이터를 요청하기 위한 설정 // 세번째 파라메터 -> 비동기(true) or 동기(false) 설정
				xhr.send(formData);
			};
		};

		function exec(value, param) {
			document.execCommand(value, false, param);
		}
		;
	
		
		/* 		 function createLink() {
		
	        var url =;
	
	        if (url)
	            document.execCommand(“createlink”, false, url);
	
	    } */
	
		var linkBtn = document.querySelector('#link');
		var linkReg = document.querySelector("#link-reg");
		var text="";
		var selection = {anchorNode:null, anchorOffset:null, focusNode:null, focusOffset:null};
		linkBtn.onclick = function() {
			selection = {anchorNode:document.getSelection().anchorNode, anchorOffset:document.getSelection().anchorOffset, focusNode:document.getSelection().focusNode, focusOffset:document.getSelection().focusOffset};//.anchorNode;
			console.log(selection);
			text = document.getSelection().toString();
			
			document.getElementById("linkbox").style.display = "flex";
		}
	
		linkReg.onclick = function() {
			var url=document.querySelector("#link-url");
			var aTag = document.createElement("a");
			
			if(document.getSelection().anchorNode.nodeName=="DIV"){
				document.getSelection().setBaseAndExtent(selection.anchorNode, selection.anchorOffset,selection.focusNode,selection.focusOffset);
				aTag.textContent = text; }
			aTag.textContent = document.getSelection();
			aTag.href = url.value;
			exec('insertHTML', aTag.outerHTML);
			document.getElementById("linkbox").style.display = "none";
			
		}
	
	
	
		var foreColorBtn = document.querySelector("#fore-color-btn");
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
				var btn = document.querySelector(".reg-style-btn.fore-color");
				foreColor = foreColorBtn.value;
				btn.style.color = foreColor;
				exec('foreColor', foreColor);
			}
		}

		var backColor = "yellow";
		var backColorBtn = document.querySelector("#back-color-btn");
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
				var btn = document.querySelector(".reg-style-btn.back-color");
				backColor = backColorBtn.value;
				btn.style.background = backColor;
				exec('backColor', foreColor);
			}
		}

		var btnWrapper = document.querySelector('.reg-style-btn-ul1');
		btnWrapper.onclick = function(e) {
			if (check == true)
				return;
			var value = e.target.value;
			if (e.target.nodeName != 'BUTTON') {
				value = e.target.parentNode.value;
			}
			document.execCommand(value, false, null);
		};

		var btnWrapper2 = document.querySelector('.reg-style-btn-ul2');
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
			var input = document.querySelector('input[name="content"]');
			//var content = document.querySelector("#content");
			if (content.innerHTML == "") {
				alert("내용을 입력하세요.");
				e.preventDefault();
			}
			if (check == true)
				content.innerHTML = content.textContent;
			input.value = content.innerHTML;
		};
	</script>

</div>
</main>