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
		alert("���̵�� ������ ���ڸ� �̿��Ͽ� 5�ڸ� �̻� 10�ڸ� ���Ϸ� �Է��ϼ���.");
		document.formname.comid.focus();
		return;
	}else if (document.formname.compw.value.search(/[a-z0-9]{8,}/i)==-1){
	    alert("��й�ȣ�� ������ ���ڸ� �̿��Ͽ� 8�ڸ� �̻����� �Է��ϼ���.");
	    document.formname.compw.focus();
		return;
	}else if (document.formname.entrpsnm.value ==""){
		alert("ȸ�縦 �����ϼ���");
		document.formname.entrpsnm.focus();
		return;
	}else if (!tel_exp.test(document.formname.comtel.value)){
		alert("����ó�� ��Ȯ�ϰ� �Է��ϼ���.");
		document.formname.comtel.focus();
		return;
	}else if (document.formname.genrenm.value=="None"){
		alert("���������� �����ϼ���.");
		document.formname.genrenm.focus();
		return;
	}

	var c=confirm('��� �Ͻðڽ��ϱ�?');
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
		document.getElementById('checkPwd').innerHTML = "������ ��ȣ�� �Է��ϼ���."; 
	}else{
		document.getElementById('checkPwd').style.color = "black";
		document.getElementById('checkPwd').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�."; 
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
	var txt = "<font color='red'>�޾ҵ�</font>";
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
                            <h2>����� ȸ�� ����</h2>
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
	                <div class="form-group">
	                    <label for="id" class="col-sm-3 control-label">���̵�</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id" placeholder="���̵�" name="comid" class="form-control" maxlength="10" onKeyPress="goNext(0)" autofocus>
	                        <span class="help-block">���̵�� ���� �� ���ڷ� 5�� �̻� �ۼ����ּ���.</span>
	              		</div>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="col-sm-3 control-label">��й�ȣ</label>
	                    <div class="col-sm-9">
	                        <input type="password" id="id0" placeholder="��й�ȣ" name="compw" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(1)">
	                        <span class="help-block">��й�ȣ�� ���� �� ���ڷ� 8�� �̻� �ۼ����ּ���.</span>
	        		    </div>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="col-sm-3 control-label">��й�ȣ Ȯ��</label>
	                    <div class="col-sm-9">
	                        <input type="password" id="id1" placeholder="��й�ȣ" name="compw_chk" onkeyup="checkPwd();" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
	                        <div id="checkPwd"><span class="help-inline">��й�ȣ�� ��ġ���� �ʽ��ϴ�!</span></div>
	        		    </div>
	                </div>
	                 <div class="form-group" style="margin-bottom:30px;">
				        <label for="entrpsnm" class="col-sm-3 control-label">��ȹ/���ۻ��</label>
				        <div class="col-sm-9">
				            <input type="text" id="id2" name="entrpsnm" placeholder="��ȹ/���ۻ���� �˻����ּ���" class="form-control" readonly>
				            <a href="#none" class="del03" id="search" onclick="search1();"><span>���� �˻�</span></a>
				        </div>
				    </div>
	               <!--  <div class="form-group">
	                    <label for="name" class="col-sm-3 control-label">��ȹ/���ۻ��</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id2" placeholder="��ȹ/���ۻ��" name="entrpsnm" class="form-control" style="ime-mode:active" onKeyPress="goNext(3)">
	                        <span class="help-block">��) ȫ�浿</span>
	        			</div>
	                </div> -->
	                <div class="form-group">
	                    <label for="tel" class="col-sm-3 control-label">��ȭ��ȣ</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id3" placeholder="��ȭ��ȣ" name="comtel" class="form-control" onKeyPress="goNext(4)">
	                        <span class="help-block">��) 010-1234-5678</span>
	        	        </div>                     
	                <div class="form-group">
	                    <label for="genrenm" class="col-sm-3 control-label">��ȹ/�����ϴ� ���� ����</label>
	                    <div class="col-sm-9">
	                        <select id="id4" name="genrenm" class="form-control">
	                        	<option value="None">������������</option>
	                            <option value="������">������</option>
	                            <option value="����">����</option>
	                            <option value="Ŭ����/�����">Ŭ����/�����</option>
	                            <option value="����/�߷�">����/�߷�</option>
	                            <option value="����/����">����/����</option>
	                        </select>
	                    </div>
	                </div> <!-- /.form-group --> 
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">������������</label>
	                    <div class="col-sm-9">
	                        <div class="checkbox">
	                            <label>
	                                <input type="checkbox" name="check" value="checked" checked>�������� ������ �����մϴ�.
	                            </label>
	                        </div>
	                    </div>
	                </div> <!-- /.form-group -->
	                <div class="form-group">
	                    <div class="col-sm-9 col-sm-offset-3">
	                        <input type="button" id="nextBtn" value="ȸ������" class="btn btn-primary btn-block" onclick="checknadd(this.form)">
	                    </div> 
	                </div>
            </form> <!-- /form -->
        </div> <!-- ./container -->
        </section>


    </body>
</html>