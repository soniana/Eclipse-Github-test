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
       <section>
    
     
        <form action="" name="formname" class="register">
           
          
   
                <p>
                    <label>�Ϲ�ȸ��ID</label>
                  <!--   <input type="text" class="long"/> -->
                  ${updatememinfo.memid}<input type="hidden" name="memid" value="${updatememinfo.memid}"><br>
                </p>
                <p>
                    <label>��й�ȣ</label>
                    <input type="text" name="mempw" placeholder="${updatememinfo.mempw}" onKeyPress="goNext(0)"><br>
                    <!-- <input type="text" maxlength="10"/> -->
                </p>
                <p>
                    <label>ȸ�� �̸� </label>
                     <input type="text" name ="memname" placeholder="${updatememinfo.memname}" onKeyPress="goNext(1)"><br>
                    <!-- <input type="text" class="long"/> -->
                </p>
                <p>
                   <p>
                    <label>��ȭ��ȣ </label>
                    <!-- <input type="text" class="long"/> -->
                    <input type="tel" name="memtel" value="${updatememinfo.memtel}" onKeyPress="goNext(2)"><br>
                </p>
                <p>
                
                 <p>
                    <label>�̸��� </label>
                    <input type="email" name="mememail" value="${updatememinfo.mememail}" onKeyPress="goNext(3)"><br>
                    <!-- <input type="text" class="long"/> -->
                </p>
      
                <p>
                    <label>����</label>
                    <select name="memjob">
			<option value="${updatememinfo.memgen}">${updatememinfo.memgen}</option>
			<option value="M">����</option>
			<option value="F">����</option>
			</select><br>
                 </p>
                
                <p>
                    <label>����</label>
                   <input type="text" name ="memname" placeholder="${updatememinfo.memage}" onKeyPress="goNext(4)"><br>
                  <!--   <input type="text" class="long"/> -->
                <%--  ${updatememinfo.memage}<input type="hidden" name="memage" value="${updatememinfo.memage}"><br> --%>
                </p>
                
               
                <p>
                    <label>��ȥ ����</label>
                <c:choose>
				<c:when test="${updatememinfo.memmarry=='��ȥ'}">
				 <div class=merrylabel>
					<input type="radio" name="memmarry" value="��ȥ" checked onKeyPress="goNext(5)"><label>��ȥ</label>
					<input type="radio" name="memmarry" value="��ȥ" onKeyPress="goNext(6)"><label>��ȥ</label><br>
			</div>
				</c:when>
				
				<c:otherwise>
							<div class=merrylabel>		
					<input type="radio" name="memmarry" value="��ȥ" onKeyPress="goNext(5)"> <label>��ȥ</label>
					<input type="radio" name="memmarry" value="��ȥ" checked onKeyPress="goNext(6)"> <label>��ȥ</label><br>
				</div>
				</c:otherwise>
			</c:choose>
                
                </p>
                
                  <p>
                   <label>����</label>
                    <select name="memjob">
			<option value="${updatememinfo.memjob}">${updatememinfo.memjob}</option>
			<option value="����(��)��">����(��)��</option>
			<option value="�ֺ�">�ֺ�</option>
			<option value="������">������</option>
			<option value="���߰��">���߰��</option>
			<option value="��Ÿ">��Ÿ</option>
			</select><br>
                    
                     </p>
                <p>
                    <label>��ȣ�ϴ� ���� ����</label>
                    <select name="memtype">
			<option value="${updatememinfo.memtype}">${updatememinfo.memtype}</option>
			<option value="������">������</option>
			<option value="����">����</option>
			<option value="Ŭ����/�����">Ŭ����/�����</option>
			<option value="����/�߷�">����/�߷�</option>
			<option value="����/����">����/����</option>
			</select><br>
                 </p>
                 <p>
                    <label>��ȣ�ϴ� ���� �帣</label>
                    ${updatememinfo.memjang1} / ${updatememinfo.memjang2} / ${updatememinfo.memjang3}<br>
                    <div class=merrylabel1>
                    
			<input type="checkbox" name="memjang"value="��ť" onclick="choise_chk(this)"><label>��ť</label>
			<input type="checkbox" name="memjang" value="���" onclick="choise_chk(this)"><label>���</label>
			<input type="checkbox" name="memjang" value="�θǽ�" onclick="choise_chk(this)"><label>�θǽ�</label>
			<input type="checkbox" name="memjang" value="������" onclick="choise_chk(this)"><label>������</label>
			<input type="checkbox" name="memjang" value="�Ƶ�" onclick="choise_chk(this)"><label>�Ƶ�</label><br><br>
			</div>
			<label>            </label>
			<div class=merrylabel1>
			<input type="checkbox" name="memjang" value="�׼�" onclick="choise_chk(this)"><label>�׼�</label>
			<input type="checkbox" name="memjang" value="����" onclick="choise_chk(this)"><label>����</label>
			<input type="checkbox" name="memjang" value="�ڹ̵�" onclick="choise_chk(this)"><label>�ڹ̵�</label>
			<input type="checkbox" name="memjang" value="Ŭ����" onclick="choise_chk(this)"><label>Ŭ����</label>
			<input type="checkbox" name="memjang" value="��Ÿ��" onclick="choise_chk(this)"><label>��Ÿ��</label>
			<input type="hidden" name="memjang1" value="${updatememinfo.memjang1}">
			<input type="hidden" name="memjang2" value="${updatememinfo.memjang2}">
			<input type="hidden" name="memjang3" value="${updatememinfo.memjang3}">
  			</div>
			</p>
            
                 <div class="col-sm-3 control-label">
                 	<label class="control">�����ϴ� ����</label>
                 </div>
                    <div class="col-sm-9">
                 	<input type="text" id="mengenre" name="mempa1" class="form-control" value="${updatememinfo.mempa1}" readonly />
                 	<input type="text" id="mengenre" name="mempa2" class="form-control" value="${updatememinfo.mempa2}" readonly />
                 	<input type="text" id="mengenre" name="mempa3" class="form-control" value="${updatememinfo.mempa3}" readonly />
                 </div>
               
          
         	
        	<div><input type="hidden" name="admini" value="${updatememinfo.admini}"><br></div>
        	<input type="button" value="����" onclick="checknupdate(this.form)">
        	</form>
        	
        </section>



    </body>
</html>