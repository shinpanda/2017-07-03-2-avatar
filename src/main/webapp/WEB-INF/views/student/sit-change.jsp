<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">


	window.addEventListener("load", function(){		
	
		var row =document.getElementById("row");
		var column =document.getElementById("column");
		
		var changeButton =document.getElementById("change");
		var resetButton =document.getElementById("reset");
		var pickButton =document.getElementById("pick");
					
		var container =document.querySelector("#area");
		
		//var span = document.createElement("span");

		
		
		
		
		
		changeButton.onclick = function(){
			var b1 = parseInt(row.value);
		    var b2 = parseInt(column.value);
				  
			var tag = "";
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
				
			xhr.open("GET", "../student/sit-change-ajax?${_csrf.parameterName}=${_csrf.token}"); 
			xhr.send(); 
			
			
			changeButton.disabled = 'true';
			
			
			//console.log(tag);
			//container.innerHTML = tag; 
			
			
			/* for(var i =0; i< data.length; i++){
				var span = document.createElement("span");
				 span.textContent = member[i];
				 container.appendChild(span);
			 } */
			
			};
			
			resetButton.onclick = function(){
				while(container.hasChildNodes()){
					container.removeChild(container.firstChild); 
					
				} 
				changeButton.disabled = false;
				pickButton.disabled = false;
				
			};
			
			
			
			pickButton.onclick = function(){
				/* var b1 = parseInt(row.value);
			    var b2 = parseInt(column.value);
				
					 
				for(j=1; j<=b2; j++){
					var div = document.createElement("div");							
					container.appendChild(div);
						for (i = 1; i <= b1; i++) {								
							var li = document.createElement("span");									 
							li.className = "seat";
							div.appendChild(li);
						}	
				}
				pickButton.disabled = 'true';		 */	
				 var xhr = new XMLHttpRequest();

				 xhr.onload = function(e){
				 	var div = document.createElement("div");
				 	container.appendChild(div);
				 	var member =JSON.parse(e.target.responseText);
				 	 var li = document.createElement("span");
				  	li.textContent = member[1];
				 	li.className = "seat";
				 	div.appendChild(li);
				 	
				 };
				 xhr.open("GET", "../student/sit-change-ajax?${_csrf.parameterName}=${_csrf.token}"); 
				xhr.send(); 	
				pickButton.disabled = 'true';	
			};			
		});
	    
</script>
</head>


<body>
<main class="main">
<h1> 자리바꾸기 </h1>
	<div class="seat-container">
		<div id ="top" style="display:flex; height:70px;">
					
					<div id="text">
						행 입력: <input type="text" id="row" />
						열 입력: <input type="text" id="column" />
					</div>
					<div id="button">
					 	<input type="button" value="자리바꾸기" id="change" />
					 	<input type="button" value="초기화"  id="reset" />
					 	<input type="button" value="오늘의 당첨자" id="pick"/>
					</div>
					<div>
				<%-- 	<c:forEach var="n" items="${list}">							
					${n.memberName}								
				</c:forEach> --%>
					</div>
	
		</div>
		
		<div id ="bottom" style="height: -webkit-fill-available;">
			<div id="area" style="height: -webkit-fill-available;">
				<!-- <span id="seat"></span>  -->
				
			</div>	
		</div>
	</div>
</main>
 </body>   