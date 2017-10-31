$(document).ready(function(){
	var formInputs = $('input[type="text"],input[type="password"]');
	formInputs.focus(function() {
       $(this).parent().children('p.formLabel').addClass('formTop');
       $('div#formWrapper').addClass('darken-bg');
       $('div.logo').addClass('logo-active');
	});
	formInputs.focusout(function() {
		if ($.trim($(this).val()).length == 0){
		$(this).parent().children('p.formLabel').removeClass('formTop');
		}
		$('div#formWrapper').removeClass('darken-bg');
		$('div.logo').removeClass('logo-active');
	});
	$('p.formLabel').click(function(){
		 $(this).parent().children('.form-style').focus();
	});
	
	$('.register-choice').addClass("hidden");
	$(".pull-left small").click(function(){
		/*$('.register-choice').css("display","flex");
		$('#form').css("display","none");*/
		$('.register-choice').removeClass("hidden");
		$('#form').addClass("hidden");
	});
	
	$(document).mouseup(function(e){
		var container=$('.register-choice');
		if(!container.is(e.target)&&container.has(e.target).length == 0){
			container.addClass("hidden");
			$('#form').removeClass("hidden");
		}
	});
	
	
});


