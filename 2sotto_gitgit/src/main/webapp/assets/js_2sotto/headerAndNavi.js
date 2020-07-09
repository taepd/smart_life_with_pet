$(document).ready(function(){
		
	$('.toggle-btn').on('click', function(){
	    $('#wrapSideMenu').addClass('side_show');
		$('#wrapSideMenu').fadeIn();
		console.log('실행!');
	});
	
	$('.side_overlay').on('click', function(){
	    $('#wrapSideMenu').removeClass('side_show');
	    $('#wrapSideMenu').fadeOut();
	});
		
	$('.sideMenu-close-icon').on('click', function () {
		$('#wrapSideMenu').removeClass('side_show');
		$('#wrapSideMenu').fadeOut();
	}); 
	
});

// jquery slide toggle