<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>

<link rel="stylesheet" href="css/newlist.css">
<link rel="stylesheet" href="css/newlist2.css">
<style></style>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
</head>

<!-- 
        ================================================== 
            Global Page Section Start
        ================================================== -->
        <body>
	<section class="global-page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2>�˻� ��� ��ȸ</h2>
						<ol class="breadcrumb">
							<li><a href="index.html"> <i class="ion-ios-home"></i>
									HOME
							</a></li>
								<li class="active">${gen}</li>
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
	<thead><tr><th>������</th><th>�������</th><th>�����⿬��</th><th>����������</th><th>��Ÿ��</th>
	<th>��������</th><th>���ۻ�</th><th>Ƽ������</th><th>�帣</th>
	<th>��������</th><th>���·�</th><th>�����ð�</th></tr>
	</thead><tbody>
	<c:forEach var="list" items="${searchlist}">
<tr><td>${list.prfnm}</td>
	<td>${list.fcltynm}</td><td>${list.prfcast}</td><td>${list.prfcrew}</td><td>${list.prfruntime}</td>
	<td>${list.prfage}</td><td>${list.entrpsnm}</td><td>${list.pcseguidance}</td><td>${list.genrenm}</td>
	<td>${list.prfstate}</td><td>${list.openrun}</td><td>${list.dtguidance}</td></tr>
</c:forEach>
	
	
	</tbody></table>

</section>
</body>
</html>