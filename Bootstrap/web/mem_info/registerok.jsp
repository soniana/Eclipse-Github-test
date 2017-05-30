<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<script type="text/javascript">
function goLogin(f){
	f.method='POST';
	f.action='main.show?view=login';
	f.submit();
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
								<h2>WELCOME!</h2>
								<ol class="breadcrumb">
									<li><a href="index.html"> <i class="ion-ios-home"></i>
											HOME
									</a></li>
									<!-- 	<li class="active">회원가입</li> -->
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
		<section>
			
			<form style="padding: 25px;">
				<div class="section-heading" style="text-align:center">
					<br>
					<br>
					<br>
					<h1 class="title wow fadeInDown animated" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInDown;"><strong>회원가입이 완료되었습니다.</strong></h1>
					<p class="wow fadeInDown animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInDown;">로그인 후 사용해주세요.</p>
				
				</div>
				<div style="text-align:center;">
					<input type="button" class="button-style wow fadeInUp animated smooth-scroll" data-wowodelay=".9s" style="padding:15px; margin:15px auto; visibility: visible; animation-delay:0.9s; animation-name: fadeInUp; font-size:12px;" value="로그인 바로가기" onclick="goLogin(this.form);"/>
				</div>
			</form>
		
		</section>

</body>
</html>