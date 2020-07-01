$(document).ready(function(){
		
	$('.toggle-btn').on('click', function(){
	    $('#wrapSideMenu').addClass('side_show');
	    $('#wrapSideMenu').fadeIn();
	});
	
	$('.side_overlay').on('click', function(){
	    $('#wrapSideMenu').removeClass('side_show');
	    $('#wrapSideMenu').fadeOut();
	});
		
	/* $('.closebtn').on('click', function () {
		    $('#wrapSideMenu').removeClass('side_show');
		    $('.side_overlay').fadeOut();
		}); */
	
});