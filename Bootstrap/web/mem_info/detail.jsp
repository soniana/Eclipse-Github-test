<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">   
<head>
	<!-- <link rel="stylesheet" href="css/meminfo_check.css"> -->

	<script>
	function memtal(f){
		var c=confirm('정말로 탈퇴하시겠습니까?');
		if(c==true){
			var cc=confirm('탈퇴가 성공적으로 완료 되었습니다.');
			f.method='POST';
			f.action='mem_info.show?db=delete&memid=${memdetail.memid}';
			f.submit();				
		}else{
			f.method='POST';
			f.action='mem_info.show?db=detail&memid=${loginmem.memid}';
			f.submit();
		}
	}
	function memsoo(f){
		var c=confirm('정말로 수정하시겠습니까?');
		if(c==true){
			f.method='POST';
			f.action='mem_info.show?db=updateview&memid=${loginmem.memid}';
			f.submit();
		}else{
			f.method='POST';
			f.action='mem_info.show?db=detail&memid=${loginmem.memid}';
			f.submit();
		}
	}
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
                            <h2>회원 정보 확인</h2>
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
<!-- 			<div class="title" style="text-align:center">
				<h8><FONT size="5">회원 정보 확인</font></h8>
			</div>                         -->    
            <div class="container">
	            <form class="form-horizontal" role="form" name="formname">
		           
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">아이디</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id" name="memid" class="form-control" value="${memdetail.memid}" readonly>
		              		</div>
		                </div>	                
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">비밀번호</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="password" id="id0" name="mempw" class="form-control" value="${memdetail.mempw}" readonly />
		        		    </div>
		                </div>                
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">이름</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id2" name="memname" class="form-control" value="${memdetail.memname}" readonly/>
		        			</div>
		                </div>
						<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">성별</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="56" name="memgen" class="form-control" value="${memdetail.memgen}" readonly />
		                    </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">전화번호</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id3" name="memtel" class="form-control" value="${memdetail.memtel}" readonly />
		        	        </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">이메일</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="email" id="id4" name="mememail" class="form-control" value="${memdetail.mememail}" readonly />
		                    </div>
		                </div>              
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">나이</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="number" id="id7" name="memage" class="form-control" value="${memdetail.memage}" readonly />
		                    </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">결혼</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id89" name="memmarry" class="form-control" value="${memdetail.memmarry}" readonly />
		                    </div>	                    
		                </div>            
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">직업</label>
		                    </div>
		                    <div class="col-sm-9">
		                    	<input type="text" id="id10" name="memjob" class="form-control" value="${memdetail.memjob}" readonly />
		                    </div>
		                </div> 	                     
		                <div class="form-group" id="rightrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">선호하는 공연 종류</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="memtype" name="memtype" class="form-control" value="${memdetail.memtype}" readonly />
		                    </div>
		                </div>
		                <div class="form-group" id="rightrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">선호하는 공연 장르</label>
		                    </div>
	                        <div class="col-sm-9">
		                    	<input type="text" id="mengenre" name="mengenre" class="form-control" value="${memdetail.memjang1}" readonly />
		                    	<input type="text" id="mengenre" name="mengenre" class="form-control" value="${memdetail.memjang2}" readonly />
		                    	<input type="text" id="mengenre" name="mengenre" class="form-control" value="${memdetail.memjang3}" readonly />
		                    </div>
		                </div>
		                <div class="form-group" id="rightrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">좋아하는 공연</label>
		                    </div>
	                        <div class="col-sm-9">
		                    	<input type="text" id="mengenre" name="mempa1" class="form-control" value="${memdetail.mempa1}" readonly />
		                    	<input type="text" id="mengenre" name="mempa2" class="form-control" value="${memdetail.mempa2}" readonly />
		                    	<input type="text" id="mengenre" name="mempa3" class="form-control" value="${memdetail.mempa3}" readonly />
		                    </div>
		                </div>
						<div class="divcenter">
	                    	<!-- <button class="button-style" onclick="memtal(this.form);">회원탈퇴</button> -->
	                    	<input type="button" id="button" class="button-class" value="회원탈퇴" onclick="memtal(this.form);" />
	                    	<input type="button" id="button" class="button-class" value="회원정보수정 "onclick="memsoo(this.form);" />
	                    </div>
            </form> <!-- /form -->
        </div> <!-- ./container -->
        </section>
        
    </body>
</html>