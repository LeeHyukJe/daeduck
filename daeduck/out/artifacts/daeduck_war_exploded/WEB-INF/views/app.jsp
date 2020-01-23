<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
	<title>전자결재 페이지</title>
	<meta charset="UTF-8" />
</head>
	<body>
		<c:forEach var="entry" items="${app }">
			<div>FORM_NAME: ${entry.FORM_NAME }</div>
			<!--div>BODY_CONTEXT: ${entry.BODY_CONTEXT }</div-->
			<div>SUBJECT: ${entry.SUBJECT }</div>
			<div>authority${entry.authority }</div>
			<hr>
		</c:forEach>
	</body>
</html>