<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>


<ul class="depth1">
	<li class="all">
		<a href="#" onClick="javascript:doSearch('ALL')">통합검색 <span>${totalCount>999?'999+':totalCount }</span></a>
	</li>

	<!-- 전자결재 -->
	<li id="app">
		<a href="#" class="on" onClick="javascript:doCollection('app')">전자결재
			<span>${APPcount>999?'999+':APPcount}</span></a>
		<ul id="appcategory" class="depth2 close" style="display:none;">

		</ul>
	</li>

	<!-- 통합게시판 -->
	<li>
		<a href="#" class="on" onclick="javascript:doCollection('bbs')">통합게시판 ${BBScount>999?'999+':BBScount}</a>
		<ul id="bbscategory" class="depth2" style="display:none;">
		</ul>
	</li>


	<!-- 표준문서 -->
	<li>
		<a href="#" onClick="javascript:doCollection('standard')">표준문서 ${STANDARDcount>999?'999+':STANDARDcount}</a>
		<ul id="standardcategory" class="depth2 close">
		</ul>
	</li>

	<!-- 기술문서 -->
	<li>
		<a href="#" onClick="javascript:doCollection('technology')">기술문서
			${TECHNOLOGYcount>999?'999+':TECHNOLOGYcount}</a>
		<ul id="technologycategory" class="depth2 close" style="display:none;">

		</ul>
	</li>

	<!-- 품질관리 -->
	<li>
		<a href="#" onclick="javascript:getCollectionQuality()">품질관리</a>
		<c:choose>
			<c:when test="${! empty colflag}">
				<ul id="quality" class="depth2 close" style="display:block;">
			</c:when>

			<c:otherwise>
				<ul id="quality" class="depth2 close" style="display:none;">
			</c:otherwise>
		</c:choose>

	<li class="on"><a href='#' onClick='javascript:doQualitySearch("0","mrb")'>DRM/MRB(PKG/MLB) ${MRBcount}</a></li>
	<li><a href='#' onClick='javascript:doQualitySearch("1","ppap")'>PPAP승인(PKG/MLB) ${PPAPcount}</a></li>
	<li><a href='#' onClick='javascript:doQualitySearch("2","ecn")'>ECM 계획서(PKG/MBL) ${ECNcount}</a></li>
	<li><a href='#' onClick='javascript:doQualitySearch("3","change")'>시정조치요구(PKG/MBL) ${CHANGEcount}</a></li>
	<li><a href='#' onClick='javascript:doQualitySearch("4","ocap")'>OCAP(PKG/MBL) ${OCAPcount}</a></li>
	<li><a href='#' onClick='javascript:doQualitySearch("5","analysis")'>분석요구서(PKG/MBL) ${ANALYSIScount}</a></li>
	<li><a href='#' onClick='javascript:doQualitySearch("6","library1")'>FT/IR 라이브러리-1 ${LIBRARY1count}</a></li>
	<li><a href='#' onClick='javascript:doQualitySearch("7","library2")'>FT/IR 라이브러리-2 ${LIBRARY2count}</a></li>
	<li><a href='#' onClick='javascript:doQualitySearch("8","raw")'>원자재승인 ${RAWcount}</a></li>
</ul>
</li>


</ul>
<!-- //leftArea -->