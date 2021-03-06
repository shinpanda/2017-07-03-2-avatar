<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:importAttribute name="memberRole"/>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

	
	window.addEventListener("load", function(){		
	
		var changeButton =document.getElementById("change");
		
		var pickButton =document.getElementById("pick");
		var delButton =document.getElementById("del");
					
		var container =document.querySelector("#area");
		
		//var span = document.createElement("span");
		
				
		var b1 = ${col};
		var b2 = ${row};
		
			
		var xhr = new XMLHttpRequest();
					
		xhr.onload = function(e){
		var count = 0;
		for(j=1; j<=b2; j++){
			var div = document.createElement("div");
			//console.log("b2:"+j);
			container.appendChild(div);
			for (i = 1; i <= b1; i++) {
				var member =JSON.parse(e.target.responseText);
				if(count < member.length){
					var li = document.createElement("span");
					li.textContent = member[count];
					li.className = "seat";
					div.appendChild(li);
				}
				else {
					var li = document.createElement("span");
					li.textContent = "";
					li.className = "seat";
					div.appendChild(li);
				}
									 
				count ++;
			}
							
		};
					
		};
					
		xhr.open("GET", "../student/seat-info-ajax?${_csrf.parameterName}=${_csrf.token}"); 
		xhr.send(); 
			
		if(changeButton!=null){
			changeButton.onclick = function(){
				if (confirm("자리를 바꾸시겠습니까") == true){  
	
					while(container.hasChildNodes()){
						container.removeChild(container.firstChild); 
						
					}
					var xhr = new XMLHttpRequest();
						
					 xhr.onload = function(e){
						 var count = 0;
						 for(j=1; j<=b2; j++){
								var div = document.createElement("div");
								//console.log("b2:"+j);
								container.appendChild(div);
								 for (i = 1; i <= b1; i++) {
									
										var member =JSON.parse(e.target.responseText);
										 if(count < member.length){
											 var li = document.createElement("span");
											 li.textContent = member[count];
											 li.className = "seat";
											 div.appendChild(li);
										 }
										 else {
											 var li = document.createElement("span");
											 li.textContent = "";
											 li.className = "seat";
											 div.appendChild(li);
										 }
										 //console.log("b1:"+i);
										 /* var span = document.createElement("span");
										 span.className = "seat";
										 span.textContent ="test";
										 div.appendChild(span); */
										 //tag+= 'span.appendChild(txt);';
										 count ++;
								}
								 //tag += "<br/>";		    
							};
						/* var member =JSON.parse(e.target.responseText);
						
						for(var i =0; i<member.length; i++){
							 var li = document.createElement("span");
							 li.textContent = member[i];
							 li.className = "seat";
							 container.appendChild(li);
						};	  */
					 };
						
					xhr.open("GET", "../student/seat-change-ajax?${_csrf.parameterName}=${_csrf.token}"); 
					xhr.send(); 
				}else{  
				    return;
				}
	
			
			
			/* 
			changeButton.disabled = 'true';
			pickButton.disabled = 'true'; */
			
			
			//console.log(tag);
			//container.innerHTML = tag; 
			
			
			/* for(var i =0; i< data.length; i++){
				var span = document.createElement("span");
				 span.textContent = member[i];
				 container.appendChild(span);
			 } */
			
			};
			
		}
		
			
			
			
			pickButton.onclick = function(){
				
				 var spans = container.querySelectorAll("span");
				 
				 var i = 0;
				while(i < spans.length){
					spans[i].style.background="url('${ctx}/resource/images/monitor.png')"; 
					spans[i].style.color="black";
					spans[i].style.fontWeight="normal";
					spans[i].style.fontSize="initial";
										
					i++;
				}
				
				 
				/* for(j=1; j<=b2; j++){
					var div = document.createElement("div");
					
					container.appendChild(div);
						for (i = 1; i <= b1; i++) {								
							var li = document.createElement("span");									 
							li.className = "seat";
							div.appendChild(li);
						}	
				}
				 */
				 				 
				//var spans = container.querySelectorAll("span");
				var index = Math.floor(Math.random()*spans.length);
				spans[index].style.background="url('${ctx}/resource/images/completemonitor.png')";
				spans[index].style.color="#990000";
				spans[index].style.fontWeight="bold";
				spans[index].style.fontSize="25px";
				
				/* 
				while(container.hasChildNodes()){
					container.removeChild(container.firstChild); 
					
				} */

								
				/* changeButton.disabled = 'true';
				pickButton.disabled = 'true';		 */ 
								
			};	
			
			
			
		});
	
</script>
</head>


<body>
	<main class="main">
	<h1>자리 현황</h1>
	<div class="seat-container">

	
		<div id ="top" style="display:flex; height:70px;">
					
					
					<div id="button">
					<c:if test="${memberRole eq 'ROLE_CLASSPRESIDENT'}">
					 	<input type="button" class="seat-btn seat-btn-primary seat-btn-lg raised" value="자리바꾸기" id="change" />
					 </c:if>					 	
					 	<input type="button" class="seat-btn seat-btn-primary seat-btn-lg raised" value="오늘의 당첨자" id="pick"/>
					 						 	
					</div>	

		

		</div>

		<div id="bottom"
			style="height: -webkit-fill-available; margin-left: 75px;">
			<div id="area" style="height: -webkit-fill-available;">
				<!-- <span id="seat"></span>  -->

			</div>
		</div>
		
	</div>
	</main>
</body>