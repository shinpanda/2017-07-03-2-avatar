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
							<div>
								<!-- button은 뒤로 넘어감.. 원인 찾아볼것 -->
								<button class="reg-style-btn" type="button" value="bold">
									<b>B</b>
								</button>
								<button class="reg-style-btn" type="button" value="italic">
									<i>i</i>
								</button>
								<button class="reg-style-btn" type="button" value="underline">
									<u>U</u>
								</button>
							</div>

							<span class="reg-style-btn">color</span> <input type="color" />
							<input type="button" value="Link"> 
							<img src="../../resource/images/imagebtn.png" class="img-btn"/> 
							<input type="file" id="pic" name="pic"
								accept=".jpg, .jpeg, .png" style="display:none;"/>
							<input type="button" value="html">	
								
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
		.querySelector('.reg-style-btn-wrapper > input[value="html"]');
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
	
		var imgButton = document.querySelector('#pic');
			
		imgButton.onchange = function() {
			var file = imgButton.files[0];
			var d = Date.now();
			
			var formData = new FormData();
			formData.append("now", ""+d);
			formData.append("file", file);
			
			var xhr = new XMLHttpRequest(); // XML을 HTTP으로 요청을 보내고 응답을 받을 수 있는 도구
			xhr.upload.onprogress = function(e) {
				
			};
			
			xhr.upload.onloadend = function(e) {
				var content = document.querySelector('#content');
				var img = document.createElement('img');
				//img.src = 'http://i.huffpost.com/gen/5524070/thumbs/o-THE-570.jpg?3'+d+file.name;
				//img.src = 'http://i.huffpost.com/gen/5524070/thumbs/o-THE-570.jpg?3';
				img.src = '../../resource/upload/'+d+file.name;
				content.appendChild(img);
			}
			
			xhr.upload.onload = function(e) {
			};
			
			xhr.onerror = function(e) {
				alert("예기치 못한 오류가 발생하였습니다.");	
			};
			xhr.open("POST","../../upload?${_csrf.parameterName}=${_csrf.token}", true); // 데이터를 요청하기 위한 설정 // 세번째 파라메터 -> 비동기(true) or 동기(false) 설정
			xhr.send(formData);
		};
		
		var sb = document.querySelector('.reg-btn-container input[type="submit"]');
		sb.onclick = function(e) {
			var input = document.querySelector('input[name="content"]');
			//var content = document.querySelector("#content");
			if(content.innerHTML == ""){
				alert("내용을 입력하세요.");
				e.preventDefault();
			}
			input.value = content.innerHTML;
		};
		var btnWrapper = document.querySelector('.reg-style-btn-wrapper');
		btnWrapper.onclick = function(e) {
			var value = e.target.value;
			if (e.target.nodeName != 'BUTTON') {
				value = e.target.parentNode.value;
			}
			document.execCommand(value, false, null);

		};

		
	</script>

</div>
</main>