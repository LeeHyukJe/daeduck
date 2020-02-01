

$(document).ready(function(){
	$('#query').keydown(function(){

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
				console.log('자동완성 데이터 '+data.result[0].items[0].hkeyword);
				var str = '';
				for(var i=0;i<data.result[0].items.length;i++){
					str += "<div style='margin-top: 10px;width: 366px;background-color: beige;'>"+data.result[0].items[i].keyword+"</div>";
				}
				$('#auto').append(str);
			}
		});
	})
})
