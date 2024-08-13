// 상세 검색
function goDetailSearch() {
	var searchForm = document.prosearch; 
	searchForm.mode.value = "detail";
	searchForm.pageNo.value = "1";
	searchForm.sort.value = "";
	searchForm.submit();
}


// 화면에 보이는 개수
function showCount(count){
	var searchForm = document.prosearch;
	searchForm.indexsize.value = count;	
	searchForm.pageNo.value = "1";
	searchForm.submit();
}


// 정렬
function goSorting(sort) {
	var searchForm = document.prosearch;
	searchForm.sort.value = sort;
	searchForm.reQuery.value = "2";
	searchForm.pageNo.value = "1";
	searchForm.submit();
}

//페이지 이동
function movePage(pageNo){
	var searchForm = document.prosearch;
	searchForm.pageNo.value = pageNo;
	searchForm.reQuery.value= "2";
	searchForm.submit();
}


function detailSearch() {
	var searchForm = document.prosearch;
	if ( searchForm.mode.value == "detail" ) {
		$(".detail_search").css('display','none');	
		searchForm.mode.value = "basic";
		searchForm.title.value = "";
		searchForm.content.value = "";
		searchForm.writer.value = ""; 
 
	}else{
		$(".detail_search").css('display','block') 
		searchForm.mode.value = "detail";
	}
	
}


function goKeywordSearch(query) {
	var searchForm = document.prosearch; 
	searchForm.pageNo.value = "1";
	searchForm.query.value = query;
	searchForm.index.value = "TOTAL";
	searchForm.sort.value = "";
	searchForm.query.value = query;
	goSearch();
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

var remove = false;
// 내가 찾은 검색어 조회
function getSearchMyKeyword(keyword, totCount) {
	var MYKEYWORD_COUNT = 10; //내가 찾은 검색어 갯수 + 1
	var myKeyword = getCookie("mySearchKeyword");
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
		setCookie("mySearchKeyword", myKeywords.join("^%"), 365);
	}

	searchMyKeyword(myKeywords.reverse());
}

// 내가 찾은 검색어 조회
function getSearchMyKeywords(keyword) {
	var MYKEYWORD_COUNT = 10; //내가 찾은 검색어 갯수 + 1
	var myKeyword = getCookie("mySearchKeyword");
	if( myKeyword== null) {
		myKeyword = "";
	}

	var myKeywords = myKeyword.split("^%");
 
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
	setCookie("mySearchKeyword", myKeywords.join("^%"), 365);

	searchMyKeyword(myKeywords.reverse());
}


// 내가 찾은 검색어 삭제
function removeMyKeyword(keyword) {
	var myKeyword = getCookie("mySearchKeyword");
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

	setCookie("mySearchKeyword", myKeywords.join("^%"), 365);

	searchMyKeyword(myKeywords);
	remove = true;
}

// 내가 찾은 검색어 삭제
function removeAllMyKeyword() {
	var myKeyword = getCookie("mySearchKeyword");
	if( myKeyword == null) {
		myKeyword = "";
	}
	myKeyword = "";
	var myKeywords = myKeyword.split("^%");

	var i = 0;
	while (i < myKeywords.length) {
		if (myKeywords[i] == keyword) {
			myKeywords.splice(i, 1);
		} else { 
			i++; 
		}
	}
	setCookie("mySearchKeyword", myKeywords.join("^%"), 365);

	searchMyKeyword(myKeywords);
}
 
// 내가 찾은 검색어 
function searchMyKeyword(myKeywords) {
	//var str = "<p class=\"tit\">내가 찾은 검색어</p>";

	str = "";
	str += "<ul>";
	
	for( var i = 0; i < myKeywords.length; i++) {
		if( myKeywords[i] == "") continue;

		str += "<li >";
		str += "		<a href=\"#\" onClick=\"javascript:goKeywordSearch('"+myKeywords[i]+"');\">";
		str += "	   	 	<span class=\"kwd\">" + myKeywords[i] + "</span>";
//		str += "	   	 	<span class=\"date\">" + myKeywords[i] + "</span>";
		str += "	 	</a>";
		str += "		 <button type=\"button\" title=\"삭제\" class=\"btn_del\" onClick=\"javascript:removeMyKeyword('"+myKeywords[i]+"');\" >"; 
		str += "		 	<i class=\"ico ico_close\"><span>삭제</span></i>";
		str += "		</button>"; 
		str += "	</li>";
	}
	str += "</ul>";
	//alert(str);
	$("#kwd_lst").html(str);
}
 
 
// 기간 설정
function setDate(range) {
	var searchForm = document.prosearch;
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
	// 기간 버튼 이미지 선택
	var toDate = year + "-" + month + "-" + day;
	if (range == "TOTAL") {
		startDate = "";  
		endDate = "";  
	} else  if (range == "W"){
		endDate = toDate; 
	}
	if (range == "TOTAL") {
		startDate = "";  
		endDate = "";  
	} else if (range == "W") {
		startDate = getAddDay(currentDate, -6);
	} else if (range == "M") {
		startDate = getAddDay(currentDate, -30);
	} else if (range == "3M") {
		startDate = getAddDay(currentDate, -92);
	} else if (range == "6M") {
		startDate = getAddDay(currentDate, -183);
	} else {
//		startDate = "1970.01.01";
	}
	if (range != "SELECT" && startDate != "" && range != "TOTAL") { 
		year = startDate.getFullYear();
		month = startDate.getMonth()+1; 
		day = startDate.getDate();
		if (parseInt(month) < 10) {
			month = "0" + month;
		}
		if (parseInt(day) < 10) {
			day = "0" + day;
		}
		startDate = year + "-" + month + "-" + day;				
		endDate = toDate;
	}
	
	if (range != "SELECT"){
		console.log("select ");
		 searchForm.startDate.value = startDate;
		 searchForm.endDate.value = endDate;
		$('#startDate').attr('disabled', false);
		$('#endDate').attr('disabled', false);
		$("#startDate").val(startDate);
		$("#endDate").val(endDate);
	}else{
		if($("#startDate").val() == "" || $("#endDate").val() == "") {
			
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
		}
	}
//	$("#range").val(range);
	 searchForm.range.value = range;
	console.log("range : "+ searchForm.range.value);
	console.log("startDate : "+ searchForm.startDate.value);
	console.log("endDate : "+ searchForm.endDate.value);
	searchForm.submit();
}
 function getAddDay ( targetDate, dayPrefix )
{
	var newDate = new Date( );
	var processTime = targetDate.getTime ( ) + ( parseInt ( dayPrefix ) * 24 * 60 * 60 * 1000 );
	newDate.setTime ( processTime );
	return newDate;
}

function goDetailInit() {
	
	var searchForm = document.prosearch;
	
		if ( searchForm.title.value != "undefined" ) 
			searchForm.title.value = "";
			
		if ( searchForm.content.value  != "undefined" ) 
			searchForm.content.value = "";
		
		if ( searchForm.writer.value  != "undefined" ) 
			searchForm.writer.value = "";
		
		if ( searchForm.attach.value  != "undefined" ) 
			searchForm.attach.value = "";
		
	
	searchForm.extactstring.value = "";
	searchForm.andstring.value = "";
	searchForm.orstring.value = "";
	searchForm.notstring.value = "";
	 
	
}

// 검색
function goSearch() {
	var searchForm = document.prosearch; 
	if ( searchForm.mode.value != "detail" ) {
	
		if (searchForm.query.value == "") {
			alert("검색어를 입력하세요.");
			searchForm.query.focus();
			return;
		}
	}
	searchForm.pageNo.value = "1";
	searchForm.sfield.value = "";
	searchForm.sort.value = "";
	searchForm.range.value = "";
	searchForm.startDate.value = "";
	searchForm.endDate.value = "";
	searchForm.notQuery.value = "";
	searchForm.f_search_not.value = "";
	$('#startDate').attr('disabled', false);
	$('#endDate').attr('disabled', false);
	$("#startDate").val("");
	$("#endDate").val("");	
	
	searchForm.submit();
}

// index별 검색
function goIndexSearch(idx) {
	var searchForm = document.prosearch; 
	searchForm.index.value = idx;
	searchForm.pageNo.value = "1";
	searchForm.reQuery.value = "2";
	searchForm.indexsize.value = "10";
	console.log("searchForm.index.value : "+ searchForm.index.value);
	searchForm.submit();
}

//엔터 체크	
function pressCheckEnter() {   
	if (event.keyCode == 13) {
		var searchForm = document.prosearch;
		
		if ( searchForm.mode.value == "detail") {
			return goDetailSearch();
		} else {
			return goSearch();		
		}
	}else{
		return false;
	}
} 


//엔터 체크	
function pressDetailCheckEnter() {   

	if (event.keyCode == 13) {
		return goDetailSearch();
	}else{
		return false;
	}
} 

// 결과내 재검색
function resultReSearch() {
	var searchForm = document.prosearch;
	var query = searchForm.query;
	var reQuery = searchForm.reQuery;
	var imsi_query = "";
	//alert("reQuery=" + query.value);
	if (document.getElementById("reChk").checked == true) {
		imsi_query = query.value;
		searchForm.realQuery.value = imsi_query;
		reQuery.value = "1";
		query.value = "";
		query.focus();
	} else {
		query.value = trim(imsi_query);
		reQuery.value = "";
		imsi_query = "";
	}
}
  


// 세부정보 검색
function resultTypeSearch() {
	var searchForm = document.prosearch;
	var checkedValue = ""; 
	var inputElements = document.getElementsByName('typeCode');
	//alert(inputElements.length);
	for(var i=0; inputElements[i]; ++i){
		  if(inputElements[i].checked){
			   if(checkedValue!=""){
				   checkedValue +="|";
			   }
			   checkedValue += inputElements[i].value;
          }
	}
	searchForm.category.value = checkedValue;
}

// 페이징
function goPaging(page) {
	var searchForm = document.prosearch;
	searchForm.pageNo.value = page;
	searchForm.reQuery.value = "2";
	searchForm.submit();
}

// 기간 적용
function goRange() {
	var searchForm = document.prosearch;
	
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

	searchForm.startDate.value = $("#startDate").val();
	searchForm.endDate.value = $("#endDate").val();
	searchForm.range.value = $("#range").val();
	searchForm.reQuery.value = "2";
	searchForm.submit();
}

// 영역
function goSearchField(field) {
	var searchForm = document.prosearch;
	var sfield = "";
	$("input[name=ca]:checked").each(function() {
		if($(this).val() != 'TOTAL'){
			sfield += $(this).val() + ",";
			} 
	});
	if(sfield == '' || sfield.indexOf('TOTAL') > -1 || field == 'TOTAL'){
		sfield =  'TOTAL';
	}
	searchForm.sfield.value = sfield;
	searchForm.reQuery.value = "2";
	searchForm.submit();
}
 

// Replace All
function replaceAll(str, orgStr, repStr) {
	return str.split(orgStr).join(repStr);
}

// 공백 제거
function trim(str) {
	return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}
function doSearchKeyword(searchkeyword) {
	var searchForm = document.prosearch; 

	searchForm.pageNo.value = "1";
	searchForm.sfield.value = "";
	searchForm.sort.value = "";
	searchForm.query.value = searchkeyword;
	searchForm.submit();
}
