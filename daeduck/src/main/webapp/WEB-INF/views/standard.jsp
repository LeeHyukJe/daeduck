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
<script src="/resources/js/handlebars-1.0.rc.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/sidebar_menu.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/searchbox.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/popular.css" />
</head>
	<body>
	<%@ include file="./sidenav/sidenav.jsp" %>
	<%@ include file="./searchbox/searchbox.jsp" %>
	
	<div class="main">
	
		<c:forEach var="entry" items="${standard }">
			
			<div>Subject: ${entry.SUBJECT }</div>
			<div>Body: ${entry.BODY }</div>
			<div>CreatorName: ${entry.CreatorName }</div>
			<div>FolderPath: ${entry.FolderPath }</div>
			<div>DATE: ${entry.DATE }</div>
			<hr>
		</c:forEach>
		<div>검색 건수: ${count}/${totalCount }</div>
		
		${paging}s
	</div>
	</body>
	<script>
		$(document).ready(function(){


			$.ajax({
			url : '/category',
			type : 'GET',
			datatype : 'html',
			data : {
				"collection" : 'standard'
				//"depth" : click
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

	<script>
		$(document).on('click','.depth2',function(){
			var list = $(this).text();
			var parentList = $(this).parent().text();
			cateQuery(list);
		})
	</script>

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
			{{cateName}}
			{{#each ../dep2}}
			{{#level ../cateName parent}} 
			<ul>
				<li>
					<a href="#" onClick="javascript:cateQuery('{{../../cateName}}','{{cateName1}}')">{{cateName1}}({{count1}})</a> 
				</li>
			</ul>
			{{/level}}
			{{/each}}
		</li>
		{{/dep1}}
	</script>

</html>