<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
	<title>게시판 페이지</title>
	<meta charset="UTF-8" />
	<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="/resources/js/category.js"></script>
<script src="/resources/js/popular.js"></script>
<script src="/resources/js/search.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.2/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/sidebar_menu.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/searchbox.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/popular.css" />
</head>
	<body>
	<%@ include file="./sidenav/sidenav.jsp" %>
	<%@ include file="./searchbox/searchbox.jsp" %>
	
	<div class="popular" id="pop"></div>
	
	<div class="main">
		<c:forEach var="entry" items="${bbs }">
			<c:if test="${!empty entry}">
			<div>SUBJECT: ${entry.SUBJECT }</div>
			<div>BODY: ${entry.BODY }</div>
			<div>CreatorName: ${entry.CreatorName }</div>
			<div>FolderPath: ${entry.FolderPath }</div>
			<div>Authority1: ${entry.Authority1 }</div>
			
			<div>DATE: ${entry.DATE }</div>
			<hr>
			</c:if>
		</c:forEach>
		<div>검색 건수: ${count}/${totalCount }</div>
		${paging}
	</div>
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
				"collection" : 'bbs'
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

	<script>
		$(document).on('click','.depth2',function(){
			var list = $(this).text();
			var parentList = $(this).parent().text();
			cateQuery(list);
		})
	</script>

	<script id="entry-template" type="text/x-handlebars-template">
		{{#dep1}}
		<li>
			{{cateName}}
			{{#each ../dep2}}
			{{#level ../cateName parent}}
			<ul> 
				<li>
					<a href="#" onClick="javascript:cateQuery('{{../cateName}}','{{cateName1}}')">{{cateName1}}({{count1}})</a>       
					{{#each ../../dep3}}
						{{#level ../cateName1 parent}}  
						<ul>
							<li><a href="#" onClick="javascript:cateQuery2('{{../../cateName}}','{{../cateName1}}','{{cateName3}}')">{{cateName3}}({{count3}})</a></li>
						</ul>
						{{/level}}
					{{/each}}
				</li>   
			</ul>
			{{/level}}
			{{/each}}
		</li>
		{{/dep1}}
	</script>
</html>