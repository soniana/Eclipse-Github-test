<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">   
<head>
	<!-- <link rel="stylesheet" href="css/meminfo_check.css"> -->

	<script>
	function comtal(f){
		var c=confirm('������ Ż���Ͻðڽ��ϱ�?');
		if(c==true){
			confirm('Ż�� ���������� �Ϸ� �Ǿ����ϴ�.');
			f.method='POST';
			f.action='com.show?db=delete&comid=${cominfo.comid}';
			f.submit();				
		}else{
			f.method='POST';
			f.action='com.show?db=detail&comid=${logincom.comid}';
			f.submit();
		}
	}
	function comsoo(f){
		var c=confirm('������ �����Ͻðڽ��ϱ�?');
		if(c==true){
			f.method='POST';
			f.action='com.show?db=updateview&comid=${cominfo.comid}';
			f.submit();
		}else{
			f.method='POST';
			f.action='com.show?db=detail&comid=${logincom.comid}';
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
                            <h2>ȸ�� ���� Ȯ��</h2>
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
		                        <input type="text" id="id" name="memid" class="form-control" value="${cominfo.comid}" readonly>
		              		</div>
		                </div>	                
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">��й�ȣ</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" type="password" id="id0" name="mempw" class="form-control" value="${cominfo.compw}" readonly>
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
		                    	<label class="control">����ó</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id0" name="comtel" class="form-control" value="${cominfo.comtel}" readonly>
		                    </div>
		                </div>
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">����</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="id0" name="genrenm" class="form-control" value="${cominfo.genrenm}" readonly>
		        	        </div>
		                </div>
		                
						<div class="divcenter">
					<input type="button" id="button" class="button-class" value="ȸ��Ż��" onclick="comtal(this.form);"/>
        			<input type="button" id="button" class="button-class" value="ȸ����������"onclick="comsoo(this.form);"/>
	                    </div>
            </form> <!-- /form -->
        </div> <!-- ./container -->
        </section>
        
    </body>
</html>