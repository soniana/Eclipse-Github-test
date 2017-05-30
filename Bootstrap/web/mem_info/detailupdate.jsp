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
	    alert("��й�ȣ�� ������ ���ڸ� �̿��Ͽ� 8�ڸ� �̻����� �Է��ϼ���.");
	    document.formname.mempw.focus();
		return;
	}else if (!tel_exp.test(document.formname.memtel.value)){
		alert("��ȭ��ȣ�� ��Ȯ�ϰ� �Է��ϼ���.");
		document.formname.memtel.focus();
		return;
	}else if(!email_exp.test(document.formname.mememail.value)){
		alert("email�� ��Ȯ�ϰ� �Է��ϼ���.");
		document.formname.mememail.focus();
		return;
	}else if (document.formname.memage.value=="" ||document.formname.memage.value<1 ||document.formname.memage.value>100){
		alert("���̸� ��Ȯ�ϰ� �Է��ϼ���.");
		document.formname.memage.focus();
		return;
	}else if (document.formname.memjob.value=="None"){
		alert("������ �����ϼ���.");
		document.formname.memjob.focus();
		return;
	}else if (document.formname.memtype.value=="None"){
		alert("���������� �����ϼ���.");
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
		alert("��ȣ�ϴ� �帣�� 3�� �����ϼ���.");
		return;
	}
	
	var c=confirm('���� �Ͻðڽ��ϱ�?');
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
		document.getElementById('checkPwd').innerHTML = "������ ��ȣ�� �Է��ϼ���."; 
	}else{
		document.getElementById('checkPwd').style.color = "black";
		document.getElementById('checkPwd').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�."; 
	}			
}

function choise_chk(chk) {
	var memjang=document.getElementsByName('memjang');
	var num=0;
	var ropNum=3; // ���� ��������
	for(var i=0;i<memjang.length;i++) {
		if(memjang[i].checked==true) {
		num++;
		}
	}
	if(num>ropNum) {
		chk.checked = false;
		return alert(ropNum+"�� �̻� üũ �Ұ����մϴ�.");
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
		                        <input type="text" id="id" name="memid" class="form-control" value="${updatememinfo.memid}" readonly>
		              		</div>
		                </div>	      
		                 <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">�̸�</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id2" name="memname" class="form-control" value="${updatememinfo.memname}" readonly/>
		        			</div>
		                </div>
		                          
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">��й�ȣ</label>
		                    </div>
		                    <div class="col-sm-9">
		                    <input type="password" id="id1" placeholder="��й�ȣ" name="mempw" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
		        		    </div>
		                </div>  
		                <div class="form-group" id="leftrow">
		                    <label for="password" class="col-sm-3 control-label">��й�ȣ Ȯ��</label>
		                    <div class="col-sm-9">
		                        <input type="password" id="id1" placeholder="��й�ȣ" name="mempw_chk" onkeyup="checkPwd();" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
		                        <div id="checkPwd"><span class="help-inline">��й�ȣ�� ��ġ���� �ʽ��ϴ�!</span></div>
		        		    </div>
		                </div>              
		               
						<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">����</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="56" name="memgen" class="form-control" value="${updatememinfo.memgen}" readonly />
		                    </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">��ȭ��ȣ</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id3" name="memtel" class="form-control" value="${updatememinfo.memtel}" />
		        	        </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">�̸���</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="email" id="id4" name="mememail" class="form-control" value="${updatememinfo.mememail}" />
		                    </div>
		                </div>              
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">����</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="number" id="id7" name="memage" class="form-control" value="${updatememinfo.memage}" />
		                    </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">��ȥ</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id89" name="memmarry" class="form-control" value="${updatememinfo.memmarry}" readonly/>
		                    </div>	                    
		                </div>            
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">����</label>
		                    </div>
		                    <div class="col-sm-9">
		                    	<select id="id10" name="memjob" class="form-control">
	                        	<option value="${updatememinfo.memjob}">${updatememinfo.memjob}</option>
	                            <option value="���߰�">���߰�</option>
	                            <option value="����(��)">����(��)</option>
	                            <option value="������">������</option>
	                            <option value="�ֺ�">�ֺ�</option>
	                            <option value="��Ÿ">��Ÿ</option>
	                        </select>
		                    </div>
		                </div> 	                     
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">��ȣ�ϴ� ���� ����</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <select id="memtype" name="memtype" class="form-control">
		                        	<option value="${updatememinfo.memtype}">${updatememinfo.memtype}</option>
		                            <option value="������">������</option>
		                            <option value="����">����</option>
		                            <option value="Ŭ����/�����">Ŭ����/�����</option>
		                            <option value="����/�߷�">����/�߷�</option>
		                            <option value="����/����">����/����</option>
		                        </select>
		                    </div>
		                </div>
		                
		                 <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">�����ϴ� ����</label>
		                    </div>
	                        <div class="col-sm-9">
		                    	<input type="text" id="mengenre" name="mempa1" class="form-control" value="${updatememinfo.mempa1} / ${updatememinfo.mempa2} / ${updatememinfo.mempa3}" readonly />
		                    	<input type="hidden" id="mengenre" name="mempa2" value="${updatememinfo.mempa2}">
		                    	<input type="hidden" id="mengenre" name="mempa3" value="${updatememinfo.mempa3}">
		                    </div>
		                </div>
		                
		                
		                
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">��ȣ�ϴ� ���� �帣</label>
		                    </div>
	                        <div class="col-sm-9">
                    			<br>
		                    	<input type="text" id="mengenre" name="mengenre" class="form-control" value="${updatememinfo.memjang1} / ${updatememinfo.memjang2} / ${updatememinfo.memjang3}" readonly />
		                    	<div class=merrylabel1>                    
								<input type="checkbox" name="memjang"value="��ť" onclick="choise_chk(this)"><label>��ť</label>
								<input type="checkbox" name="memjang" value="���" onclick="choise_chk(this)"><label>���</label>
								<input type="checkbox" name="memjang" value="�θǽ�" onclick="choise_chk(this)"><label>�θǽ�</label>
								<input type="checkbox" name="memjang" value="������" onclick="choise_chk(this)"><label>������</label>
								</div>
								
								<div class=merrylabel1>
								<input type="checkbox" name="memjang" value="�Ƶ�" onclick="choise_chk(this)"><label>�Ƶ�</label>
								<input type="checkbox" name="memjang" value="�׼�" onclick="choise_chk(this)"><label>�׼�</label>
								<input type="checkbox" name="memjang" value="����" onclick="choise_chk(this)"><label>����</label>
								<input type="checkbox" name="memjang" value="�ڹ̵�" onclick="choise_chk(this)"><label>�ڹ̵�</label>
		                  	    </div>
		                    
		                    <div class=merrylabel1>
		                    	<input type="checkbox" name="memjang" value="Ŭ����" onclick="choise_chk(this)"><label>Ŭ����</label>
								<input type="checkbox" name="memjang" value="��Ÿ��" onclick="choise_chk(this)"><label>��Ÿ��</label>
		                   </div>
		                   </div>
		         		
		         	<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control"><input type="hidden" name="admini" value="${updatememinfo.admini}"></label>
		                    </div>
	                        <div class="col-sm-9">
						<div class="divcenter">
	                    	<input type="button" id="button" class="button-class" value="ȸ���������� " onclick="checknupdate(this.form);" />
	                    	<!-- <input type="button" id="button" class="button-class" value="ȸ��Ż��" onclick="memtal(this.form);" /> -->
		               </div>
		                  </div>
		          </div>
		         		
		         		<%--  <div class="form-group" id="leftrow">
						<div class="divcenter">
	                    	<!-- <button class="button-style" onclick="memtal(this.form);">ȸ��Ż��</button> -->
	                    	<input type="hidden" name="admini" value="${updatememinfo.admini}"><br>
	                    	<input type="button" id="button" class="button-class" value="ȸ��Ż��" onclick="memtal(this.form);" />
	                    	<input type="button" id="button" class="button-class" value="ȸ���������� "onclick="memsoo(this.form);" />
	                    </div>
	                    </div> --%>
	                 
            </form> <!-- /form -->
        </div> <!-- ./container -->
        </section>
        
    </body>
</html>