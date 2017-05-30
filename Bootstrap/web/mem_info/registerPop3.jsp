<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style></style>
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
		window.opener.document.bb.mempa3.value = document.myform.sender.value;
		window.opener.document.getElementById("process").innerHTML = txt;

		window.close();
	};
	
	//공연_입력
	function pickPrf(obj){
	  (function($){
	  		//form초기화
	  		/* initForm(); */
			/* $("#pickPrf").empty();	 */	
			var pickPrf = '';		
			pickPrf += '<strong>'+$(obj).attr("prfnm") +'</strong><br />';
/* 			pickPrf += '<div class="block_1">';
			pickPrf += '<div class="margin_top5">';
			pickPrf += '</div>';
			pickPrf += '</div>'; */
			document.myform.sender.value=$(obj).attr("prfnm");
			/* $("#pickPrf").append(pickPrf); */
			//form에 넣어주기
			/* insertForm(obj); */
			$("#pickPrf").attr("style","display:;");
		})(jQuery);					
	}
	</script>
</head>
<body>						   
			
			<form action="../pa.show?db=detail3" method="post">
		        <input type="text" name="prfnm" style="border:1px solid #ccc; width:390px; margin-right:10px" autofocus>
		        <button value="검색">검색</button>
		        <table border="1">
 		            <c:forEach var="prf" items="${prf}">
		                <tr>
		                    <td class="genrename"><c:out value="${prf.genrenm}" /></td>
		                    <td class="prfname" onclick="javascript:pickPrf(this);" prfnm="${prf.prfnm}"><a href="#"><c:out value="${prf.prfnm}" /></a></td>
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