$(document).ready(function() {
	function display(data1) {
		$(data1).each(function(index, item) {
			var poster = item.poster;
			$('.rerank').append("<div class='col-md-4 col-lg-4 col-xs-12'>" +
					"<div class='media wow fadeInRight animated' data-wow-duration='500ms' data-wow-delay='1200ms'>" + 
					"<div class='media-left'>" + 
					"<div class='icon'>" + 
					"<img src='" + item.poster + "' width='95px' height='140px' style='margin-right:10px'> <br>" +
					"</div>" + 
					"<div class='media-body'>" + 
					"<h4 class='media-heading'>" + item.PRFNM + "</h4>" + 
					"</div>" +
					"</div>" + 
					"</div>");
		});
	}
	$.ajax({
		url : 're111', // hive라는 서버프로그램에 요청하겠다
		dataType : 'json', // json이라는 형태로 요청하겠다
		success : function(data) {
			display(data);
		}
	});

});
