<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>

<!-- Login css -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<script>
	function login(f) {
		var c = confirm('로그인 하시겠습니까');
		if (c == true) {
			f.method = 'POST';
			f.action = 'login.show?db=mem';
			f.submit();
		}
	}
	function goNexts(num) {
		if (event.keyCode == 13){
			$('input[id="id'+num+'"]').focus();
		}
	};
	function comlogin(f) {
		var c = confirm('로그인 하시겠습니까');
		if (c == true) {
			f.method = 'POST';
			f.action = 'comlogin.show';
			f.submit();
		}
	}
</script>

<style>
.login {
	margin: 90px;
}
.title {
	padding-top: 0;
}
.login .col-xs-6 {
	/* height: 340px; */
}

.login .col-xs-6 h8 {
	text-align: center;
}
body {
	background: #fff;
}
.modal-dialogue {
	width: 600px;
	margin: 70px auto;
}
.modal-body {
	padding: 30px;
}
.modal-content {
	box-shadow: 0 5px 15px rgba(109, 109, 109, 0.5);
	width: 600px;
}
#login-overlay .row {
	margin-right: -15px;
	margin-left: -15px;;
}
.col-xs-6 {
	border-radius: 6px;
}
#loginForm {
	margin: 20px auto;
}
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
#id3 {
	font-size: 14px;
	display: block;
	margin-top: 30px;
	margin-bottom: -10px;
	margin-left: auto;
	margin-right: auto;
}
#id6 {
	font-size: 14px;
	display: block;
	margin-top: 30px;
	margin-bottom: -10px;
	margin-left: auto;
	margin-right: auto;
}
#form-l {
	float: left;
}
#form-r {
	float: right;
}
.loginwell {
	min-height: 20px;
	padding: 19px;
	/* margin-bottom: 20px; */
	background-color: #f5f5f5;
	border: 1px solid #e3e3e3;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
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
						<h2>로그인</h2>
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
							<div class="col-xs-6">
								<div class="loginwell" style="background-color: white">
									<c:choose>
									<c:when test="${loginmem==null}">
									<form id="loginForm" name="formname" method="POST" action="login.show?db=mem" novalidate="novalidate">
										<div class="title" style="text-align:center">
											<h8><FONT size="5">일반 회원</font></h8>
										</div>
										<div class="form-group">
											<label for="username" class="control-label">아이디</label>
											<input type="text" class="form-control" id="id1" name="id" onKeyPress="goNexts(2)" autofocus title="Please enter you username">
											<span class="help-block"></span>
										</div>
										<div class="form-group">
											<label for="password" class="control-label">비밀번호</label>
											<input type="password" class="form-control" id="id2" name="pwd" onKeyPress="goNexts(3)" title="Please enter your password">
										</div>
											<c:choose>
												<c:when test="${login=='error'}">
												아이디 또는 비밀번호를 다시 확인하세요.<br>
												등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
<!-- 											<input type="button" class="btn btn-success btn-block" id="id3" style="background-color: #66cccc; border-color: #66cccc"
												value="일반회원 로그인" onclick="login(this.form);"> -->
											<input type="button" class="button-style wow fadeInDown" id="id3" value="일반회원 로그인" onclick="login(this.form);">
											</form>
										</c:when>
									</c:choose>
								</div>
							</div>
							<div class="col-xs-6">
								<div class="loginwell" style="background-color: white">
								   <c:choose>
								   <c:when test="${logincom==null}">
								   <form id="loginForm" name="formname" method="POST" action="login.show?db=mem" novalidate="novalidate">
										<div class="title" style="text-align:center">
											<h8><FONT size="5">사업자 회원</FONT></h8>
										</div>
										<div class="form-group">
											<label for="username" class="control-label">아이디</label>
											<input type="text" class="form-control" id="id4" name="comid" onKeyPress="goNexts(5)" autofocus title="Please enter you username">
											<span class="help-block"></span>
										</div>
										<div class="form-group">
											<label for="password" class="control-label">비밀번호</label>
											<input type="password" class="form-control" id="id5" name="compw" onKeyPress="goNexts(6)" title="Please enter your password">
										</div>
											<c:choose>
												<c:when test="${login=='err'}">
												아이디 또는 비밀번호를 다시 확인하세요.<br>
												등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
											<input type="button" class="button-style wow fadeInDown" id="id6" value="사업자 로그인" onclick="comlogin(this.form);">
									</form>
								  </c:when>
								  </c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


</body>
</html>