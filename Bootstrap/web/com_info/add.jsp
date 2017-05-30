<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
    <head>

        
<script type="text/javascript">
function checknadd(f) {
	var id_exp = /[A-za-z0-9]{5,10}/g;
	var tel_exp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var email_exp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if (!id_exp.test(document.formname.comid.value)){
		alert("아이디는 영문과 숫자를 이용하여 5자리 이상 10자리 이하로 입력하세요.");
		document.formname.comid.focus();
		return;
	}else if (document.formname.compw.value.search(/[a-z0-9]{8,}/i)==-1){
	    alert("비밀번호는 영문과 숫자를 이용하여 8자리 이상으로 입력하세요.");
	    document.formname.compw.focus();
		return;
	}else if (document.formname.entrpsnm.value ==""){
		alert("회사를 선택하세요");
		document.formname.entrpsnm.focus();
		return;
	}else if (!tel_exp.test(document.formname.comtel.value)){
		alert("연락처를 정확하게 입력하세요.");
		document.formname.comtel.focus();
		return;
	}else if (document.formname.genrenm.value=="None"){
		alert("공연종류를 선택하세요.");
		document.formname.genrenm.focus();
		return;
	}

	var c=confirm('등록 하시겠습니까?');
	if(c==true){
		f.method='POST';
		f.action='com.show?db=add';
		f.submit();
	}	
};

function checkPwd(){
	var f1 = document.formname;
	var pw1 = f1.compw.value;
	var pw2 = f1.compw_chk.value;
	if(pw1!=pw2){
		document.getElementById('checkPwd').style.color = "red";
		document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
	}else{
		document.getElementById('checkPwd').style.color = "black";
		document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
	}			
};

function goNext(num) {
	if (event.keyCode == 13){
		$('input[id="id'+num+'"]').focus();
	}
};

var newWindow;
function search1() {
	newWindow1 = window.open("com_info/registerPop1.jsp", "newWindow1",
			"height=600, width=600, resizable=yes");
}
function recieve1() {
	var txt = "<font color='red'>받았따</font>";
	document.getElementById("id2").innerHTML = txt;
	document.myform.receiver.value = newWindow1.document.myform.sender.value;
}
</script>

<style>
	label {
		width: 102px;
		padding: 0;
	}
	.col-sm-9 {
		padding: 0px 0px 0px 30px;
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
                            <h2>사업자 회원 가입</h2>
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
	                        <input type="text" id="id" placeholder="아이디" name="comid" class="form-control" maxlength="10" onKeyPress="goNext(0)" autofocus>
	                        <span class="help-block">아이디는 영문 및 숫자로 5자 이상 작성해주세요.</span>
	              		</div>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="col-sm-3 control-label">비밀번호</label>
	                    <div class="col-sm-9">
	                        <input type="password" id="id0" placeholder="비밀번호" name="compw" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(1)">
	                        <span class="help-block">비밀번호는 영문 및 숫자로 8자 이상 작성해주세요.</span>
	        		    </div>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="col-sm-3 control-label">비밀번호 확인</label>
	                    <div class="col-sm-9">
	                        <input type="password" id="id1" placeholder="비밀번호" name="compw_chk" onkeyup="checkPwd();" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
	                        <div id="checkPwd"><span class="help-inline">비밀번호가 일치하지 않습니다!</span></div>
	        		    </div>
	                </div>
	                 <div class="form-group" style="margin-bottom:30px;">
				        <label for="entrpsnm" class="col-sm-3 control-label">기획/제작사명</label>
				        <div class="col-sm-9">
				            <input type="text" id="id2" name="entrpsnm" placeholder="기획/제작사명을 검색해주세요" class="form-control" readonly>
				            <a href="#none" class="del03" id="search" onclick="search1();"><span>공연 검색</span></a>
				        </div>
				    </div>
	               <!--  <div class="form-group">
	                    <label for="name" class="col-sm-3 control-label">기획/제작사명</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id2" placeholder="기획/제작사명" name="entrpsnm" class="form-control" style="ime-mode:active" onKeyPress="goNext(3)">
	                        <span class="help-block">예) 홍길동</span>
	        			</div>
	                </div> -->
	                <div class="form-group">
	                    <label for="tel" class="col-sm-3 control-label">전화번호</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id3" placeholder="전화번호" name="comtel" class="form-control" onKeyPress="goNext(4)">
	                        <span class="help-block">예) 010-1234-5678</span>
	        	        </div>                     
	                <div class="form-group">
	                    <label for="genrenm" class="col-sm-3 control-label">기획/제작하는 공연 종류</label>
	                    <div class="col-sm-9">
	                        <select id="id4" name="genrenm" class="form-control">
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