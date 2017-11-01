<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main class="main">
<div class="board-style">
	<form method="post">
		<div class="reg-container">
			<div class="reg-wrapper">
				<input type="text" name="title" placeholder="제목을 입력하세요" >
				<div class="content-wrapper">
					<div class="reg-style-btn-container">
						<div class="reg-style-btn-wrapper">
						<div>
						<!-- button은 뒤로 넘어감.. 원인 찾아볼것 -->
							<input class="reg-style-btn" type="button" value="bold"><b>B</b></input>
							<input class="reg-style-btn" type="button" value="italic"><i>i</i></input> 
							<input class="reg-style-btn" type="button" value="underline"><u>U</u></input>
							<button><b>B</b></button>
						</div>	
						
						<span class="reg-style-btn">color</span>
						<input type="color"/>
						 <input
							type="button" value="Link"> <input type="button"
							value="html">
						</div>
					</div>
					<div id="content" class="reg-content" contenteditable="true"></div>
				</div>
			</div>

			<div class="reg-btn-container">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}"> <input type="submit"
					class="btn reg-btn" value="등록" />
				<button type="button" onclick="history.back()"
					class="btn reg-btn reg-cancel">취소</button>
			</div>
		</div>

	</form>
	<script>
		// 할 일 1. var reg-style-btn-container에 이벤트 걸기
		// 버튼들 이미지로 변경

		var b1 = document
				.querySelector('.reg-style-btn-container > button[value="bold"]');
		b1.onclick = function() {
			alert('test');
			//document.execCommand('bold', false, null);
		}
		var b2 = document
				.querySelector('.reg-style-btn-container > button[value="italic"]');
		b2.onclick = function() {
			document.execCommand('italic', false, null);
		}
		var b3 = document
				.querySelector('.reg-style-btn-container > button[value="underline"]');
		b3.onclick = function() {
			document.execCommand('underline', false, null);
		}
		var b4 = document
				.querySelector('.reg-style-btn-container > input[value="U"]');
		b3.onclick = function() {
			document.execCommand('underline', false, null);
		}
	</script>

</div>
</main>