<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>

<div class="sidenav">
	<div>카테고리</div>
	<hr>

	<div>
		<a href="#" onClick="javascript:doSearch('ALL')">통합검색 ${totalCount>999?'999+':totalCount }</a>
	</div>

	<div id="app">
		<a href="#" onClick="javascript:doCollection('app')">전자결재 ${APPcount>999?'999+':APPcount}</a>
	</div>

	<ul id="appcategory" style="display:none;">

	</ul>

	<div>
		<a href="#" onclick="javascript:doCollection('bbs')">통합게시판 ${BBScount>999?'999+':BBScount}</a>
	</div>

	<ul id="bbscategory" style="display:none;">
		
	</ul>

	<div>
		<a href="#" onClick="javascript:doCollection('standard')">표준문서 ${STANDARDcount>999?'999+':STANDARDcount}</a>
	</div>

	<ul id="standardcategory" style="display:none;">
		
	</ul>
	
	<div>
		<a href="#" onClick="javascript:doCollection('technology')">기술문서 ${TECHNOLOGYcount>999?'999+':TECHNOLOGYcount}</a>
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
			<li><a href='#' onClick='javascript:doQualitySearch("0","mrb")'>DRM/MRB(PKG/MLB) ${MRBcount}</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("1","ppap")'>PPAP승인(PKG/MLB) ${PPAPcount}</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("2","ecn")'>ECM 계획서(PKG/MBL) ${ECNcount}</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("3","change")'>시정조치요구(PKG/MBL) ${CHANGEcount}</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("4","ocap")'>OCAP(PKG/MBL) ${OCAPcount}</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("5","analysis")'>분석요구서(PKG/MBL) ${ANALYSIScount}</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("6","library1")'>FT/IR 라이브러리-1 ${LIBRARY1count}</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("7","library2")'>FT/IR 라이브러리-2 ${LIBRARY2count}</a></li>
			<li><a href='#' onClick='javascript:doQualitySearch("8","raw")'>원자재승인 ${RAWcount}</a></li>
		</ul>
	</div>









</div>