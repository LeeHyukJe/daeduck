function doSearch(collection) {
	
	var colName = collection;
	
	if(colName != 'ALL'){
		$('#search').attr('action','/search');
	}
	if(colName == 'tech'){
		$('#search [name=tech]').val('Y');
		colName='app';
	}
	if(colName == 'quality'){
		$('#search').attr('action','/colquality');
		colName = 'ALL'; // 품질관리는 컬렉션이 여러개 이므로 통합검색 하듯 검색함
	}
	
	$('#search [name=collection]').val(colName);
	$('#search [name=reQuery]').val(2);
	$('form').submit();

	catecate(collection);
	
}
 // 품질관리 검색
function doQualitySearch(colflag){
	$('#search [name=colflag]').val(colflag);
	doSearch('quality'); 
}


// 페이징
function doPaging(count) {
	$('#search [name=startCount]').val(count);
	$('#search [name=reQuery]').val(2);
	$('#search').attr('action','/search');
	$('form').submit();
}


// 인기검색어, 내가찾은 검색어
function doKeyword(query) {
	var searchForm = document.search; 
	searchForm.startCount.value = "0";
	searchForm.query.value = query;
	searchForm.collection.value = "ALL";
	searchForm.sort.value = "RANK";
	searchForm.query.value = query;
	doSearch();
}


// 쿠키값 조회
function getCookie(c_name) {
	var i,x,y,cookies=document.cookie.split(";");
	for (i=0;i<cookies.length;i++) {
		x=cookies[i].substr(0,cookies[i].indexOf("="));
		y=cookies[i].substr(cookies[i].indexOf("=")+1);
		x=x.replace(/^\s+|\s+$/g,"");
	
		if (x==c_name) {
			return unescape(y);
		}
	}
}

// 쿠키값 설정
function setCookie(c_name,value,exdays) {
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
	document.cookie=c_name + "=" + c_value;
}

// 내가 찾은 검색어 조회
function getMyKeyword(keyword, totCount) {
	var MYKEYWORD_COUNT = 6; //내가 찾은 검색어 갯수 + 1
	var myKeyword = getCookie("mykeyword");
	if( myKeyword== null) {
		myKeyword = "";
	}

	var myKeywords = myKeyword.split("^%");

	if( totCount > 0 ) {
		var existsKeyword = false;
		for( var i = 0; i < myKeywords.length; i++) {
			if( myKeywords[i] == keyword) {
				existsKeyword = true;
				break;
			}
		}

		if( !existsKeyword ) {
			myKeywords.push(keyword);
			if( myKeywords.length == MYKEYWORD_COUNT) {
				myKeywords = myKeywords.slice(1,MYKEYWORD_COUNT);
			}
		}
		setCookie("mykeyword", myKeywords.join("^%"), 365);
	}

	showMyKeyword(myKeywords.reverse());
}


// 내가 찾은 검색어 삭제
function removeMyKeyword(keyword) {
	var myKeyword = getCookie("mykeyword");
	if( myKeyword == null) {
		myKeyword = "";
	}

	var myKeywords = myKeyword.split("^%");

	var i = 0;
	while (i < myKeywords.length) {
		if (myKeywords[i] == keyword) {
			myKeywords.splice(i, 1);
		} else { 
			i++; 
		}
	}

	setCookie("mykeyword", myKeywords.join("^%"), 365);

	showMyKeyword(myKeywords);
}
 
// 내가 찾은 검색어 
function showMyKeyword(myKeywords) {
	var str = "<li class=\"tit\"><img src=\"images/tit_mykeyword.gif\" alt=\"내가 찾은 검색어\" /></li>";

	for( var i = 0; i < myKeywords.length; i++) {
		if( myKeywords[i] == "") continue;

		str += "<li class=\"searchkey\"><a href=\"#none\" onClick=\"javascript:doKeyword('"+myKeywords[i]+"');\">"+myKeywords[i]+"</a> <img src=\"images/ico_del.gif\" onClick=\"removeMyKeyword('"+myKeywords[i]+"');\"/></li>";
	}

	$("#mykeyword").html(str);
}


//팝업창 크기 조절
function popupOpen(url,name,width,heigth){
	if(heigth==''){
		height = window.screen.height - 82
	}
	window.open(url,name,width,heigth);
}

