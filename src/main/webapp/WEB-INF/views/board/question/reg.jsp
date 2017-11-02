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
							<button class="reg-style-btn" type="button" value="bold"><b>B</b></button>
							<button class="reg-style-btn" type="button" value="italic"><i>i</i></button> 
							<button class="reg-style-btn" type="button" value="underline"><u>U</u></button>
						</div>	
						
						<span class="reg-style-btn">color</span>
						<input type="color"/>
						 <input
							type="button" value="Link"> <input type="button"
							value="html">
						</div>
					</div>
					<div id="content" class="reg-content" contenteditable="true" spellcheck="false" ></div>
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
		var btnWrapper = document.querySelector('.reg-style-btn-wrapper');
		btnWrapper.onclick = function(e) {
			var value = e.target.value;
			if(e.target.nodeName!='BUTTON'){
				value = e.target.parentNode.value;
			}
			document.execCommand(value, false, null);
			 
		};
		
	</script>

</div>
</main>