$(document).ready(function(){
	$.ajax({
		url:'/popword',
		type:'GET',
		datatype:'text',
		data:{
			"target": "popword",
			"collection":"_ALL_",
			"range":"week",
			"datatype":"xml"
		},
		success:function(data){
			console.log(data);
			//data = trim(data);
			var xml = $.parseXML(data);
			
			var str = "<li class='tit'>";
			str += "<div class='timg'><img src='images/tit_popu.gif' alt='인기검색어' /></div>";
			str += "</li>";

			$(xml).find("Query").each(function(){
	 			str += "<li class='ranking'>";
				str += "	<ul>";
				str += "		<li class='ranktxt'><img src='images/"+ $(this).attr("id")+".gif' alt='' /> <a href='#none' onclick=\"javascript:doKeyword('" + $(this).text() + "');\">" + $(this).text() + "</a></li>";
				str += "		<li class='rankico'>";

				if ($(this).attr("updown") == "U") {
					str += "<img src='images/ico_up.gif' alt='상승' />";
				} else if ($(this).attr("updown") == "D") {
					str += "<img src='images/ico_down.gif' alt='하락' />";
				} else if ($(this).attr("updown") == "N") {
					str += "<img src='images/ico_new.gif' alt='신규' />";
				} else if ($(this).attr("updown") == "C") {
					str += "-";
				}

				str += "		</li>";
				str += "		<li class='rankstep'>" + $(this).attr("count") + "</li>";
				str += "		";
				str += "	</ul>";
				str += "</li>";
			});
			
			$('#pop').append(str);


		},
		error:function(error){
			
		}
	})
})
