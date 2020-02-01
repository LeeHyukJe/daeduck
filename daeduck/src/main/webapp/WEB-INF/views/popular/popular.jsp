<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>



<script>
    $(document).ready(function(){
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
			
			var source = $('#entry-template').html();
			var template = Handlebars.compile(source);

			var html = template(data);
			
			$('#pop').append(html);

		},
		error:function(error){
			
		}
	})
})

</script>

<script id="entry-template" type="text/x-handlebars-template">
    {{#result}}
		<li>
			
		</li>
	{{/result}}
</script>