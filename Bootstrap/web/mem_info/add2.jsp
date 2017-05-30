<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
        <link rel="icon" type="image/png" href="images/favicon.png">
        <title>MACHU? PICKU!</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <!-- Mobile Specific Metas
        ================================================== -->
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Template CSS Files
        ================================================== -->
        <!-- Twitter Bootstrs CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Ionicons Fonts Css -->
        <link rel="stylesheet" href="css/ionicons.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Hero area slider css-->
        <link rel="stylesheet" href="css/slider.css">
        <!-- owl craousel css -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/jquery.fancybox.css">
        <!-- template main css file -->
        <link rel="stylesheet" href="css/mainpage.css?ver=1">
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Login css -->
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        
        
        <!-- Template Javascript Files
        ================================================== -->
        <!-- modernizr js -->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <!-- jquery -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <!-- owl carouserl js -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- wow js -->
        <script src="js/wow.min.js"></script>
        <!-- slider js -->
        <script src="js/slider.js"></script>
        <script src="js/jquery.fancybox.js"></script>
        <!-- template main js -->
        <script src="js/main.js"></script>
        
        <script>
        var newWindow1;
        var newWindow2;
        var newWindow3;
        function search1() {
        	newWindow1 = window.open("mem_info/registerPop1.jsp", "newWindow1",
        			"height=600, width=600, resizable=yes");
        }
        function search2() {
        	newWindow2 = window.open("mem_info/registerPop2.jsp", "newWindow2",
        			"height=600, width=600, resizable=yes");
        }
        function search3() {
        	newWindow3 = window.open("mem_info/registerPop3.jsp", "newWindow3",
        			"height=600, width=600, resizable=yes");
        }
        function recieve1() {
        	var txt = "<font color='red'>받았따</font>";
        	document.getElementById("process").innerHTML = txt;
        	document.myform.receiver.value = newWindow1.document.myform.sender.value;
        }
        function recieve2() {
        	var txt = "<font color='red'>받았따</font>";
        	document.getElementById("process").innerHTML = txt;
        	document.myform.receiver.value = newWindow2.document.myform.sender.value;
        }
        function recieve3() {
        	var txt = "<font color='red'>받았따</font>";
        	document.getElementById("process").innerHTML = txt;
        	document.myform.receiver.value = newWindow3.document.myform.sender.value;
        }
        function addition(f){
        	var c=confirm('선택하신 공연이 맞습니까?');
			if(c==true){
				f.method='POST';
				f.action='mem_info.show?db=addition';
				f.submit();
			}
        }
        </script>
    </head>
    <body>

        <!-- 
        ================================================== 
            Global Page Section Start
        ================================================== -->
        <section class="global-page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2>좋아하는 공연 선택</h2>
                            <ol class="breadcrumb">
							<li><a href="index.html"> <i class="ion-ios-home"></i>
									HOME
							</a></li>
								<li class="active"><a href="javascript:history.back()">뒤로가기</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>   
        </section><!--/#Page header-->
        
        
        <!-- 
        ================================================== 
            Section Section Start
        ================================================== -->
		
		<section id ="register" class="register">
			<div class="container">
				<form class="form-horizontal" name="bb" role="form">
				    <div class="form-group" style="margin-bottom:30px;">
				        <label for="mempa1" class="col-sm-3 control-label">좋아하는 공연 1</label>
				        <div class="col-sm-9">
				            <input type="text" id="process" name="mempa1" placeholder="공연을 검색해주세요" class="form-control" readonly>
				            <a href="#none" class="del03" id="search" onclick="search1();"><span>공연 검색</span></a>
				        </div>
				    </div>
				    <div class="form-group" style="margin-bottom:30px;">
				        <label for="mempa1" class="col-sm-3 control-label">좋아하는 공연 2</label>
				        <div class="col-sm-9">
				            <input type="text" id="process" name="mempa2" placeholder="공연을 검색해주세요" class="form-control" readonly>
				            <a href="#none" class="del03" id="search" onclick="search2();"><span>공연 검색</span></a>
				        </div>
				    </div>
				    <div class="form-group" style="margin-bottom:30px;">
				        <label for="mempa1" class="col-sm-3 control-label">좋아하는 공연 3</label>
				        <div class="col-sm-9">
				            <input type="text" id="process" name="mempa3" placeholder="공연을 검색해주세요" class="form-control" readonly>
				            <a href="#none" class="del03" id="search" onclick="search3();"><span>공연 검색</span></a>
				        </div>
				</div>
				<div class="form-group">
	                    <div class="col-sm-9 col-sm-offset-3">
	                        <button type="submit" class="btn btn-primary btn-block" onclick="addition(this.form);">완료</button>
	                    </div>
	            </div>
	                    	<input type="hidden" name="memid" value="${addmeminfo.memid}">
				</form>
			</div>
		</section>
      
    </body>
</html>