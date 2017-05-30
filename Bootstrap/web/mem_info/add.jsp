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
				alert("���̵�� ������ ���ڸ� �̿��Ͽ� 5�ڸ� �̻� 10�ڸ� ���Ϸ� �Է��ϼ���.");
				document.formname.memid.focus();
				return;
			}else if (document.formname.mempw.value.search(/[a-z0-9]{8,}/i)==-1){
			    alert("��й�ȣ�� ������ ���ڸ� �̿��Ͽ� 8�ڸ� �̻����� �Է��ϼ���.");
			    document.formname.mempw.focus();
				return;
			}else if (document.formname.memname.value ==""){
				alert("�̸��� �Է��ϼ���.");
				document.formname.memname.focus();
				return;
			}else if (!tel_exp.test(document.formname.memtel.value)){
				alert("����ó�� ��Ȯ�ϰ� �Է��ϼ���.");
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
		// 			alert("�ȵ�");	//�̷������� üũ�� �Ǿ����� �ȵǾ������� Ȯ���ؾ� �Ѵ�. //value������ Ȯ���� �Ұ��ϴ�.
					chk++;	
				}
			}
			if(chk<3){
				alert("��ȣ�ϴ� �帣�� 3�� �����ϼ���.");
				return;
			}
			if (eval("document.formname.check.checked") == false) {				
				alert("�������� ������ ���� �ϼž� ���� �ܰ�� ���� �����մϴ�.");
				document.formname.check.focus();
				return;
			}
			
			var c=confirm('��� �Ͻðڽ��ϱ�?');
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
				document.getElementById('checkPwd').innerHTML = "������ ��ȣ�� �Է��ϼ���."; 
			}else{
				document.getElementById('checkPwd').style.color = "black";
				document.getElementById('checkPwd').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�."; 
			}			
		}
		
		function choise_chk(chk) {
			var target=document.getElementsByName('memjang');
			var num=0;
			var ropNum=3; // ���� ��������
			for(var i=0;i<target.length;i++) {
				if(target[i].checked==true) {
				num++;
				}
			}
			if(num>ropNum) {
				chk.checked = false;
				return alert(ropNum+"�� �̻� üũ �Ұ����մϴ�.");
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
                            <h2>�Ϲ� ȸ�� ����</h2>
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
	                        <input type="text" id="id" placeholder="���̵�" name="memid" class="form-control" maxlength="10" onKeyPress="goNext(0)" autofocus>
	                        <span class="help-block">���̵�� ���� �� ���ڷ� 5�� �̻� �ۼ����ּ���.</span>
	              		</div>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="col-sm-3 control-label">��й�ȣ</label>
	                    <div class="col-sm-9">
	                        <input type="password" id="id0" placeholder="��й�ȣ" name="mempw" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(1)">
	                        <span class="help-block">��й�ȣ�� ���� �� ���ڷ� 8�� �̻� �ۼ����ּ���.</span>
	        		    </div>
	                </div>
	                <div class="form-group">
	                    <label for="password" class="col-sm-3 control-label">��й�ȣ Ȯ��</label>
	                    <div class="col-sm-9">
	                        <input type="password" id="id1" placeholder="��й�ȣ" name="mempw_chk" onkeyup="checkPwd();" class="form-control" style="ime-mode:disabled" onKeyPress="goNext(2)">
	                        <div id="checkPwd"><span class="help-inline">��й�ȣ�� ��ġ���� �ʽ��ϴ�!</span></div>
	        		    </div>
	                </div>
	                <div class="form-group">
	                    <label for="name" class="col-sm-3 control-label">�̸�</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id2" placeholder="�̸�" name="memname" class="form-control" style="ime-mode:active" onKeyPress="goNext(3)">
	                        <span class="help-block">��) ȫ�浿</span>
	        			</div>
	                </div>
	                <div class="form-group">
	                    <label for="tel" class="col-sm-3 control-label">��ȭ��ȣ</label>
	                    <div class="col-sm-9">
	                        <input type="text" id="id3" placeholder="��ȭ��ȣ" name="memtel" class="form-control" onKeyPress="goNext(4)">
	                        <span class="help-block">��) 010-1234-5678</span>
	        	        </div>
	                </div>
	                <div class="form-group">
	                    <label for="email" class="col-sm-3 control-label">�̸���</label>
	                    <div class="col-sm-9">
	                        <input type="email" id="id4" placeholder="�̸��� �ּ�" name="mememail" class="form-control" onKeyPress="goNext(5)">
	                        <span class="help-block">��) aa@aa.com</span>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="control-label col-sm-3">����</label>
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
	                    <label for="memage" class="col-sm-3 control-label">����</label>
	                    <div class="col-sm-9">
	                        <input type="number" id="id7" name="memage" class="form-control" min="1" max="100" onKeyPress="goNext(8)">
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="control-label col-sm-3">��ȥ����</label>
	                    <div class="col-sm-6">
	                        <div class="row">
	                            <div class="col-sm-4">
	                                <label class="radio-inline">	                                    
	                                    <input type="radio" id="id8" name="memmarry" value="��ȥ" checked onKeyPress="goNext(9)">��ȥ
	                                </label>
	                            </div>
	                            <div class="col-sm-4">
	                                <label class="radio-inline">
	                      			    <input type="radio" id="id9" name="memmarry" value="��ȥ" onKeyPress="goNext(10)">��ȥ
	                                </label>
	                            </div>
	                        </div>
	                    </div>
	                </div> <!-- /.form-group --> 
	                <div class="form-group">
	                    <label for="memjob" class="col-sm-3 control-label">����</label>
	                    <div class="col-sm-9">
	                        <select id="id10" name="memjob" class="form-control">
	                        	<option value="None">��������</option>
	                            <option value="���߰�">���߰�</option>
	                            <option value="����(��)">����(��)</option>
	                            <option value="������">������</option>
	                            <option value="�ֺ�">�ֺ�</option>
	                            <option value="��Ÿ">��Ÿ</option>
	                        </select>
	                    </div>
	                </div> <!-- /.form-group -->                               
	                <div class="form-group">
	                    <label for="memtype" class="col-sm-3 control-label">��ȣ�ϴ� ���� ����</label>
	                    <div class="col-sm-9">
	                        <select id="memtype" name="memtype" class="form-control">
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
	                    <label for="memjang" class="col-sm-3 control-label">��ȣ�ϴ� �帣</label>
                        <div class="col-sm-9">
	                    	<input type="checkbox" name="memjang" value="��ť" onclick="choise_chk(this)">��ť
							<input type="checkbox" name="memjang" value="���" onclick="choise_chk(this)">���
							<input type="checkbox" name="memjang" value="�θǽ�" onclick="choise_chk(this)">�θǽ�
							<input type="checkbox" name="memjang" value="������" onclick="choise_chk(this)">������
							<input type="checkbox" name="memjang" value="�Ƶ�" onclick="choise_chk(this)">�Ƶ�
							<input type="checkbox" name="memjang" value="�׼�" onclick="choise_chk(this)">�׼�
							<input type="checkbox" name="memjang" value="����" onclick="choise_chk(this)">����
							<input type="checkbox" name="memjang" value="�ڹ̵�" onclick="choise_chk(this)">�ڹ̵�
							<input type="checkbox" name="memjang" value="Ŭ����" onclick="choise_chk(this)">Ŭ����
							<input type="checkbox" name="memjang" value="��Ÿ��" onclick="choise_chk(this)">��Ÿ��
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