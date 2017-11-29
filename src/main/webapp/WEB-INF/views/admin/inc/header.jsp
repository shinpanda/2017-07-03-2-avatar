<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<header class="header">
			<h1 class="logo">
				<a href="${ctx}/admin/board">Avatar Admin Page</a>
			</h1>
			<div class="member-info-container">
				<div class="member-info-wrapper">
					<h2 class="hidden">멤버 정보</h2>
					<div></div>
					<div>					
					</div>
				</div>
			</div>
			<section class="menu-container">
				<h1 class="hidden">메뉴</h1>
				<nav class="menu-wrapper">
					<h1 class="hidden">메인메뉴</h1>
					<ul class="main-menu">
						<li><a href="${ctx}/admin/board">게시판관리<img src="${ctx}/resource/images/board.png"></a></li>
						<li>
							<a href="${ctx}/admin/member">회원관리<img src="${ctx}/resource/images/user.png"></a>
							<ul class="sub-menu hidden">
								<li><a href="${ctx}/admin/member">회원관리</a></li>
								<li><a href="${ctx}/admin/member/teacher">선생님관리</a></li>
							</ul>	
						</li>
						<li>
							<a href="${ctx}/admin/class">강의관리</a>
							<ul class="sub-menu hidden">
								<li><a href="${ctx}/admin/class">강의관리</a></li>
								<li><a href="${ctx}/admin/class/lecture-room">강의실관리</a></li>
							</ul>						
						</li>
					</ul>
					<script>
						var str = location.pathname;
						var index = str.indexOf('/', 3);
						var res = str.substr(index+1);
						
						var onLink = "a[href*='"+res+"']";
						var onLinks = document.querySelectorAll(onLink);
						for(var i in onLinks){
							if(typeof onLinks[i].parentNode!="undefined"){
								onLinks[i].parentNode.parentNode.classList.remove('hidden');
								onLinks[i].classList.add('on');
							}
						}
					</script>
				</nav>
				<nav id="member-menu" class="member-menu">
					<h1 class="hidden">회원메뉴</h1>
					<ul>
						<li><a href="${ctx}/member/mypage">마이페이지</a></li>
						<li><form action="${ctx}/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="submit" value="로그아웃" class="logout-btn"/>
							
							</form></li>
						
					</ul>
				</nav>
			</section>
		</header>