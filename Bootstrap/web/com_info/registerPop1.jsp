<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>공연 검색</title>
<link  rel="stylesheet" type="text/css" href="https://simage.kyobobook.co.kr/ink/cssux/default_ssl.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<script type="text/javascript">
	jQuery(document).ready(function(){	
		popupResize();
	});

	function popupResize(){
		var ww = document.documentElement.offsetWidth || jQuery(window).width();
		var wh = jQuery(window).height();
		var dw = jQuery(document).width();
		var dh = jQuery(document).height();

		// 팝업 실제위치 확인 (IE8 이하)
		if(!window.screenY){
			var wl1 = window.screenX||window.screenLeft;
			var wt1 = window.screenY||window.screenTop;
			window.moveTo(wl1,wt1);
			var wl2 = window.screenX||window.screenLeft;
			var wt2 = window.screenY||window.screenTop;
			var wl = wl1-wl2;
			var wt = wt1-wt2;
			window.moveBy(wl,wt);
		}

		// 팝업 실제크기 확인
		if (window.outerHeight) {
			var totalW = window.outerWidth;
			var totalH = window.outerHeight;
		} else {
			if (document.documentElement.clientWidth){
				var clientW = document.documentElement.clientWidth;
				var clientH = document.documentElement.clientHeight;
				window.resizeTo (clientW, clientH);
				var frameW = clientW - document.documentElement.clientWidth;
				var frameH = clientH - document.documentElement.clientHeight;
				var totalW = clientW + frameW;
				var totalH = clientH + frameH;
				window.resizeTo (totalW, totalH);
				if (clientW != document.documentElement.clientWidth || clientH != document.documentElement.clientHeight) {
					frameW = totalW - document.documentElement.clientWidth;
					frameH = totalH - document.documentElement.clientHeight;
					totalW = clientW + frameW;
					totalH = clientH + frameH;
				}
			}
		}
		// 팝업 잘림 방지 (IE9 이하)
		var scrH = screen.availHeight;
		var scrY = window.screenY||(window.screenTop+wt);
		var scrH2 = scrH-scrY;
		var totalH2 = totalH+dh-wh;
		if(scrH<=totalH2){
			// 팝업이 화면보다 클 경우 최대한 위로 이동
			window.moveBy(0,-scrY);
		}else if(scrH2<totalH2){
			// 팝업의 하단이 잘릴 경우 잘린만큼만 위로 이동
			window.moveBy(0,scrH2-totalH2);
		}

		// 내용크기로 팝업크기 변경
		window.resizeBy( dw-ww, dh-wh );

		if(scrH<=totalH2){
			// 화면보다 팝업이 클 경우 팝업크기를 화면크기로 축소
			window.resizeTo(totalW,scrH);
			// 스크롤바 생성하고 팝업크기 확장
			document.body.scroll = "yes";
			var ww = document.documentElement.offsetWidth || jQuery(window).width();
			var dw = jQuery(document).width();
			window.resizeBy(dw-ww,dh-wh);
		}

	}
	
	function send() {
		var txt = "<font color='blue'>입력 완료</font>";
		window.opener.document.formname.entrpsnm.value = document.myform.sender.value;
		window.opener.document.getElementById("id2").innerHTML = txt;

		window.close();
	};
	
	//공연_입력
	function pickPrf(obj){
	  (function($){
	  		//form초기화
	  		/* initForm(); */
			/* $("#pickPrf").empty();	 */	
			var pickPrf = '';		
			pickPrf += '<strong>'+$(obj).attr("entrpsnm") +'</strong><br />';
/* 			pickPrf += '<div class="block_1">';
			pickPrf += '<div class="margin_top5">';
			pickPrf += '</div>';
			pickPrf += '</div>'; */
			document.myform.sender.value=$(obj).attr("entrpsnm");
			/* $("#pickPrf").append(pickPrf); */
			//form에 넣어주기
			/* insertForm(obj); */
			$("#pickPrf").attr("style","display:;");
		})(jQuery);					
	}
/* 	
	//주소목록
	function addressListDetail(){
		(function($){			 
			//주소목록
			$(".box_address_scroll").find("tbody").find("tr").remove();
alert("come here");
 				if($("#keyword").val() != ""){ 
					var searchResultList ='';
 		   	   		searchResultList = '<c:forEach var="prf" items="${prf}">';
		   	     	searchResultList +='<tr onclick="javascript:pickAddress(this)"; GENRENM=${prf.genrenm} PRFNM=${prf.prfnm} >'; 					   	     	
		   	     	searchResultList +='<td class="genrenm"><a href="#"><c:out value="${prf.genrenm}" /></a></td>';  
		   	     	searchResultList +='<td class="prfname" ><a href="#"><strong><c:out value="${prf.prfnm}" /></strong></a></td>';  			   	     	
		   	     	searchResultList +='</tr>';
		   	     	searchResultList +='</c:forEach>'; 
		   	     	$(".box_address_scroll").find("tbody").append(searchResultList);	
 				} else {
			   		var searchResultList = "";
			   		searchResultList +='<tr>'; 
			   		searchResultList +='<td class="no_result" colspan="3">검색된 주소가 없습니다.</td>'; 
			   		searchResultList +='</tr>'; 
			   		$(".box_address_scroll").find("tbody").append(searchResultList);	
				}	 		 	
		 })(jQuery);	
	}	 */   

</script>
</head>
<body>  
		    <form action="../comlist.show?db=detail1" method="post">
		        <input type="text" name="entrpsnm" style="border:1px solid #ccc; width:390px; margin-right:10px" autofocus>
		        <button value="검색">검색</button>
		        <table border="1">
 		            <c:forEach var="comlist" items="${comlist}">
		                <tr>
		                    <td class="genrename"><c:out value="${comlist.genrenm}"/></td>
		                    <td class="entrpsnm" onclick="javascript:pickPrf(this);" entrpsnm="${comlist.entrpsnm}"><a href="#"><c:out value="${comlist.entrpsnm}" /></a></td>
		                </tr>
		            </c:forEach> 
		        </table>
		    </form>
		   	 <div class="box_detail_margin_top20" id="pickPrf" style="border:1px solid #ccc; width:390px; margin-right:10px"></div>
			 <form name="myform">
				<input type="text" style="border:1px solid #ccc; width:390px;" name="sender" size="10">
				<input type="button" value="공연 입력" onclick="send()" />
			</form> 
		
			
</body>
</html>