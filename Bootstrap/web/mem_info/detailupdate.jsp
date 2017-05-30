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
	if (!document.formname.mempw.value.search()==-1){
	    alert("비밀번호는 영문과 숫자를 이용하여 8자리 이상으로 입력하세요.");
	    document.formname.mempw.focus();
		return;
	}else if (!tel_exp.test(document.formname.memtel.value)){
		alert("전화번호를 정확하게 입력하세요.");
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
			chk++;	
		}
	}
	if(chk<3){
		alert("선호하는 장르를 3개 선택하세요.");
		return;
	}
	
	var c=confirm('수정 하시겠습니까?');
	if(c==true){
	   	f.method='POST';
	   	f.action='mem_info.show?db=update';
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
	var memjang=document.getElementsByName('memjang');
	var num=0;
	var ropNum=3; // 개수 임의지정
	for(var i=0;i<memjang.length;i++) {
		if(memjang[i].checked==true) {
		num++;
		}
	}
	if(num>ropNum) {
		chk.checked = false;
		return alert(ropNum+"개 이상 체크 불가능합니다.");
	}
};

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
	    /* margin-right: 90px; */
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
		                        <input type="text" id="id" name="memid" class="form-control" value="${updatememinfo.memid}" readonly>
		              		</div>
		                </div>	      
		                 <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">이름</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id2" name="memname" class="form-control" value="${updatememinfo.memname}" readonly/>
		        			</div>
		                </div>
		                          
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">비밀번호</label>
		                    </div>
		                    <div class="col-sm-9">
		                    <input type="password" id="id1" placeholder="비밀번호" name="mempw" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
		        		    </div>
		                </div>  
		                <div class="form-group" id="leftrow">
		                    <label for="password" class="col-sm-3 control-label">비밀번호 확인</label>
		                    <div class="col-sm-9">
		                        <input type="password" id="id1" placeholder="비밀번호" name="mempw_chk" onkeyup="checkPwd();" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
		                        <div id="checkPwd"><span class="help-inline">비밀번호가 일치하지 않습니다!</span></div>
		        		    </div>
		                </div>              
		               
						<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">성별</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="56" name="memgen" class="form-control" value="${updatememinfo.memgen}" readonly />
		                    </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">전화번호</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id3" name="memtel" class="form-control" value="${updatememinfo.memtel}" />
		        	        </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">이메일</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="email" id="id4" name="mememail" class="form-control" value="${updatememinfo.mememail}" />
		                    </div>
		                </div>              
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">나이</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="number" id="id7" name="memage" class="form-control" value="${updatememinfo.memage}" />
		                    </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">결혼</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id89" name="memmarry" class="form-control" value="${updatememinfo.memmarry}" readonly/>
		                    </div>	                    
		                </div>            
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">직업</label>
		                    </div>
		                    <div class="col-sm-9">
		                    	<select id="id10" name="memjob" class="form-control">
	                        	<option value="${updatememinfo.memjob}">${updatememinfo.memjob}</option>
	                            <option value="초중고">초중고</option>
	                            <option value="대학(원)">대학(원)</option>
	                            <option value="직장인">직장인</option>
	                            <option value="주부">주부</option>
	                            <option value="기타">기타</option>
	                        </select>
		                    </div>
		                </div> 	                     
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">선호하는 공연 종류</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <select id="memtype" name="memtype" class="form-control">
		                        	<option value="${updatememinfo.memtype}">${updatememinfo.memtype}</option>
		                            <option value="뮤지컬">뮤지컬</option>
		                            <option value="연극">연극</option>
		                            <option value="클래식/오페라">클래식/오페라</option>
		                            <option value="무용/발레">무용/발레</option>
		                            <option value="국악/복합">국악/복합</option>
		                        </select>
		                    </div>
		                </div>
		                
		                 <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">좋아하는 공연</label>
		                    </div>
	                        <div class="col-sm-9">
		                    	<input type="text" id="mengenre" name="mempa1" class="form-control" value="${updatememinfo.mempa1} / ${updatememinfo.mempa2} / ${updatememinfo.mempa3}" readonly />
		                    	<input type="hidden" id="mengenre" name="mempa2" value="${updatememinfo.mempa2}">
		                    	<input type="hidden" id="mengenre" name="mempa3" value="${updatememinfo.mempa3}">
		                    </div>
		                </div>
		                
		                
		                
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">선호하는 공연 장르</label>
		                    </div>
	                        <div class="col-sm-9">
                    			<br>
		                    	<input type="text" id="mengenre" name="mengenre" class="form-control" value="${updatememinfo.memjang1} / ${updatememinfo.memjang2} / ${updatememinfo.memjang3}" readonly />
		                    	<div class=merrylabel1>                    
								<input type="checkbox" name="memjang"value="다큐" onclick="choise_chk(this)"><label>다큐</label>
								<input type="checkbox" name="memjang" value="드라마" onclick="choise_chk(this)"><label>드라마</label>
								<input type="checkbox" name="memjang" value="로맨스" onclick="choise_chk(this)"><label>로맨스</label>
								<input type="checkbox" name="memjang" value="스릴러" onclick="choise_chk(this)"><label>스릴러</label>
								</div>
								
								<div class=merrylabel1>
								<input type="checkbox" name="memjang" value="아동" onclick="choise_chk(this)"><label>아동</label>
								<input type="checkbox" name="memjang" value="액션" onclick="choise_chk(this)"><label>액션</label>
								<input type="checkbox" name="memjang" value="재즈" onclick="choise_chk(this)"><label>재즈</label>
								<input type="checkbox" name="memjang" value="코미디" onclick="choise_chk(this)"><label>코미디</label>
		                  	    </div>
		                    
		                    <div class=merrylabel1>
		                    	<input type="checkbox" name="memjang" value="클래식" onclick="choise_chk(this)"><label>클래식</label>
								<input type="checkbox" name="memjang" value="판타지" onclick="choise_chk(this)"><label>판타지</label>
		                   </div>
		                   </div>
		         		
		         	<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control"><input type="hidden" name="admini" value="${updatememinfo.admini}"></label>
		                    </div>
	                        <div class="col-sm-9">
						<div class="divcenter">
	                    	<input type="button" id="button" class="button-class" value="회원정보수정 " onclick="checknupdate(this.form);" />
	                    	<!-- <input type="button" id="button" class="button-class" value="회원탈퇴" onclick="memtal(this.form);" /> -->
		               </div>
		                  </div>
		          </div>
		         		
		         		<%--  <div class="form-group" id="leftrow">
						<div class="divcenter">
	                    	<!-- <button class="button-style" onclick="memtal(this.form);">회원탈퇴</button> -->
	                    	<input type="hidden" name="admini" value="${updatememinfo.admini}"><br>
	                    	<input type="button" id="button" class="button-class" value="회원탈퇴" onclick="memtal(this.form);" />
	                    	<input type="button" id="button" class="button-class" value="회원정보수정 "onclick="memsoo(this.form);" />
	                    </div>
	                    </div> --%>
	                 
            </form> <!-- /form -->
        </div> <!-- ./container -->
        </section>
        
    </body>
</html>