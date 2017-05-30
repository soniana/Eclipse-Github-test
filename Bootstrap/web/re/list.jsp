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
<link rel="stylesheet" href="css/mem_mylist.css">
<!-- mem_mylist css -->
<link rel="stylesheet" href="css/mem_mylist2.css">
<!-- mem_mylist less -->
<link rel="stylesheet" href="less/mem_mylist.less">

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


<style>
	.listtable {
		margin-top: 70px;
	}
</style>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>

<script type="text/javascript">
function recancel(f,no,id){
	var c=confirm('������ ����Ͻðڽ��ϱ�?');
	if(c==true){
		var cc=confirm('������ ��ҵǾ����ϴ�.');
		if(cc==true){
			f.method='POST';
			f.action='re.show?db=delete&reno='+no+'&memid='+id;
			f.submit();			
		}		
	}
}

// $(document).ready(function() {
// 	function pedetail(data) {
// 		var output = '';
// 		var detail = $(data).find('db');	
		
// 		$(detail).each(function() {		
// 			var prfnm = $(this).find('prfnm').text();		
// 			output +=prfnm;
// 			}); 
// 		$('#pedetail').html(output);
// 	};
// 	function requestDetail() {
// 		$.ajax({
<%-- 				url : 'PeDetail?id=<%=request.getParameter("mt20id")%>', --%>
// 				dataType : 'xml',
// 				success : function(data) {
// 					pedetail(data);
// 				}
// 			});
// 		};
// 		requestDetail();
// 	});

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
							<h2>���� ��Ȳ ��ȸ</h2>
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
		<div class="listtable">
		<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
			<thead>
				<tr>
					<td>����No.</td>
					<td>�Ϲ�ȸ��ID</td>
					<td>������</td>
					<td>�����ü���</td>
					<td>��������¥</td>
					<td>�����ð�</td>
					<td>�����ο�</td>
					<td>�¼�Ÿ��</td>
					<td>�ѱݾ�</td>
					<td>�������</td>				
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td>����No.</td>
					<td>�Ϲ�ȸ��ID</td>
					<td>������</td>
					<td>�����ü���</td>
					<td>��������¥</td>
					<td>�����ð�</td>
					<td>�����ο�</td>
					<td>�¼�Ÿ��</td>
					<td>�ѱݾ�</td>
					<td>�������</td>
				</tr>
			</tfoot>
			 <tbody>
			<c:forEach var="re" items="${relist}">
				<tr>
					<td>${re.reno}</td>
					<td>${re.memid}</td>
					<td>${re.prfnm}</td>
					<td>${re.fcltynm}</td>
					<td>${re.seldate}</td>
					<td>${re.seltime}</td>
					<td>${re.people}</td>
					<td>${re.seattype}</td>
					<td>${re.price}</td>
					<td>
				<form><input type="button" value="�������" onclick="recancel(this.form,'${re.reno}','${re.memid}')"></form>
				</td>
				</tr>
				
			</c:forEach>
			 </tbody>
		</table>
		</div>
		<div class="listtable"></div>
	</section>
</body>
</html>
