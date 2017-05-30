
	//초기 날짜 데이터 셋팅		
    var cmmToDate = '2017-03-17';
	var date_nowDate = cmmToDate;
	
	var year = date_nowDate.substring(0,4);
	var month = date_nowDate.substring(5,7);
	var date = date_nowDate.substring(8,10);
	
	var subDay = 1 
	var nSubDay = Number(subDay);
	var sdate = new Date(year,month-1,date);
	var newDate = new Date(sdate.getTime() - (nSubDay * 86400000));
    var d1Dt = newDate.getFullYear()+'.'+addzero(newDate.getMonth()+1)+'.'+addzero(newDate.getDate());
    var d1DtTab = '('+addzero(newDate.getMonth()+1)+'.'+addzero(newDate.getDate())+')';
	
    var subDay30 = 30 
	var nSubDay30 = Number(subDay30);
	var sdate30 = new Date(year,month-1,date);
	var newDate30 = new Date(sdate30.getTime() - (nSubDay30 * 86400000));
    var d30Dt = newDate30.getFullYear()+'.'+addzero(newDate30.getMonth()+1)+'.'+addzero(newDate30.getDate());
    var d30DtTab = '('+addzero(newDate30.getMonth()+1)+'.'+addzero(newDate30.getDate())+' ~ '+addzero(newDate.getMonth()+1)+'.'+addzero(newDate.getDate())+')';
    
    var subDay7 = 7 
	var nSubDay7 = Number(subDay7);
	var sdate7 = new Date(year,month-1,date);
	var newDate7 = new Date(sdate7.getTime() - (nSubDay7 * 86400000));
    var d7Dt = newDate7.getFullYear()+'.'+addzero(newDate7.getMonth()+1)+'.'+addzero(newDate7.getDate());
    var d7DtTab = '('+addzero(newDate7.getMonth()+1)+'.'+addzero(newDate7.getDate())+' ~ '+addzero(newDate.getMonth()+1)+'.'+addzero(newDate.getDate())+')';       
    
    


    // 주간박스오피스
selectWeekBoxOffice = function(genre) {
	if(genre!=''){
		var id='#'+genre;
		$("#tab3_wrap .list_category li a").removeClass("over");
		$("#tab3>a").addClass("over");
		$("#tab3_wrap").css({'display':'block'});
		$(id).addClass("over");
		if($("#tab1>a").hasClass('over') == true){
			$("#tab2_wrap").css({'display':'none'});
			$("#tab1_wrap").css({'display':'block'});
		}else{
			$("#tab1_wrap").css({'display':'none'});
			$("#tab2_wrap").css({'display':'block'});
		}
		switch(genre){
			case 'Theatre': $('.title h1 span').text(' - Theatre'); break;
			case 'Musical': $('.title h1 span').text(' - Musical'); break;
			case 'Classic': $('.title h1 span').text(' - Classic/Opera'); break;
			case 'Dance': $('.title h1 span').text(' - Dance/Ballet'); break;
			case 'Gukak': $('.title h1 span').text(' - Gukak'); break;
		}
	}	
	
	if(genre == "Theatre"){

		$(document).ready(function(data){
			function weekly1(data){
				if(!data){ alert('no data error'); return false; }
				var listoutput = '';
				var posteroutput = '';
				var weekly = $(data).find('boxof');
				/*$('.weekBoxOffice').html('');*/
				
			$(weekly).each(function() {
				var rnum = $(this).find('rnum').text();
				var prfnm = $(this).find('prfnm').text();
				var mt20id = $(this).find('mt20id').text();
				var nmrs = $(this).find('nmrs').text();
				var poster = $(this).find('poster').text();
				listoutput += "<li>";
				listoutput += "<span class='num'>"+rnum+"</span>";
				listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
				listoutput += "<span class='audience'>"+nmrs+"명</span>";
				listoutput += "</li>";

				/* KOPIS 추출 소스
				$('.weekBoxOffice').append(
	                    "<li>" +
							"<span class='num'>"+rnum+"</span>" +
							"<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>" +
							"<span class='audience'>"+nmrs+"명</span>" +
						"</li>"
				);
				*/
			});
			$('.weekBoxOffice').html(listoutput);
			
			$(weekly).each(function() {
				var rnum = $(this).find('rnum').text();
				var prfnm = $(this).find('prfnm').text();
				var mt20id = $(this).find('mt20id').text();
				var nmrs = $(this).find('nmrs').text();
				var poster = $(this).find('poster').text();
				
				posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
				posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
				posteroutput += "<span class='poster_img'>";
				posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
				posteroutput += "</div><div class='poster_hover'>";
				posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
				posteroutput += "</dl></div></a></li>";
				
				$('.weekBoxOfficePoster').html(posteroutput);
								
				/* KOPIS 추출 소스			
				$('.weekBoxOfficePoster').append(
						"<li>" +
							"<a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">" +
				        		"<div class='poster'>" +
				             		"<span class='num'>"+rnum+"</span>" +
				             		"<span class='poster_img'>"+
				             		"<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>" +
				        		"</div>" +
				        		"<div class='poster_hover'>" +
				        			"<dl>" +
				             			"<dt>"+prfnm+"</dt>" +
				             			"<dd>"+nmrs+"명</dd>" +
				        			"</dl>" +
					        	"</div>" +
				        	"</a>" +
			        	"</li>"
				);
				*/
				$(".weekBoxOfficePoster li a").hover(function(){
					$(this).children(".poster_hover").fadeToggle();
				});
				$(".poster_hover").hide();
				$(".poster_rank ul li").each(function(){
					var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
					var title_num = $(this).find(".poster_hover dl dt").text().length;
					if(title_num>30){
						$(this).find(".poster_hover dl dt").text(poster_title+"...");
					}else{
						$(this).find(".poster_hover dl dt").text(poster_title);
					}
				});
				$(".poster_img img").error(function(){
					$(this).parent().text("no images");
					$(this).remove();
			    });
				
			});

		};
			function requestWeekly() {
				$.ajax({
					url : 'week1',
					dataType : 'xml',
					success : function(data) {
						weekly1(data);
					}
				});
			}
			requestWeekly();
	});	// $.ajax
		
	} else if (genre == "Musical"){
		
		$(document).ready(function(data){
			function weekly2(data){
				if(!data){ alert('no data error'); return false; }
				var listoutput = '';
				var posteroutput = '';
				var weekly = $(data).find('boxof');
			
				$(weekly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
	
					listoutput += "<li>";
					listoutput += "<span class='num'>"+rnum+"</span>";
					listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
					listoutput += "<span class='audience'>"+nmrs+"명</span>";
					listoutput += "</li>";
				});
				$('.weekBoxOffice').html(listoutput);

				$(weekly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
					
					posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
					posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
					posteroutput += "<span class='poster_img'>";
					posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
					posteroutput += "</div><div class='poster_hover'>";
					posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
					posteroutput += "</dl></div></a></li>";
					
					$('.weekBoxOfficePoster').html(posteroutput);
									
					$(".weekBoxOfficePoster li a").hover(function(){
						$(this).children(".poster_hover").fadeToggle();
					});
					$(".poster_hover").hide();
					$(".poster_rank ul li").each(function(){
						var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
						var title_num = $(this).find(".poster_hover dl dt").text().length;
						if(title_num>30){
							$(this).find(".poster_hover dl dt").text(poster_title+"...");
						}else{
							$(this).find(".poster_hover dl dt").text(poster_title);
						}
					});
					$(".poster_img img").error(function(){
						$(this).parent().text("no images");
						$(this).remove();
				    });
				});
			};
			function requestWeekly() {
				$.ajax({
					url : 'week2',
					dataType : 'xml',
					success : function(data) {
						weekly2(data);
					}
				});
			}
			requestWeekly();
		});
		
	} else if (genre == "Classic"){

		$(document).ready(function(data){
			function weekly3(data){
				if(!data){ alert('no data error'); return false; }
				var listoutput = '';
				var posteroutput = '';
				var weekly = $(data).find('boxof');
			
				$(weekly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
	
					listoutput += "<li>";
					listoutput += "<span class='num'>"+rnum+"</span>";
					listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
					listoutput += "<span class='audience'>"+nmrs+"명</span>";
					listoutput += "</li>";
				});
				$('.weekBoxOffice').html(listoutput);

				$(weekly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
					
					posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
					posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
					posteroutput += "<span class='poster_img'>";
					posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
					posteroutput += "</div><div class='poster_hover'>";
					posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
					posteroutput += "</dl></div></a></li>";
					
					$('.weekBoxOfficePoster').html(posteroutput);
									
					$(".weekBoxOfficePoster li a").hover(function(){
						$(this).children(".poster_hover").fadeToggle();
					});
					$(".poster_hover").hide();
					$(".poster_rank ul li").each(function(){
						var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
						var title_num = $(this).find(".poster_hover dl dt").text().length;
						if(title_num>30){
							$(this).find(".poster_hover dl dt").text(poster_title+"...");
						}else{
							$(this).find(".poster_hover dl dt").text(poster_title);
						}
					});
					$(".poster_img img").error(function(){
						$(this).parent().text("no images");
						$(this).remove();
				    });
				});
			};
			function requestWeekly() {
				$.ajax({
					url : 'week3',
					dataType : 'xml',
					success : function(data) {
						weekly3(data);
					}
				});
			}
			requestWeekly();
		});
	} else if (genre == "Dance") {

		$(document).ready(function(data){
			function weekly4(data){
				if(!data){ alert('no data error'); return false; }
				var listoutput = '';
				var posteroutput = '';
				var weekly = $(data).find('boxof');
			
				$(weekly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
	
					listoutput += "<li>";
					listoutput += "<span class='num'>"+rnum+"</span>";
					listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
					listoutput += "<span class='audience'>"+nmrs+"명</span>";
					listoutput += "</li>";
				});
				$('.weekBoxOffice').html(listoutput);

				$(weekly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
					
					posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
					posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
					posteroutput += "<span class='poster_img'>";
					posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
					posteroutput += "</div><div class='poster_hover'>";
					posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
					posteroutput += "</dl></div></a></li>";
					
					$('.weekBoxOfficePoster').html(posteroutput);
									
					$(".weekBoxOfficePoster li a").hover(function(){
						$(this).children(".poster_hover").fadeToggle();
					});
					$(".poster_hover").hide();
					$(".poster_rank ul li").each(function(){
						var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
						var title_num = $(this).find(".poster_hover dl dt").text().length;
						if(title_num>30){
							$(this).find(".poster_hover dl dt").text(poster_title+"...");
						}else{
							$(this).find(".poster_hover dl dt").text(poster_title);
						}
					});
					$(".poster_img img").error(function(){
						$(this).parent().text("no images");
						$(this).remove();
				    });
				});
			};
			function requestWeekly() {
				$.ajax({
					url : 'week4',
					dataType : 'xml',
					success : function(data) {
						weekly4(data);
					}
				});
			}
			requestWeekly();
		});
	} else if (genre == "Gukak") {

		$(document).ready(function(data){
			function weekly5(data){
				if(!data){ alert('no data error'); return false; }
				var listoutput = '';
				var posteroutput = '';
				var weekly = $(data).find('boxof');
			
				$(weekly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
	
					listoutput += "<li>";
					listoutput += "<span class='num'>"+rnum+"</span>";
					listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
					listoutput += "<span class='audience'>"+nmrs+"명</span>";
					listoutput += "</li>";
				});
				$('.weekBoxOffice').html(listoutput);

				$(weekly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
					
					posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
					posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
					posteroutput += "<span class='poster_img'>";
					posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
					posteroutput += "</div><div class='poster_hover'>";
					posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
					posteroutput += "</dl></div></a></li>";
					
					$('.weekBoxOfficePoster').html(posteroutput);
									
					$(".weekBoxOfficePoster li a").hover(function(){
						$(this).children(".poster_hover").fadeToggle();
					});
					$(".poster_hover").hide();
					$(".poster_rank ul li").each(function(){
						var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
						var title_num = $(this).find(".poster_hover dl dt").text().length;
						if(title_num>30){
							$(this).find(".poster_hover dl dt").text(poster_title+"...");
						}else{
							$(this).find(".poster_hover dl dt").text(poster_title);
						}
					});
					$(".poster_img img").error(function(){
						$(this).parent().text("no images");
						$(this).remove();
				    });
				});
			};
			function requestWeekly() {
				$.ajax({
					url : 'week5',
					dataType : 'xml',
					success : function(data) {
						weekly5(data);
					}
				});
			}
			requestWeekly();
		});
	}
};

//월간박스오피스
selectMonthBoxOffice = function(genre) {
	
	if(genre == "Theatre"){
		
		$(document).ready(function(data){
			function monthly1(data){
				if(!data){ alert('no data error'); return false; }
				var listoutput = '';
				var posteroutput = '';
				var monthly = $(data).find('boxof');
			
				$(monthly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
	
					listoutput += "<li>";
					listoutput += "<span class='num'>"+rnum+"</span>";
					listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
					listoutput += "<span class='audience'>"+nmrs+"명</span>";
					listoutput += "</li>";
				});
				$('.monthBoxOffice').html(listoutput);
			
				$(monthly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
					
					posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
					posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
					posteroutput += "<span class='poster_img'>";
					posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
					posteroutput += "</div><div class='poster_hover'>";
					posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
					posteroutput += "</dl></div></a></li>";
					
				$('.monthBoxOfficePoster').html(posteroutput);

				
				$(".monthBoxOfficePoster li a").hover(function(){
					$(this).children(".poster_hover").fadeToggle();
				});
				$(".poster_hover").hide();
				$(".poster_rank ul li").each(function(){
					var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
					var title_num = $(this).find(".poster_hover dl dt").text().length;
					if(title_num>30){
						$(this).find(".poster_hover dl dt").text(poster_title+"...");
					}else{
						$(this).find(".poster_hover dl dt").text(poster_title);
					}
				});
				$(".poster_img img").error(function(){
					$(this).parent().text("no images");
					$(this).remove();
			    });
				
			});

		};
		function requestMonthly() {
			$.ajax({
				url : 'month1',
				dataType : 'xml',
				success : function(data) {
					monthly1(data);
				}
			});
		}
		requestMonthly();
	});	// $.ajax		
	}
	if(genre == "Musical"){
			
			$(document).ready(function(data){
				function monthly2(data){
					if(!data){ alert('no data error'); return false; }
					var listoutput = '';
					var posteroutput = '';
					var monthly = $(data).find('boxof');
				
					$(monthly).each(function() {
						var rnum = $(this).find('rnum').text();
						var prfnm = $(this).find('prfnm').text();
						var mt20id = $(this).find('mt20id').text();
						var nmrs = $(this).find('nmrs').text();
						var poster = $(this).find('poster').text();
		
						listoutput += "<li>";
						listoutput += "<span class='num'>"+rnum+"</span>";
						listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
						listoutput += "<span class='audience'>"+nmrs+"명</span>";
						listoutput += "</li>";
					});
					$('.monthBoxOffice').html(listoutput);
				
					$(monthly).each(function() {
						var rnum = $(this).find('rnum').text();
						var prfnm = $(this).find('prfnm').text();
						var mt20id = $(this).find('mt20id').text();
						var nmrs = $(this).find('nmrs').text();
						var poster = $(this).find('poster').text();
						
						posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
						posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
						posteroutput += "<span class='poster_img'>";
						posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
						posteroutput += "</div><div class='poster_hover'>";
						posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
						posteroutput += "</dl></div></a></li>";
						
					$('.monthBoxOfficePoster').html(posteroutput);
	
					
					$(".monthBoxOfficePoster li a").hover(function(){
						$(this).children(".poster_hover").fadeToggle();
					});
					$(".poster_hover").hide();
					$(".poster_rank ul li").each(function(){
						var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
						var title_num = $(this).find(".poster_hover dl dt").text().length;
						if(title_num>30){
							$(this).find(".poster_hover dl dt").text(poster_title+"...");
						}else{
							$(this).find(".poster_hover dl dt").text(poster_title);
						}
					});
					$(".poster_img img").error(function(){
						$(this).parent().text("no images");
						$(this).remove();
				    });
					
				});
	
			};
			function requestMonthly() {
				$.ajax({
					url : 'month2',
					dataType : 'xml',
					success : function(data) {
						monthly2(data);
					}
				});
			}
			requestMonthly();
		});	// $.ajax		
		}
	if(genre == "Classic"){
			
			$(document).ready(function(data){
				function monthly3(data){
					if(!data){ alert('no data error'); return false; }
					var listoutput = '';
					var posteroutput = '';
					var monthly = $(data).find('boxof');
				
					$(monthly).each(function() {
						var rnum = $(this).find('rnum').text();
						var prfnm = $(this).find('prfnm').text();
						var mt20id = $(this).find('mt20id').text();
						var nmrs = $(this).find('nmrs').text();
						var poster = $(this).find('poster').text();
		
						listoutput += "<li>";
						listoutput += "<span class='num'>"+rnum+"</span>";
						listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
						listoutput += "<span class='audience'>"+nmrs+"명</span>";
						listoutput += "</li>";
					});
					$('.monthBoxOffice').html(listoutput);
				
					$(monthly).each(function() {
						var rnum = $(this).find('rnum').text();
						var prfnm = $(this).find('prfnm').text();
						var mt20id = $(this).find('mt20id').text();
						var nmrs = $(this).find('nmrs').text();
						var poster = $(this).find('poster').text();
						
						posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
						posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
						posteroutput += "<span class='poster_img'>";
						posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
						posteroutput += "</div><div class='poster_hover'>";
						posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
						posteroutput += "</dl></div></a></li>";
						
					$('.monthBoxOfficePoster').html(posteroutput);
	
					
					$(".monthBoxOfficePoster li a").hover(function(){
						$(this).children(".poster_hover").fadeToggle();
					});
					$(".poster_hover").hide();
					$(".poster_rank ul li").each(function(){
						var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
						var title_num = $(this).find(".poster_hover dl dt").text().length;
						if(title_num>30){
							$(this).find(".poster_hover dl dt").text(poster_title+"...");
						}else{
							$(this).find(".poster_hover dl dt").text(poster_title);
						}
					});
					$(".poster_img img").error(function(){
						$(this).parent().text("no images");
						$(this).remove();
				    });
					
				});
	
			};
			function requestMonthly() {
				$.ajax({
					url : 'month3',
					dataType : 'xml',
					success : function(data) {
						monthly3(data);
					}
				});
			}
			requestMonthly();
		});	// $.ajax		
	}
	if(genre == "Dance"){
		
		$(document).ready(function(data){
			function monthly4(data){
				if(!data){ alert('no data error'); return false; }
				var listoutput = '';
				var posteroutput = '';
				var monthly = $(data).find('boxof');
			
				$(monthly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
	
					listoutput += "<li>";
					listoutput += "<span class='num'>"+rnum+"</span>";
					listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
					listoutput += "<span class='audience'>"+nmrs+"명</span>";
					listoutput += "</li>";
				});
				$('.monthBoxOffice').html(listoutput);
			
				$(monthly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
					
					posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
					posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
					posteroutput += "<span class='poster_img'>";
					posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
					posteroutput += "</div><div class='poster_hover'>";
					posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
					posteroutput += "</dl></div></a></li>";
					
				$('.monthBoxOfficePoster').html(posteroutput);

				
				$(".monthBoxOfficePoster li a").hover(function(){
					$(this).children(".poster_hover").fadeToggle();
				});
				$(".poster_hover").hide();
				$(".poster_rank ul li").each(function(){
					var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
					var title_num = $(this).find(".poster_hover dl dt").text().length;
					if(title_num>30){
						$(this).find(".poster_hover dl dt").text(poster_title+"...");
					}else{
						$(this).find(".poster_hover dl dt").text(poster_title);
					}
				});
				$(".poster_img img").error(function(){
					$(this).parent().text("no images");
					$(this).remove();
			    });
				
			});

		};
		function requestMonthly() {
			$.ajax({
				url : 'month4',
				dataType : 'xml',
				success : function(data) {
					monthly4(data);
				}
			});
		}
		requestMonthly();
	});	// $.ajax		
	}
	if(genre == "Gukak"){
		
		$(document).ready(function(data){
			function monthly5(data){
				if(!data){ alert('no data error'); return false; }
				var listoutput = '';
				var posteroutput = '';
				var monthly = $(data).find('boxof');
			
				$(monthly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
	
					listoutput += "<li>";
					listoutput += "<span class='num'>"+rnum+"</span>";
					listoutput += "<span class='showname'><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">"+prfnm+"</a></span>";
					listoutput += "<span class='audience'>"+nmrs+"명</span>";
					listoutput += "</li>";
				});
				$('.monthBoxOffice').html(listoutput);
			
				$(monthly).each(function() {
					var rnum = $(this).find('rnum').text();
					var prfnm = $(this).find('prfnm').text();
					var mt20id = $(this).find('mt20id').text();
					var nmrs = $(this).find('nmrs').text();
					var poster = $(this).find('poster').text();
					
					posteroutput += "<li><a href=\"prf.show?db=peDetail&mt20id="+mt20id+"\">";
					posteroutput += "<div class='poster'><span class='num'><img src='images/rank/poster_rank_"+rnum+".png' alt='"+rnum+"'/></span>"
					posteroutput += "<span class='poster_img'>";
					posteroutput += "<img src='"+poster+"' onError=this.src='/images/por/main_no_img.jpg'; alt='"+prfnm+"'/></span>";
					posteroutput += "</div><div class='poster_hover'>";
					posteroutput += "<dl><dt>"+prfnm+"</dt><dd>"+nmrs+"명</dd>";
					posteroutput += "</dl></div></a></li>";
					
				$('.monthBoxOfficePoster').html(posteroutput);

				
				$(".monthBoxOfficePoster li a").hover(function(){
					$(this).children(".poster_hover").fadeToggle();
				});
				$(".poster_hover").hide();
				$(".poster_rank ul li").each(function(){
					var poster_title = $(this).find(".poster_hover dl dt").text().substring( 0, 30 );
					var title_num = $(this).find(".poster_hover dl dt").text().length;
					if(title_num>30){
						$(this).find(".poster_hover dl dt").text(poster_title+"...");
					}else{
						$(this).find(".poster_hover dl dt").text(poster_title);
					}
				});
				$(".poster_img img").error(function(){
					$(this).parent().text("no images");
					$(this).remove();
			    });
				
			});

		};
		function requestMonthly() {
			$.ajax({
				url : 'month5',
				dataType : 'xml',
				success : function(data) {
					monthly5(data);
				}
			});
		}
		requestMonthly();
	});	// $.ajax		
	}
};

var genre;
var getTitle;

$(function(){
	
	$("#tab2_wrap").css({'display':'none'});
	// 주간 박스오피스
	$("#tab1").on("click focusin",function(){
		$("#tab2>a").removeClass("over");
		$("#tab1>a").addClass("over");
		$("#tab2_wrap").css({'display':'none'});
		$("#tab1_wrap").css({'display':'block'});

		if ($("#tab3>a").hasClass('over') == true) {
			genre = $("#tab3_wrap .list_category").find("li .over").attr("id");
		}
		selectWeekBoxOffice(genre);
		return false;
		
	});
	// 월간 박스오피스
	$("#tab2").on("click focusin",function(){
		$("#tab1>a").removeClass("over");
		$("#tab2>a").addClass("over");
		$("#tab1_wrap").css({'display':'none'});
		$("#tab2_wrap").css({'display':'block'});
		
		if($("#tab3>a").hasClass('over') == true){
			genre = $("#tab3_wrap .list_category").find("li .over").attr("id");
		}
		selectMonthBoxOffice(genre);
		return false;
	});
	// 장르별 박스오피스
	$("#tab3").on("click focusin",function(){
		$("#tab3>a").addClass("over");
		$("#tab3_wrap").css({'display':'block'});
		genre = $("#tab3_wrap .list_category").find("li .over").attr("id");
		getTitle = $("#tab3_wrap .list_category").find("li .over .category_name").text();
		//선택된 카테고리 제목 가져오기
		$('.title h1 span').text('  -  '+getTitle);
		if($("#tab1>a").hasClass('over') == true){
			selectWeekBoxOffice(genre);
			$("#tab2_wrap").css({'display':'none'});
			$("#tab1_wrap").css({'display':'block'});
		}else{
			selectMonthBoxOffice(genre);
			$("#tab1_wrap").css({'display':'none'});
			$("#tab2_wrap").css({'display':'block'});
		}
		return false;
	});

	//집계날짜 D-30
	$('.d30Dt').text(d30Dt);
	//집계날짜 D-7
	$('.d7Dt').text(d7Dt);
	//집계날짜 D-1
	$('.d1Dt').text(d1Dt);

	// 기본 박스오피스설정 - 랜덤
	var names=['Theatre','Musical','Classic','Dance','Gukak'];
	var namesIndex=Math.floor(Math.random() * 5);
	
	selectWeekBoxOffice(names[namesIndex]);
	
	$("#Theatre").on("click focusin",function(){
		categoryArea(this);
		$('.title h1 span').text(' - Theatre');
	});
	$("#Musical").on("click focusin",function(){
		categoryArea(this);
		$('.title h1 span').text(' - Musical');
	});
	$("#Classic").on("click focusin",function(){
		categoryArea(this);
		$('.title h1 span').text(' - Classic/Opera');
	});
	$("#Dance").on("click focusin",function(){
		categoryArea(this);
		$('.title h1 span').text(' - Dance/Ballet');
	});
	$("#Gukak").on("click focusin",function(){
		categoryArea(this);
		$('.title h1 span').text(' - Gukak');
	});

	categoryArea = function(a) {
		$("#tab3_wrap .list_category li a").removeClass("over");
		/*("#tab3>a").addClass("over");*/
		$("#tab3_wrap").css({'display':'block'});
		$(a).addClass("over");
		genre = $("#tab3_wrap .list_category").find("li .over").attr("id");
		if($("#tab1>a").hasClass('over') == true){
			$("#tab2_wrap").css({'display':'none'});
			$("#tab1_wrap").css({'display':'block'});
			selectWeekBoxOffice(genre);
		} else{
			$("#tab1_wrap").css({'display':'none'});
			$("#tab2_wrap").css({'display':'block'});
			selectMonthBoxOffice(genre);
		}
	};

});

/*날짜계산 lee test*/
function timeSt(dt) {
	 var d = new Date(dt);
	 var yyyy = d.getFullYear();
	 var MM = d.getMonth()+1;
	 var dd = d.getDate();
	 var hh = d.getHours();
	 var mm = d.getMinutes();
	 var ss = d.getSeconds();
	 
	 //return (yyyy + '-' + addzero(MM) + '-' + addzero(dd) + ' ' + addzero(hh) + ':' + addzero(mm) + ':' + addzero(ss));
	 return (yyyy + '/' + addzero(MM) + '/' + addzero(dd));
	}
	 
	//10보다 작으면 앞에 0을 붙임
	 
	function addzero(n) {
	 return n < 10 ? "0" + n : n;
	}
	