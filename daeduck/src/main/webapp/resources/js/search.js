// document.domain = "daeduck.com";

function doSearch(collection) {
	
	var colName = collection;
	

	// if ($('#search [name=query]').val() == "") {
	// 	alert("검색어를 입력하세요.");
	// 	$('#search [name=query]').focus();
	// 	//location.href = window.location.href
	// 	return ;
	// }

	//통합검색, 품질관리 검색이 아닐 경우
	if(colName != 'ALL'){
		$('#search').attr('action','/search');
	}
	
	$('#search [name=collection]').val(colName);
	$('#search [name=startDate]').val("");
	$('#search [name=endDate]').val("");
	$('#search [name=range]').val('A');
	$('#search').submit(); 
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
	$('#search').attr('action','/search');
	$('#search [name=collection]').val(collection);

	if(collection == 'technology'){
		$('#search [name=tech]').val('Y');
		//colName='app';
	}
	$('#search [name=reQuery]').val(2);
	$('#search').submit();
}

// 품질관리 상세 검색
function qualityDetailSearch(){
	$('#drbSearch').submit();
}




// datepicker
$(function() {
    $( "#startDate" ).datepicker({
		dateFormat : 'yy.mm.dd'
	});
	
	$( "#endDate" ).datepicker({
		dateFormat : 'yy.mm.dd'
	});
	
	// 품질관리 날짜 검색용
	$('#col_time_start, #col_time_end').datepicker({
		dateFormat : 'yymmdd'
	});
	$('#step1_startDate, #step1_endDate').datepicker({
		dateFormat : 'yymmdd'
	});
	$('#step2_startDate, #step2_endDate').datepicker({
		dateFormat : 'yymmdd'
	});
	$('#step4_startDate, #step4_endDate').datepicker({
		dateFormat : 'yymmdd'
	});
	$('#step6_startDate, #step6_endDate').datepicker({
		dateFormat : 'yymmdd'
	});
	$('#step7_startDate, #step7_endDate').datepicker({
		dateFormat : 'yymmdd'
	});
	$('#recompl_startDate, #recompl_endDate').datepicker({
		dateFormat : 'yymmdd'
	});

});



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
	var str = '';
	//var str = "<li class=\"tit\"><img src=\"images/tit_mykeyword.gif\" alt=\"내가 찾은 검색어\" /></li>";

	for( var i = 0; i < myKeywords.length; i++) {
		if( myKeywords[i] == "") continue;

		//str += "<li class=\"searchkey\"><a href=\"#none\" onClick=\"javascript:doKeyword('"+myKeywords[i]+"');\">"+myKeywords[i]+"</a> <img src=\"images/ico_del.gif\" onClick=\"removeMyKeyword('"+myKeywords[i]+"');\"/></li>";
		str += "<li class=\"clearfix\"><a href='#' class='word' onClick=\"javascript:doKeyword('"+myKeywords[i]+"');\">"+myKeywords[i]+"<a href='#' class='btn_close'><img src='/resources/img/right_keyword_close.gif' onClick=\"removeMyKeyword('"+myKeywords[i]+"');\"></img></a></a></li>";
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

	if ($('#reChk').is(":checked") == true) {
		temp_query = query;
		$('#search [name=reQuery]').val(1);
		$('#search [name=query]').val(query);
		$('#search [name=query]').focus();
	} else {
		query = $.trim(temp_query);
		$('#search [name=query]').val(query);
		$('#search [name=reQuery]').val("");
		temp_query = "";
	}
}



// 기간 적용
function doRange() {
	
	
	if($("#startDate").val() != "" || $("#endDate").val() != "") {
		if($("#startDate").val() == "") {
			alert("시작일을 입력하세요.");
			$("#startDate").focus();
			return;
		}

		if($("#endDate").val() == "") {
			alert("종료일을 입력하세요.");
			$("#endDate").focus();
			return;
		}

		if(!compareStringNum($("#startDate").val(), $("#endDate").val(), ".")) {
			alert("기간이 올바르지 않습니다. 시작일이 종료일보다 작거나 같도록 하세요.");
			$("#startDate").focus();
			return;
		}		
	}
	$('#search [name=startDate]').val($('#startDate').val());
	$('#search [name=endDate]').val($('#endDate').val());
	$('#search [name=reQuery]').val(2);
	$('form').submit();
}





// 문자열 숫자 비교
function compareStringNum(str1, str2, repStr) {
	var num1 =  parseInt(replaceAll(str1, repStr, ""));
	var num2 = parseInt(replaceAll(str2, repStr, ""));

	if (num1 > num2) {
		return false;
	} else {
		return true;
	}
}

// Replace All
function replaceAll(str, orgStr, repStr) {
	return str.split(orgStr).join(repStr);
}

// 공백 제거
function trim(str) {
	return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}

// 영역
function doSearchField(field) {
	var searchForm = document.search;
	searchForm.searchField.value = field;
	searchForm.reQuery.value = "2";
	searchForm.submit();
}


// 기간 설정
function setDate(range) {
	var startDate = "";
	var endDate = "";
	
	var currentDate = new Date();
	var year = currentDate.getFullYear();
	var month = currentDate.getMonth() +1;
	var day = currentDate.getDate();

	if (parseInt(month) < 10) {
		month = "0" + month;
	}

	if (parseInt(day) < 10) {
		day = "0" + day;
	}

	var toDate = year + "." + month + "." + day;

	// 기간 버튼 이미지 초기화
	for (i = 1;i < 5 ;i++) {
		$("#range"+i).attr ("src", "images/btn_term" + i + ".gif");
	}
	
	// 기간 버튼 이미지 선택
	if (range == "D") {
		startDate = getAddDay(currentDate, -0);
		$("#range2").attr ("src", "images/btn_term22.gif");
	} else if (range == "W") {
		startDate = getAddDay(currentDate, -6);
		$("#range3").attr ("src", "images/btn_term32.gif");
	} else if (range == "M") {
		startDate = getAddDay(currentDate, -29);
		$("#range4").attr ("src", "images/btn_term42.gif");
	} else {
		startDate = "1970.01.01";
		endDate = toDate;
		$("#range1").attr ("src", "images/btn_term12.gif");
	}
	
	if (range != "A" && startDate != "") { 
		year = startDate.getFullYear();
		month = startDate.getMonth()+1; 
		day = startDate.getDate();

		if (parseInt(month) < 10) {
			month = "0" + month;
		}

		if (parseInt(day) < 10) {
			day = "0" + day;
		}

		startDate = year + "." + month + "." + day;				
		endDate = toDate;
	}
	
	$("#search [name=range]").val(range);
	$("#startDate").val(startDate);
	$("#endDate").val(endDate);
}

// 날짜 계산
function getAddDay ( targetDate, dayPrefix )
{
	var newDate = new Date( );
	var processTime = targetDate.getTime ( ) + ( parseInt ( dayPrefix ) * 24 * 60 * 60 * 1000 );
	newDate.setTime ( processTime );
	return newDate;
}







//상세 검색 박스 누를 경우 상세 검색 화면 보이기
function showDetailBox(){
	if($('.optionArea').css('display') == 'none'){
		$('.optionArea').css('display','block');
	}else{
		$('.optionArea').css('display','none');
	}
	
}

// 인기검색어, 내가찾은 검색어
function doKeyword(query) {
	var collection = $('#search [name=collection]').val();
	$('#search [name=startDate]').val("0");
	$('#search [name=query]').val(query);
	$('#search [name=collection]').val("ALL");
	$('#search [name=sort]').val("RANK");
	$('#search [name=collection]').val("ALL");
	doSearch(collection);
}


// 엔터 체크	
function pressCheck(event, collection) {   
	if (event.keyCode == 13) {
		return doSearch(collection);
	}else{
		return false;
	}
}