<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>

<div class="sidenav">
	<div>카테고리</div>
	<hr>

	<div>
		<a href="#" onClick="javascript:doSearch('ALL')">통합검색</a>
	</div>
	<div id="app">
		<a href="#" onClick="javascript:doSearch('app')">전자결재</a>
	</div>
	<div>
		<a href="#" onclick="javascript:doSearch('bbs')">통합게시판</a>
	</div>

	<ul id="bbscategory" style="display:none;">
		
	</ul>

	<!--
	<c:if test="${! empty cateBbsName }">
		<ul id="depth1" style="display:none;">
			<li>${ cateBbsName.dep1[0].cateName}
				<ul>
					<c:forEach var="list" items="${cateBbsName.dep2}"
						varStatus="status">
						<c:if test="${ !empty  list.cateName1}">
							<li>${list.cateName1}
						</c:if>

					</c:forEach>
				</ul>
			<li>${ cateBbsName.dep1[1].cateName}
				<ul>
					<c:forEach var="list" items="${cateBbsName.dep2}"
						varStatus="status">
						<c:if test="${ !empty  list.cateName2}">
							<li>${list.cateName2}
						</c:if>

					</c:forEach>

				</ul>
		</ul>
	</c:if>
	-->

	
	<div>
		<a href="#" onClick="javascript:doSearch('standard')">표준문서</a>
	</div>

	<ul id="standardcategory" style="display:none;">
		
	</ul>
	<!--
	<c:if test="${! empty cateStandardName }">
		<ul id="depth1" style="display:none;">
			<li>${ cateStandardName.dep1[0].cateName}
				<ul class="depth2">
					<c:forEach var="list" items="${cateStandardName.dep2}"
						varStatus="status">
						<c:if test="${ !empty  list.cateName1}">
							<li style="padding-left: 10px;" onClick="javascript:cateQuery('${cateStandardName.dep1[0].cateName }','${list.cateName1}','standard')">${list.cateName1 }
						</c:if>
					</c:forEach>
				</ul>
				<hr>
			<li>${ cateStandardName.dep1[1].cateName}
				<ul>
					<c:forEach var="list" items="${cateStandardName.dep2}"
						varStatus="status">
						<c:if test="${ !empty  list.cateName2}">
							<li>${list.cateName2}
						</c:if>

					</c:forEach>
				</ul>
		</ul>
	</c:if>
	-->
	<div>
		<a href="#" onClick="javascript:doSearch('technology')">기술문서</a>
	</div>
	<div>
		<a href="#" onclick="javascript:getCollectionQuality()">품질관리</a>
		<c:choose>
			<c:when test="${! empty colflag}">
				<ul id="quality" style="display:block;">
			</c:when>

			<c:otherwise>
                <ul id="quality" style="display:none;">
            </c:otherwise>
		</c:choose>		
			<li><a href='#' onClick='javascript:doQualitySearch("0","mrb")'>DRM/MRB(PKG/MLB)</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("1","ppap")'>PPAP승인(PKG/MLB)</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("2","ecn")'>ECM 계획서(PKG/MBL)</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("3","change")'>시정조치요구(PKG/MBL)</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("4","ocap")'>OCAP(PKG/MBL)</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("5","analysis")'>분석요구서(PKG/MBL)</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("6","")'>검사표준서</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("7","")'>DRB/MRB</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("8","library1")'>FT/IR 라이브러리-1</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("9","library2")'>FT/IR 라이브러리-2</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("10","raw")'>원자재승인</a></li>
		</ul>
	</div>









</div>