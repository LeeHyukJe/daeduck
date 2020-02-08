<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css" />



<!--  검색창 -->
<div class="header">
	<div class="top">
		<h1><a href="#"><img src="/resources/img/logo.png" alt="DAEDUCK" /></a></h1>
		<form action="/searchAll" method="get" id="search" class="srh_form">
			<div class="sch_wrap">
				<input type="text" id="query" class="input_text" name="query" placeholder="검색어를 입력하세요"
					value="${value.query }" onKeypress="javascript:pressCheck((event),'${value.collection}');"/>
				
				<!-- 검색 버튼 분리-->
				<c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality'}">
					<a href="#" class="sch_btn" 
						onClick="javascript:doQualitySearch('${value.colflag}','${value.collection}')"></a>
				</c:if>

				<c:if test="${requestScope['javax.servlet.forward.request_uri'] != '/colquality'}">
					<a href="#" class="sch_btn" 
						onClick="javascript:doSearch('${value.collection}')"></a>
				</c:if>
			</div>

			<input type="hidden" name="startCount" value="0">
			<input type="hidden" name="mode" value="${value.mode }">
			<input type="hidden" name="sort" value="${value.sort }">
			<input type="hidden" name="collection" value="${value.collection }">
			<input type="hidden" name="realQuery" value="${value.realQuery }" />
			<input type="hidden" name="reQuery" />
			<input type="hidden" name="tech" />
			<input type="hidden" name="cateQuery" />
			<input type="hidden" name="range" value="${value.range}" />

			<!-- 권한 처리 파라미터 -->
			<input type="hidden" name="authority" value="${value.authority}" />
			<input type="hidden" name="authorityapdept" value="${value.authoritydept}" />
			<input type="hidden" name="authorityex" value="${value.authorityex}" />
			<input type="hidden" name="authoritydept" value="${value.authoritydept}" />

			<input type="hidden" name="startDate" value="${value.startDate}">
			<input type="hidden" name="endDate" value="${value.endDate}">
			<input type="hidden" name="colflag" value="${value.colflag}">
			
			

			

			<!-- 결과 내 재검색 -->
			<div class="sch_opt">
				<div class="chk_box">
					<input name="reCheck" id="reChk" onClick="checkReSearch();" type="checkbox" />
					<label for="reChk"><span></span>결과 내 재검색</label>
				</div>
				<a href="#" class="sch_detail_btn" value="상세검색" onClick="javascript:showDetailBox()">상세검색</a>
			</div>
			


			<!-- 상세검색 선택창-->
			<c:choose>
				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '0'}">
					<%@ include file="../qualitydetail/drbdetail.jsp" %>
				</c:when>

				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '1'}">
					<%@ include file="../qualitydetail/ppapdetail.jsp" %>
				</c:when>

				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '2'}">
					<%@ include file="../qualitydetail/ecndetail.jsp" %>
				</c:when>

				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '3'}">
					<%@ include file="../qualitydetail/changedetail.jsp" %>
				</c:when>

				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '4'}">
					<%@ include file="../qualitydetail/ocapdetail.jsp" %>
				</c:when>
				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '5'}">
					<%@ include file="../qualitydetail/analysis.jsp" %>
				</c:when>

				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '6'}">
					<%@ include file="../qualitydetail/library1detail.jsp" %>
				</c:when>
				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '7'}">
					<%@ include file="../qualitydetail/library2detail.jsp" %>
				</c:when>
				<c:when
					test="${requestScope['javax.servlet.forward.request_uri'] eq '/colquality' && value.colflag eq '8'}">
					<%@ include file="../qualitydetail/rawdetail.jsp" %>
				</c:when>


			</c:choose>
		</form>
	</div>
</div>

<c:if
	test="${requestScope['javax.servlet.forward.request_uri'] eq '/search' || requestScope['javax.servlet.forward.request_uri'] eq '/searchAll'}">
	<%@ include file="../searchdetail/searchdetail.jsp" %>
</c:if>

<%-- <script>
$(document).ready(function(){
	$('#query').autocomplete({
		source : function(req, res){
			var query = $(this).val();
			var params={
				"convert":'fw',
				"target":'common',
				"charset":'utf-8',
				"query":query,
				"datatype": 'json'
			};


			$.ajax({
				url: '/ark',
				type: "POST",
				dataType: "json",
				data: JSON.stringify(params),
				contentType: "application/json",
				success: function(data) {
					res(
						$.map(data, function(item){
							return {
								label:item.data,
								value:item.data
							}
						})
					)
				}
			});
		},
		minLength:2,
		delay :500,
		select: function(event ,ui){

		},
		focus:function(event, ui){
			return false;
		},
		close: function(event){
			console.log(event+' 자동완성 닫힘');
		}
	});
});
</script> --%>