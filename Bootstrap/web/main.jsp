<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
        <!-- <link rel="stylesheet" href="css/main.css"> -->
        <link rel="stylesheet" href="css/main.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
<!--         boxoffice css file
        <link rel="stylesheet" type="text/css" href="/js/cmmn/jquery/ui/jquery-ui-1.10.4.custom.css"/> -->
        
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
        <!-- boxoffice js -->
        <script src="js/boxoffice.js"></script>

		<script type="text/javascript">
		function memLogout(){
			var c=confirm('로그아웃 하시겠습니까?');
			if(c==true){
				location.href='login.show';
			}
		}
		function comLogout(){
			var c=confirm('로그아웃 하시겠습니까?');
			if(c==true){
				location.href='comlogin.show';
			}
		}
		</script>

    </head>
    <body>
        <!--
        ==================================================
        Header Section Start
        ================================================== -->
        <header id="top-bar" class="navbar-fixed-top animated-header">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->
                    
                    <!-- logo -->
                    
                    <c:choose>
                     <c:when test="${center==null}">
                    <div class="navbar-brand">
                        <a href="index.html" >
                            <img src="images/logo.png" alt="">
                        </a>
                    </div>
                     </c:when>
                     <c:otherwise>
                    <div class="navbar-brand">
                        <a href="index.html" >
                            <img src="images/logo3.png" alt="">
                        </a>
                    </div>
                     </c:otherwise>
                    </c:choose>
                    
                    <!-- /logo -->
                <c:choose> 
                 <c:when test="${loginmem==null&&logincom==null}">  
                 <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="mini-menu">
                        <ul class="nav navbar-nav navbar-right">
                        	<li><a href="main.show?view=login">로그인</a></li>
                        	<li><a href="main.show?view=register">회원가입</a></li>
                        </ul>
                    </div>
                </nav>   
                </c:when>
                <c:when test="${loginmem==null&&logincom!=null}">  
                 <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="mini-menu">
                        <ul class="nav navbar-nav navbar-right">
                        	<li><a href="#" onclick="comLogout();">로그아웃</a></li>
                        	<li><a href="cominfo.show?db=mypage">마이페이지</a></li>
                        </ul>
                    </div>
                </nav>   
                </c:when>
                <c:when test="${loginmem.memid=='admini'}">  
                 <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="mini-menu">
                        <ul class="nav navbar-nav navbar-right">
                        	<li><a href="#" onclick="comLogout();">로그아웃</a></li>
                        	<li><a href="mem_info.show?db=mypage">마이페이지</a></li>
                        	<li><a href="mem_info.show?db=admini">회원정보확인</a></li>
                        </ul>
                    </div>
                </nav>   
                </c:when>
                <c:otherwise>
                 <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="mini-menu">
                        <ul class="nav navbar-nav navbar-right">
                        	<li><a href="#" onclick="memLogout();">로그아웃</a></li>
                        	<li><a href="mem_info.show?db=mypage">마이페이지</a></li>
                        </ul>
                    </div>
                </nav>   
                </c:otherwise>
                
                
                </c:choose>   
                    
                    
                </div>
                <!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                          <c:choose>
                          <c:when test="${center==null}">
                            <li><a class="animated smooth-scroll" href="#feature" data-section="#feature">이달의 추천공연</a></li>
                            <li class="dropdown">
                                <a href="#" class="animated smooth-scroll dropdown-toggle" data-toggle="dropdown" href="#works" data-section="#works" >이달의 최신공연<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="prf.show?db=typesearch&gen=all">공연검색</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=y">연극</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=m">뮤지컬</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=o">오페라</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=c">클래식</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=d">무용</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=b">발레</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=k">국악</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=s">복합</a></li>                                       
                                    </ul>
                                </div>
                            </li>
                          </c:when>
                          <c:otherwise>                          
                             <li><a class="animated smooth-scroll" href="main.show#feature" data-section="#feature">이달의 추천공연</a></li>
                            <li class="dropdown">
                                <a class="animated smooth-scroll" href="main.show#works" data-section="#works">이달의 최신공연<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="prf.show?db=typesearch&gen=all">공연검색</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=y">연극</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=m">뮤지컬</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=o">오페라</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=c">클래식</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=d">무용</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=b">발레</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=k">국악</a></li>
                                        <li><a href="prf.show?db=typesearch&gen=s">복합</a></li>                                       
                                    </ul>
                                </div>
                            </li>
                          </c:otherwise>
                          </c:choose>
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
            </div>
        </header>        
        
		<c:choose>
			<c:when test="${center==null}">
				<jsp:include page="center.jsp" />
			</c:when>
            <c:otherwise>
            	<jsp:include page="${center}.jsp" />
            </c:otherwise>
		</c:choose>
                
                        
        <!--
        ==================================================
        Call To Action Section Start
        ================================================== -->
        <section id="call-to-action">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2 class="title wow fadeInDown" data-wow-delay=".3s" data-wow-duration="500ms">만든이</h2>
                            <p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms">귀염둥이 2JO 멤버들을 소개합니다!</p>
                            <a href="#" class="btn btn-default btn-contact wow fadeInDown" data-wow-delay=".7s" data-wow-duration="500ms">
                            	김민진 / 나소영 / 서동준 / 오소연 / 이다현 / 이홍은
                            </a>                                	
                        </div>
                    </div>
                </div>
            </div>
        </section>
           
           
           
        <!--
        ==================================================
        Footer Section Start
        ================================================== -->
        <footer id="footer">
            <div class="container">
                <div class="col-md-8">
                    <p class="copyright">Copyright: <span>2017</span> . Design and Developed by <a href="http://cafe.naver.com/melticampusbigdata">2JO</a></p>
                </div>
                <div class="col-md-4">
                    <!-- Social Media -->
                    <ul class="social">
                    
                    <c:choose>
                     <c:when test="${center==null}">
                        <li>
                            <a href="main.show" class="Main">
                                <img src="images/logo3.png">
                            </a>
                        </li>    
                     </c:when>
                     <c:otherwise>
                     	<li>
                            <a href="main.show" class="Main">
                                <img src="images/logo.png">
                            </a>
                        </li>    
                     </c:otherwise>
                     </c:choose>
                                                                  
                    </ul>
                </div>
            </div>
        </footer> <!-- /#footer -->     
        
        
        </body>
    </html>