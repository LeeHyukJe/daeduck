function doSearch(collection) {
	
	var colName = collection;

	// if ($('#search [name=query]').val() == "") {
	// 	alert("검색어를 입력하세요.");
	// 	$('#search [name=query]').focus();
	// 	return;
	// }
	 
	//통합검색, 품질관리 검색이 아닐 경우
	if(colName != 'ALL'){
		$('#search').attr('action','/search');
	}

	// 통합검색 일 경우 기술보고서 노출 제거
	$('#search [name=tech]').val('N');

	// 전재 결재 검색 일 경우 기술보고서 노출 여부 상관 없음
	if(colName =='app'){
		$('#search [name=tech]').val('');
	}
	

	// 기술문서 검색일 경우
	if(colName == 'technology'){
		$('#search [name=tech]').val('Y');
		//colName='app';
	}

	$('#search [name=collection]').val(colName);
	//$('#search [name=reQuery]').val(2);
	$('#search').submit();

	// 카테고리 트리구조는 표준문서, 통합게시판에서만 보여줘야 함
	if(colName == 'bbs' && colName == 'standard'){
		var query = $('#search [name=query]').val();
		//catecate(collection,query);
	}
	
	
}
 // 품질관리 검색
function doQualitySearch(colflag,colletion){
	$('#search').attr('action','/colquality');
	$('#search [name=colflag]').val(colflag);
	$('#search [name=collection]').val(colletion);
	//$('#search [name=reQuery]').val(2);
	$('#search').submit(); 
}

function doCollection(collection){
	var searchForm = document.search; 
	
	searchForm.collection.value = coll;
	$('#search [name=collection]').val(collection);
	//searchForm.reQuery.value = "2";
	searchForm.submit();
}

// 품질관리 상세 검색
function qualityDetailSearch(){
	$('#drbSearch').submit();
}



// 페이징
function doPaging(count) {
	$('#search [name=startCount]').val(count);
	$('#search [name=reQuery]').val(2);

	if (window.location.pathname =='/colquality'){
		$('#search').attr('action','/colquality');
	}
	else{
		$('#search').attr('action','/search');
	}
	
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
		heigth = window.screen.height - 82
	}
	window.open(url,name,width,heigth);
}


// 엔터 체크	
function pressCheck(obj) {   
	if (event.keyCode == 13) {
		return doSearch(obj);  
	}else{
		return false;
	}
}

var temp_query = '';
// 결과내 재검색
function checkReSearch() {
	var query = $('#search [name=query]').val();
	var reQuery = $('#search [name=reQuery]').val();

	if ($('#reChk').is(":checked") == true) {
		temp_query = query;
		reQuery = "1";
		query = "";
		$('#search [name=query]').focus();
	} else {
		query = $.trim(temp_query)
		reQuery = "";
		temp_query = "";
	}
}