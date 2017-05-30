<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width,initial-scale=1">

        <!-- Section js -->
        <script src="js/boxoffice.js"></script>
<!--         <script src="js/log_data1.js"></script>
    	<script src="js/log_data2.js"></script>   -->        
        
        <script>
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
        
	    
		 //실시간 검색어 순위
		 $(document).ready(function() {
		     	function keyword(data) {
		     			$(data).each(function(index,item){
		 			$('.rankname').append(
		 					"<li id='prfname' class='prfname1'><a href='#'>"+item.search+"</a></li>"
			);
		 		});
		     	
		}
		     	function requestKeyword() {
		     		$.ajax({
		     			url : 'keyword.show',
		     		    dataType : 'json',
		     			success : function(data) {
		     				//alert(data);
		     				keyword(data);
		     				}
		     			});
		     		};
		     		requestKeyword();
		 });	    
		 //조회순으로 공연추천
		 $(document).ready(function() {
				function display(data1) {
					$(data1).each(function(index, item) {
						var poster = item.poster
						$('.srank').append("<div class=\"col-md-4 col-lg-4 col-xs-12\">" +
								"<div class='media wow fadeInLeft animated' data-wow-duration='500ms' data-wow-delay='300ms'>" + 
								"<div class='media-left'>" + 
								"<div class='icon'>" + 
								"<img src='"+item.poster+"' width='235px' height='330px' style='margin-right:10px'> <br>" +
								"</div>" + 
								"<div class='media-body'>" + 
								"<h4 class='media-heading'>"+item.PRFNM + "</h4>" + 
								"</div>" +
								"</div>" + 
								"</div>");
					});
				}
				$.ajax({
					url : 'csv1', // hive라는 서버프로그램에 요청하겠다
					dataType : 'json', // json이라는 형태로 요청하겠다
					success : function(data) {
						display(data);
					}
				});
	
			});
		 //예매순으로 공연추천
		 $(document).ready(function() {
				function display(data1) {
					$(data1).each(function(index, item) {
						var poster = item.poster;
						$('.rerank').append("<div class='col-md-4 col-lg-4 col-xs-12'>" +
								"<div class='media wow fadeInRight animated' data-wow-duration='500ms' data-wow-delay='1200ms'>" + 
								"<div class='media-left'>" + 
								"<div class='icon'>" + 
								"<img src='" + item.poster + "' width='235px' height='330px' style='margin-right:10px'> <br>" +
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
		function goGo(f){
	           f.action='hive111.show?db=gogo&memid=${loginmem.memid}';
	           f.method='POST';
	           f.submit();
	        };
		function goCom(f){
	           f.action='chart1.show?db=go&comid=${logincom.comid}';
	           f.method='POST';
	           f.submit();
	        };
		function gogosearch(f){
        	f.action='search.show?db=gogogo&memid=${loginmem.memid}';
        	f.method='POST';
        	f.submit();
        };
        function gogogosearch(f){
        	f.action='search.show?db=gogo';
        	f.method='POST';
        	f.submit();
        };
	   </script>

      <style>
		#logoimg {
		      	float: left;
		      	margin-bottom: 40px;
		      }
		.check {
		      	font-size: 25px;
		      	font-weight: 600;
		      }
		.keywordrank {
		      	float: right;
		      	width: 250px;
		      	height: 40px;
		      	margin: 10px 60px 50px 50px;
		      }
		.ranktitle {
		      	width: 250px;
		      	height: 40px;
		      	font-size: 14px;
		      	font-weight:700;
		      	color: #fff;
		      	padding: 10px;
		      	background-color: #66cccc;
		      }
		.ranknum {
		      	float: left;
		      	height: 300px;
		      	width: 45px;
		      	margin-top: 12px;
		      }
		.rankname {
		       float: right;
		      	height: 300px;
		      	width: 195px;
		      	margin-top: 12px;
		      }
		#prfrank {
		      	float: left;
		      	padding: 0;
		      	font-size: 13px;
		      	color: #353535;  
		      	width: 70px;
		      	height: 35px;
		      	font-weight: 700;      	
		      }
		#prfname {
		      	float: right;
		      	font-size: 13px;
		      	font-weight: 500;
		      	color: #353535;
		       width: 205px;
		       height: 35px;
		   }
		#prfname a:hover {
		   	color: #ffa42f;
		   	background-color: #fff;
		   	font-weight: 700;
		   }
		#hero-area h1 {
		   	width: 600px;
		}
		#slider {
		   	float: left;
		   }
		.field {
			float: left;
			display:flex;
			width: 270px;
			height: 50px;
			flex-direction:row;
			box-shadow:
				1px 1px 0 #35afaf,
				2px 2px 0 #35afaf,
				3px 3px 0 #35afaf,
				4px 4px 0 #35afaf,
				5px 5px 0 #35afaf,
				6px 6px 0 #35afaf,
				7px 7px 0 #35afaf;
		}
		.field>input[type=text],
		.field>button {
		  display:block;
		}
		.field>input[type=text] {
		  flex:1;
		  padding:1em;
		  border:0.2em solid #66cccc;
		  background-color: #fff;
		  color: #000;
		  font-size: 15px;
		}
		.field>button {
		    padding: 0.6em 0.8em;
		    width: 60px;
		    background-color: #66cccc;
		    color: white;
		    border: none;
		    font-size: 15px;
		    font-weight: 700;
		    font-family: Nanumgothic;
		}
		.field>button:hover {
			background-color: #87d6d6;
		}			
		.right-field {
		    display: flex;
		    float: right;
		    margin: 0px 230px 0px 0px;
		    width: 265px;
		    height: 50px;
		    flex-direction: row;
		    box-shadow: 1px 1px 0 #e6880e,
					    2px 2px 0 #e6880e,
					    3px 3px 0 #e6880e,
					    4px 4px 0 #e6880e,
					    5px 5px 0 #e6880e,
					    6px 6px 0 #e6880e,
					    7px 7px 0 #e6880e;
		}
		.right-field>input[type=text],
		.right-field>button {
			display:block;
		}
		.right-field>input[type=text] {
		    flex: 1;
		    padding: 1em;
		    border: 0.2em solid #ffa42f;
		    background-color: #fff;
		    color: #000;
		    font-size: 15px;
		}
		.right-field>button {
		    padding: 0.6em 0.8em;
		    width: 60px;
		    background-color: #ffa42f;
		    color: white;
		    border: none;
		    font-size: 15px;
		    font-weight: 700;
		    font-family: Nanumgothic;
		}
		.right-field>button:hover {
			background-color: #f7b45e;
		}		
		#menudown {
			width: 254px;
		    height: 400px;
		    border: 2px solid #66cccc;
		    box-shadow: 1px 1px 0 #66cccc, 2px 2px 0 #66cccc, 3px 3px 0 #66cccc, 4px 4px 0 #66cccc, 5px 5px 0 #66cccc;
		}
      </style>

        
        
        
        
        <!--
        ==================================================
        Slider Section Start
        ================================================== -->
        <section id="hero-area" >
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="block wow fadeInUp" data-wow-delay=".3s">
                            <section class="cd-intro">
	                            <div id="menudown" class="keywordrank">
                                	<div class="ranktitle">실시간 검색어 순위</div>
	                                	<ul class="ranknum">
	                                		<li id="prfrank" class="rank">1</li>
	                                		<li id="prfrank" class="rank">2</li>
	                                		<li id="prfrank" class="rank">3</li>	
	                                		<li id="prfrank" class="rank">4</li>	
	                                		<li id="prfrank" class="rank">5</li>	
	                                		<li id="prfrank" class="rank">6</li>	
	                                		<li id="prfrank" class="rank">7</li>
	                                		<li id="prfrank" class="rank">8</li>
	                                		<li id="prfrank" class="rank">9</li>
	                                		<li id="prfrank" class="rank">10</li>	                                		
	                                	</ul>
	                                	<ul class="rankname"></ul>
		                        </div>                                
                                <h1 class="wow fadeInUp animated cd-headline slide" data-wow-delay=".4s" >
                                	<img id="logoimg" class="img-responsive" src="images/logo2.png"><br>
                                </h1>
                            </section>                             
                            <form> 
							<c:choose>
	                        <c:when test="${loginmem!=null}">
			                <div class="field fadeInUp animated" id="searchform" data-wow-delay=".6s" >
								<input type="text" name="searchterm" placeholder="공연 검색" />
								<button type="button" id="search" onclick="gogosearch(this.form);">GO!</button>
							</div>
							</c:when>
							<c:otherwise>
							<div class="field fadeInUp animated" id="searchform" data-wow-delay=".6s" >
								<input type="text" name="searchterm" placeholder="공연 검색" />
								<button type="button" id="search" onclick="gogogosearch(this.form);">GO!</button>
							</div>
							</c:otherwise>
							</c:choose>
							</form>
							<form>
				                <div class="right-field fadeInUp animated" id="searchform" data-wow-delay=".9s" >
									<input type="text" id="searchterm" placeholder="나의 취향에 맞는 공연 확인하기" readonly />
									<c:choose>
	                                   <c:when test="${loginmem!=null&&logincom==null}">
	                                  		<button type="button" id="search" onclick="goGo(this.form);">GO!</button>
	                                   </c:when>
	                                   <c:when test="${loginmem==null&&logincom!=null}">
	                                  		<button type="button" id="search" onclick="goCom(this.form);">GO!</button>
	                                   </c:when>
	                                   <c:otherwise>  
											<button type="button" id="search">GO!</button>
	                                   </c:otherwise>
	                                </c:choose>	
								</div>  
							 </form>                            
                            </div>
                        </div>
                    </div>
                </div> 
            </section><!--/#main-slider-->
            
            
            
 


          <!--
           ==================================================
           Second Section Start
           ================================================== -->
           <section id="feature" class="feature">
               <div class="container">
                   <div class="section-heading">
                       <h1 class="title wow fadeInLeft" data-wow-delay=".3s">이달의 추천 공연</h1>
                       <p class="wow fadeInLeft" data-wow-delay=".5s">빅데이터 분석을 바탕으로 한 이달의 조회순 1,2,3위 공연 추천</p>
                   </div>
                   <div class="row">
                   		<div class="srank"></div>
                   </div>
                   <div class="section-heading">
                       <p class="wow fadeInRight" data-wow-delay=".5s">빅데이터 분석을 바탕으로 한 이달의 예매순 1,2,3위 공연 추천</p>
                   </div>
                   <div class="row">
						<div class="rerank"></div>
                   </div>
               </div>
           </section> <!-- /#feature -->
           
           
            
            
            
            <!--
            ==================================================
            Second Section Start
            ================================================== -->
            <section id="works" class="works">
                <div class="container">
                    <div class="section-heading">
                        <h1 class="title wow fadeInDown" data-wow-delay=".3s">이달의 공연순위</h1>
                        <p class="wow fadeInDown" data-wow-delay=".5s">
							이 달의 공연 순위를 확인해보쎄요우~!
                        </p>
                    </div>
                    	   	
		            <!-- 메인 비주얼  -->
					<div class="wow fadeInLeft animated boxoffice" id="visual"  data-wow-duration="500ms" data-wow-delay="300ms">
						<div class="boxtable">
							<h2 class="skip">박스오피스</h2>
							
						    <!-- 주간 박스오피스 -->
							<div class="box" id="tab1"><a href="#tab1_visible" class="over"><span class="">주간</span></a></div>
							<!-- 장르별 박스오피스  -->
							<div class="box" id="category">
								<div id="tab3">
									<a href="" class="over"></a>
									<div id="tab3_wrap">
										<ul class="list_category">
											<li><a href="#none" id="Theatre"><span class="category_name">연극</span></a></li>
											<li><a href="#none" id="Musical" class="over"><span class="category_name">뮤지컬</span></a></li>
											<li><a href="#none" id="Classic"><span class="category_name">클래식/오페라</span></a></li>
											<li><a href="#none" id="Dance"><span class="category_name">무용/발레</span></a></li>
											<li><a href="#none" id="Gukak"><span class="category_name">국악/복합</span></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="box" id="tab1_wrap">
								<ul class="list_rank weekBoxOffice"></ul>
						        <div class="poster_rank">
						        	<div class="title">
							            <h1>박스오피스<span> - 연극</span></h1>
							        	<p><span class="d7Dt"></span><span> ~ </span><span class="d1Dt"></span><span class="text"> 기준</span></p>
						          	</div>
						           	<ul class="weekBoxOfficePoster"></ul>
								</div>
							</div>
						    <!-- // 주간 박스오피스 끝 -->
						          
						    <!-- 월간 박스오피스  -->
							<div class="box" id="tab2"><a href="#tab2_visible"><span class="">월간</span></a></div>
							<div class="box" id="tab2_wrap">
								<ul class="list_rank monthBoxOffice"></ul>
						        <div class="poster_rank">
									<div class="title">
										<h1>박스오피스<span> - 연극</span></h1>
						               	<p><span class="d30Dt"></span><span> ~ </span><span class="d1Dt"></span><span class="text"> 기준</span></p>
						            </div>
						           	<ul class="monthBoxOfficePoster"></ul>
								</div>
							</div>
						    <!-- // 월간 박스오피스 끝 -->
						</div>
					</div>		               
					<!-- // 메인 비주얼 끝 -->
            	</div>
            </section> <!-- #works -->
            
            