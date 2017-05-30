/**
 * YYYYMMDD 형식에 YYYY/MM/DD로 표현될 구분자를 전역변수로 선언하여 사용한다.
 * 구분자를 변경할 경우 해당 전역변수만 변경되면 적용될 수 있도록 한다. 
 */
var DATE_GUBUN = ".";
/*
 * 요소기술 스크립트  
 */

// 숫자체크
function isNumber(control, msg) {
	
	var val = control;
	var Num = "1234567890";
	for (i=0; i<val.length; i++) {
		if(Num.indexOf(val.substring(i,i+1))<0) {
			alert(msg+' 형식이 잘못되었습니다.');
			return false;
		}
	}
	return true;
}

// 날짜체크
function isDate(control, msg) {
	 
	// '/'나 '-' 구분자 제거
	var val = getRemoveFormat(control);
	
	// 숫자, length 확인
	if (isNumber(val, msg) && val.length == 8) {
		var year = val.substring(0,4);
		var month = val.substring(4,6);
		var day = val.substring(6,8);
		
		// 유효날짜 확인
		if(checkDate(year,month,day,msg)){
			return true;
		} else {
			return false;
		}
	} else {
		alert(msg + " 유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
		return false;
	}
}

// 구분자 제거
function getRemoveFormat(val) {
	if(val.length == 10) {
		var arrDate = new Array(3);
		arrDate = val.split("/");
		if(arrDate.length != 3) {
			arrDate = val.split("-");
		}
		return arrDate[0] + arrDate[1] + arrDate[2];
	} else {
		return val;
	}	
}

// 유효날짜 확인
function checkDate(varCk1, varCk2, varCk3, msg) {
	if (varCk1>="0001" && varCk1<="9999" && varCk2>="01" && varCk2<="12") {
		febDays = "29";
		if ((parseInt(varCk1,10) % 4) == 0) {
			if ((parseInt(varCk1,10) % 100) == 0 && (parseInt(varCk1,10) % 400) != 0){
				febDays = "28";
			}
		}else{
			febDays = "28";
		}
		if (varCk2=="01" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="02" && varCk3>="01" && varCk3<=febDays) return true;
		if (varCk2=="03" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="04" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="05" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="06" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="07" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="08" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="09" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="10" && varCk3>="01" && varCk3<="31") return true;
		if (varCk2=="11" && varCk3>="01" && varCk3<="30") return true;
		if (varCk2=="12" && varCk3>="01" && varCk3<="31") return true;
	}
	alert(msg + " 유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
	return false;
}
//문자 뒤의 공백문자를 제거하는 함수
function rTrim ( str ) {
	str = str + "";
	var len = str.length;

	for(var i = (len - 1); (str.charAt(i) == ' '); i--);
	str = str.substring(0, i + 1);

	return str;
}

// 문자 맨 앞의 공백문자를 제거하는 함수
function lTrim ( str ) {
	var len = str.length;
	var i = 0;

	for(i = 0; str.charAt(i) == ' '; i++);
	str = str.substring(i, len);

	return str;
}

function Trim ( strValue ) {
		strValue = lTrim(rTrim(strValue));
		return strValue;
}

// Email Check
function EmailCheck(strEmail, strName)
{
	var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;
	var regMust = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3})$/;

	if ( !regDoNot.test(strEmail) && regMust.test(strEmail) ) {
		return true;
	} else {
		msg = "[" + strName + "] : 잘못 입력하셨습니다!\r\n\r\n  다시 한번 확인하십시오.";
		alert(msg);
		return false;
	}
}

function isFieldBlank(theField) {
		var str = theField.value.length;
		str = lTrim(rTrim(str));

		if(str == 0)
 		return true;
		else
 		return false;
}

function EmptyCheck( strValue, strName ) {
		var strlength = strValue.length;

		if ( strlength == 0 ) {
		msg = "[" + strName + "] : 입력하십시오!";
		alert(msg);
		return false;
		} else
		return true;
}

function LengthCheck( strValue, strName, lowLength, highLength )
{
	var nsize = 0;

	nsize = GetLength(strValue);
	if ( nsize < lowLength ) {
		msg = "[" + strName + "] : " + lowLength + "자 이상 입력하십시오!\r\n\r\n (주의: 한글 1자는 2자로 계산함.)";
		alert(msg);
		return false;
	} else if ( nsize > highLength ) {
		msg = "[" + strName + "] : " + highLength + "자 이하로 입력하십시오!\r\n\r\n (주의: 한글 1자는 2자로 계산함.)";
		alert(msg);
		return false;
	}
	else
		return true;
}

//정해진 글자 길이로만 검색해야 할 경우
function LengthCheck2(strValue, strName, length){
	
	var nsize = 0;
	
	nsize = GetLength(strValue);
	
	if(nsize != length){
		msg = "[" + strName + "] : " + length + "자로 검색하십시오!";
		alert(msg);
		return false;
	}
	return true;
}

//정해진 글자 길이로만 등록해야 할 경우
function LengthCheck3(strValue, strName, length){
	
	var nsize = 0;
	
	nsize = GetLength(strValue);
	
	if(nsize != length){
		msg = "[" + strName + "] : " + length + "자로 입력하십시오!";
		alert(msg);
		return false;
	}
	return true;
}

function GetLength( strValue )
{
	var nsize = 0;
	var chrOrig;
	var charEscaped;

	for( var intinx = 0; intinx <= strValue.length -1 ; intinx++ ){
		chrOrig = strValue.substring(intinx,intinx+1);
		chrEscaped = escape(chrOrig); 
		if ( chrEscaped.substring(0,2) == "%u" )
			nsize = nsize + 2;
		else
			nsize++;
		}
		return nsize;
}

//숫만 허용
function onlyNumber(){
	
  if((event.keyCode<48) || (event.keyCode>57)){
	  event.returnValue=false;
  }
}

//영문/숫자만 허용하기 
function onlyEngNumber(str, strName)
{
	var regMust = /[^_(a-zA-Z0-9)]/;

	if ( regMust.test(str) ) {
		msg = "[" + strName + "] : 영문과 숫자만 입력하실 수 있습니다!\r\n\r\n  다시 한번 확인하십시오.";
		alert(msg);
		return false;
	}
	return true;
}

//숫자만 허용하기
//기존함수가 있어 중복되어 함수명 onlyNumber2 로 수정합니다.(2010.11.02 남덕우)
function onlyNumber2(str, strName)
{
	var regMust = /[^_(0-9)]/;

	if ( regMust.test(str) ) {
		msg = "[" + strName + "] :  숫자만 입력하실 수 있습니다!\r\n\r\n  다시 한번 확인하십시오.";
		alert(msg);
		return false;
	}
	return true;
}

//영문만 허용하기 
function onlyEng(str, strName)
{
	var regMust = /[^_(a-zA-Z)]/;

	if ( regMust.test(str) ) {
		msg = "[" + strName + "] : 영문만 입력하실 수 있습니다!\r\n\r\n  다시 한번 확인하십시오.";
		alert(msg);
		return false;
	}
	return true;
}
/**
 * 입력값에 특정 문자(chars)가 있는지 체크
 * 특정 문자를 허용하지 않으려 할 때 사용
 * ex) if (containsChars(form.name,"!,*&^%$#@~;")) {
 *         alert("이름 필드에는 특수 문자를 사용할 수 없습니다.");
 *     }
 */
function containsChars(input,chars) {
	for (var inx = 0; inx < input.value.length; inx++) {
		if (chars.indexOf(input.value.charAt(inx)) != -1)
			return true;
	}
	return false;
}

// 주민번호 검사
function JuminCheck(jumin1, jumin2)
{
	var chk = 0;
	if(jumin1.length != 6){
		alert ('주민등록번호 앞부분이 잘못되었습니다.');
		return false;
	}
	
	var sex = jumin2.substring(0,1);
	var yy  = jumin1.substring(0,2);
	var mm  = jumin1.substring(2,4);
	var dd  = jumin1.substring(4,6);

	if ((sex != 1 && sex != 2 && sex != 3 && sex != 4 && sex != 9 && sex != 0) || (jumin2.length != 7 ))
	{
		alert ('주민등록번호 뒷부분이 잘못되었습니다.');
		return false;
	}
	
	for (var i = 0; i <=5 ; i++)
		chk = chk + ((i%8+2) * parseInt(jumin1.substring(i,i+1)));
	
	for (i = 6; i <=11 ; i++)
		chk = chk + ((i%8+2) * parseInt(jumin2.substring(i-6,i-5)));
	
	chk = 11 - (chk %11);
	chk = chk % 10;
	  
	if (chk != jumin2.substring(6,7))
	{
		alert ('유효하지 않은 주민등록번호입니다.');
		return false;
	}
	
	return true
}

//외국인 주민번호 검사
function ForeignerJuminCheck(jumin1, jumin2)
{
	var chk = 0;
	if(jumin1.length != 6){
		alert ('주민등록번호 앞부분이 잘못되었습니다.');
		return false;
	}
	
	var sex = jumin2.substring(0,1);
	var yy  = jumin1.substring(0,2);
	var mm  = jumin1.substring(2,4);
	var dd  = jumin1.substring(4,6);

	if ((sex != 5 && sex != 6 && sex != 7 && sex != 8) || (jumin2.length != 7 ))
	{
		alert ('주민등록번호 뒷부분이 잘못되었습니다.');
		return false;
	}
	
	for (var i = 0; i <=5 ; i++)
		chk = chk + ((i%8+2) * parseInt(jumin1.substring(i,i+1)));
	
	for (i = 6; i <=11 ; i++)
		chk = chk + ((i%8+2) * parseInt(jumin2.substring(i-6,i-5)));
	
	chk = 11 - (chk %11);
	chk = chk % 10;
	
	if (chk != jumin2.substring(6,7))
	{
		alert ('유효하지 않은 주민등록번호입니다.');
		return false;
	}
	
	return true
}

//Radio button Check
function CheckRadio(obj, msg ) {

	if (obj) {
		if (obj.length){
			var j = 0;
			for (i=0;i < obj.length; i++){
				if (obj[i].checked == true) {
					j++;
				}
			}
			if ( j == 0) {
				alert(msg);
				return false;
			}
		} else {
			if (obj.checked == true) {
			} else {
				alert(msg);
				return false;
			}
		}
	} else {
		alert(msg);
		return false;
	}

	return true;
}

/*	검색어 입력시에 특수문자 체크용 함수	*/
function checkxword(str) {
	var xword = '!@#$%^&*()';
	for (i = 0; i < str.length; i++) {
		for (z = 0; z < xword.length; z++) {
			if (str.charAt(i) == xword.charAt(z)) {
				return true;
			}
		}
	}
	return false;
}

	/*
	* 사업자번호 검사
	*/
	function  idnumSecond_Check(idnum){

		if(idnum.length == 0){
			return false;
		}
		
		var sum = 0; 
		var getlist =new Array(10); 
		var chkvalue =new Array("1","3","7","1","3","7","1","3","5"); 
		for(var i=0; i<10; i++) { 
			getlist[i] = idnum.substring(i, i+1); 
		}
		for(var i=0; i<9; i++) {
			sum += getlist[i]*chkvalue[i]; 
		} 
		sum = sum + parseInt((getlist[8]*5)/10); 
		sidliy = sum % 10; 
		sidchk = 0; 
		if(sidliy != 0){ 
			sidchk = 10 - sidliy; 
		}else{ 
			sidchk = 0; 
		}
		if(sidchk != getlist[9]) { 
			return false; 
		} 
		return true; 
	}
	/*
	* 법인번호 검사
	*/
	function  idnumThird_Check(idnum){
		if(idnum.length == 0){
			return false;
		}
		
		//if (para.length!= 10 || !isNumber2(para))  return(false);		
		var  szChkDgt = new Array(1,2,1,2,1,2,1,2,1,2,1,2);
		var  szCoNo = idnum;
		// 법인번호 오류시 빠져나가는 방법
		//if ( szCoNo = "2150110001021")
		//    return true;
		var  lV1 = 0;
		var  nV2 = 0;
		var  nV3 = 0;
		nV2 = 0;
		for( var i = 0 ; i < 12 ; i++){
			lV1 = parseInt(szCoNo.substring(i,i+1)) * szChkDgt[i];
			if(lV1 >= 10){
				nV2 += lV1 % 10;
			}else{
				nV2 += lV1;
			}
		}
		nV3 = nV2 % 10;
		if( nV3 > 0 ){
			nV3 = 10 - nV3;
		}else{
			nV3 = 0;
		}
		if( szCoNo.substring(12,13) != nV3){
			return false;
		}
		return true;
	}
	
	 /**
	비밀번호 정책 강화로 인한 대/소문자/숫자/기호 조합체크
	 **/
	 function containsChars_N1(input) {
//		var chars="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$^%&*_-"; 2009.06.03 비밀번호 정책 변경 -> 영+숫자
		var chars="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		for (var inx = 0; inx < input.value.length; inx++) {
			if (chars.indexOf(input.value.charAt(inx)) == -1)
				return false;
		}
		return true;
	}
	 
	 	 
 function isAlphaNum(input) {
		var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		return containsChars(input,chars);
	}
 
 function checkPassword(uid, upw){
	 chk1 = /^[a-zA-Z0-9]{6,12}$/;
	 chk2 = /[a-zA-Z]/;
	 chk3 = /\d/;
	 chk4 = /(\w)\1\1\1/;
	 
	 if(!chk1.test(upw)){ 
		 alert('비밀번호는 숫자와 영문자 조합으로 6~12자리를 사용해야 합니다.'); 
		 return false;
	 }
	 
	 if(!chk2.test(upw)){ 
		 alert('비밀번호는 숫자와 영문자 조합으로 사용해야 합니다.'); 
		 return false;
	 }
	 
	 if(!chk3.test(upw)){ 
		 alert('비밀번호는 숫자와 영문자 조합으로 사용해야 합니다.'); 
		 return false;
	 }
	 
	 if(chk4.test(upw)){ 
		 alert('비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.'); 
		 return false;
	 }
	 
	if(upw.search(uid)>-1) {
		 alert('아이디가 포함된 비밀번호는 사용하실 수 없습니다.'); 
		 return false;
	}
	 
	return true;
 }
 
 
 function setCookie (name, value, expires) {
		document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
	}

function getCookie(Name) {
	var search = Name + "="
	if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
		offset = document.cookie.indexOf(search)
		if (offset != -1) { // 쿠키가 존재하면
			offset += search.length
			// set index of beginning of value
			end = document.cookie.indexOf(";", offset)
			// 쿠키 값의 마지막 위치 인덱스 번호 설정
			if (end == -1)
				end = document.cookie.length
			return unescape(document.cookie.substring(offset, end))
		}
	}
	return "";
}
		
		
/*
* 숫자만 입력가능 하도록 함
* 예) onkeypress="onOnlyNumber(this);" 
*/
function onOnlyNumber(obj)
{
	if (event.keyCode >= 48 && event.keyCode <= 57) {
	} else {
		event.returnValue = false;
	}
}		

/*
* 숫자만 입력가능 하도록 함(IE, FF 모두 사용가능)
* 예) onkeypress="onOnlyNumber(this, event);" 
*/
function onOnlyNumber(obj, e)
{
	var result = (window.event) ? event.keyCode : e.which;
	
	code = String.fromCharCode(result); 

    if ((result == null) || (result == 0) || (result == 8) || (result == 9) || (result == 13) || (result==27)) {
    	
	}else if((("0123456789").indexOf(code) > -1)){
		
	}else {
		if(window.event){
			event.returnValue = false;
		}else{
			e.preventDefault();
		}
	}
}	
	

/*
* 숫자와 '-'만 입력가능 하도록 함
* 예) onkeypress="onTelCheck(this);" 
*/
function onTelCheck(obj)
{
	if( !(((event.keyCode > 47) && (event.keyCode < 58)) || (event.keyCode == 45)) ) { 
		event.returnValue = false;
	}
}


/*
* 숫자와 '.'(점)만 입력가능 하도록 함
* 예) onkeypress="onNumberSpotCheck(this);" 
*/
function onNumberSpotCheck(obj)
{
	if( !(((event.keyCode > 47) && (event.keyCode < 58)) || (event.keyCode == 46)) ) { 
		event.returnValue = false;
	}
}


/**
*  글자수를 Byte로 가져오기
*  한글 : 2Byte, 영문/숫자 : 1Byte
*/
function GetTextByte(text){
	var length = 0;
	var ch;
	for (var i = 0; i < text.length; i++) {
		ch = escape(text.charAt(i));
		if ( ch.length == 1 ) {
			length++;
		}else if (ch.indexOf("%u") != -1) {
			length += 2;
		}else if (ch.indexOf("%") != -1) {
			length += ch.length/3;
		}
	}
	return length;
}


// type="radio" value 가져오기
function getRadioValue(inputName){	
	var ret_val;
	
	if(inputName){
		var in_len = inputName.length;//길이를 구한다.
		
		if(in_len == undefined){
			ret_val = inputName.value;
		}else{
			for(ri = 0 ; ri < in_len; ri++){
				if(inputName[ri].checked == true){
					ret_val = inputName[ri].value;		
				}
			}
		}
	}else{
	    ret_val = "";
	}
	
	return ret_val;	
}


  /**
  * 입력받은 숫자의 3자리마다 comma 추가(숫자 아닌 문자는 자동 제거)
  * ex) 1234567890 -> 1,234,567,890
  */
 function addCommas(nStr)
 {
 	nStr = stripNonNumeric( nStr );
 	
 	// 앞자리에 붙어있는 불필요한 0 제거
 	if(nStr.length > 1) {	// 길이가 1일 때는 0이라도 상관 없음
	  	for( var i = 0; i < nStr.length; i++ ){
	  		if( nStr.charAt(i) == '0') {
	  			nStr = nStr.substring(i+1, nStr.length);
	  		} else {
	  			break;
	  		}
	  	}
	  }
	  
 	nStr += '';
 	x = nStr.split('.');
 	x1 = x[0];
 	x2 = x.length > 1 ? '.' + x[1] : '';
 	var rgx = /(\d+)(\d{3})/;
 	while (rgx.test(x1)) {
 		x1 = x1.replace(rgx, '$1' + ',' + '$2');
 	}
 	return x1 + x2;
 }

 /**
 * 숫자 아닌 문자는 제거
 */ 
 function stripNonNumeric( str ){
	str += '';
 	var rgx = /^\d|-$/;
 	var out = '';
 	for( var i = 0; i < str.length; i++ ){
 		if( rgx.test( str.charAt(i) ) ){
 			if( !( ( str.charAt(i) == '.' && out.indexOf( '.' ) != -1 ) ||
 			( str.charAt(i) == '-' && out.length != 0 ) ) ){
 				out += str.charAt(i);
 			}
 		}
 	}
 	/*
 	str += '';
 	var out = str.replace(/[^0-9]/g, "");
 	alert(out);
 	*/
 	return out;
 }
 
 
// 옵션 지우기 ex) nullOptions(document.aaaForm.class1, false);
function nullOptions(obj, allGbn){
	var obj_len = obj.options.length;
	var i = 0;
	
	if(allGbn == true){
		// 모두지움
		obj.options.length = 0;
	}else{
		//최상위 하나만을 남겨놓구 지움
		for(i=0; i<obj_len; i++){
			obj.options[obj_len-i] = null;
		}
	}
}

//
// 옵션 복사 신규생성
//	selectbox-1(oldObj) 의 값을 selecbox-2(newObj) 옵션으로 복사하여 신규 생성 
// ex)	newOption(document.aaaForm.class1, document.aaaForm.class2)	
//
function newOption(newObj, oldObj){
	for(i=0; i<oldObj.options.length; i++){
		newObj.options[i] = new Option(oldObj.options[i].text, oldObj.options[i].value);
	}
}

function newOptionById(newObj, oldObj){
	for(i=0; i<oldObj.options.length; i++){
		var opt = document.createElement("option");
		opt.text = oldObj.options[i].text;
		opt.value = oldObj.options[i].value;
		newObj.insertAdjacentElement("beforeEnd",opt);
	}
}

//
// 옵션 추가 신규생성
//	현재 있는 셀렉트 박스의 값에 추가로 생성할경우
// ex)	newNextOption(document.aaaForm.class1, "text 값","value값")
  
//	반복문을 사용할수도 있다.
//	for(i=0; i<3; i++)
//	{
//		newNextOption(document.aaaForm.class1, i, i);
//	}
//
function newNextOption(newObj, str_text, str_value){
	var now_option_length = newObj.options.length;
	
	newObj.options[now_option_length] = new Option(str_text, str_value);
}


/**
 *  문자열에 있는 모든 공백 제거  
 */
function removeWhitespace(str){
	str = str.replace(/\s/g,''); // 공백(whitespace) 제거
	return str;
}

// 전화번호 국번 구분
function formTel(val){
 	var result="";
 	
 	if(val.substring(0,1)=="0"){
 		
 		if(val.substring(0,2)=="02"){
 			result = val.substring(0,2) + ")" + val.substring(2,30);
 		}else{
 			result = val.substring(0,3) + ")" + val.substring(3,30);
 		}
 		
 	}else{
 		result = val;
 	}
 	
 	return result;
 }


//시험 성적서 첨자 및 특수문자 입력 관련 - 이재진

//첨자입력 팝업
function fnExponentPopup(openerFormNm, openerInputNm, openerIndex, objLength){

	window.open("/svc/cmmn/fm/htmlEditExponentPopup.do?openerFormNm="+openerFormNm+"&openerInputNm="+openerInputNm+"&openerIndex="+openerIndex+
			"&objLength="+objLength,
			"htmlCodeInputPopup","width=400, height=140, scrollbars=no, resizable=yes, toolbar=no, status=no");
	
}

//특수문자 입력 팝업
function fnSpecialCharPopup(openerFormNm, openerInputNm, openerIndex, objLength){

	window.open("/svc/cmmn/fm/htmlEditSpecialCharPopup.do?openerFormNm="+openerFormNm+"&openerInputNm="+openerInputNm+"&openerIndex="+openerIndex+
			"&objLength="+objLength,
			"htmlCodeInputPopup","width=400, height=280, scrollbars=no, resizable=yes, toolbar=no, status=no");
}

//부모창의 inputbox에 데이터 넣어주기
function fnOpenerInputValue(formNm, inputNm, value, openerIndex, objLength){
	
	if(objLength == 1){
		eval("opener.document." + formNm + "." + inputNm).value += value;			
	}else{
		eval("opener.document." + formNm + "." + inputNm)[openerIndex].value += value;
	}
}

//데이터 인코딩
function fnEncodeResult(formNm, inputNm, openerIndex, objLength){
	
	var ecodeValue;
	if(objLength == 1){
		ecodeValue = eval("document." + formNm + "." + inputNm).value;
	}else{
		ecodeValue = eval("document." + formNm + "." + inputNm)[openerIndex].value;
	}
	ecodeValue = encodeURIComponent(ecodeValue, "UTF-8");
	return ecodeValue;
}

//입력값 세자리 콤마찍기
function isNumInput(input){
	input.value = addCommas(input.value);
}

// 풍선도움말용 전역변수
var bubbleNo = 0;	// 풍선도움말오 div를 순차적으로 생성하기 위한 변수
//var bubbleArray = new Array("동해물","남산위에", "가을 하늘","이 기상과"); 	// 풍선도움말에 넣을 문자열. html 가능함.

/*
 * 풍선도움말용 함수
 * 
 * 1. <header>태그에 var bubbleArray 변수를 선언하고 도움말을 정의하셔야 합니다. 
 * <head>
 * 	<script>
 * 	var bubbleArray = new Array();
 * 	bubbleArray['업체명'] = "업체명은 해당 기업의 업체명으로 사업자 등록증 상의 사업체명과 동일하여야 합니다.";
 * 	bubbleArray['대표자명'] = "대표자명은 실제 법인 등록시 대표자명으로 등록된 대표자의 이름으로 기입하십시오.";
 * 	</script>    
 * </head>
 * 
 * 2. 풍선도움말을 삽입하고 싶은 곳에 아래처럼 넣으세요. 반드시 script 태그로 둘러싸야 합니다.
 * ex) 업체명 입력 <script>fnPutBubble('업체명');</script>
 *  
 * 3. parameter
 * bubbleId : bubbleArray 배열의 해당 엘리먼트의 아이디
 */
function fnPutBubble(bubbleId) {
	tempBubbleNo = bubbleNo++;
	document.write("<div class=\"question_layer01\">");
	document.write("<a href=\"#\" onmouseover=\"document.getElementById('reply_box" + tempBubbleNo + "').style.display='block';\" onmouseout=\"document.getElementById('reply_box" + tempBubbleNo + "').style.display='none';\"><img src=\"/img/svc/btn/btn_question01.gif\" alt=\"?\"/></a>");
	document.write("<div class=\"reply_box\" id=\"reply_box" + tempBubbleNo + "\">");
	document.write("<span>" + bubbleArray[bubbleId] + "</span>");
	document.write("</div>");
	document.write("</div>");
}



/*  Function Equivalent to java.net.URLEncoder.encode(String, "UTF-8")
Copyright (C) 2002, Cresc Corp.
Version: 1.0
*/
function encodeURL(str){
var s0, i, s, u;
s0 = "";                // encoded str
for (i = 0; i < str.length; i++){   // scan the source
    s = str.charAt(i);
    u = str.charCodeAt(i);          // get unicode of the char
    if (s == " "){s0 += "+";}       // SP should be converted to "+"
    else {
        if ( u == 0x2a || u == 0x2d || u == 0x2e || u == 0x5f || ((u >= 0x30) && (u <= 0x39)) || ((u >= 0x41) && (u <= 0x5a)) || ((u >= 0x61) && (u <= 0x7a))){       // check for escape
            s0 = s0 + s;            // don't escape
        }
        else {                  // escape
            if ((u >= 0x0) && (u <= 0x7f)){     // single byte format
                s = "0"+u.toString(16);
                s0 += "%"+ s.substr(s.length-2);
            }
            else if (u > 0x1fffff){     // quaternary byte format (extended)
                s0 += "%" + (oxf0 + ((u & 0x1c0000) >> 18)).toString(16);
                s0 += "%" + (0x80 + ((u & 0x3f000) >> 12)).toString(16);
                s0 += "%" + (0x80 + ((u & 0xfc0) >> 6)).toString(16);
                s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
            }
            else if (u > 0x7ff){        // triple byte format
                s0 += "%" + (0xe0 + ((u & 0xf000) >> 12)).toString(16);
                s0 += "%" + (0x80 + ((u & 0xfc0) >> 6)).toString(16);
                s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
            }
            else {                      // double byte format
                s0 += "%" + (0xc0 + ((u & 0x7c0) >> 6)).toString(16);
                s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
            }
        }
    }
}
return s0;
}

/*  Function Equivalent to java.net.URLDecoder.decode(String, "UTF-8")
Copyright (C) 2002, Cresc Corp.
Version: 1.0
*/
function decodeURL(str){
var s0, i, j, s, ss, u, n, f;
s0 = "";                // decoded str
for (i = 0; i < str.length; i++){   // scan the source str
    s = str.charAt(i);
    if (s == "+"){s0 += " ";}       // "+" should be changed to SP
    else {
        if (s != "%"){s0 += s;}     // add an unescaped char
        else{               // escape sequence decoding
            u = 0;          // unicode of the character
            f = 1;          // escape flag, zero means end of this sequence
            while (true) {
                ss = "";        // local str to parse as int
                    for (j = 0; j < 2; j++ ) {  // get two maximum hex characters for parse
                        sss = str.charAt(++i);
                        if (((sss >= "0") && (sss <= "9")) || ((sss >= "a") && (sss <= "f"))  || ((sss >= "A") && (sss <= "F"))) {
                            ss += sss;      // if hex, add the hex character
                        } else {--i; break;}    // not a hex char., exit the loop
                    }
                n = parseInt(ss, 16);           // parse the hex str as byte
                if (n <= 0x7f){u = n; f = 1;}   // single byte format
                if ((n >= 0xc0) && (n <= 0xdf)){u = n & 0x1f; f = 2;}   // double byte format
                if ((n >= 0xe0) && (n <= 0xef)){u = n & 0x0f; f = 3;}   // triple byte format
                if ((n >= 0xf0) && (n <= 0xf7)){u = n & 0x07; f = 4;}   // quaternary byte format (extended)
                if ((n >= 0x80) && (n <= 0xbf)){u = (u << 6) + (n & 0x3f); --f;}         // not a first, shift and add 6 lower bits
                if (f <= 1){break;}         // end of the utf byte sequence
                if (str.charAt(i + 1) == "%"){ i++ ;}                   // test for the next shift byte
                else {break;}                   // abnormal, format error
            }
        s0 += String.fromCharCode(u);           // add the escaped character
        }
    }
}
return s0;
}


//object 별 display option
function displayObj(obj, displayOpt){
	obj.style.display = displayOpt;
}

// 스크립트 출력시 널값 변경
function setNullToInitialize(inputData){
	
	if(inputData==null){
		inputData = "";
	}
	return inputData;
}
function setNullToReplace(inputData,comma){
	
	if(inputData==null){
		inputData = "";
	}else{
		
		if(inputData.indexOf(comma) > -1){
			inputData = inputData.replace(comma,"");
			
		}
	}
	return inputData;
}

// 엔터이벤트 셋팅
function setEnterEvent(execFnc){ 
	
	if(event.keyCode == 13){		
		execFnc();		
	}
}

// 파일다운로드(사이버)
function cyFileDownLoad(fileFullPath, oriFileName){
	var frm = document.forms[0];
	var oldFrmAction = frm.action;
	var oldFrmMethod = frm.method;
	var oldFrmTarget = frm.target;
	var oldFrmenctype = frm.enctype;

	frm.method = "post";
	frm.enctype = "application/x-www-form-urlencoded;charset=euc-kr";
	frm.target = "_self";
	frm.action = "/download/downloadFile.do?requestedFile="+fileFullPath+"&atchmnflNm="+oriFileName;
	frm.submit();

	frm.action = oldFrmAction;
	frm.target = oldFrmTarget;
	frm.method = oldFrmMethod;
	frm.enctype = oldFrmenctype;
}

// 화면인쇄
function cyPrintContents(printAreaId, width, height){
	
	
	var printForm = document.createElement("FORM");
	var body = document.getElementsByTagName("BODY")[0];
	
	body.insertAdjacentElement("beforeEnd",printForm);
	
	var printContentHidden = document.createElement("INPUT");
	printContentHidden.type = "hidden";
	printContentHidden.name = "cyPrintContents";
	printContentHidden.value = document.getElementById(printAreaId).outerHTML;
	
	printForm.insertAdjacentElement("beforeEnd",printContentHidden);
	
	window.open('','cyPrintPop',"'left=0, top=0, width="+width+", height="+height+", scrollbars=yes, toolbar=no, menubar=no, status=no, resizable=no';");
	
	printForm.action = "/cy/comn/popup/printPopup.do";
	printForm.target = "cyPrintPop";
	printForm.method = "post";
	
	printForm.submit();
	
}

//고객번호 포맷팅
function cyFormatCusNo(orgCusNo){
	
	if(orgCusNo==null || orgCusNo==""){
		return "";
	}
	var regExp = /.*-.*/g;
	
	if(regExp.test(orgCusNo)){
		return orgCusNo;
	}
	
	if(orgCusNo.length != 9){
		return "";
	}
	
	try{
		return orgCusNo.substring(0,3) + "-" + orgCusNo.substring(3);
	}catch(e){return "";}
	
}

//수용가번호 포맷팅
function cyFormatSuyoNo(orgSuyoNo){
	
	
	if(orgSuyoNo==null || orgSuyoNo==""){
		return "";
	}
	
	var regExp = /.*-.*/g;
	
	if(regExp.test(orgSuyoNo)){
		return orgSuyoNo;
	}
	
	if(orgSuyoNo.length != 20){
		return "";
	}
	
	var formatedNo = "";
	try{
		formatedNo += (orgSuyoNo.substring(0,2) + "-");
		formatedNo += (orgSuyoNo.substring(2,7) + "-");
		formatedNo += (orgSuyoNo.substring(7,10) + "-");
		formatedNo += (orgSuyoNo.substring(10,13) + "-");
		formatedNo += (orgSuyoNo.substring(13,17) + "-");
		formatedNo += (orgSuyoNo.substring(17,19) + "-");
		formatedNo +=  orgSuyoNo.substring(19,20);
	}catch(e){return "";}
	
	return formatedNo;
}

//주민번호 포맷팅
function cyFormatJuminNo(orgJumin){
	
	
	if(orgJumin==null || orgJumin==""){
		return "";
	}
	
	var regExp = /.*-.*/g;
	
	if(regExp.test(orgJumin)){
		return orgJumin;
	}
	
	if(orgJumin.length != 13){
		return "";
	}
	
	var formatedNo = "";
	try{
		formatedNo += (orgJumin.substring(0,6) + "-");
		formatedNo +=  orgJumin.substring(6);
	}catch(e){return "";}
	
	return formatedNo;
}

//사업자등록번호 포맷팅
function cyFormatBizNo(orgBiz){
	
	if(orgBiz==null || orgBiz==""){
		return "";
	}
	
	var regExp = /.*-.*/g;
	
	if(regExp.test(orgBiz)){
		return orgBiz;
	}
	
	if(orgJumin.length != 10){
		return "";
	}
	
	var formatedNo = "";
	try{
		formatedNo += (orgBiz.substring(0,3) + "-");
		formatedNo += (orgBiz.substring(3,5) + "-");
		formatedNo +=  orgBiz.substring(5);
	}catch(e){return "";}
	
	return formatedNo;
}

//날짜 포맷팅(YYYY/MM/DD)
//2012.08.14 김수정 추가
function cyFormatDate(date){
	
	
	if(date==null || date==""){
		return "";
	}
	
	var regExp = /.*-.*/g;
	
	if(regExp.test(date)){
		return date;
	}
	
	var formatedNo = "";
	try{
		formatedNo += (date.substring(0,4) + DATE_GUBUN);
		formatedNo += (date.substring(4,6) + DATE_GUBUN);
		formatedNo +=  date.substring(6);
	}catch(e){return "";}
	
	return formatedNo;
}

//날짜 포맷팅(YYYY/MM/DD)
//2012.08.14 김수정 추가
function cyFormatDateTime(date){
	var TIME_GUBUN = ":";
	if(date==null || date==""){
		return "";
	}
	
	var regExp = /.*-.*/g;
	
	if(regExp.test(date)){
		return date;
	}
	
	var formatedNo = "";
	try{
		formatedNo += (date.substring(0,4) + DATE_GUBUN);
		formatedNo += (date.substring(4,6) + DATE_GUBUN);
		formatedNo +=  date.substring(6,8);
		formatedNo += " ";
		formatedNo += date.substring(8,10) + TIME_GUBUN;
		formatedNo += date.substring(10,12) + TIME_GUBUN;
		formatedNo += date.substring(12,14);
	}catch(e){return "";}
	
	return formatedNo;
}

// replaceAll
function removeSlash(val){
	val = val.replace(/\//gi,"");
	
	return val;
}
/*
function replaceAll(val, gubun){
	val = val.replace("/"+gubun+"/gi","");
	
	return val;
}
*/
function replaceAll(inputString, targetString, replacement)
{
 var v_ret = null;
 var v_regExp = new RegExp(targetString, "g");
 v_ret = inputString.replace(v_regExp, replacement);
 
 return v_ret;
}


function onNumberOnly(e) {
    if(window.event){   //IE
        e = window.event
        var lkeycode = e.keyCode; 
    }else{               //W3C
        var lkeycode = e.which; 
    } 

    if(  !(48 <= lkeycode && lkeycode <=57) 
       && lkeycode != 0             // 기타 key
       && lkeycode != 45          // -
       && lkeycode != 46 			// .
       && lkeycode != 8) {       	// backspace
        if( window.event ){
            e.keyCode = 0;
        }else{
            e.preventDefault();
        }
    } 
}


/* ********************************************************************************
 * 입력한 값을 날짜 형태로 형식을 변환하여 리턴한다.
 * ex)YYYY/MM/DD
 * @param  : this
 * @사용예 : style="IME-MODE:disabled"(한글 입력 하지 못하도록 하는 style) 
 *          onKeyDown="onDateYearMonthDayCheck(this);" onKeyPress="onDateYearMonthDayCheck(this);" onKeyUp="onDateYearMonthDayCheck(this);"
 * *******************************************************************************/
function onDateYearMonthDayCheck(this_s){
	var temp_value = this_s.value.toString();
	temp_value = temp_value.replace(/[^0-9]/g,'');
	temp_value = temp_value.substr(0,8);
	if(temp_value.length == 8){
		temp_value = temp_value.replace(/([0-9]{4})([0-9]{2})([0-9]{2})$/,"$1"+DATE_GUBUN+"$2"+DATE_GUBUN+"$3");
	}
	this_s.value = temp_value;
}  


/* ********************************************************************************
 * 공통코드 목록으로 selectbox를 생성한다.
 * ex)<option value="01">VAN</option><option value="02">제휴사</option>
 * @param  : target(option추가할 id), rtnList(공통코드 목록), code(선택할 코드값)
 * @사용예 : makeSelectboxByCode($("#srchServiceDiv"), rtnList, code);
 * *******************************************************************************/
function makeSelectboxByCode(target, rtnList, code){
	var shtml = "";
	if(rtnList.length>0){
		for(var i=0;i<rtnList.length;i++){
   			var rowObj = rtnList[i];
   			var iselected = "";
			
			if(rowObj.code == code){
				iselected = "selected='selected'";
			}else{
				iselected ="";
			}
			shtml +="<option "+iselected+" value='"+rowObj.code+"'>"+rowObj.name+"</option>";
   		}
		target.append(shtml);
	} 
}

/* ********************************************************************************
 * 공통코드 목록으로 selectbox를 생성한다.
 * ex)<option value="01">VAN</option><option value="02">제휴사</option>
 * @param  : target(option추가할 id), rtnList(공통코드 목록), code(선택할 코드값)
 * @사용예 : makeSelectboxByCode($("#srchServiceDiv"), rtnList, code);
 * *******************************************************************************/
function makeSelectboxByCodeAll(target, rtnList, code){
	if(code == ''){
		var shtml = "<option "+iselected+" value=''>전체</option>";
	} else {
		var shtml = "<option value=''>전체</option>";
	}
	if(rtnList.length>0){
		for(var i=0;i<rtnList.length;i++){
   			var rowObj = rtnList[i];
   			var iselected = "";
			
			if(rowObj.code == code){
				iselected = "selected='selected'";
			}else{
				iselected ="";
			}
			shtml +="<option "+iselected+" value='"+rowObj.code+"'>"+rowObj.name+"</option>";
   		}
		target.append(shtml);
	} 
}

//날짜와 날짜 사이의 일수를 리턴한다.
function fnGetBetweenDay( startDt, endDt )
{
	 var rtnValue = 0 ;

	   var yyyy = startDt.substring(0,4) +"" ;
	   var mm   = startDt.substring(4,6) +"" ;
	   var dd   = startDt.substring(6,8) +"" ;
	   var startDate = new Date(yyyy,(eval(mm)-1),dd) ; // 달 은 한달이 느리므로 1을 빼준다.

	   yyyy = endDt.substring(0,4) +"" ;
	   mm   = endDt.substring(4,6) +"" ;
	   dd   = endDt.substring(6,8) +"" ;
	   var endDate = new Date(yyyy,(eval(mm)-1),dd) ;

	   // 1000분의 1초 단위를 일 단위로 바꾸기
	   rtnValue = ((endDate-startDate)/60/60/24/1000) ;

     return rtnValue ;

}
/* 세자리마다   1000,000 lee*/
function setComma(value){
	  value+="";
	  if(value.charAt(value.length-1) == ".")return value;
	  var arr = value.split(".");
	  value = arr[0].split(",").join("");
	  var len = value.length;
	  var loop = Math.floor(len/3);
	  var result = value.substring(0,len%3);
	  var p;
	  for(var i=loop; i>0; i--){
	   p = len-(i*3);
	   if(len%3!=0 || i != loop)result += ",";
	   result += value.substr(p, 3);
	  }
	  if(arr[1])result += "."+arr[1];  
	  return result;
	 }




/*날짜계산 lee test*/
function timeSt(dt) {
	 var d = new Date(dt);
	 var yyyy = d.getFullYear();
	 var MM = d.getMonth()+1;
	 var dd = d.getDate();
	 var hh = d.getHours();
	 var mm = d.getMinutes();
	 var ss = d.getSeconds();
	 
	 //return (yyyy + '-' + addzero(MM) + '-' + addzero(dd) + ' ' + addzero(hh) + ':' + addzero(mm) + ':' + addzero(ss));
	 return (yyyy + '/' + addzero(MM) + '/' + addzero(dd));
	}
	 
	//10보다 작으면 앞에 0을 붙임
	 
	function addzero(n) {
	 return n < 10 ? "0" + n : n;
	}
	

/* ********************************************************
 * 천단위 콤마 처리
 ******************************************************** */   
 function fn_comma(Obj, e){
	var reg = /(^[+-]?\d+)(\d{3})/; // 천단위 , 찍는 정규식
 	if(Obj != null && Obj.value != "" && Obj.value.length > 1){
 		if(Obj.value.indexOf("0") == 0){
 			
 			var tempValue = Obj.value;
 			var temp = 0;
 			for(var i=0; i<tempValue.length; i++){
 				if(tempValue.charAt(i) != '0'){
 					temp = i;
 					break;
 				}
 			}
 			if(temp == 0){
 				temp = tempValue.length;
 			}
 			Obj.value = tempValue.substr(temp, tempValue.length);
 			if(Obj.value == null || Obj.value == ""){
 				Obj.value = 0;
 			}
 			
 		}		
 	}
 	
 	if(Obj.value.indexOf(",") != -1){
 		Obj.value = Obj.value.replace(/,/gi,"");
 	}
 	
 	Obj.value += ''; // 숫자를 문자열로 변환
 	
    while (reg.test(Obj.value)) {
    	Obj.value = Obj.value.replace(reg, '$1' + ',' + '$2');
    }
    gfn_amtMaxLength(Obj, 15); 
     
 }
 
 
 /* ********************************************************************************
  * 확장자 체크
  * @param  : 파일확장자구분(첨부파일)
  * @param  : 파일테이블ID()
  * @desc :
  * @사용예 :  if( !attachKindCheck('fileTable') ) {
  *				alert("첨부파일의 업로드 가능한 확장자가 아닙니다. 다시 등록하시기 바랍니다. \n\n※업로드 가능한 확장자(zip, hwp, doc, xls, xlsx, pdf, pptx)");
  *				return;
  *			 }
  * *******************************************************************************/
 function attachKindCheck(tTableId){
 	var refuseFile = ["ZIP","HWP","DOC","DOCX","XLS","XLSX","PDF","PPTX","JPG","BMP","TIF","GIF"];
 	var tTable = document.getElementById(tTableId);
 	var oTrInfo = tTable.getElementsByTagName("tr");
 	for(var i=0; i< oTrInfo.length; i++) {
 		var objInput = oTrInfo[i].getElementsByTagName("INPUT");
 		for(var v=0; v<objInput.length ; v++){ 
 			if( objInput[v].type == 'file' ) {
 				var str = objInput[v].value;
 				if( str !=null && str.length>0) {

 					var splitLength = (str.split(".")).length;		
 					str = str.split(".")[splitLength-1];

 					isAlert=0;
 					for(k=0; k<refuseFile.length; k++){
 						if(str.toUpperCase() == refuseFile[k]){
 							isAlert=isAlert+1;
 						} 
 					}
 					if (isAlert==0){
 					  	return false;
 					}
 				}
 			}
 		}
 	}

 	return true;
 }
 
 /* ********************************************************************************
  * 확장자 체크
  * @param  : 파일확장자구분(이미지)
  * @param  : 파일테이블ID()
  * @desc :
  * @사용예 :  if( !attachKindCheck('fileTable') ) {
  *				alert("첨부파일의 업로드 가능한 확장자가 아닙니다. 다시 등록하시기 바랍니다. \n\n※업로드 가능한 확장자(zip, hwp, doc, xls, xlsx, pdf, pptx)");
  *				return;
  *			 }
  * *******************************************************************************/
 function imageKindCheck(imgPath){
 	var refuseFile = ["JPG","BMP","TIF","GIF","PNG"];
 	var str = "";
	var splitLength = (imgPath.split(".")).length;		
	str = imgPath.split(".")[splitLength-1];

	isAlert=0;
	for(var k=0; k<refuseFile.length; k++){
		if(str.toUpperCase() == refuseFile[k]){
			isAlert=isAlert+1;
		} 
	}
	if (isAlert==0){
	  	return false;
	}

 	return true;
 }

 
 function inputCheckSpecial(obj){
	  //var strobj = document.all.special; //입력값을 담을변수.
	  re = "/\\,.?{}<>';:|[~`!@\#$%^&*\()\-=+_']/gi";
	  //if(re.test($("#"+obj).val())){
	 if(re.indexOf($("#"+obj).val()) > -1){
	    //alert("특수문자는 입력하실수 없습니다.");
	    //obj.value=obj.value.replace(re,"");
		  $("#"+obj).val("");//.replace(re,""));
	  }
	}
 isDateFormatKorEng = function(d) {
 	var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
 	var eng_check = /^[A-za-z]/g;
 	
 	if(kor_check.test(d)){
 		return kor_check.test(d);
 	}
		if(eng_check.test(d)){
			return eng_check.test(d);
 	}		
 }
 goComma = function(data) {
     //var tmps = data.replace(/[^0-9]/g, '');
     //var tmps2 = tmps.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
	 data = String(data);
	 return data.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');

     return data;
     
 };
 goDatePattern = function(date,pattern) {
 	if(!isDateFormatKorEng(date)){
 		return date;
 	}
 	if(pattern == "" || typeof(pattern) == "undefined" || pattern == null){
 		pattern = "yy-mm";
 	}
		var year;
		var month; // 1월=0,12월=11
		var dd;
		var newDate;
		var rVal;
		if(date.length == 6){
			year  = date.substr(0,4);
			month = date.substr(4,2) - 1; // 1월=0,12월=11
			newDate = new Date(year,month);
		}else if(date.length == 8){
			year  = date.substr(0,4);
			month = date.substr(4,2) - 1; // 1월=0,12월=11 20100506
			dd = date.substr(6,2);
			newDate = new Date(year,month,dd);
		}		
		/*newDate.setDate( newDate.getDate() + 1 );
		alert(newDate.getFullYear());*/
		rVal = $.datepicker.formatDate(pattern, newDate);
 	return rVal; 
 };
 function initCal(obj){	 
	$('#'+obj).datepicker({    	
		changeMonth:true,
		changeYear:true,
		showWeek: true,
		firstDay: 0,
		//starts: 1,
		dateFormat: 'yy-mm-dd',
		//minDate : '-1y'
		yearRange: '2014:"'+cmmToYear+'"',
		//showAnim: "slide", //애니메이션을 적용한다.
		showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], // 요일의 한글 형식.
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		weekHeader: '주',  		
		onSelect: function(dateText, inst) {  		     
	        //goDateWeekSetting($(this).attr('id'),dateText);
			if(obj == 'startDate'){
				startDate(dateText,inst);
			}else if(obj == 'endDate'){
				endDate(dateText,inst);
			}				
	    }
	});
	$.datepicker.setDefaults($.datepicker.regional['ko']);
 }
 function startDate(){
		//alert(1);
		//goDateWeekSetting($(this).attr('id'),dateText);
}
function endDate(){
	//alert(2); 
}	
 function dateClick(obj){    	
  	var attr = obj.id;
 	if(attr == "startDate" || attr == "startDateImg"){
 		if(attr == "startDateImg"){
 			$("#startDate").datepicker('show');    			
 		}				    		
 		$("#startDateImg").attr("src",cmmSrcDateOnImg);    		
 	}else if(attr == "endDate" || attr == "endDateImg"){
 		if(attr == "endDateImg"){
 			$("#endDate").datepicker('show');
 		}
 		//$("#endDateImg").attr("style","background-image :url('"+cmmSrcDateOnImg+"')");
 		$("#endDateImg").attr("src",cmmSrcDateOnImg);
 	}
 } 
 function dateBlur(obj){
 	var attr = obj.id;    	
 	if(attr.indexOf("startDate") > -1){    		
 		//$("#startDateImg").attr("style","background-image :url('"+cmmSrcDateOffImg+"')");
 		$("#startDateImg").attr("src",cmmSrcDateOffImg);
 	}else{
 		//$("#endDateImg").attr("style","background-image :url('"+cmmSrcDateOffImg+"')");
 		$("#endDateImg").attr("src",cmmSrcDateOffImg);
 	}
 }
 function getCalendarWeek(date){
   	 
 	var dateArr = date.split("-");
 	var v_yyyy = dateArr[0];
 	var v_mm = dateArr[1];
 	var v_dd = dateArr[2];
 	var wk = "";
 	 $.ajax({
 		url : root+'cmm/calendar/util/getWeek.json',
 		async : false,
 		data : {					
 			yyyy : v_yyyy,
 			mm : v_mm,
 			dd : v_dd
 		},
 		success	: function(data)  {
 			wk = data.result;
 			//alert("data:"+wk);
 		}
 	});
 	return wk;
  }
function goDefaultImage(obj){
 	$(obj).attr("src",cmmSrcDefaultimage);
}
function fontLimitCut(v){
	var prfNm = setNullToInitialize(v);
	if(prfNm.length > 20){							
		prfNm = prfNm.substr(1,20) + "...";
	}
}

/* ********************************************************************************
 * 확장자 체크
 * @param  : 파일확장자구분(첨부파일)
 * @param  : 파일테이블ID()
 * @desc :
 * @사용예 :  if( !attachKindCheck('fileTable') ) {
 *				alert("첨부파일의 업로드 가능한 확장자가 아닙니다. 다시 등록하시기 바랍니다. \n\n※업로드 가능한 확장자(zip, hwp, doc, xls, xlsx, pdf, pptx)");
 *				return;
 *			 }
 * *******************************************************************************/
function attachKindCheck(tTableId){
	var refuseFile = ["ZIP","HWP","DOC","DOCX","XLS","XLSX","PDF","PPTX","JPG","BMP","TIF","GIF"];
	var tTable = document.getElementById(tTableId);
	var oTrInfo = tTable.getElementsByTagName("tr");
	for(var i=0; i< oTrInfo.length; i++) {
		var objInput = oTrInfo[i].getElementsByTagName("INPUT");
		for(var v=0; v<objInput.length ; v++){ 
			if( objInput[v].type == 'file' ) {
				var str = objInput[v].value;
				if( str !=null && str.length>0) {

					var splitLength = (str.split(".")).length;		
					str = str.split(".")[splitLength-1];

					isAlert=0;
					for(k=0; k<refuseFile.length; k++){
						if(str.toUpperCase() == refuseFile[k]){
							isAlert=isAlert+1;
						} 
					}
					if (isAlert==0){
					  	return false;
					}
				}
			}
		}
	}

	return true;
}

/* ********************************************************************************
 * 확장자 체크
 * @param  : 파일확장자구분(이미지)
 * @param  : 파일테이블ID()
 * @desc :
 * @사용예 :  if( !attachKindCheck('fileTable') ) {
 *				alert("첨부파일의 업로드 가능한 확장자가 아닙니다. 다시 등록하시기 바랍니다. \n\n※업로드 가능한 확장자(zip, hwp, doc, xls, xlsx, pdf, pptx)");
 *				return;
 *			 }
 * *******************************************************************************/
function imageKindCheck(imgPath){
	var refuseFile = ["JPG","BMP","TIF","GIF","PNG"];
	var str = "";
	var splitLength = (imgPath.split(".")).length;		
	str = imgPath.split(".")[splitLength-1];
	 

	isAlert=0;
	for(var k=0; k<refuseFile.length; k++){
		if(str.toUpperCase() == refuseFile[k]){
			isAlert=isAlert+1;
		} 
	}
	if (isAlert==0){
	  	return false;
	}

	return true;
}
function fileUpload(){
	document.getElementById("upload").click();
}

/*document.write('<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"><\/script>');*/

function fileChange(){
	
	
	if(document.getElementById("upload").value.length == 0){
		document.getElementById("uploadText").value = "";
		//document.getElementById("upload").select();
		//document.selection.clear();
		document.getElementsByName("upload")[0].form.reset();
		return;
	}
	/*if( !imageKindCheck(document.getElementById("upload").value) ){ 
		alert("첨부파일의 업로드 가능한 확장자가 아닙니다. 다시 등록하시기 바랍니다. \n\n※업로드 가능한 확장자(jpg, bmp, tif, gif, png)");
		document.getElementById("uploadText").value = "";
		//document.getElementById("upload").select();
		//document.selection.clear();
		document.getElementsByName("upload")[0].form.reset(); 
	}*/
	else{
		var filePath = document.getElementById("upload").value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileKind = fileName.split(".")[1];
		$("#uploadText").val(fileName);
		
	/*	var maxSize = (1024*1024)*5;
		var fileSize = document.getElementById("upload").files[0].size;
		
		if(fileSize > maxSize){
			alert("5MB이내의 파일만 첨부 가능 합니다.");
			document.getElementById("uploadText").value = "";
			//document.getElementById("upload").select();
			//document.selection.clear();
			document.getElementsByName("upload")[0].form.reset();
			return;
		}
		
		var filePath = document.getElementById("upload").value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileKind = fileName.split(".")[1];
		$("#uploadText").val(fileName);
		//document.getElementById("uploadText").value = fileName;
*/	}
}
function f_chk_byte(value,ari_max) {
	
	if(value == "" || value.length == 0){
		
		return "";
	}
	 
	var ls_str= value;
	var li_str_len = ls_str.length;
	var li_max= ari_max;
	var i= 0;
	var li_byte= 0;
	var li_len= 0;
	var ls_one_char = "";
	var ls_str2= "";
	for(i=0; i< li_str_len; i++) {
		ls_one_char = ls_str.charAt(i);
		if (escape(ls_one_char).length > 4) 
			li_byte += 2;
	 	else 
	 		li_byte++;
	 	if (li_byte <= li_max) li_len = i + 1;
	}
	if(li_byte > li_max) {	 		
 		ls_str2 = ls_str.substr(0, li_len);
 		ls_str2 = ls_str2 + "...";
 		
 	}else{
 		ls_str2 = value;
 	}
	return ls_str2;
}
function onOnlyNumber2(){
	if (event.keyCode >= 48 && event.keyCode <= 57) {
	} else {
		//event.returnValue = false;
		event.preventDefault(); 
	}
}
	// 영문과 숫자만 허용
function SetAlphaNum(obj){
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
		|| event.keyCode == 46) return;
	obj.value = obj.value.replace(/[\ ㄱ-ㅎ ㅏ-ㅣ가-힣]/g,'');
		
			//var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i; 
}
function isStartEndDate(srtDt, endDt, str){
    var arySrtDt = srtDt.split("-"); // ex) 시작일자(2007-10-09)
    var aryEndDt = endDt.split("-"); // ex) 종료일자(2007-12-05)

    if(str !=undefined && str != null && str.length > 0)
    	str = str +" 부분의 ";
    else
    	str = "";
 
    if( arySrtDt.length != 3 || aryEndDt.length != 3){ 
        alert(str + "날짜 형식이 잘못되었습니다."); return false;
    }
 
    var startDt = new Date(Number(arySrtDt[0]),Number(arySrtDt[1])-1,Number(arySrtDt[2]));
    var endDt	= new Date(Number(aryEndDt[0]),Number(aryEndDt[1])-1,Number(aryEndDt[2]));
    resultDt	= Math.floor(endDt.valueOf()/(24*60*60*1000)- startDt.valueOf()/(24*60*60*1000));
 
    if(resultDt < 0 ){ alert(str + "시작날짜가 더 큽니다."); return false; }
 
    return true;
}
function rStar ( str ) {
	str = str + "";
	var len = str.length;
	var ch = "";
	
	/*for(var i = (len - 1); (str.charAt(i) == ' '); i--);
	str = str.substring(0, i + 1);*/
	if(str != ""){
		if(len == 2){
			ch = str.substring(0,1);
			str = str.replace(ch, "*");
		}else if(len == 3){
			ch += str.charAt(0);
			ch += "*";
			ch += str.charAt(2);
			str = ch;
		} else if(len > 3){
			//alert(str);
			for(var i = 0 ; i < len; i ++){
				if(i == 0 || i == len-1){
					ch += str.charAt(i);
				}else{
					ch += "*";
					//alert(str.charAt(i));
					
				}				
			}
			str = ch;
		} 
	}
	return str;
}

/*ie버전 날짜체크*/
function parseDate(strDate) {
	var _strDate = strDate;
	var _dateObj = new Date(_strDate);
	if (_dateObj.toString() == 'Invalid Date') {
		_strDate = _strDate.split('.').join('-');
		_dateObj = new Date(_strDate);
	}
	if (_dateObj.toString() == 'Invalid Date') {
		var _parts = _strDate.split(' ');

		var _dateParts = _parts[0];
		_dateObj = new Date(_dateParts);

		if (_parts.length > 1) {
			var _timeParts = _parts[1].split(':');
			_dateObj.setHours(_timeParts[0]);
			_dateObj.setMinutes(_timeParts[1]);
			if (_timeParts.length > 2) {
				_dateObj.setSeconds(_timeParts[2]);
			}
		}
	}

	return _dateObj;
}
 