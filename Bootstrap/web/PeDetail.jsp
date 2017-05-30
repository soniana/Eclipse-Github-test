<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<!-- prfdetail css -->
<link rel="stylesheet" href="css/prfdetail.css">
<!-- ticket incHeader -->
<link rel="stylesheet" href="css/prfdetail2.css">
<!-- ticket_vip -->
<link rel="stylesheet" href="css/prfdetail3.css">
<!-- kopis-sub2 -->
<link rel="stylesheet" href="css/prfdetail4.css">
<style>
.btn_statsView2 {float:right; margin:25px 0 0 10px; padding:10px 25px; background:url("../../images/por/bg_thead.png") repeat-x; border:1px solid #707070; color:#707070; font-family: 'y780';}

</style>
<script type="text/javascript">
function Bmember(){
	var c=confirm('로그인이 필요한 페이지입니다. 확인을 누르면 로그인 페이지로 이동합니다.');
	if(c==true){
		location.href='main.show?view=login';
	}
}

var prfnm;
var poster;
var mt20id;
var mt10id;
var fcltynm;
var prfpdfrom;
var prfpdto;
function member(){
	location.href=encodeURI('re.show?db=reDetail&poster='+poster+'&prfnm='+prfnm+'&mt20id='+mt20id+'&mt10id='+mt10id+'&fcltynm='+fcltynm+'&prfpdfrom='+prfpdfrom+'&prfpdto='+prfpdto);
}

$(document).ready(function() {	
	function pedetail(data) {
		var output = '';
		var detail = $(data).find('db');	
		
		$(detail).each(function() {
			mt20id = $(this).find('mt20id').text();
			mt10id = $(this).find('mt10id').text();
			prfnm = $(this).find('prfnm').text();
			prfpdfrom = $(this).find('prfpdfrom').text();
			prfpdto = $(this).find('prfpdto').text();
			fcltynm = $(this).find('fcltynm').text();
			var prfcast = $(this).find('prfcast').text();
			var prfcrew = $(this).find('prfcrew').text();
			var prfruntime = $(this).find('prfruntime').text();
			var prfage = $(this).find('prfage').text();
			var entrpsnm = $(this).find('entrpsnm').text();
			var pcseguidance = $(this).find('pcseguidance').text();
			poster = $(this).find('poster').text();
			var genrenm = $(this).find('genrenm').text();
			var dtguidance = $(this).find('dtguidance').text();
			output +='<section class="company-description">';
			output +='<div id="showInfo"><div class="showDetail"><div class="showTit">';
			output +='<span class="txt_ellipsis"><b>'+prfnm+'<b></span>';	
			output +='</div>';
			output +='<div class="showDetailArea"><div class="sda_l"><dl><dd><img src="'+poster+'"/></dd></dl></div>';
			output +='<div class="sda_r">';
			output +='<table summary="공연시설 정보" class="table_list4"><caption>공연장 상세정보입니다.</caption><colgroup><col width="110px"></col><col width="*"></col></colgroup><tbody class="place"><tr>';
			output +='<th scope="row" class="info_name">공연명</th>';
			output +='<td>'+prfnm+'</td></tr><tr class="pline">';
			output +='<th scope="row" class="info_name">공연기간</th><td>'+prfpdfrom+'~'+prfpdto+'</td></tr>';
			output +='<th scope="row" class="info_name">공연시간</th><td>'+dtguidance+'</td></tr>';
			output +='<tr class="pline"><th scope="row" class="info_name">공연장소</th><td>'+fcltynm+'</td></tr>';
			output +='<tr class="pline"><th scope="row" class="info_name">출연진</th><td>'+prfcast+'</td></tr>';
			output +='<tr><th scope="row" class="info_name">제작진</th><td>'+prfcrew+'</td></tr>';
			output +='<tr class="pline"><th scope="row" class="info_name">관람시간</th><td>'+prfruntime+'</td></tr>';
			output +='<tr><th scope="row" class="info_name">관람연령</th><td>'+prfage+'</td></tr>';
			output +='<tr><th scope="row" class="info_name">제작사</th><td>'+entrpsnm+'</td></tr>';
			output +='<tr><th scope="row" class="info_name">티켓가격</th><td>'+pcseguidance+'</td></tr></tbody></table>';
			
			
			
 			output +='<c:choose><c:when test="${loginmem==null && logincom==null}"><a href="#" onclick="Bmember();"><button class="btn_statsView2" value="가자서버로"><span class="">예매하기</span></button></a></c:when><c:when test="${loginmem!=null && logincom==null}"><a href="#" onclick="member();"><button class="btn_statsView2" value="가자서버로"><span class="">예매하기</span></button></a></c:when><c:otherwise></c:otherwise></c:choose>';
 			output +='</div></div></div></div></div>';

			
			
			
			
			output +='<div id="detail_info_sub03"><h4 class="detail_sub_title"><span class="spr_vip txt_detail_prd_info">공연(작품정보)</span></h4>';
			
		 	var styurls = $(this).find('styurls');			
			$(styurls).find('styurl').each(function(){
				var styurl = $(this).text();
				output +='<div class="detail_block"><div class="input_img"><div style="text-align: center">';
				output +='<img alt="이미지를 표시할 수 없습니다."src="'+styurl+'"/><br />';
				output +='</div></div></div>';
			}); 
	//		var styurls = $(this).find('styurls').text();
			
			
	
			
			/* output +='if(s1.contains(".jpg")){var strArray=s1.split(".jpg"); for(var i=0; i<strArray.length;i++) result=strArray[i]; for(var j=0; j<strArray.length;j++)<div class="detail_block"><div class="input_img"><div style="text-align: center"><img alt="" src="'+result+'"/><br />};';
			/*  output +='<img alt="" src="'+styurls+'" /><br />';  */ 			
		   	output +='</div></div></div></div></section>';
			
		});
		$('#pedetail').html(output);
	};
	function requestDetail() {
		$.ajax({
			url : 'PeDetail.show?mt20id=<%=request.getParameter("mt20id")%>',
				dataType : 'xml',
				success : function(data) {
					pedetail(data);
				}
			});

		}
		;
		requestDetail();

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
						<h2>공연 상세 정보</h2>
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



<div id="pedetail"></div>



</body>
</html>