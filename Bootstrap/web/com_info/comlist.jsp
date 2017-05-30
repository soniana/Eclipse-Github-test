<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<!-- css/less
        ================================================== -->
<!-- mem_mylist css -->
<link rel="stylesheet" href="css/admini_mylist.css">
<!-- mem_mylist css -->
<link rel="stylesheet" href="css/admini_mylist2.css">
<!-- mem_mylist less -->
<link rel="stylesheet" href="less/admini_mylist.less">

<!-- END css/less
        ================================================== -->

<title>Reservation Search Page</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
	
<style></style>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
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
	</section>
	<!--/#Page header-->


	<!-- 
        ================================================== 
            Section Section Start
        ================================================== -->
        
        
	<section>

	<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
		<thead>
			<tr>
				<td>�����No.</td>
				<td>ȸ��ID</td>
				<td>ȸ��PW</td>
				<td>��ȹ/���ۻ�ID</td>
				<td>��ȹ/���ۻ��</td>
				<td>����ó</td>
				<td>����</td>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td>�����No.</td>
				<td>ȸ��ID</td>
				<td>ȸ��PW</td>
				<td>��ȹ/���ۻ�ID</td>
				<td>��ȹ/���ۻ��</td>
				<td>����ó</td>
				<td>����</td>
			</tr>
		</tfoot>
		 <tbody>
		<c:forEach var="com" items="${cominfo}">
			<tr>
				<td>${com.comno}</td>
				<td>${com.comid}</td>
				<td>${com.compw}</td>
				<td>${com.mt30id}</td>
				<td>${com.entrpsnm}</td>
				<td>${com.comtel}</td>
				<td>${com.genrenm}</td>
			</tr>			
			</c:forEach>
		 </tbody>
	</table>
	</section>
</body>
</html>

