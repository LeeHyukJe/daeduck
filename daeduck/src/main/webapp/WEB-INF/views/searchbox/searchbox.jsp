<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>




<!--  검색창 -->
	<form action="/searchAll" method="get" id="search">
		
		<!--  검색 대상 설정 -->
		<div class="searchbox">
			<span>
				<select name="searchField" id="searchTarget">
			  		<option value="" selected="selected">전체</option>
			  		<option value="BODY,SUBJECT">본문/제목</option>
			  		<option value="SUBJECT,ATTACH">제목/첨부파일</option>
				</select>
			</span>
			<span class="green_window">
				<input type="text" id="query" class="input_text" name="query" placeholder="검색어를 입력하세요" value="${value.query }" />
				<div id="ark"></div>
			</span>
			
			<input type="hidden" name="startCount" value="0">
			<input type="hidden" name="mode" value="${value.mode }">
			<input type="hidden" name="sort" value="${value.sort }">
			<input type="hidden" name="collection" value="${value.collection }">
			<input type="hidden" name="realQuery" value="${value.realQuery }" />
			<input type="hidden" name="reQuery" />
			<input type="hidden" name="tech" />
			<input type="hidden" name="cateQuery" />
			
			<!-- 권한 처리 파라미터 -->
			<input type="hidden" name="authority" value="${value.authority}"/>
			<input type="hidden" name="authorityapdept" value="${value.authoritydept}"/>
			<input type="hidden" name="authorityex" value="${value.authorityex}"/>
			<input type="hidden" name="authoritydept" value="${value.authoritydept}"/>
			
			<c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality'}">
				<button type="submit" class="srch_submit" value="검색" onClick="javascript:doQualitySearch('${value.colflag}','${value.collection}')"></button>
			</c:if>

			<c:if test="${requestScope['javax.servlet.forward.request_uri'] != '/colquality'}">
				<button type="submit" class="srch_submit" value="검색" onClick="javascript:doSearch('${value.collection}')"></button>
			</c:if>
			
			<input type="hidden" name="startDate" value="${value.startDate}">
			<input type="hidden" name="endDate" value="${value.endDate}">
			<input type="hidden" name="colflag" value="${value.colflag}">
		
			<!-- 결과 내 재검색 -->
			<label><input name="reChk" id="reChk" onClick="checkReSearch();" type="checkbox" /> 결과내재검색</label>
		</div>
		
		<c:choose>
            <c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '0'}">
				<%@ include file="../qualitydetail/drbdetail.jsp" %>
			</c:when>

			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '1'}">
				<%@ include file="../qualitydetail/drbdetail.jsp" %>
			</c:when>

			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '2'}">
				<%@ include file="../qualitydetail/ecndetail.jsp" %>
			</c:when>

			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '3'}">
				<%@ include file="../qualitydetail/changedetail.jsp" %>
			</c:when>

			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '4'}">
				<%@ include file="../qualitydetail/ocapdetail.jsp" %>
			</c:when>
			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '5'}">
				<%@ include file="../qualitydetail/analysis.jsp" %>
			</c:when>
			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '6'}">
				<%@ include file="../qualitydetail/drbdetail.jsp" %>
			</c:when>
			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '7'}">
				<%@ include file="../qualitydetail/drbdetail.jsp" %>
			</c:when>
			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '8'}">
				<%@ include file="../qualitydetail/library1detail.jsp" %>
			</c:when>
			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '9'}">
				<%@ include file="../qualitydetail/library2detail.jsp" %>
			</c:when>
			<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '10'}">
				<%@ include file="../qualitydetail/rawdetail.jsp" %>
			</c:when>


        </c:choose>
	
	</form>