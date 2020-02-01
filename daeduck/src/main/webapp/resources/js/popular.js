// $(document).ready(function(){
// 	$.ajax({
// 		url:'/popword',
// 		type:'GET',
// 		datatype:'text',
// 		data:{
// 			"target": "popword",
// 			"collection":"_ALL_",
// 			"range":"week",
// 			"datatype":"json"
// 		},
// 		success:function(data){
// 			console.log(data);
			
// 			var source = $('#entry-template').html();
// 			var template = Handlebars.compile(source);
			
				
// 			var value = JSON.stringify(data); 
			
// 			console.log('json 변환 '+value);
			

// 			var html = template(data);
			
// 			$('#pop').append(html);

// 		},
// 		error:function(error){
			
// 		}
// 	})
// })
