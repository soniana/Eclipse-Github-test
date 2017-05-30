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
						<h2>내 공연 예약 현황</h2>
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
			<td>예매No.</td>
			<td>일반회원ID</td>
			<td>이름</td>
			<td>연락처</td>
			<td>공연ID</td>
			<td>공연시설ID</td>
			<td>공연시설명(공연장명)</td>
			<td>공연볼날짜</td>
			<td>공연시간</td>
			<td>관람인원</td>
			<td>좌석타입</td>
			<td>총금액</td>
			</tr>
			
		</thead>
		<tfoot>
			<tr>
			<td>예매No.</td>
			<td>일반회원ID</td>
			<td>이름</td>
			<td>연락처</td>
			<td>공연ID</td>
			<td>공연시설ID</td>
			<td>공연시설명(공연장명)</td>
			<td>공연볼날짜</td>
			<td>공연시간</td>
			<td>관람인원</td>
			<td>좌석타입</td>
			<td>총금액</td>
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
