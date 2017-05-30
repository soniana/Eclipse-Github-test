<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>

<!-- 	 <link rel="stylesheet" href="css/meminfo_check.css"> -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script>
	function bclick(f){
		f.method='POST';
		f.action='mem_info.show?db=detail&memid=${loginmem.memid}';
		f.submit();
	}
	function cclick(f){
		f.method='POST';
		f.action='re.show?db=mylist&memid=${loginmem.memid}';
		f.submit();
	}
	function dclick(f){
		f.method='POST';
		f.action='re.show?db=search';
		f.submit();
	}
	</script>
	
		<style>
	body {
		background: #fff;
	}
	.login {
		margin: 90px;
	}
	.modal-content {
		box-shadow: 0 5px 15px rgba(109, 109, 109, 0.5);
	}
	#login-overlay .row {
		margin: 11px;
	}
	.col-xs-6 {
		border: 1px solid rgba(195, 195, 195, 0.5);
		border-radius: 6px;
		width: 260px;
	}
	#loginForm {
		margin: 20px auto;
	}
	img {
		display: block;
		margin-left: auto;
		margin-right: auto;
	}
	#button {
		display: block;
		margin-left: auto;
		margin-right: auto;
	}
	#form-l {
		float: left;
	}
	#form-r {
		float: right;
	}
	</style>
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
							<h2>마이페이지</h2>
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
		</section>
		<!--/#Page header-->


	<!-- 
        ================================================== 
            Section Section Start
        ================================================== -->
		<section id="login" class="login">
			<div id="login-overlay" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-6" id="form-l">
								<form id="loginForm" novalidate="novalidate">
									<img src="./images/check.png"><br><br>
									<input type="button" id="button" class="button-style wow fadeInDown" value="회원 정보 확인" onclick="bclick(this.form);">
								</form>
							</div>
							<div class="col-xs-6" id="form-r" >
								<form id="loginForm" novalidate="novalidate">
									<img src="./images/browser.png"> <br> <br>
									<c:choose>
									<c:when test="${loginmem.memid=='admini'}">
									<input type="button" id="button" class="button-style wow fadeInDown" value="예매 정보 확인" onclick="dclick(this.form);">
									</c:when>
									<c:otherwise>
									<input type="button" id="button" class="button-style wow fadeInDown" value="예매 현황 조회" onclick="cclick(this.form);">
									</c:otherwise>
									</c:choose>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

</body>
</html>