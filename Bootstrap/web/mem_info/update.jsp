<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
   
   <head>
<link rel="stylesheet" href="css/mem_info.css">       
<script type="text/javascript" src="dt/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="dt/jquery-ui-1.8.10.custom.min.js"></script>
<script type="text/javascript" src="dt/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="dt/jquery.ui.widget.js"></script>
<link rel="stylesheet" type="text/css" href="dt/jquery.ui.datepicker.css" />


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
       <section>
    
     
        <form action="" name="formname" class="register">
           
          
   
                <p>
                    <label>일반회원ID</label>
                  <!--   <input type="text" class="long"/> -->
                  ${updatememinfo.memid}<input type="hidden" name="memid" value="${updatememinfo.memid}"><br>
                </p>
                <p>
                    <label>비밀번호</label>
                    <input type="text" name="mempw" placeholder="${updatememinfo.mempw}" onKeyPress="goNext(0)"><br>
                    <!-- <input type="text" maxlength="10"/> -->
                </p>
                <p>
                    <label>회원 이름 </label>
                     <input type="text" name ="memname" placeholder="${updatememinfo.memname}" onKeyPress="goNext(1)"><br>
                    <!-- <input type="text" class="long"/> -->
                </p>
                <p>
                   <p>
                    <label>전화번호 </label>
                    <!-- <input type="text" class="long"/> -->
                    <input type="tel" name="memtel" value="${updatememinfo.memtel}" onKeyPress="goNext(2)"><br>
                </p>
                <p>
                
                 <p>
                    <label>이메일 </label>
                    <input type="email" name="mememail" value="${updatememinfo.mememail}" onKeyPress="goNext(3)"><br>
                    <!-- <input type="text" class="long"/> -->
                </p>
      
                <p>
                    <label>성별</label>
                    <select name="memjob">
			<option value="${updatememinfo.memgen}">${updatememinfo.memgen}</option>
			<option value="M">남자</option>
			<option value="F">여자</option>
			</select><br>
                 </p>
                
                <p>
                    <label>나이</label>
                   <input type="text" name ="memname" placeholder="${updatememinfo.memage}" onKeyPress="goNext(4)"><br>
                  <!--   <input type="text" class="long"/> -->
                <%--  ${updatememinfo.memage}<input type="hidden" name="memage" value="${updatememinfo.memage}"><br> --%>
                </p>
                
               
                <p>
                    <label>결혼 유무</label>
                <c:choose>
				<c:when test="${updatememinfo.memmarry=='미혼'}">
				 <div class=merrylabel>
					<input type="radio" name="memmarry" value="미혼" checked onKeyPress="goNext(5)"><label>미혼</label>
					<input type="radio" name="memmarry" value="기혼" onKeyPress="goNext(6)"><label>기혼</label><br>
			</div>
				</c:when>
				
				<c:otherwise>
							<div class=merrylabel>		
					<input type="radio" name="memmarry" value="미혼" onKeyPress="goNext(5)"> <label>미혼</label>
					<input type="radio" name="memmarry" value="기혼" checked onKeyPress="goNext(6)"> <label>기혼</label><br>
				</div>
				</c:otherwise>
			</c:choose>
                
                </p>
                
                  <p>
                   <label>직업</label>
                    <select name="memjob">
			<option value="${updatememinfo.memjob}">${updatememinfo.memjob}</option>
			<option value="대학(원)생">대학(원)생</option>
			<option value="주부">주부</option>
			<option value="직장인">직장인</option>
			<option value="초중고생">초중고생</option>
			<option value="기타">기타</option>
			</select><br>
                    
                     </p>
                <p>
                    <label>선호하는 공연 종류</label>
                    <select name="memtype">
			<option value="${updatememinfo.memtype}">${updatememinfo.memtype}</option>
			<option value="뮤지컬">뮤지컬</option>
			<option value="연극">연극</option>
			<option value="클래식/오페라">클래식/오페라</option>
			<option value="무용/발레">무용/발레</option>
			<option value="국악/복합">국악/복합</option>
			</select><br>
                 </p>
                 <p>
                    <label>선호하는 공연 장르</label>
                    ${updatememinfo.memjang1} / ${updatememinfo.memjang2} / ${updatememinfo.memjang3}<br>
                    <div class=merrylabel1>
                    
			<input type="checkbox" name="memjang"value="다큐" onclick="choise_chk(this)"><label>다큐</label>
			<input type="checkbox" name="memjang" value="드라마" onclick="choise_chk(this)"><label>드라마</label>
			<input type="checkbox" name="memjang" value="로맨스" onclick="choise_chk(this)"><label>로맨스</label>
			<input type="checkbox" name="memjang" value="스릴러" onclick="choise_chk(this)"><label>스릴러</label>
			<input type="checkbox" name="memjang" value="아동" onclick="choise_chk(this)"><label>아동</label><br><br>
			</div>
			<label>            </label>
			<div class=merrylabel1>
			<input type="checkbox" name="memjang" value="액션" onclick="choise_chk(this)"><label>액션</label>
			<input type="checkbox" name="memjang" value="재즈" onclick="choise_chk(this)"><label>재즈</label>
			<input type="checkbox" name="memjang" value="코미디" onclick="choise_chk(this)"><label>코미디</label>
			<input type="checkbox" name="memjang" value="클래식" onclick="choise_chk(this)"><label>클래식</label>
			<input type="checkbox" name="memjang" value="판타지" onclick="choise_chk(this)"><label>판타지</label>
			<input type="hidden" name="memjang1" value="${updatememinfo.memjang1}">
			<input type="hidden" name="memjang2" value="${updatememinfo.memjang2}">
			<input type="hidden" name="memjang3" value="${updatememinfo.memjang3}">
  			</div>
			</p>
            
                 <div class="col-sm-3 control-label">
                 	<label class="control">좋아하는 공연</label>
                 </div>
                    <div class="col-sm-9">
                 	<input type="text" id="mengenre" name="mempa1" class="form-control" value="${updatememinfo.mempa1}" readonly />
                 	<input type="text" id="mengenre" name="mempa2" class="form-control" value="${updatememinfo.mempa2}" readonly />
                 	<input type="text" id="mengenre" name="mempa3" class="form-control" value="${updatememinfo.mempa3}" readonly />
                 </div>
               
          
         	
        	<div><input type="hidden" name="admini" value="${updatememinfo.admini}"><br></div>
        	<input type="button" value="수정" onclick="checknupdate(this.form)">
        	</form>
        	
        </section>



    </body>
</html>