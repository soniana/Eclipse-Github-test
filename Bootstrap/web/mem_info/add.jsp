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
        
		<script type="text/javascript">
		function checknadd(f) {
			var id_exp = /[A-za-z0-9]{5,10}/g;
			var tel_exp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			var email_exp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if (!id_exp.test(document.formname.memid.value)){
				alert("아이디는 영문과 숫자를 이용하여 5자리 이상 10자리 이하로 입력하세요.");
				document.formname.memid.focus();
				return;
			}else if (document.formname.mempw.value.search(/[a-z0-9]{8,}/i)==-1){
			    alert("비밀번호는 영문과 숫자를 이용하여 8자리 이상으로 입력하세요.");
			    document.formname.mempw.focus();
				return;
			}else if (document.formname.memname.value ==""){
				alert("이름을 입력하세요.");
				document.formname.memname.focus();
				return;
			}else if (!tel_exp.test(document.formname.memtel.value)){
				alert("연락처를 정확하게 입력하세요.");
				document.formname.memtel.focus();
				return;
			}else if(!email_exp.test(document.formname.mememail.value)){
				alert("email을 정확하게 입력하세요.");
				document.formname.mememail.focus();
				return;
			}else if (document.formname.memage.value=="" ||document.formname.memage.value<1 ||document.formname.memage.value>100){
				alert("나이를 정확하게 입력하세요.");
				document.formname.memage.focus();
				return;
			}else if (document.formname.memjob.value=="None"){
				alert("직업을 선택하세요.");
				document.formname.memjob.focus();
				return;
			}else if (document.formname.memtype.value=="None"){
				alert("공연종류를 선택하세요.");
				document.formname.memtype.focus();
				return;
			}
			var memjang=document.formname.memjang;
			var chk=0;
			for(i=0;i<memjang.length;i++){
				if(memjang[i].checked == true){
		// 			alert("안돼");	//이런식으로 체크가 되었는지 안되었는지로 확인해야 한다. //value값으로 확인이 불가하다.
					chk++;	
				}
			}
			if(chk<3){
				alert("선호하는 장르를 3개 선택하세요.");
				return;
			}
			if (eval("document.formname.check.checked") == false) {				
				alert("개인정보 수집에 동의 하셔야 다음 단계로 진행 가능합니다.");
				document.formname.check.focus();
				return;
			}
			
			var c=confirm('등록 하시겠습니까?');
			if(c==true){
				f.method='POST';
				f.action='mem_info.show?db=add';
				f.submit();
			}	
		};
		
		function checkPwd(){
			var f1 = document.formname;
			var pw1 = f1.mempw.value;
			var pw2 = f1.mempw_chk.value;
			if(pw1!=pw2){
				document.getElementById('checkPwd').style.color = "red";
				document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
			}else{
				document.getElementById('checkPwd').style.color = "black";
				document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
			}			
		}
		
		function choise_chk(chk) {
			var target=document.getElementsByName('memjang');
			var num=0;
			var ropNum=3; // 개수 임의지정
			for(var i=0;i<target.length;i++) {
				if(target[i].checked==true) {
				num++;
				}
			}
			if(num>ropNum) {
				chk.checked = false;
				return alert(ropNum+"개 이상 체크 불가능합니다.");
			}
		};
		
		function goNext(num) {
			if (event.keyCode == 13){
				$('input[id="id'+num+'"]').focus();
			}
		};		
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
                            <h2>일반 회원 가입</h2>
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
	            <form class="form-horizontal" role="form" name="formname">
	                <div class="form-group">
	                    <label for="id" class="col-sm-3 control-label">아이디</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id" placeholder="아이디" name="memid" class="form-control" maxlength="10" onKeyPress="goNext(0)" autofocus>
	                        <span class="help-block">아이디는 영문 및 숫자로 5자 이상 작성해주세요.</span>
	              		</div>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="col-sm-3 control-label">비밀번호</label>
	                    <div class="col-sm-9">
	                        <input type="password" id="id0" placeholder="비밀번호" name="mempw" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(1)">
	                        <span class="help-block">비밀번호는 영문 및 숫자로 8자 이상 작성해주세요.</span>
	        		    </div>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="col-sm-3 control-label">비밀번호 확인</label>
	                    <div class="col-sm-9">
	                        <input type="password" id="id1" placeholder="비밀번호" name="mempw_chk" onkeyup="checkPwd();" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
	                        <div id="checkPwd"><span class="help-inline">비밀번호가 일치하지 않습니다!</span></div>
	        		    </div>
	                </div>
	                <div class="form-group">
	                    <label for="name" class="col-sm-3 control-label">이름</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id2" placeholder="이름" name="memname" class="form-control" style="ime-mode:active" onKeyPress="goNext(3)">
	                        <span class="help-block">예) 홍길동</span>
	        			</div>
	                </div>
	                <div class="form-group">
	                    <label for="tel" class="col-sm-3 control-label">전화번호</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id3" placeholder="전화번호" name="memtel" class="form-control" onKeyPress="goNext(4)">
	                        <span class="help-block">예) 010-1234-5678</span>
	        	        </div>
	                </div>
	                <div class="form-group">
	                    <label for="email" class="col-sm-3 control-label">이메일</label>
	                    <div class="col-sm-9">
	                        <input type="email" id="id4" placeholder="이메일 주소" name="mememail" class="form-control" onKeyPress="goNext(5)">
	                        <span class="help-block">예) aa@aa.com</span>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="control-label col-sm-3">성별</label>
	                    <div class="col-sm-6">
	                        <div class="row">
	   		                    <div class="col-sm-4">
	             		            <label class="radio-inline">
	                                    <input type="radio" id="id5" name="memgen" value="F" checked onKeyPress="goNext(6)">Female
	                                </label>
	                            </div>
	                            <div class="col-sm-4">
	                                <label class="radio-inline">
	                                    <input type="radio" id="id6" name="memgen" value="M" onKeyPress="goNext(7)">Male
	                                </label>
	                            </div>
	                        </div>
	                    </div>
	                </div> <!-- /.form-group -->
	                <div class="form-group">
	                    <label for="memage" class="col-sm-3 control-label">나이</label>
	                    <div class="col-sm-9">
	                        <input type="number" id="id7" name="memage" class="form-control" min="1" max="100" onKeyPress="goNext(8)">
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="control-label col-sm-3">결혼유무</label>
	                    <div class="col-sm-6">
	                        <div class="row">
	                            <div class="col-sm-4">
	                                <label class="radio-inline">	                                    
	                                    <input type="radio" id="id8" name="memmarry" value="미혼" checked onKeyPress="goNext(9)">미혼
	                                </label>
	                            </div>
	                            <div class="col-sm-4">
	                                <label class="radio-inline">
	                      			    <input type="radio" id="id9" name="memmarry" value="기혼" onKeyPress="goNext(10)">기혼
	                                </label>
	                            </div>
	                        </div>
	                    </div>
	                </div> <!-- /.form-group --> 
	                <div class="form-group">
	                    <label for="memjob" class="col-sm-3 control-label">직업</label>
	                    <div class="col-sm-9">
	                        <select id="id10" name="memjob" class="form-control">
	                        	<option value="None">직업선택</option>
	                            <option value="초중고">초중고</option>
	                            <option value="대학(원)">대학(원)</option>
	                            <option value="직장인">직장인</option>
	                            <option value="주부">주부</option>
	                            <option value="기타">기타</option>
	                        </select>
	                    </div>
	                </div> <!-- /.form-group -->                               
	                <div class="form-group">
	                    <label for="memtype" class="col-sm-3 control-label">선호하는 공연 종류</label>
	                    <div class="col-sm-9">
	                        <select id="memtype" name="memtype" class="form-control">
	                        	<option value="None">공연종류선택</option>
	                            <option value="뮤지컬">뮤지컬</option>
	                            <option value="연극">연극</option>
	                            <option value="클래식/오페라">클래식/오페라</option>
	                            <option value="무용/발레">무용/발레</option>
	                            <option value="국악/복합">국악/복합</option>
	                        </select>
	                    </div>
	                </div> <!-- /.form-group --> 
	                <div class="form-group">
	                    <label for="memjang" class="col-sm-3 control-label">선호하는 장르</label>
                        <div class="col-sm-9">
	                    	<input type="checkbox" name="memjang" value="다큐" onclick="choise_chk(this)">다큐
							<input type="checkbox" name="memjang" value="드라마" onclick="choise_chk(this)">드라마
							<input type="checkbox" name="memjang" value="로맨스" onclick="choise_chk(this)">로맨스
							<input type="checkbox" name="memjang" value="스릴러" onclick="choise_chk(this)">스릴러
							<input type="checkbox" name="memjang" value="아동" onclick="choise_chk(this)">아동
							<input type="checkbox" name="memjang" value="액션" onclick="choise_chk(this)">액션
							<input type="checkbox" name="memjang" value="재즈" onclick="choise_chk(this)">재즈
							<input type="checkbox" name="memjang" value="코미디" onclick="choise_chk(this)">코미디
							<input type="checkbox" name="memjang" value="클래식" onclick="choise_chk(this)">클래식
							<input type="checkbox" name="memjang" value="판타지" onclick="choise_chk(this)">판타지
	                    </div>
	                </div> <!-- /.form-group -->
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">개인정보동의</label>
	                    <div class="col-sm-9">
	                        <div class="checkbox">
	                            <label>
	                                <input type="checkbox" name="check" value="checked" checked>개인정보 수집에 동의합니다.
	                            </label>
	                        </div>
	                    </div>
	                </div> <!-- /.form-group -->
	                <div class="form-group">
	                    <div class="col-sm-9 col-sm-offset-3">
	                        <input type="button" id="nextBtn" value="회원가입" class="btn btn-primary btn-block" onclick="checknadd(this.form)">
	                    </div> 
	                </div>
            </form> <!-- /form -->
        </div> <!-- ./container -->
        </section>


    </body>
</html>