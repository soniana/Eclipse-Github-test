<%@page import="java.util.ArrayList"%>
<%@page import="com.keyword.KeywordBiz"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style></style>
<script></script>
</head>
<body>
<table border="1">
<tr><th>순위</th>
<th>검색어</th>
<th>검색 횟수</th>
</tr>
<c:forEach var="list" items="${list}">
<tr>
<td>

</td>
<td>
 ${list.search}
 </td>
 <td>
 ${list.rank}
 </td>
</c:forEach>
</table>
</body>
</html>