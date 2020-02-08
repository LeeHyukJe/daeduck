<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta content="IE=Edge" http-equiv="X-UA-Compatible" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>대덕전자 표준문서</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/search_sty.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/default.css">

	<%-- <script src="/resources/js/jquery-3.4.1.min.js"></script> --%>
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/beta.fix.js"></script>
	<%-- <script src="/resources/js/ark.js"></script> --%>
	<script src="/resources/js/autocomplete.js"></script>
	<script src="/resources/js/category.js"></script>
	<script src="/resources/js/search.js"></script>
	<script src="/resources/js/handlebars-1.0.rc.1.js"></script>
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
					<div class="sectit01">
						<h2>
							<span>표준문서</span><span>${STANDARDcount}</span>
						</h2>
						<c:forEach var="entry" items="${standard }">
							<dl class="resultsty">
								<dt>
									<a href="#"
										onClick="javascript:popupOpen('https://gw.portal.daeduck.com/Website/Approval/Forms/Form.aspx?mode=COMPLETE&piid=${entry.DOCID }','전자결재','width=950','')">
										${entry.SUBJECT }
									</a>
									<dl class="sort">
										<dt>기안자 :</dt>
										<dd>${entry.CreatorName }</dd>
										<dt>기안일 :</dt>
										<dd>${entry.DATE }</dd>
										<dt>분류 :</dt>
										<dd>${entry.FOLDER_NAME}</dd>
									</dl>

								</dt>
								<dd class="cont">
									${entry.BODY}
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
				<!--//contenst-->
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
				"collection" : 'standard',
				"query": query,
				"reQuery" : $('#search [name=reQuery]').val(),
				"target" : 'FolderPath'
			},
			success : function(data) {
				console.log(data);
				$('#standardcategory').css('display','block');
				var str = '';
				
				if (typeof data != "undefined" && Object.keys(data).length != 0) {
					if (data.dep1[0].cateName!='') {
						str +='<li>'+data.dep1[0].cateName;
					str += '<ul>';
					for(var i=0;i<data.dep2.length;i++){
						if(typeof data.dep2[i].cateName1 != "undefined")
						str +='<li>'+data.dep2[i].cateName1;
					}
					str += '</ul>';


				

					str +='<li id='+data.dep1[1].cateName+'>'+data.dep1[1].cateName;
					str +='<ul>';
					for(var j=0;j<data.dep2.length;j++){
						if(typeof data.dep2[j].cateName2 != "undefined"){
							var test = data.dep2[j].cateName2;
							str +="<li class='depth2'>"+data.dep2[j].cateName2; 
						}
					}	

					str +='</ul>';

						//$('#category').append(str);
					}
					
				}

				Handlebars.registerHelper('level',function(parent,target,options){
					if(parent == target)
						return options.fn(this);
					else
						return options.inverse(this);
				})

				var source = $('#entry-template').html();
				var template = Handlebars.compile(source);
				var html = template(data);
				$('#standardcategory').html(html);
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

	<!--
	<script id="entry-template" type="text/x-handlebars-template">
		<li>
			{{dep1.0.cateName}} 
			{{#dep2}}
			{{#if cateName1}} 
			<ul> 
				<li >
					<a href="#" onClick="javascript:cateQuery('{{../../dep1.0.cateName}}','{{cateName1}}')">{{cateName1}}</a>       
				</li>   
			</ul>
			{{/if}} 
			{{/dep2}}
			
		</li>
		<li>
			{{dep1.1.cateName}}
			{{#dep2}}
			{{#if cateName2}} 
			<ul>
				<li>
					<a href="#" onClick="javascript:cateQuery('{{../../dep1.1.cateName}}','{{cateName2}}')">{{cateName2}}</a> 
				</li>
			</ul>
			{{/if}}
			{{/dep2}}
		</li>
	</script>
	-->

	<script id="entry-template" type="text/x-handlebars-template">
		{{#dep1}}
		<li>
			<a href="#" class="on">{{cateName}}</a>
			{{#each ../dep2}}
			{{#level ../cateName parent}} 
			<ul class="depth3">
				<li><a href="#" onClick="javascript:cateQuery('{{../../cateName}}','{{cateName1}}')">{{cateName1}}({{count1}})</a></li>
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