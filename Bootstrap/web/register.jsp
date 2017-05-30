<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<script type="text/javascript">
function login(f){
	f.method='POST';
	f.action='mem_info.show?view=add';
	f.submit();
}
function comlogin(f){
	f.method='POST';
	f.action='cominfo.show?view=add';
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
							<h2>회원가입</h2>
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
							<div class="col-xs-6" id="form-l" >
								<form id="loginForm" method="POST" action="login.show?db=mem" novalidate="novalidate">
										<img src="./images/running.png"><br> <br>
									<input type="button" id="button" class="button-style wow fadeInDown" value="일반 회원 가입" onclick="login(this.form);">
								</form>
							</div>
							<div class="col-xs-6" id="form-r" >
								<form id="loginForm" method="POST" action="login.show?db=mem"
									novalidate="novalidate">
										<img src="./images/briefcase.png"> <br> <br>
									<input type="button" id="button" class="button-style wow fadeInDown" value="사업자 회원 가입" onclick="comlogin(this.form);">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

</body>
</html>