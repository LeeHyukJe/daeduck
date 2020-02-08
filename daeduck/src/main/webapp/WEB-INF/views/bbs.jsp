<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta content="IE=Edge" http-equiv="X-UA-Compatible" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>대덕전자 표준게시판</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/search_sty.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/default.css">
	
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/beta.fix.js"></script>
	<%-- <script src="/resources/js/ark.js"></script> --%>
	<script src="/resources/js/autocomplete.js"></script>
	<script src="/resources/js/category.js"></script>
	<script src="/resources/js/search.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.js"></script>
	<script src="/resources/js/popular.js"></script>
	<script src="/resources/js/recommend.js"></script>

	<link rel="stylesheet" type="text/css" href="/resources/css/sidebar_menu.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/searchbox.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/popular.css" />
</head>
	<body>

	<div class="wrapper">
		<div class="wrap">

			<div class="header_wrap">
				<!--header -->
				<%@ include file="./searchbox/searchbox.jsp"%>
			</div>
		</div>
		<!-- //header_wrap-->

		<!-- container_wrap -->
		<div class="container_wrap">
			<!-- container -->
			<div class="container">
				<!-- leftArea -->
				<div class="leftArea">
					<%@ include file="./sidenav/sidenav.jsp"%>
				</div>
				<!--//leftArea-->


				<!-- contents -->
				<div class="contents">
					<div class="result_top">
						검색어 <strong>${value.query}</strong>에 대한 통합검색 결과 입니다.
					</div>
					<!-- 통합게시판 -->
					<div class="sectit01">
						<h2>
							<span>통합게시판</span><span>${BBScount}</span>
						</h2>
						<c:forEach var="entry" items="${bbs }">
							<dl class="resultsty">
								<dt>
									<a class="tit" href="#"
										onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
										${entry.SUBJECT }</a>
									<dl class="sort">
										<dt>기안자 :</dt>
										<dd>${entry.INITIATOR_NAME }</dd>
										<dt>기안일 :</dt>
										<dd>${entry.INITIATED_DATE }</dd>
										<dt>분류 :</dt>
										<dd>${entry.FOLDER_NAME}</dd>
									</dl>
								</dt>
								<dd class="cont">
									${entry.BODY}
								</dd>
								<dd class="info">
									${entry.FolderName}
								</dd>
								<dd>
									<ul class="attch_file">
										<li class="file_xls">
											<a href="#" class="doc_type">
												${entry.ATTACHNAME}
											</a>
											<div class="preview">
												첨부파일 미리보기...
											</div>
										</li>
									</ul>
								</dd>
							</dl>
						</c:forEach>
						<div class="page_btn">
							${paging}
						</div>
					</div>
				</div>
				<!-- contenst -->
				<!-- rightArea -->
				<div class="rightArea">
					<dl class="rank">
						<%@ include file="./popular/popular.jsp"%>
					</dl>
					<dl class="keyword">
						<dt>내가 찾은 검색어</dt>
						<dd>
							<ul id="mykeyword">
								
							</ul>
						</dd>
					</dl>
					<dl class="recommend">
						<dt>개인화 문서 추천</dt>
						<dd>
							<ul id="recommend">
								<%-- <li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li>
								<li>
									<a href="#">2018년도 업무용 자동차(건설기계)보험 가입.zip</a>
								</li> --%>
							</ul>
						</dd>
					</dl>
				</div>
				<!-- //rightArea -->

			</div>
		</div>
		<!-- container_wrap-->

		
	</div>
	<!-- //wrap -->



	<%-- <%@ include file="./popular/popular.jsp"%> --%>

	<%-- <ul class="mykeyword" id="mykeyword"> --%>


</body>
	<script>
		$(document).ready(function(){
			var query;
			if('${value.query}' != ''){
				query = '${value.query}';
			}
			else{
				query = '';
			}
			console.log("쿼리 값!! : "+query);

			$.ajax({
			url : '/category',
			type : 'GET',
			datatype : 'html',
			data : {
				"collection" : 'bbs',
				"query": query,
				"reQuery" : $('#search [name=reQuery]').val(),
				"target" : "FolderPath"
			},
			success : function(data) {
				console.log(data);
				$('#bbscategory').css('display','block');

				Handlebars.registerHelper('level',function(parent,target,options){
					if(parent == target)
						return options.fn(this);
					else
						return options.inverse(this);
				})
			
				
				var source = $('#entry-template').html();
				var template = Handlebars.compile(source);
			
				
				var value = JSON.stringify(data); 
			
				console.log('json 변환 '+value);
			

				var html = template(data);
			

				$('#bbscategory').html(html);
			},
			error : function(error) {
				console.log(error);
			}
			});
		});

		
		
		
	</script>

	<%-- <script>
		$(document).on('click','.depth2',function(){
			var list = $(this).text();
			var parentList = $(this).parent().text();
			cateQuery(list);
		})
	</script> --%>

	<script id="entry-template" type="text/x-handlebars-template">
		{{#dep1}}
		<li>
			<a href="#" class="on">{{cateName}}</a>
			{{#each ../dep2}}
			{{#level ../cateName parent}}
			<ul class="depth3"> 
				<li><a href="#" onClick="javascript:cateQuery('{{../cateName}}','{{cateName1}}')">{{cateName1}}({{count1}})</a></li>
				{{#each ../../dep3}}
					{{#level ../cateName1 parent}}
					<li class="on"><a href="#" onClick="javascript:cateQuery2('{{../../cateName}}','{{../cateName1}}','{{cateName3}}')">{{cateName3}}({{count3}})</a></li>
					{{/level}}
				{{/each}} 
			</ul>
			{{/level}}
			{{/each}}
		</li>
		{{/dep1}}
	</script>

	<!-- 내가 찾은 검색어 -->
	<script>
		getMyKeyword('${value.query}', '${totalCount}');
	</script>
</html>