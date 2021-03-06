<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
	<title>전자결재 페이지</title>
	<meta charset="UTF-8" />
		<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="/resources/js/category.js"></script>
<script src="/resources/js/popular.js"></script>
<script src="/resources/js/search.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/sidebar_menu.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/searchbox.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/popular.css" />
</head>
	<body>
	<%@ include file="./sidenav/sidenav.jsp" %>
	<%@ include file="./searchbox/searchbox.jsp" %>
	
	<div class="main">
		<c:forEach var="entry" items="${app }">
			<div>BODY: ${entry.BODY }</div>
			<div>SUBJECT: ${entry.SUBJECT }</div>
			<div>authority${entry.authority }</div>
			<div>TYPE: ${entry.TYPE }</div>
			<div>DATE : ${entry.DATE  }</div>
			<hr>
		</c:forEach>
		<div>검색 건수: ${count}/${totalCount }</div>
		${paging}
	</div>
	
	</body>
</html>