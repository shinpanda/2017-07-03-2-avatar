<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
$(function() {
	  addCalendar("SCH_DT");
	  getMainSchedule('to');

	  $.fx.speeds._default = 500;
	  $( "#dialog-course-eval" ).dialog({
	    resizable: false,
	    width:973,
	    autoOpen: false,
	    show: "blind",
	    hide: "fade", //explode"    
	    modal: true,
	    dialogClass: "noTitleStuff",
	    closeOnEscape: false,
	    position:  { my: "center top+20", at: "center top+20", of: "body" },
	    close: function(ev, ui) {$("#dialog-course-eval-form").remove();} 
	  }); 
	});

	//달력 조회
	function getMainSchedule(dv,date){
	  //월별 이동버튼을 클릭하였을 때
	  if(typeof date === 'undefined'){
	    var days = [31,28,31,30,31,30,31,31,30,31,30,31];
	    var year = new Date().getFullYear();
	    var month= new Date().getMonth()+1;
	    var day  = new Date().getDate();
	  
	    //오늘보기
	    if(dv == 'to'){
	      if(Number(month) < 10) month = '0'+Number(month);
	      if(Number(day) < 10)   day   = '0'+Number(day);
	    }
	    else{
	      var a = getSchDate(); 
	    
	      //이전달
	      if(dv == 'bf'){
	        if(a[1] == 1){
	          year  = Number(a[0])-1;
	          month = 12;
	        }
	        else{
	          year  = a[0];
	          month = Number(a[1])-1;
	        }
	      }
	      //다음달
	      else if(dv == 'at'){
	        if(a[1] == 12){
	          year  = Number(a[0])+1;
	          month = 1;
	        }
	        else{
	          year  = a[0];
	          month = Number(a[1])+1;
	        }
	      }
	      //등록 또는 수정시 보고있던 일자로 유지 조회
	      else{
	        year  = a[0];
	        month = a[1];
	      }

	      if( month==2 && ( year%4==0 && year%100!=0 || year%400==0 ) ) {
	        days[1] = 29;
	      }

	      if(days[month-1] < a[2]) day = days[month-1];
	      else day = a[2];

	      if(Number(month) < 10) month = '0'+Number(month);
	      if(Number(day) < 10)   day   = '0'+Number(day);
	    }
	  }
	  //날짜를 클릭하였을 때
	  else{
	    var a = date.split('-'); 
	    var year = a[0];
	    var month= a[1];
	    var day  = a[2];
	    if(Number(month) < 10) month = '0'+Number(month);
	    if(Number(day) < 10)   day   = '0'+Number(day);
	  }

	  $("#loading").show();
	  $.ajax({
	    url: "/ilos/main/main_schedule.acl",
	    type: "POST",
	    data: {
	      year     : year,
	      month    : month,
	      day      : day,
	      encoding : "utf-8"
	    },
	    async: false,
	    success: function(data) {
	      $(".shedule_form").html(data);
	      getWeekDay(year, month, day);
	      getMainScheduleView(year, month, day);
	      $("#loading").hide();
	    },
	    error: function(data) {
	      alert("error22:"+data);
	      $("#loading").hide();
	    }
	  });
	}

	//목록 조회
	function getMainScheduleList(dv){
	  //월별 이동버튼을 클릭하였을 때
	  var days = [31,28,31,30,31,30,31,31,30,31,30,31];
	  var year = new Date().getFullYear();
	  var month= new Date().getMonth()+1;
	  var day  = new Date().getDate();
	  
	  var a = getSchDate();

	  //오늘보기
	  if(dv == 'to'){
	    if(Number(month) < 10) month = '0'+Number(month);
	    if(Number(day) < 10)   day   = '0'+Number(day);
	  }
	  else{
	    //이전달
	    if(dv == 'bf'){
	      if(a[1] == 1){
	        year  = Number(a[0])-1;
	        month = 12;
	      }
	      else{
	        year  = a[0];
	        month = Number(a[1])-1;
	      }
	    }
	    //다음달
	    else if(dv == 'at'){
	      if(a[1] == 12){
	        year  = Number(a[0])+1;
	        month = 1;
	      }
	      else{
	        year  = a[0];
	        month = Number(a[1])+1;
	      }
	    }
	    //등록 또는 수정시 보고있던 일자로 유지 조회
	    else{
	      year  = a[0];
	      month = a[1];
	    }

	    if( month==2 && ( year%4==0 && year%100!=0 || year%400==0 ) ) {
	      days[1] = 29;
	    }

	    if(days[month-1] < a[2]) day = days[month-1];
	    else day = a[2];

	    if(Number(month) < 10) month = '0'+Number(month);
	    if(Number(day) < 10)   day   = '0'+Number(day);
	  }
	  $("#loading").show();
	  
	  $.ajax({
	    url: "/ilos/main/main_schedule_list.acl",
	    type: "POST",
	    data: {
	      year     : year,
	      month    : month,
	      viewDt   : year + '' + month,
	      day      : day,
	      encoding : "utf-8"
	    },
	    async: true,
	    success: function(data) {
	      $(".shedule_form").html(data);
	      getWeekDay(year, month, day);
	      $("#loading").hide();
	    },
	    error: function(data) {
	      alert("error22:"+data);
	      $("#loading").hide();
	    }
	  });
	}

	//날짜 내역 조회
	function getMainScheduleView(y,m,d){
	  $.ajax({
	    url: "/ilos/main/main_schedule_view.acl",
	    type: "POST",
	    data: {
	      viewDt   : getSchDate()[0]+''+getSchDate()[1]+''+getSchDate()[2],
	      encoding : "utf-8"
	    },
	    async: false,
	    success: function(data) {
	      $(".schedule_txt_view").html(data);
	    },
	    error: function(data) {
	      alert("error22:"+data);
	    }
	  });
	}

	//날짜 가져오기
	var getSchDate = function(){
	  var date = $("#Month").html().split('.');
	  var y = date[0];
	  var m = date[1];
	  var d = $("#Day").html();

	  if(Number(m) < 10) m = "0" + Number(m);
	  if(Number(d) < 10) d = "0" + Number(d);
	  
	  return [y,m,d];
	}

	//요일 표시
	function getWeekDay(y,m,d){
	  var languge = "ko";
	  var weekDay = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];
	  
	  if(languge == 'en') weekDay = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];    
	  if(languge == 'ja') weekDay = ["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"];
	  
	  $("#Month").html(y+'.'+Number(m));
	  $("#Day").html(Number(d));

	  if(Number(m) < 10) m = "0" + Number(m);
	  if(Number(d) < 10) d = "0" + Number(d);
	  
	  var date = y+'/'+m+'/'+d;
	  $("#WeekDay").html("("+weekDay[new Date(date).getDay()]+")");
	}

	//등록폼 
	function insertFormSchedule(){
	  if($(".schedule_txt_insert").css("display") === 'block') {
	    cencleSchedule('','inst');
	  }
	  else{
	    $(".schedule_txt_view").hide();
	  
	    $("#SCH_DT").val(getSchDate()[0] + '.' + getSchDate()[1] + '.' + getSchDate()[2]);
	    $(".schedule_txt_insert").show();
	  }
	}

	//취소 컨트롤 inst 등록/ cal 달력/ list 목록
	function cencleSchedule(a,b){
	  if(typeof b !== 'undefined'){
	    if(b == 'inst'){
	      getMainScheduleView(getSchDate()[0], getSchDate()[1], getSchDate()[2]);
	      
	      $(".schedule_txt_view").show();
	      $(".schedule_txt_insert").hide();
	      
	      $("#SCH_DT").val("2017.11.17");
	      $("#SCH_HH").val("16");
	      $("#SCH_MM").val("15");
	      
	      $("#SCH_TITLE").val("");
	      $("#SCH_CONTENTS").html("");
	    }
	    if(b == 'cal'){
	      $("#view_"+a).show();
	      $("#update_"+a).hide();
	      
	      $(".hide-Schedule").hide();
	      $(".show-Schedule").show();
	      $(".schedule-show-control").show();
	      $(".schedule-show-control").attr("change","show");
	    }
	    if(b == 'list'){
	      $("#view_"+a).show();
	      $("#update_"+a).hide();
	    }
	  }
	}

	//날짜 내역 상세 보기
	function changeDetile(a,b,c,obj,dv,i){
	  var c = $(obj).attr("change");
	  if(c == 'show') {
	    $("#hide_"+i+"_"+dv+"_"+a+"_"+b).show();
	    $("#view_"+i+"_"+dv+"_"+a+"_"+b).show();
	    $("#show_"+i+"_"+dv+"_"+a+"_"+b).hide();
	    $(obj).attr("change","hide");
	  }
	  else{
	    $("#show_"+i+"_"+dv+"_"+a+"_"+b).show();
	    $("#view_"+i+"_"+dv+"_"+a+"_"+b).hide();
	    $("#hide_"+i+"_"+dv+"_"+a+"_"+b).hide();
	    $(obj).attr("change","show");
	    cencleSchedule('1_'+b,c);      
	  }
	}

	//수정폼 컨트롤 inst 등록/ cal 달력/ list 목록
	function updateFormSchedule(a,b){
	  if(b == 'inst'){}
	  if(b == 'cal'){
	    $("#view_"+a).hide();
	    $("#update_"+a).show();
	    $(".changeDetile").hide();
	    $(".schedule-show-control").hide();  
	  }
	  if(b == 'list'){
	    $("#view_1_"+a).hide();
	    $("#update_1_"+a).show();
	  }
	}

	//등록하기
	function insertSchedule(){
	  $.ajax({
	    url: "/ilos/main/schedule_insert.acl",
	    type: "POST",
	    data: { 
	      SCH_TITLE    : $("#SCH_TITLE").val(),  
	      SCH_CONTENTS : $("#SCH_CONTENTS").val(),
	      SCH_START_DT : $("#SCH_DT").val().replaceAll(".", ""), 
	      SCH_START_TM : $("#SCH_HH").val()+$("#SCH_MM").val(),
	      SCH_DV_CD    : 1, 
	      encoding : "utf-8"
	          },
	    async: false,
	    success: function(data){
	      if(data.isError){
	        alert(data.message);
	      }else{
	        getMainSchedule();
	      }
	    },
	    error : function(html) {
	      alert("error:"+html);
	    }
	  });
	}

	//수정하기
	function updateSchedule(a,b){
	  $.ajax({
	    url: "/ilos/main/schedule_update.acl",
	    type: "POST",
	    data: { 
	      SCH_SEQ      : a.replaceAll("1_", ""),
	      SCH_TITLE    : $("#SCH_TITLE_"+a).val(),  
	      SCH_CONTENTS : $("#SCH_CONTENTS_"+a).val(),
	      SCH_START_DT : $("#SCH_DT_"+a).val().replaceAll(".", ""),  
	      SCH_START_TM : $("#SCH_HH_"+a).val()+$("#SCH_MM_"+a).val(),
	      SCH_DV_CD    : 1, 
	      encoding : "utf-8"
	          },
	    async: false,
	    success: function(data){
	      if(data.isError){
	        alert(data.message);
	      }else{
	        if(b == 'cal'){  //달력형
	          getMainSchedule();
	        }
	        else{//목록형
	          getMainScheduleList();
	        }
	      }
	    },
	    error : function(html) {
	      alert("error:"+html);
	    }
	  });
	}

	//삭제하기
	function deleteSchedule(a,b){
	  if(!confirm("정말로 삭제하시겠습니까?")) {
	    return;
	  }
	  
	  $.ajax({
	    url: "/ilos/main/schedule_delete.acl",
	    type: "POST",
	    data: { 
	      SCH_SEQ  : a,  
	      encoding : "utf-8"
	          },
	    async: false,
	    success: function(data){
	      if(data.isError){
	        alert(data.message);
	      }else{
	        if(b == 'cal'){  //달력형
	          getMainSchedule();
	        }
	        else{//목록형
	          getMainScheduleList();
	        }
	      }
	    },
	    error : function(html) {
	      alert("error:"+html);
	    }
	  });
	}
</script>
</head>


<body>
	<main>
	<div
		style="float: left; font-size: 18px; font-weight: bold; color: #fff; font-family: malgun gothic;">일정</div>
	<input id="show_schedule_list" type="image" src="/ilos/images/common/view_list.png"
		style="width: 16px; height: 10px; float: right; margin-top: 2px; border-radius: 0px;"
		title="목록보기" onclick="getMainScheduleList('');"> 
		</main>
</body>