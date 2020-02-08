<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>


<script>
// 인기검색어 쿼리
    $(document).ready(function(){
		var comData = '';
	$.ajax({
		url:'/popword',
		type:'GET',
		datatype:'text',
		data:{
			"target": "popword",
			"collection":"_ALL_",
			"range":"week",
			"datatype":"json"
		},
		success:function(data){
			console.log(data);
			comData = data;
			var source = $('#popular-template').html();
			var template = Handlebars.compile(source);

			var html = template(data);
			
			$('.rank').append(html);

		},
		error:function(error){
			
		},
		complete:function(data){
			var popArr = comData.Data.Query;
			popArr.forEach(element => {
				if(element.updown =='D'){
					$('#'+element.id).attr('class','rank_down');
					$('#'+element.id).text(element.count);
				}
				else if(element.updown =='U'){
					$('#'+element.id).attr('class','rank_up');
					$('#'+element.id).text(element.count);
				}
				else if(element.updown == 'N'){
					$('#'+element.id).attr('class','rank_new');
					$('#'+element.id).text('NEW');
				}
				else{
					$('#'+element.id).attr('class','rank_stay');
				}
			});
		}
	})
})

</script>

<script id="popular-template" type="text/x-handlebars-template">
	<dt>인기검색어</dt>
	<dd>
		<ol>
			{{#Data.Query}}
			<li><span class="rank_num0">{{id}}</span><a href="#">{{content}}</a><span id='{{id}}' class="rank_stay">-</span></li>
			{{/Data.Query}}
		</ol>
	</dd>
</script>