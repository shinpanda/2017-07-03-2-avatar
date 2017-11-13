<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<main class="main">
<div class="board-style reg-board">
	<form method="post">
		<div class="reg-container">
			<div class="reg-wrapper">
				<input type="text" name="title" placeholder="제목을 입력하세요" value="${b.title}" required>
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
									src="${ctx}/resource/images/if_align-left_2561323 (1).png"
									class="img-btn" alt="왼쪽정렬" id="justifyLeft" /></li>
								<li value="justifyCenter"><img
									src="${ctx}/resource/images/if_align-center_2561319 (1).png"
									class="img-btn" alt="가운데정렬" id="justifyCenter" /></li>
								<li value="justifyRight"><img
									src="${ctx}/resource/images/if_align-right_2561324 (1).png"
									class="img-btn" alt="오른쪽정렬" id="justifyRight" /></li>
							</ul>
							<ul>
								<li><img
									src="${ctx}/resource/images/if_icon-image_211677.png"
									class="img-btn" id="pic-btn" /> <input type="file" id="pic"
									name="pic" accept=".jpg, .jpeg, .png" style="display: none;" /></li>
								<li>
								<img
									src="${ctx}/resource/images/if_icon_set_outlinder-12_2519681 (1).png"
									class="img-btn" id="link" />
									<div id="linkbox" class="link-box" style="display:none">
										<span>링크를 입력하세요</span> <input type="text" id="link-url"/>
										<div>
											<input type="button" value="확인" id="link-reg" class="btn" />
											<input type="button" value="취소" id="link-cancel" class="btn" />
										</div>
									</div>
								</li>
							</ul>
							<ul>
								<li><input type="button" value="html" class="html-btn"></li>
							</ul>

						</div>
					</div>
					<div id="content" class="reg-content" contenteditable="true"
						spellcheck="false" required>${b.content}</div>
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
		<div class="img-edit-container" style="display:none;">
			<div>
				<label>너비 :</label>
				<input type="text" name="img-width"/>
			</div>
			<div>
				<label>높이 :</label>
				<input type="text" name="img-height"/>
			</div>
			<div class="img-edit-btn-wrapper">
				<input type="button" value="확인" id="img-edit-submit" class="btn img-edit-btn"/>
				<input type="button" value="취소" id="img-edit-cancel" class="btn img-edit-btn" />
			</div>
		</div>
	</form>
</div>
</main>