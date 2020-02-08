

// $(document).ready(function(){
// 	$('#query').keydown(function(){

// 		var query = $(this).val();
// 		var params={
// 				"convert":'fw',
// 				"target":'common',
// 				"charset":'utf-8',
// 				"query":query,
// 				"datatype": 'json'
// 		};
			
// 		$.ajax({
// 			url: '/ark',
// 			type: "POST",
// 			dataType: "json",
// 			data: JSON.stringify(params),
// 			contentType: "application/json",
// 			success: function(data) {
// 				Handlebars.registerHelper('level',function(parent,target,options){
// 					if(parent == target)
// 						return options.fn(this);
// 					else
// 						return options.inverse(this);
// 				})
			
				
// 				var source = $('#auto').html();
// 				var template = Handlebars.compile(source);
			
				
// 				var value = JSON.stringify(data); 
			
// 				console.log('json 변환 '+value);
			

// 				var html = template(data);
// 			}
// 		});
// 	})
// })

$(document).ready(function(){
	$('#query').autocomplete({
		source : function(req, res){
			var query = req.term;
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
					var result = data.result[0];
					res(
						$.map(result.items, function(item){
							return {
								label:item.keyword,
								value:item.keyword
							}
						})
					)
				}
			});
		},
		minLength:2,
		select: function(event ,ui){

		},
		focus:function(event, ui){
			return false;
		},
		close: function(event){
			console.log(event+' 자동완성 닫힘');
		}
	});
})

