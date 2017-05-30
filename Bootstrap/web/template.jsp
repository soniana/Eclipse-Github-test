<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.sun.org.apache.xml.internal.security.utils.Base64"%>
<%@page import="com.hive.Word"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<script src="js/highchart.js"></script>
<script src="js/top3poster.js"></script>

<!-- highchart -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
</head>
	<script>
		$(document)
		.ready(
				function() {
					function display(serverdata) {
	
						Highcharts
								.chart(
										'highchart1',
										{
											chart : {
												plotBackgroundColor : null,
												plotBorderWidth : 0,
												plotShadow : false
											},
											title : {
												text : '연령대<br>성별<br>장르',
												align : 'center',
												verticalAlign : 'middle',
												y : 40
											},
	
											tooltip : {
												pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
											},
											plotOptions : {
												pie : {
													dataLabels : {
														enabled : true,
														distance : -50,
														style : {
															fontWeight : 'bold',
															color : 'white'
														}
													},
													startAngle : -90,
													endAngle : 90,
													center : [
															'50%',
															'75%' ]
												}
											},
											series : [ {
												type : 'pie',
												name : '점유율',
												innerSize : '50%',
												data : serverdata
											} ]
										});
	
					}
					;
	
					$.ajax({
						url : 'hive11?memid=${loginmem.memid}', // hive라는 서버프로그램에 요청하겠다
						dataType : 'json', //json이라는 형태로 요청하겠다
						success : function(data) {
							display(data);
						}
					});
	
				});
		
		$(document)
			.ready(
					function() {
						function display(serverdata) {
		
							Highcharts
									.chart(
											'highchart2',
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : 0,
													plotShadow : false
												},
												title : {
													text : '연령대<br>직업<br>장르',
													align : 'center',
													verticalAlign : 'middle',
													y : 40
												},
		
												tooltip : {
													pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
												},
												plotOptions : {
													pie : {
														dataLabels : {
															enabled : true,
															distance : -50,
															style : {
																fontWeight : 'bold',
																color : 'white'
															}
														},
														startAngle : -90,
														endAngle : 90,
														center : [
																'50%',
																'75%' ]
													}
												},
												series : [ {
													type : 'pie',
													innerSize : '50%',
													data : serverdata
												} ]
											});
		
						}
						;
		
						$.ajax({
							url : 'hive22?memid=${loginmem.memid}', // hive라는 서버프로그램에 요청하겠다
							dataType : 'json', //json이라는 형태로 요청하겠다
							success : function(data) {
								display(data);
							}
						});
		
					});	
		
		$(document).ready(function() {
				function display(serverdata) {
					Highcharts.chart(
						'highchart3', {
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : 0,
								plotShadow : false
							},
							title : {
								text : '예매<br>선호장르<br>예매',
								align : 'center',
								verticalAlign : 'middle',
								y : 40
							},
							tooltip : {
								pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
							},
							plotOptions : {
								pie : {
									dataLabels : {
										enabled : true,
										distance : -50,
										style : {
											fontWeight : 'bold',
											color : 'white'
										}
									},
									startAngle : -90,
									endAngle : 90,
									center : [
											'50%',
											'75%' ]
								}
							},
							series : [{
								type : 'pie',
								name : '',
								innerSize : '50%',
								data : serverdata
							}]
						});
				};
				$.ajax({
					url : 'hive33?memid=${loginmem.memid}', // hive라는 서버프로그램에 요청하겠다
					dataType : 'json', //json이라는 형태로 요청하겠다
					success : function(data) {
						display(data);
					}
				});
		});
		$(document).ready(function() {
			function display(data1) {
				$(data1).each(function(index, item) { // alert(item.name);
					$('.poster1').append("<img src='"+item.poster+"'>");
					$('.postertitle1').append("<div class='name1'>"+item.name+"</div>");
				});
			}
			$.ajax({
				url : 'hive111?db=no&memid=${loginmem.memid}', // hive라는 서버프로그램에 요청하겠다
				dataType : 'json', // json이라는 형태로 요청하겠다
				success : function(data) {
					display(data);
				}
			});
		});
		$(document).ready(function() {
			function display(data1) {
				$(data1).each(function(index, item) {// alert(item.name);
					$('.poster2').append("<img src='"+ item.poster+ "'>");
					$('.postertitle2').append("<div class='name1'>"+item.name+"</div>");
				});
			}
			$.ajax({
				url : 'hive222?memid=${loginmem.memid}', // hive라는 서버프로그램에 요청하겠다
				dataType : 'json', // json이라는 형태로 요청하겠다
				success : function(data) {
					display(data);
				}
			});
		});
		$(document).ready(function() {
			function display(data1) {
				$(data1).each(function(index, item) {
				// alert(item.name);
				// item.name
					$('.poster3').append("<img src='"+item.poster+"'>");
					$('.postertitle3').append("<div class='name1'>"+item.name+"</div>");
				});
			}
			$.ajax({
				url : 'hive333?memid=${loginmem.memid}', // hive라는 서버프로그램에 요청하겠다
				dataType : 'json', // json이라는 형태로 요청하겠다
				success : function(data) {
					display(data);
				}
			});
		});	
	</script>
		<style>
	* {
		margin: 0;
		padding: 0;		
	}
	.highchart {
		width: 1140px;
		margin: 0 auto;
	}
	#highchart1 {
		float: left;
		width: 480px;
		height: 300px;
		margin: 15px 0 15px 0;
	}
	.poster1 {
		float: right;
		width: 620px;
		height: 300px;
	}
	#highchart2 {
		float: left;
		width: 480px;
		height: 300px;
		margin: 15px 0 15px 0;
	}
	.poster2 {
		float: right;
		width: 620px;
		height: 300px;
	}
	#highchart3 {
		float: left;
		width: 480px;
		height: 300px;
		margin: 15px 0 15px 0;
	}
	.poster3 {
		float: right;
		width: 620px;
		height: 300px;
	}
	.chart {
		width: 1140px;
		height: 400px;
		border: 15px solid #ffa42f;
		margin: 20px 0 120px 0;
	}
	.chart1 {
		width: 550px;
		height: 550px;
		border: 15px solid #ffa42f;
		margin: 20px 0 120px 0;
	}
	#poster {
		display: table;
		height: 200px;
		margin-top: 20px;
		margin-left: 0;
		margin-right: 0;
	}
	#poster img {
		display: block;
		margin: auto;
		width: 130px;
		height: 170px;
		float: left;
		margin: 15px 0px 15px 62px;
		border: 1px solid #cccccc;
	}
	.charttitle {
		width: 1120px;
		height: 40px;
		color: #191919;
		font-size: 18px;
		font-weight: 500;
		padding: 5px 5px 5px 5px;
		background-color: #ffa42f;
	}
	.charttitle1 {
		width: 520px;
		height: 40px;
		color: #191919;
		font-size: 18px;
		font-weight: 500;
		padding: 5px 5px 5px 5px;
		background-color: #ffa42f;
	}
	#rank {
		float: right;
		width: 620px;
		height:50px;
	}
	#postertitle {
		float: right;
		width: 565px;
		margin: 0;
	}
	.name1 {
		float: left;
		font-weight: 700;
		margin: 15px 54px 20px 54px;
	}
	.rankbadge {
		float: left;
		margin: 25px 40px 0 115px;
	}
	</style>
<body>


	<!-- 
        ================================================== 
            Global Page Section Start
        ================================================== -->
		<section class="global-page-header">
			<div class="container">
			
			<div class="list-style-list">
	              
	              </div>
				<div class="row">
					<div class="col-md-12">
						<div class="block">
							<h2>맞춤형 분석 추천</h2>
							<ol class="breadcrumb">
								<li class="active">${loginmem.memid}님의 취향에 맞는 공연 목록</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/#Page header-->


	<!-- 
        ================================================== 
            Section Section Start
        ================================================== -->
		<section class="works service-page">
			<div class="container">
			
				<div class="chart">
					<div class="charttitle wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						${loginmem.memid}님과 연령대가 비슷한 남성이 선호하는 공연 장르
					</div>
					<div class="highchart" id="highchart1"></div>
					<div id="rank" class="rank wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						<div class="rankbadge"><img src="./images/rank/poster_rank_1.png" /></div>
						<div class="rankbadge"><img src="./images/rank/poster_rank_2.png" /></div>
						<div class="rankbadge"><img src="./images/rank/poster_rank_3.png" /></div>
					</div>
					<div id="poster" class="poster1 wow fadeInDown animated" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInDown;"></div>
					<div id="postertitle" class="postertitle1 wow fadeInDown animated" data-wow-delay=".9s" style="visibility: visible; animation-delay: 0.9s; animation-name: fadeInDown;"></div>
				</div>
				
				<div class="chart">
					<div class="charttitle wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						${loginmem.memid}님과 연령대와 직업이 같은 사람들이 선호하는 공연 장르 
					</div>			
					<div id="rank" class="rank wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						<div class="rankbadge"><img src="./images/rank/poster_rank_1.png" /></div>
						<div class="rankbadge"><img src="./images/rank/poster_rank_2.png" /></div>
						<div class="rankbadge"><img src="./images/rank/poster_rank_3.png" /></div>
					</div>				
					<div class="highchart" id="highchart2"></div>
					<div id="poster" class="poster2 wow fadeInDown animated" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInDown;"></div>
					<div id="postertitle" class="postertitle2 wow fadeInDown animated" data-wow-delay=".9s" style="visibility: visible; animation-delay: 0.9s; animation-name: fadeInDown;"></div>
				</div>
				
				<div class="chart">
					<div class="charttitle wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						${loginmem.memid}님께서 예매하신 공연을 예매한 다른 사람들이 예매한 공연 
					</div>	
					<div id="rank" class="rank wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						<div class="rankbadge"><img src="./images/rank/poster_rank_1.png" /></div>
						<div class="rankbadge"><img src="./images/rank/poster_rank_2.png" /></div>
						<div class="rankbadge"><img src="./images/rank/poster_rank_3.png" /></div>
					</div>									
					<div class="highchart" id="highchart3"></div>
					<div id="poster" class="poster3 wow fadeInDown animated" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInDown;"></div>
					<div id="postertitle" class="postertitle3 wow fadeInDown animated" data-wow-delay=".9s" style="visibility: visible; animation-delay: 0.9s; animation-name: fadeInDown;"></div>
	             </div>
	             
	             <div class="chart1">
					<div class="charttitle1 wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						${loginmem.memid}님과 동일한 공연을 검색한 다른 사람들이 검색한 공연 
					</div>	
					<div id="wordcloud" class="rank wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
<%-- 						<div class="wordcloud">
							<% Word w = new Word(); %>
							<img src="data:image/jpeg;base64,<%=Base64.encode(w.getGraph())%>">
						</div> --%>
					</div>									
	             </div>	             
             </div>
		</section>




</body>
</html>