function getCurrentPicNum() {
	classes = $("#active").attr('class').split(' ');
	nums = classes[0].split("-");
	return parseInt(nums[1]);
}

function toggleElements(num) {
	if ($('.pic-' + num).attr('src')) {
		$('#active').attr('id', '').toggle('slow');	
		$('.pic-' + num).attr('id', 'active').toggle('slow');
	}
}

$(document).ready(function() {
	$('.pic').css('display', 'none');
	$('#active').css('display', 'block');
	
	$('#left').click(function() { 
		num = getCurrentPicNum() - 1;
		toggleElements(num);
	});
	$('#right').click(function() { 
		num = getCurrentPicNum() + 1;
		toggleElements(num);
	});	
});