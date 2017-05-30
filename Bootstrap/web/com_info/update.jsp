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
	    alert("��й�ȣ�� ������ ���ڸ� �̿��Ͽ� 8�ڸ� �̻����� �Է��ϼ���.");
	    document.formname.compw.focus();
		return;
	}else if (!tel_exp.test(document.formname.comtel.value)){
		alert("��ȭ��ȣ�� ��Ȯ�ϰ� �Է��ϼ���.");
		document.formname.comtel.focus();
		return;
	}else if (document.formname.genrenm.value=="None"){
		alert("���������� �����ϼ���.");
		document.formname.genrenm.focus();
		return;
	}
	
	var c=confirm('���� �Ͻðڽ��ϱ�?');
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
		document.getElementById('checkPwd').innerHTML = "������ ��ȣ�� �Է��ϼ���."; 
	}else{
		document.getElementById('checkPwd').style.color = "black";
		document.getElementById('checkPwd').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�."; 
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
                            <h2>ȸ�� ���� ����</h2>
                            <ol class="breadcrumb">
							<li><a href="index.html"> <i class="ion-ios-home"></i>
									HOME
							</a></li>
								<li class="active"><a href="javascript:history.back()">�ڷΰ���</a></li>
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
		                    	<label class="control">���̵�</label>
		                    </div>
		                    <div class="col-sm-9">
		                    	<input type="text" id="id" name="comid" class="form-control" value="${cominfo.comid}" readonly>
		              		</div>
		                </div>	      
		                
						<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">��ȹ/���ۻ��</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id0" name="entrpsnm" class="form-control" value="${cominfo.entrpsnm}" readonly>
		                    </div>
		                </div>
		                          
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">��й�ȣ</label>
		                    </div>
		                    <div class="col-sm-9">
		                    <input type="password" id="id0" placeholder="��й�ȣ" name="compw" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
		        		    </div>
		                </div>  
		                <div class="form-group" id="leftrow">
		                    <label for="password" class="col-sm-3 control-label">��й�ȣ Ȯ��</label>
		                    <div class="col-sm-9">
		                        <input type="password" id="id1" placeholder="��й�ȣ" name="compw_chk" onkeyup="checkPwd();" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
		                        <div id="checkPwd"><span class="help-inline">��й�ȣ�� ��ġ���� �ʽ��ϴ�!</span></div>
		        		    </div>
		                </div>              
		               
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">����ó</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id0" name="comtel" class="form-control" value="${cominfo.comtel}">
		        	        </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">���� ����</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <select id="genrenm" name="genrenm" class="form-control">
		                        	<option value="${cominfo.genrenm}">${cominfo.genrenm}</option>
		                            <option value="������">������</option>
		                            <option value="����">����</option>
		                            <option value="Ŭ����/�����">Ŭ����/�����</option>
		                            <option value="����/�߷�">����/�߷�</option>
		                            <option value="����/����">����/����</option>
		                        </select>
		                    </div>
		                </div>
		         		
		         	<!-- <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control"></label>
		                    </div>
	                        <div class="col-sm-9">
						<div class="divcenter">
	                    	<input type="button" id="button" class="button-class" value="ȸ���������� " onclick="checknupdate(this.form);" />
		               </div>
		                  </div>
		          </div> -->
		          
					<div class="divcenter">
						<input type="button" id="button" class="button-class" value="ȸ���������� " onclick="checknupdate(this.form);" />
					</div>
	                 
            </form> <!-- /form -->
        </div> <!-- ./container -->
        </section>
        
    </body>
</html>