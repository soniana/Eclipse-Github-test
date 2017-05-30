<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
										'com_highchart1',
										{
											chart : {
												plotBackgroundColor : null,
												plotBorderWidth : 0,
												plotShadow : false
											},
											title : {
												text : '종류<br>선호장르',
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
						url : 'chart1?db=no&comid=${logincom.comid}', // hive라는 서버프로그램에 요청하겠다
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
											'com_highchart2',
											{
												chart : {
													plotBackgroundColor : null,
													plotBorderWidth : 0,
													plotShadow : false
												},
												title : {
													text : '종류<br>성별',
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
							url : 'chart2?comid=${logincom.comid}', // hive라는 서버프로그램에 요청하겠다
							dataType : 'json', //json이라는 형태로 요청하겠다
							success : function(data) {
								display(data);
							}
						});
		
					});	
		
		$(document).ready(function() {
				function display(serverdata) {
					Highcharts.chart(
						'com_highchart3', {
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : 0,
								plotShadow : false
							},
							title : {
								text : '종류<br>직업',
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
					url : 'chart3?comid=${logincom.comid}', // hive라는 서버프로그램에 요청하겠다
					dataType : 'json', //json이라는 형태로 요청하겠다
					success : function(data) {
						display(data);
					}
				});
		});
		
		//////////////////////////////////////////////////////
		
		$(document).ready(function() {
				function display(serverdata) {
					Highcharts.chart(
						'com_highchart4', {
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : 0,
								plotShadow : false
							},
							title : {
								text : '종류<br>기/미혼',
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
					url : 'chart4?comid=${logincom.comid}', // hive라는 서버프로그램에 요청하겠다
					dataType : 'json', //json이라는 형태로 요청하겠다
					success : function(data) {
						display(data);
					}
				});
		});
		
		
		///////////////////////////////////////////////////////
		
		/* $(document).ready(function() {
			function display(data1) {
				$(data1).each(function(index, item) { // alert(item.name);
					$('.poster1').append("<img src='"+item.poster+"'>");
					$('.postertitle1').append("<div class='name1'>"+item.name+"</div>");
				});
			}
			$.ajax({
				url : 'hive111', // hive라는 서버프로그램에 요청하겠다
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
				url : 'hive222', // hive라는 서버프로그램에 요청하겠다
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
				url : 'hive333', // hive라는 서버프로그램에 요청하겠다
				dataType : 'json', // json이라는 형태로 요청하겠다
				success : function(data) {
					display(data);
				}
			});
		});	 */
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
	#com_highchart1 {
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
	#com_highchart2 {
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
	#com_highchart3 {
		float: left;
		width: 480px;
		height: 300px;
		margin: 15px 0 15px 0;
	}
	#com_highchart4 {
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
	    float: left;
		width: 550px;
		height: 400px;
		border: 15px solid #ffe6c2;
		margin: 20px 0 120px 0;
	}
	.chart2 {
		float : right;
		width: 550px;
		height: 400px;
		border: 15px solid #ffe6c2;
		margin: 20px 0 120px 0;
	}
	
	.chart1 {
		width: 550px;
		height: 550px;
		border: 15px solid #ffe6c2;
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
		width: 520px;
		height: 40px;
		color: #636363;
		font-size: 18px;
		font-weight: 500;
		padding: 5px 5px 5px 5px;
		background-color: #ffe6c2;
	}
	.charttitle1 {
		width: 520px;
		height: 40px;
		color: #636363;
		font-size: 18px;
		font-weight: 500;
		padding: 5px 5px 5px 5px;
		background-color: #ffe6c2;
	}
	#rank {
		float: right;
		width: 620px;
		height:50px;
	}
	#postertitle {
		float: right;
		margin: 0 10px;
	}
	.name1 {
		float: left;
		font-weight: 700;
		margin: 15px 15px 20px 15px;
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
								<li class="active">${logincom.comid}님을 위한 분석 목록</li>
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
						${logincom.comid}님의 공연종류를 예매한 사람들이 선호하는 공연 장르
					</div>
					<div class="highchart" id="com_highchart1" ></div>
					</div>
				
				<div class="chart2">
					<div class="charttitle wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						${logincom.comid}님의 공연종류를 예매한 사람들의 성별
					</div>			
					<div class="highchart" id="com_highchart2"></div>
				</div>
				
				<div class="chart">
					<div class="charttitle wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						${logincom.comid}님의 공연종류를 예매한 사람들의 직업
					</div>	
													
					<div class="highchart" id="com_highchart3"></div>
					
	             </div>
	             
	             	<div class="chart2">
					<div class="charttitle wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;">
						${logincom.comid}님의 공연종류를 예매한 사람들의 기/미혼
					</div>	
												
					<div class="highchart" id="com_highchart4"></div>
					
	             </div>             
             </div>
		</section>


</body>
</html>