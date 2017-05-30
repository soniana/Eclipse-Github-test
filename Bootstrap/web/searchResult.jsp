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
						<h2>검색 목록 조회</h2>
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
	<thead><tr><th>공연명</th><th>공연장소</th><th>공연출연진</th><th>공연제작진</th><th>런타임</th>
	<th>관람연령</th><th>제작사</th><th>티켓정보</th><th>장르</th>
	<th>공연상태</th><th>오픈런</th><th>공연시간</th></tr>
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