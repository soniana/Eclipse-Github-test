<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<style>
img .poster{
width:85px;
height:109.17px;
}


</style>
<script>		
	$(document).ready(function(data) {
		function weekly1(data) {
			if (!data) {
				alert('no data error');
				return false;
			}
			var weekly = $(data).find('db');		

			$(weekly).each(function() {
				var mt20id=$(this).find('mt20id').text();
				var prfnm = $(this).find('prfnm').text();
				var fcltynm = $(this).find('fcltynm').text();
				var prfpdfrom = $(this).find('prfpdfrom').text();
				var prfpdto = $(this).find('prfpdto').text();
				var poster = $(this).find('poster').text();
				var genrenm = $(this).find('genrenm').text();
				var openrun = $(this).find('openrun').text();
				$('#example').append("<tr>"+
						"<th><img class='poster' style='width:80px;height:109.17px;' src='"+poster+"'></th>"+
						"<th>"+genrenm+"</th>"+
						"<th><a href='prf.show?db=peDetail&mt20id="+mt20id+"'\">"+prfnm+"</th>"+
						"<th>"+prfpdfrom+"</th>"+
						"<th>"+prfpdto+"</th>"+
						"<th>"+fcltynm+"</th>"+
						"<th>"+openrun+"</th>");				
			});
	
			$('#example').DataTable();
		};
		function requestWeekly() {
			$.ajax({
				url : 'prflist1?gen=<%=request.getParameter("gen")%>',
				dataType : 'xml',
				success : function(data) {
					weekly1(data);
				}
			});
		}
		requestWeekly();
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
						<h2>공연 목록 조회</h2>
						<ol class="breadcrumb">
							<li><a href="index.html"> <i class="ion-ios-home"></i>
									HOME
							</a></li>
								<li class="active">${typee}</li>
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


<div>

	<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
	<thead><tr><th>포스터</th><th>종류</th><th>공연명</th><th>공연시작일</th>
	<th>공연종료일</th><th>공연시설명</th><th>오픈런</th></tr></thead><tbody>
	
	
	
	</tbody></table>
</div>

</section>
</body>
</html>

