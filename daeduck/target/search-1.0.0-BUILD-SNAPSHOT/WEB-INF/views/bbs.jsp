<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
	<title>게시판 페이지</title>
	<meta charset="UTF-8" />
</head>
	<body>
		<c:forEach var="entry" items="${bbs }">
			<div>Subject: ${entry.Subject }</div>
			<div>BodyText: ${entry.BodyText }</div>
			<div>CreatorName: ${entry.CreatorName }</div>
			<hr>
		</c:forEach>
		<div>검색 건수: ${count}/${totalCount }</div>
	</body>
</html>