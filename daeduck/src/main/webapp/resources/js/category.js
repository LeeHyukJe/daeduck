


function catecate(collection,query){
	$(document).ready(function(){
		$.ajax({
			url : '/category',
			type : 'GET',
			datatype : 'html',
			data : {
				"collection" : collection,
				"query" : query
				//"depth" : click
			},
			success : function(data) {
				console.log(data);
			},
			error : function(error) {
				console.log(error);
			}
		})
	});
}



function getCollectionQuality(){
	$('#quality').css('display','block');
}


function cateQuery(cateQuery1,cateQuery){
	var realCateQuery = cateQuery1 +'>'+cateQuery;
	$('#search [name=cateQuery]').val(realCateQuery);
	$('#search').attr('action','/search');
	$('#search [name=query]').val();
	$('form').submit();
}

function cateQuery2(cateQuery1,cateQuery2,cateQuery3){
	var realCateQuery = cateQuery1 +'>'+cateQuery2+'>'+cateQuery3;
	$('#search [name=cateQuery]').val(realCateQuery);
	$('#search').attr('action','/search');
	$('#search [name=query]').val();
	$('form').submit();
}

function cateQuery3(cateQuery1,cateQuery2,cateQuery3,cateQuery4){
	var realCateQuery = cateQuery1 +'>'+cateQuery2+'>'+cateQuery3+'>'+cateQuery4;
	$('#search [name=cateQuery]').val(realCateQuery);
	$('#search').attr('action','/search');
	$('#search [name=query]').val();
	$('form').submit();
}
 

// function getCategory(collection) {
// 	//click++;
// 	$.ajax({
// 		url : '/category',
// 		type : 'GET',
// 		datatype : 'html',
// 		data : {
// 			"collection" : collection
// 			//"depth" : click
// 		},
// 		success : function(data) {
// 			console.log(data);
// 			var result = data.name + ' ' + '(' + data.count + ')';
// 			if (Object.keys(data).length === 0) {
// 				return;
// 			} else {
// 				$('#category').html(result);
// 				//window.location.href=window.location.href+'?cateQuery='+result;
// 			}

// 		},
// 		error : function(error) {
// 			console.log(error);
// 		}
// 	})
// }
