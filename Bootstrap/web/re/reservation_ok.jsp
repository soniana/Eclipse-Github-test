<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">   
   <head>   
	
	<script type="text/javascript" src="dt/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="dt/jquery-ui-1.8.10.custom.min.js"></script>
	<script type="text/javascript" src="dt/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="dt/jquery.ui.widget.js"></script>
	<link rel="stylesheet" type="text/css" href="dt/jquery.ui.datepicker.css" />
	<link rel="stylesheet" type="text/css" href="dt/jquery.ui.all.css" />
	
	<script type="text/javascript">
	function goReList(f){
		f.method='POST';
		f.action='re.show?db=mylist&memid=${loginmem.memid}';
		f.submit();
	}
	</script>
<style>
	.form-group #leftrow {
		display:inline-block;
		width: 50%;
		float:left;
		width: 415px;
		margin: 50px 0 50px 0;
	}
	.form-group #rightrow {
		display:inline-block;
		width: 50%;
		float:right;
		width: 415px;
		margin: 50px 0 50px 0;
	}
	*[role="form"] {
		text-align: justify;
		width: 480px;
	    background-color: #fff;
	    margin-top: 30px;
	    margin-left:160px;
	}
	*[role="form"] h2 {
	/*     margin-left: 5em; */
	    margin-bottom: 1em;
	}
	.form-horizontal .form-group {
		float: left;
		margin-left: 0;
		margin-right: 0;
		margin-bottom: 0;
		/* border: 1px solid #ccc; */
	}
	.form-control {
		width: 200px;
		margin: 10px;
	}
	.col-sm-3 {
		float: left;
		width: 135px;
	}

	.col-sm-9 {
		width: 265px;
		margin-left: 15px;
	}
	.control {
		margin: 10px 0px 10px 0;
		font-size: 14px;
	}
	.button-class {
		background: #414141;
	    border: none;
	    color: #fff;
	    padding: 10px 30px;
	    margin-top: 30px;
	    font-size: 12px;
	    line-height: 1em;
	    text-transform: uppercase;
	    letter-spacing: normal;
	    border-radius: 3px;
	}
	#button {
	    margin: 30px 10px 30px 5px;
	    padding: 10px;
	    float: right;
	}
	.img reserv_img{
		width:380px;
		heigt:450px
		}
		
	.btn_statsView2 {float:right; margin:25px 0 0 10px; padding:10px 25px; background:url("../../images/por/bg_thead.png") repeat-x; border:1px solid #707070; color:#707070; font-family: 'y780';}
	</style>
	

<script type="text/javascript">
	$(function() {
		$("#dtp1").datepicker({
			changeYear : true,
			changeMonth : true,
			dateFormat : 'yy.mm.dd',
			minDate : '${prfpdfrom}',
			maxDate : '${prfpdto}'
		});
	});
	function checknadd(f) {
		if (document.formname.seldate.value == ""){
			alert("공연볼날짜를 선택하세요.")
			document.formname.seldate.focus()
			return
		}else if (document.formname.seltime.value =="시간선택"){
			alert("공연시간을 입력하세요.")
			document.formname.seltime.focus()
			return
		}else if (document.formname.seattype.value =="None"){
			alert("좌석타입을 입력하세요.")
			document.formname.seattype.focus()
			return		
		}else if (document.formname.people.value =="" || document.formname.people.value<1){
			alert("관람인원을 1이상 입력하세요.")
			document.formname.seattype.focus()
			return
		}
		else{
			var c=confirm('입력 하시겠습니까?');
			if(c==true){
				f.method='POST';
				f.action='re.show?db=add';
				f.submit();	
			}
		}
	}

	function getPeople(){
		var people= document.getElementById("people");
		var howmany =1;
		if(people.value!=""){
			howmany = parseInt(people.value);
		}
		return howmany;
	}
	function onlyNumber() {
		if(event.keyCode<48 || event.keyCode>57){
			alert("관람인원은 숫자로만 입력하세요.")
			event.returnValue = false;
		}
	}

	var seat_prices = new Array();
	seat_prices["None"]=0;
	seat_prices["S석"]=150000;
	seat_prices["R석"]=80000;
	seat_prices["A석"]=30000;

	function getSeatPrice() {
		var seatSelect = document.getElementById('seattype');
		return seat_prices[seatSelect.value];
	}

	function calculateTotal() {
		var total=getPeople()*getSeatPrice();
		var totalEl=document.getElementById('price');
		document.getElementById('price').innerHTML=total;
	}

	$(document).ready(function(){
	    var people=$("#people");
	    people.keyup(function(){
			var total=getPeople()*getSeatPrice();
	        $("#price").val(total);
	    });
	});

$(document).ready(function() {
	function pedetail(data) {
		var output = '';
		var detail = $(data).find('db');	
		
		$(detail).each(function() {		
			var poster = $(this).find('poster').text();		
			output +='<div class="showDetailArea"><div class="sda_l"><dl><dd><img src="'+poster+'"/></dd></dl></div>';
			}); 
		$('#pedetail').html(output);
	};
	function requestDetail() {
		$.ajax({
			url : 'PeDetail?id=<%=request.getParameter("mt20id")%>',
				dataType : 'xml',
				success : function(data) {
					pedetail(data);
				}
			});
		};
		requestDetail();
	});
</script>      
<style>
.ui-datepicker{
	background:white;
}
</style>        
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
                            <h2>공연 예매 완료</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="index.html">
                                        <i class="ion-ios-home"></i>
                                        HOME
                                    </a>
                                </li>
<!--                                 <li class="active">회원가입</li> -->
                            </ol>
                        </div>
                    </div>
                </div>
            </div>   
        </section><!--/#Page header-->
        
        
        <!-- 
        ================================================== 
            Section Section Start
        ================================================== -->
 
        <section id ="register" class="register">  

		             <div class="container">
	            <form class="form-horizontal" role="form" name="formname">
		           
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">일반회원ID</label>
		                    </div>
		                    <div class="col-sm-9">
		                         <input type="text" id="id" name="memid" class="form-control" value="${addre.memid}" readonly>
		              		</div>
		                </div>	 
         				  <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">공연ID</label>
		                    </div>
		                    <div class="col-sm-9">
		                       <input type="text" id="id0" name="mt20id" class="form-control" value="${addre.mt20id}" readonly />
		        		    </div>
		                </div>                
          
           				 <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">공연명</label>
		                    </div>
		                    <div class="col-sm-9">
		                       <input type="text" id="id2" name="prfnm" class="form-control" value="${prfnm}" readonly/>
		     
		        			</div>
		                </div>
          
                 		<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">공연시설ID</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="56" name="mt10id" class="form-control" value="${addre.mt10id}" readonly />
		                    </div>
		                </div>
		                
		                <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">공연시설명</label>
		                    </div>
		                    <div class="col-sm-9">
		                        <input type="text" id="56" name="fcltynm" class="form-control" value="${addre.fcltynm}" readonly />
		                    </div>
		                </div>
                  
             		    <div class="form-group" id="leftrow">
                			 <div class="col-sm-3 control-label">
                				 <label class="control">공연날짜선택</label>
                		     </div>
                		       <div class="col-sm-9">	 
      						   <input type="text" id="dtp2" name="seldate" class="form-control" value="${addre.seldate}" readonly />
		                    </div>
		                </div>
                	
                	   <div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">공연시간</label>
		                    </div>
		                     <div class="col-sm-9">	 
		                       <input type="text" id="dtp2" name="seltime" class="form-control" value="${addre.seltime}" readonly />
		                        </div>
		               </div>   
                
                
                		<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">좌석타입</label>
		                    </div>
		                    	<div class="col-sm-9">	 
		                       <input type="text" id="seattype" name="seattype" class="form-control" value="${addre.seattype}" readonly />
		                        </div>
		               </div>   

                		<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
		                    	<label class="control">관람인원</label>
		                    </div>
		  						<div class="col-sm-9">
		                    	 <input type="text" name="people" class="form-control" id="people" value="${addre.people}" readonly />
		               			</div>
		                   		
		           		</div>   
                
                		<div class="form-group" id="leftrow">
		                    <div class="col-sm-3 control-label">
                		     <label class="control">총금액</label>
                		     </div>
                		   <div class="col-sm-9">
						  <input type="text" class="form-control" name="price" id="price" value="${addre.price}" readonly />
       						</div>
       					</div>	
             
        
         	          <fieldset>
						<table width=380 height=450>
						<tr align=center>
							<td><img class="reserv_img" src="<%=request.getParameter("poster")%>" style="width:370px;">
							<input type="hidden" name="poster" value="${poster}">
							<div>

								<input type="button" id="button" class="button-class" value="예매 내역 모두 보기" onclick="goReList(this.form);" style="width:150px; margin-bottom:50px;">
						
							</div>
							
							</td>
						</tr>
						</table>
					</fieldset>
						
					
					
				
					
        	
        </form>
        </section>
    </body>
</html>