<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
	<title>통합검색 페이지</title>
	<meta charset="UTF-8" />
</head>
	<body>
	<div>통합 검색 결과 수: ${totalCount}</div>
	<div>전자결재 검색 결과 --> ${Appcount }</div>
		<c:forEach var="entry" items="${total.APP }">
			<div><a href="https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }">FORM_NAME: ${entry.FORM_NAME }</a></div>
			<!--div>BODY_CONTEXT: ${entry.BODY_CONTEXT }</div-->
			<div>SUBJECT: ${entry.SUBJECT }</div>
			<div>authority${entry.authority }</div>
			<hr>
		</c:forEach>
		<hr>
		<hr>
	<div>게시판 검색 결과 --> ${Bbscount }</div>
		<c:forEach var="entry" items="${total.BBS }">
			
			<div>Subject: ${entry.Subject }</div>
			<div>BodyText: ${entry.BodyText }</div>
			<div>CreatorName: ${entry.CreatorName }</div>
			<hr>
		</c:forEach>
	</body>
	<hr>
	<hr>
	<div>표준문서 검색 결과 --> </div>
		<c:forEach var="entry" items="${total.STANDARD }">
			
			<div>Subject: ${entry.Subject }</div>
			<div>BodyText: ${entry.BodyText }</div>
			<div>CreatorName: ${entry.CreatorName }</div>
			<hr>
		</c:forEach>
	</body>
</html>