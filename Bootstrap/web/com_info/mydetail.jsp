<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<!-- css/less
        ================================================== -->
<!-- com_mylist css -->
<link rel="stylesheet" href="css/com_mylist.css">
<!-- com_mylist css -->
<link rel="stylesheet" href="css/com_mylist2.css">
<!-- com_mylist less -->
<link rel="stylesheet" href="less/com_mylist.less">

<!-- END css/less
        ================================================== -->

<title>Insert title here</title>
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
	});
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
						<h2>�� ���� ���� ��Ȳ</h2>
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

<table id="example" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
			<td>����No.</td>
			<td>�Ϲ�ȸ��ID</td>
			<td>�̸�</td>
			<td>����ó</td>
			<td>����ID</td>
			<td>�����ü�ID</td>
			<td>�����ü���(�������)</td>
			<td>��������¥</td>
			<td>�����ð�</td>
			<td>�����ο�</td>
			<td>�¼�Ÿ��</td>
			<td>�ѱݾ�</td>
			</tr>
			
		</thead>
		<tfoot>
			<tr>
			<td>����No.</td>
			<td>�Ϲ�ȸ��ID</td>
			<td>�̸�</td>
			<td>����ó</td>
			<td>����ID</td>
			<td>�����ü�ID</td>
			<td>�����ü���(�������)</td>
			<td>��������¥</td>
			<td>�����ð�</td>
			<td>�����ο�</td>
			<td>�¼�Ÿ��</td>
			<td>�ѱݾ�</td>
			</tr>
		</tfoot>
		 <tbody>
			
			

	<c:forEach var="re" items="${redelist}">
	<tr>
		<td>${re.reno}</a></td>
		<td>${re.memid}</td>
		<td>${re.memname}</td>
		<td>${re.memtel}</td>
		<td>${re.mt20id}</td>
		<td>${re.mt10id}</td>
		<td>${re.fcltynm}</td>
		<td>${re.seldate}</td>
		<td>${re.seltime}</td>
		<td>${re.people}</td>
		<td>${re.seattype}</td>
		<td>${re.price}</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>

</section>
