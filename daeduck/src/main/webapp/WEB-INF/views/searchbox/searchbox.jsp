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
				<input type="text" class="input_text" name="query" placeholder="검색어를 입력하세요" value="${value.query }"/>
			</span>
			
			<input type="hidden" name="startCount" value="0">
			<input type="hidden" name="mode" value="${value.mode }">
			<input type="hidden" name="sort" value="${value.sort }">
			<input type="hidden" name="collection" value="${value.collection }">
			<input type="hidden" name="realQuery" value="${value.realQuery }" />
			<input type="hidden" name="reQuery" />
			<input type="hidden" name="tech" />
			<input type="hidden" name="cateQuery" />
			<input type="submit" class="srch_submit" value="검색">
			<input type="hidden" name="startDate" value="${value.startDate}">
			<input type="hidden" name="endDate" value="${value.endDate}">
			<input type="hidden" name="colflag" >
		</div>
		<div id="ark"></div>
	</form>