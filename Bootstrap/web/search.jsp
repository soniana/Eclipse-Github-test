<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style></style>
<script>
function searchGo(f){
	f.method='post';
	f.action='search.show?db=nonno';
	f.submit();  
}
</script>
</head>
<body>
<form>
<table>
<tr>
<td>
검색
</td>
<td>
<input type="text" id="word" name="word"> 
<input type="hidden" id="id" name="memid" value="${loginmem.memid}"> 
</td>
<td>
<input type="button" value="검색" onclick="searchGo(this.form);">
</td>
</table>
</form>

</body>
</html>