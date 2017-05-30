<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">   
<head>
	<!-- <link rel="stylesheet" href="css/meminfo_check.css"> -->

<script type="text/javascript">
function checknupdate(f) {
	var tel_exp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var email_exp = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	var pw_exp = /[a-z0-9]{8,}/i;
	if (!document.formname.compw.value.search()==-1){
	    alert("비밀번호는 영문과 숫자를 이용하여 8자리 이상으로 입력하세요.");
	    document.formname.compw.focus();
		return;
	}else if (!tel_exp.test(document.formname.comtel.value)){
		alert("전화번호를 정확하게 입력하세요.");
		document.formname.comtel.focus();
		return;
	}else if (document.formname.genrenm.value=="None"){
		alert("공연종류를 선택하세요.");
		document.formname.genrenm.focus();
		return;
	}
	
	var c=confirm('수정 하시겠습니까?');
	if(c==true){
	   	f.method='POST';
	   	f.action='com.show?db=update';
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
}

function goNext(num){
    if(event.keyCode==13)
       document.formname.elements[num+1].focus();
 };
</script>
	
	<style>
	.form-group #leftrow {
		display:inline-block;
		width: 50%;
		float:left;
		width: 415px;
		margin: 50px 0 50px 0;
	}
	.form-group #rightrow {
		display:inline-block;
		width: 50%;
		float:right;
		width: 415px;
		margin: 50px 0 50px 0;
	}
	*[role="form"] {
		text-align: justify;
		width: 920px;
	    background-color: #fff;
	}
	*[role="form"] h2 {
	/*     margin-left: 5em; */
	    margin-bottom: 1em;
	}
	.form-horizontal .form-group {
		float: left;
		margin-left: 0;
		margin-right: 0;
		margin-bottom: 0;
		/* border: 1px solid #ccc; */
	}
	.form-control {
		width: 180px;
		margin: 10px;
	}
	.col-sm-3 {
		float: left;
		width: 135px;
	}
	.divcenter {
		margin: 0 auto;
	    margin-left: auto;
	    margin-right: 90px;
	}
	.col-sm-9 {
		width: 265px;
		margin-left: 15px;
	}
	.control {
		margin: 10px 0px 10px 0;
	}
	.button-class {
		background: #414141;
	    border: none;
	    color: #fff;
	    padding: 10px 30px;
	    margin-top: 30px;
	    font-size: 12px;
	    line-height: 1em;
	    text-transform: uppercase;
	    letter-spacing: normal;
	    border-radius: 3px;
	}
	#button {
	    margin: 30px 10px 30px 5px;
	    padding: 10px;
	    margin-left:670px;
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
                            <h2>회원 정보 수정</h2>
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
		           
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">아이디</label>
		                    </div>
		                    <div class="col-sm-9">
		                    	<input type="text" id="id" name="comid" class="form-control" value="${cominfo.comid}" readonly>
		              		</div>
		                </div>	      
		                
						<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">기획/제작사명</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id0" name="entrpsnm" class="form-control" value="${cominfo.entrpsnm}" readonly>
		                    </div>
		                </div>
		                          
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">비밀번호</label>
		                    </div>
		                    <div class="col-sm-9">
		                    <input type="password" id="id0" placeholder="비밀번호" name="compw" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
		        		    </div>
		                </div>  
		                <div class="form-group" id="leftrow">
		                    <label for="password" class="col-sm-3 control-label">비밀번호 확인</label>
		                    <div class="col-sm-9">
		                        <input type="password" id="id1" placeholder="비밀번호" name="compw_chk" onkeyup="checkPwd();" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
		                        <div id="checkPwd"><span class="help-inline">비밀번호가 일치하지 않습니다!</span></div>
		        		    </div>
		                </div>              
		               
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">연락처</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id0" name="comtel" class="form-control" value="${cominfo.comtel}">
		        	        </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">공연 종류</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <select id="genrenm" name="genrenm" class="form-control">
		                        	<option value="${cominfo.genrenm}">${cominfo.genrenm}</option>
		                            <option value="뮤지컬">뮤지컬</option>
		                            <option value="연극">연극</option>
		                            <option value="클래식/오페라">클래식/오페라</option>
		                            <option value="무용/발레">무용/발레</option>
		                            <option value="국악/복합">국악/복합</option>
		                        </select>
		                    </div>
		                </div>
		         		
		         	<!-- <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control"></label>
		                    </div>
	                        <div class="col-sm-9">
						<div class="divcenter">
	                    	<input type="button" id="button" class="button-class" value="회원정보수정 " onclick="checknupdate(this.form);" />
		               </div>
		                  </div>
		          </div> -->
		          
					<div class="divcenter">
						<input type="button" id="button" class="button-class" value="회원정보수정 " onclick="checknupdate(this.form);" />
					</div>
	                 
            </form> <!-- /form -->
        </div> <!-- ./container -->
        </section>
        
    </body>
</html>