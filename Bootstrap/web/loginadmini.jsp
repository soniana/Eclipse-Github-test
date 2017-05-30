<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
    <head>
	<script>
		function login(f){
			var c=confirm('로그인 하시겠습니까');
			if(c==true){
				f.method='POST';
				f.action='login.show?db=admini';
				f.submit();
			}
		}
	</script>
	<style>
		.form-signin {
			margin: 90px 0 90px 0;
		}
		h2 {
			font-size: 30px;
			text-align: center;
			margin: 20px 0 20px 0;
		}
		#button {
			margin: 20px auto;
		}
		.form-control {
			width: 200px;
			margin-top: 30px;
			margin-bottom: 30px;
			margin-left: auto;
			margin-right: auto;
		}
		.pinput {
			width: 200px;
			margin-left: auto;
			margin-right: auto;		
		}
		body {
			background: #fff;
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
                            <h2>관리자 로그인</h2>
                            <ol class="breadcrumb">
							<li><a href="index.html"> <i class="ion-ios-home"></i>
									HOME
							</a></li>
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
		<section>
			<div class="wrapper">
				<form class="form-signin" style="border-radius:8px">       
					<div class="title" style="text-align:center">
						<h8 class="form-signin-heading"><font size="5">Security Code를 입력하세요</font></h8>
					</div>			    	
			    		<div class="pinput"><input type="password" class="form-control" name="pwdadmini" autofocus placeholder="Security Code"></div>      
			    		<!-- <button class="btn btn-lg btn-primary btn-block" style="background-color:#66cccc;border-color:#66cccc" value="Send" onclick="login(this.form);">로그인</button> -->
			    		<input type="submit" id="button" class="button-style wow fadeInDown" value="로그인" onclick="login(this.form);">
			    	<input type="hidden" name="adminid" value="${adminid}"> 
		    </form>
		  </div>
		</section>


    </body>
</html>