<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>

<html>
<head>
<title>통합검색 페이지</title>
<meta charset="UTF-8" />
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/beta.fix.js"></script>
<script src="/resources/js/category.js"></script>
<script src="/resources/js/popular.js"></script>
<script src="/resources/js/search.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.js"></script>


<link rel="stylesheet" type="text/css" href="/resources/css/sidebar_menu.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/searchbox.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/popular.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/mykeyword.css" />   
</head>
<body>

	<!-- 카테고리 그룹 -->
	<!-- 
	<div ><a id="category" href="javascript:getCategory()">${category }</a></div>
	-->

	<%@ include file="./searchbox/searchbox.jsp"%>



	
	<%@ include file="./sidenav/sidenav.jsp"%>
	

	<div class="popular" id="pop"></div>

	<ul class="mykeyword" id="mykeyword">
	</ul>

	<div class="main">
		<div>통합 검색 결과 수: ${totalCount}</div>
		<div>전자결재 검색 결과 --> ${Appcount }</div>
		<c:forEach var="entry" items="${total.APP }">
			<div>
				<a href="#" 
				onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">FORM_NAME:
					${entry.FORM_NAME }</a>
			</div>
			<div>BODY: ${entry.BODY }</div>
			<div>SUBJECT: ${entry.SUBJECT }</div>
			<div>AUTHORITY${entry.AUTHORITY }</div>
			<div>TYPE: ${entry.TYPE }</div>
			<div>DATE : ${entry.DATE  }</div>
			<hr>
		</c:forEach>
		<hr>
		<hr>
		<div>게시판 검색 결과 --> ${Bbscount }</div>
		<c:forEach var="entry" items="${total.BBS }">
			<div>
				SUBJECT:<a href='https://gw.portal.daeduck.com/WebSite/Basic/Board/BoardView.aspx?system=Board&BoardType=Normal&fdid=${entry.FD_ID}&MsgId=${entry.DOCID}&BoardGubun=Normal' target=" _blank"> ${entry.SUBJECT }</a>
			</div>
			<div>BODY: ${entry.BODY }</div>
			<div>CreatorName: ${entry.CreatorName }</div>
			<div>FolderPath: ${entry.FolderPath }</div>
			<div>DATE : ${entry.DATE  }</div>
			<hr>
		</c:forEach>
		<hr>
		<hr>
		<div>표준문서 검색 결과 --> ${standardcount }</div>
		<c:forEach var="entry" items="${total.STANDARD }">

			<div>Subject: <a href="#" 
			onClick="javascript:popupOpen('https://gw.portal.daeduck.com/WebSite/Basic/Board/BoardView.aspx?system=Board.ISO&BoardType=Normal&fdid=${entry.FD_ID}&MsgId=${entry.DOCID}&BoardGubun=ISO','표준문서', 'width=950','')">${entry.SUBJECT }</a></div>
			<div>Body: ${entry.BODY }</div>
			<div>CreatorName: ${entry.CreatorName }</div>
			<div>FolderPath: ${entry.FolderPath }</div>
			<div>DATE : ${entry.DATE  }</div>
			<hr>
		</c:forEach>

		<hr>
		<hr>
		<div>품질관리 검색 결과</div>
		<div>ECN</div>
		<c:forEach var="entry" items="${totalQuality.ECN }">

			<div>DOCID: ${entry.DOCID }</div>
			<div>FACTORY_ID : ${entry.FACTORY_ID  }</div>
			<div>OWN_OUTSOURCED : ${entry.OWN_OUTSOURCED  }</div>   
			<div>ROUTE_CODE : ${entry.ROUTE_CODE  }</div>
			<div>DATE : ${entry.DATE  }</div>
			<div>DATE : ${entry.DATE  }</div>
			<hr>
		</c:forEach>
		<div>MRB</div>
		<c:forEach var="entry" items="${totalQuality.MRB }">

			<div>DOCID: ${entry.DOCID }</div>
			<div>FACTORY_ID : ${entry.FACTORY_ID  }</div>
			<div>SUBJECT : ${entry.SUBJECT  }</div>
			<div>DOC_TYPE : ${entry.DOC_TYPE  }</div>
			<div>DATE : ${entry.DATE  }</div>
			<hr>
		</c:forEach>
		<div>PPAP</div>
		<c:forEach var="entry" items="${totalQuality.PPAP }">

			<div>DOCID: ${entry.DOCID }</div>
			<div>BIZ_PLACE : ${entry.BIZ_PLACE  }</div>
			<div>PPAP_NO : ${entry.PPAP_NO  }</div>
			<div>SUBJECT : ${entry.SUBJECT  }</div>
			<div>DATE : ${entry.DATE  }</div>
			<hr>
		</c:forEach>
	</div>
</body>

<script>
	getMyKeyword('${value.query}','${totalCount}');
</script>

</html>