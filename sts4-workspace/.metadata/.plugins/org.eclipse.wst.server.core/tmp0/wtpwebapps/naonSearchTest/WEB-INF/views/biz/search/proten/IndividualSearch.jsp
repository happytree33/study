<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><% request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %><!-- 다국어 태그 추가 -->
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><spring:message code="srch.unified.search" text="" /></title>

<!-- <link href="http://design7.naonsoft.com//resources/lib/jquery/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"> -->
<link href="/biz/resources/biz/search/proten/css/jquery-ui-1.9.0.custom.css" rel="stylesheet">

<link href="http://design7.naonsoft.com//resources/lib/dynatree/skin-vista/ui.dynatree.css" rel="stylesheet">
<link href="http://design7.naonsoft.com//resources/common/css/basic.css" rel="stylesheet">
<link href="http://design7.naonsoft.com//resources/common/css/layout_responsive.css" rel="stylesheet">
<link href="http://design7.naonsoft.com//resources/biz/search/css/search_gw7.css" rel="stylesheet">

<!--[if lt IE 8]><link href="http://design7.naonsoft.com//resources/common/css/basic_iefix.css" rel="stylesheet"><![endif]-->
<!--[if lt IE 9]><script src="http://design7.naonsoft.com//resources/common/js/respond.src.js"></script><![endif]-->
<!--[if lt IE 9]><script src="http://design7.naonsoft.com//resources/common/js/html5shiv.js"></script><![endif]-->

<!-- <script src="http://design7.naonsoft.com//resources/lib/jquery/js/jquery-1.9.1.js"></script> -->
<!-- <script src="http://design7.naonsoft.com//resources/lib/jquery/js/jquery-ui-1.10.3.custom.min.js"></script> -->
<!-- <script src="http://design7.naonsoft.com//resources/lib/jquery/js/jquery-ui.datepicker-ko.js"></script> -->
<script src="/biz/resources/biz/search/proten//js/jquery-1.8.2.js"></script>
<script src="/biz/resources/biz/search/proten/js/jquery-ui-1.9.0.custom.min.js"></script>
<script src="/biz/resources/biz/search/proten/js/jquery.ui.datepicker-ko.js"></script>

<script src="http://design7.naonsoft.com//resources/lib/dynatree/jquery.dynatree.js"></script>
<script src="http://design7.naonsoft.com//resources/common/js/bootstrap.js"></script>
<script src="http://design7.naonsoft.com//resources/common/js/ui.js"></script>
<script src="/biz/resources/biz/search/proten/prosearch.js"></script>
<script src="/biz/resources/biz/search/proten/autoquery.js"></script>
<script type="text/javascript">
// 스크롤 TOP 버튼
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
	if (document.body.scrollTop > 10 || document.documentElement.scrollTop > 10) {
		$('#uni_srch_body').addClass('show_top');
	} else {
		$('#uni_srch_body').removeClass('show_top');
	}
}

$(function () {
	$('#page_top').click( function() {
		$('body,html').animate({scrollTop:0}, 'fast');
	});
});

$(function() {
	// 날짜선택
	$(".input_date").datepicker({
		changeMonth: true,
		changeYear: true,
		yearSuffix: '&nbsp;'
	});

	// 날짜선택 다국어 설정
	$(".input_date").datepicker($.datepicker.regional["ko"]);

	// 카테고리 트리
	$("#tree_box").dynatree({
		checkbox: true
	});

	// 카테고리 검색결과
	$('.category_box .srch_result .arr').click(function(){
		$(this).closest('.srch_result').toggleClass('open');
		return false;
	});

	// 첨부파일 미리보기
	$("a.prvw").click(function () {
		if($(this).closest('li').hasClass('prvw_open')) {
			$(this).closest('li').removeClass('prvw_open');
			return false
		}
		else {
			$(this).closest('li').addClass('prvw_open');
			return false
		}
	});

	// 사용자 정보
	$("#user_info_dialog").dialog({
		dialogClass: "user_info_dialog",
		autoOpen: false,
		resizable: false,
		show: "fade",
		hide: "fade",
		width: "260"
	});

	$(".user a.ui").click(function (e) {
		$("#user_info_dialog").dialog('open').dialog('option', 'position',[e.clientX-130,e.clientY+15]);
		return false;
	});
});

$(document).ready(function () {
	UI.init();
	//최근 검색어 
	getSearchMyKeyword("${searchResult.query }", ${searchResult.totalCount });
	// 검색 옵션
	$('.optn_box .rdo_ul li label').each(function () {
		$(this).click(function () {
			$(this).closest('li').addClass('active');
			$(this).closest('li').siblings().removeClass('active');
			$('.optn_box .rdo_ul li input[type=text]').attr('disabled', 'disabled');
			$('.optn_box .rdo_ul li button.btn_submit').attr('disabled', 'disabled');
			$('.optn_box .rdo_ul li.active input[type=text]').removeAttr('disabled', 'disabled');
			$('.optn_box .rdo_ul li.active button.btn_submit').removeAttr('disabled', 'disabled');
		});
	});
		
	if($("#index").val() == "space_work"){
		$("#indexlist8").removeClass('active');
	}
/**
	$('.optn_box .chk_ul input.input_chk[type=checkbox]').change(function() {
		$(this).closest('li').toggleClass('active');

		 if($(this).closest('li').attr('class') == 'active' ){
		 		console.log("$(this).val() : "+ $(this).val());
				$(this).attr("checked", true);
			if($(this).val() ==  'TOTAL' ){
				$("input:checkbox[id='title']").prop("checked", false);
				$("input:checkbox[id='content']").prop("checked", false);
				$("input:checkbox[id='owner']").prop("checked", false);
				$("input:checkbox[id='attach']").prop("checked", false);
				$("#stitle").removeClass("active");
				$("#scontent").removeClass("active");
				$("#sowner").removeClass("active");
				$("#sattach").removeClass("active");
			}else{
				$("input:checkbox[id='TOTAL']").prop("checked", false);
				$("#sTOTAL").removeClass("active");
		//		$(this).closest('li').addClass("active");
			}
		}else{
			//$(this).attr("checked", false);
		}
		
//	console.log("checked :: " + $(this).is(":checked"));
		console.log("this :: " + $(this).val());
		var sfield = "";
		$("input[name=ca]:checked").each(function() {
		//	if($(this).val() != 'TOTAL'){
				sfield += $(this).val() + ",";
		//		} 
		alert($(this).val());
		});
		if(sfield == ''){
			sfield =  'TOTAL';
		}
		alert("val : "+ sfield);
		
		goSearchField(sfield);
	});
**/
	// 검색어 입력창 자동완성
	$("#srch_input").keydown(function(e) {
		if (e.keyCode == 13) { // enter
			if ($("#srch_suggest").is(":visible")) {
				$("#srch_field").removeClass("suggest_open");
				selectOption();
			} else {
				$("#srch_suggest").show();
				$("#srch_field").addClass("suggest_open");
			}
			// menuOpen = !menuOpen;
		}
		if (e.keyCode == 38) { // up
			var selected = $(".selected");
			$("#srch_suggest li").removeClass("selected");
			if (selected.prev().length == 0) {
				selected.siblings().last().addClass("selected");
			} else {
				selected.prev().addClass("selected");
			}
		}
		if (e.keyCode == 40) { // down
			var selected = $(".selected");
			$("#srch_suggest li").removeClass("selected");
			if (selected.next().length == 0) {
				selected.siblings().first().addClass("selected");
			} else {
				selected.next().addClass("selected");
			}
		}
	});

	$("#srch_suggest li").mouseover(function() {
		$("#srch_suggest li").removeClass("selected");
		$(this).addClass("selected");
	}).click(function() {
		selectOption();
	});

	function selectOption() {
		$("#srch_input").val($("#srch_suggest .selected .kwd").text());
		$('#srch_field').removeClass('suggest_open');
		$("#srch_suggest").hide();
	}

	// 검색어 자동완성 레이어 토글
	$('#srch_field .srch_bar a.srch_arw').click(function () {
		if($('#srch_field').hasClass('suggest_open')) {
			$('#srch_field').removeClass('suggest_open');
			$("#srch_suggest").hide();
			return false
		} else {
			$('#srch_field').addClass('suggest_open');
			$("#srch_suggest").show();
			return false
		}
	})
	//  통합검색 아닐때
	chkIndex();
});

function chkIndex() {
	var index = '${searchResult.index }';
	if(index != 'TOTAL'){
		$("#TOTAL").removeClass("active");
	}
} 
//상세검색 onkeyup
function printText(){                                             
   var df1 = document.getElementById('df1').value.trim();                       
   var df2 = document.getElementById('df2').value.trim();                        
   var df3 = document.getElementById('df3').value.trim();                       
   var df4 = document.getElementById('df4').value.trim();                       
   var result="";
   //or검색
   if($("#or_check").is(":checked")==true){
      df1 = df1.replace(/ +/g, " ");  //여러개의 공백을 하나의 공백으로 치환
     df1 = df1.replaceAll(" ", " | ");
   }   
   //정확히 일치("")   
   if(df2.length>0){
      df2 = "\"" + df2 + "\"";                             
   }
   //반드시(+)   
   if(df3.indexOf(" ")>-1){   
      df3 = "+\"" + df3 + "\"";  
   }else if(df3.length>0){
      df3 = "+" + df3 ;    
   }
   //제외검색(!)   
   if(df4.indexOf(" ")>-1){
      df4 = "!\"" + df4 + "\"";  
   }else if(df4.length>0){
      df4 = "!" + df4;    
   }
   result = df1+" "+df2+" "+df3+" "+df4;
   result = result.replace(/ +/g, " ");
   
   result1 = df1+" "+df2+" "+df3;
   result1 = result1.replace(/ +/g, " ");  //제외쿼리의경우
   
   $("#f_search").val(result);
   $("#f_search_not").val(result1);
}

//상세검색 초기화
function init(){
   $("#df1").val("");
   $("#df2").val("");
   $("#df3").val("");
   $("#df4").val("");
   $("#f_search").val("");
}

// 상세검색
function detailSearch(){
	console.log("detail : " + $("#f_search").val());
	if($("#df4").val() != ""){
		$("#notQuery").val( $("#df4").val() );	
	}
	$("#query").val( $("#f_search").val() );
	goDetailSearch();
}
function changeDetailQuery(){
	$("#df1").val( $("#query").val() );
	$("#f_search").val( $("#query").val() );
}


</script>
</head>
<body id="uni_srch_body" class="uni_srch_body layout_ex gw_color1 fixed_none">
<form name="prosearch" id="prosearch" action="/biz/IndividualSearch" method="post" onsubmit="return false;">
<input type="hidden" name="sort" 	id="sort" value="${searchResult.sort }">
<input type="hidden" name="index" 	id="index" value="${searchResult.index}">      
<input type="hidden" name="range" 	id="range" value="${searchResult.range}"> 
<input type="hidden" name="reQuery" id="reQuery" value="2"/>
<input type="hidden" name="realQuery" id="realQuery" value=""/>
<input type="hidden" name="pageNo"  id="pageNo" value="${searchResult.pageNo }">             
<input type="hidden" name="proPaging" 	value="">
<input type="hidden" name="mode" id="mode" value="">
<input type="hidden" name="f_search_not" id="f_search_not" value="${searchResult.f_search_not }" >
<input type="hidden" name="notQuery" id="notQuery" value="${searchResult.notQuery }"/>
<input type="hidden" name="sfield" id="sfield" value="${searchResult.searchField}">
<input type="hidden" name="indexsize" id="indexsize" value="<c:if test="${searchResult.index ne 'TOTAL'}">${searchResult.indexsize}</c:if>">
<input type="text" name="individual" id="individual" value="${searchResult.individual }"/>
<div>개별 검색 : board/doc/eapp/eml/gapp/note/org/prj/smw/wiki/wor</div>
<div class="uni_srch_container uni_srch_simple">
	<div class="unified_search">
		<div id="uni_srch_header" class="uni_srch_header">
			<div class="uni_srch_bar">
				<div class="tit"><h1><spring:message code="srch.unified.search" text="" /></h1></div>
				<div class="logo"><img src="http://design7.naonsoft.com//resources/biz/search/img/logo_naon.png" alt=""></div>
				<div id="srch_field" class="srch_field">
					<fieldset>
						<legend><spring:message code="srch.text.search" text="" /></legend>
						<div class="srch_bar">
<!-- 							<input id="srch_input" name="" type="text" title="검색어" placeholder="검색어" autocomplete="off" class="input_txt"> -->
							<input class="input_txt" name="query" id="query" type="text" value="${searchResult.query }" onKeypress="javascript:pressCheckEnter((event),this);" autocomplete="off"/>
							<a href="#srch_suggest" class="srch_arw"><span><spring:message code="srch.text.autocomplete.open" text="" /></span></a>
							<button type="button" title="검색" class="btn btn_ico" onClick="javascript:goSearch();"><i class="ico ico_srch"><span><spring:message code="srch.text.search" text="" /></span></i></button>
						</div>
					</fieldset>
					<div class="srch_suggest"  id="srch_suggest" >
						<div class="keywords_box">
							<div id="suggest_kwd" onclick="hideLayer('suggest_kwd');showLayer('recomm_kwd');" class="suggest_kwd" >
								<div class="kwd_tit">
									<div class="tit"><strong><spring:message code="srch.text.suggest.search" text="" /></strong></div>
								</div>
							</div>
<!-- 							<div id="recomm_kwd" onclick="hideLayer('recomm_kwd');showLayer('suggest_kwd');" class="recomm_kwd" style="display:none;"> -->
							<div id="recomm_kwd" class="recomm_kwd" style="display:none;">
								<div class="kwd_tit">
									<div class="tit"><strong><spring:message code="srch.text.recent.search" text="" /></strong></div>
									<div class="optn"><a href="#" onClick="removeAllMyKeyword();" class="del_all"><spring:message code="srch.text.all.del" text="" /></a></div>
								</div>
								<div class="kwd_lst" id="kwd_lst">
<!-- 									<ul> -->
<!-- 										<li class="selected"> -->
<!-- 											<a href="#"> -->
<!-- 												<span class="kwd">그룹웨어</span> -->
<!-- 												<span class="date">03.27</span> -->
<!-- 											</a> -->
<!-- 											<button type="button" title="삭제" class="btn_del"><i class="ico ico_close"><span>삭제</span></i></button> -->
<!-- 										</li> -->
<!-- 										<li><a href="#"><span class="kwd">업무보고 작성 가이드</span><span class="date">03.27</span></a><button type="button" title="삭제" class="btn_del"><i class="ico ico_close"><span>삭제</span></i></button></li> -->
<!-- 										<li><a href="#"><span class="kwd">프로젝트 투입현황</span><span class="date">03.26</span></a><button type="button" title="삭제" class="btn_del"><i class="ico ico_close"><span>삭제</span></i></button></li> -->
<!-- 										<li><a href="#"><span class="kwd">datepicker</span><span class="date">03.26</span></a><button type="button" title="삭제" class="btn_del"><i class="ico ico_close"><span>삭제</span></i></button></li> -->
<!-- 										<li><a href="#"><span class="kwd">날짜선택</span><span class="date">03.26</span></a><button type="button" title="삭제" class="btn_del"><i class="ico ico_close"><span>삭제</span></i></button></li> -->
<!-- 										<li><a href="#"><span class="kwd">결함 리포트</span><span class="date">03.24</span></a><button type="button" title="삭제" class="btn_del"><i class="ico ico_close"><span>삭제</span></i></button></li> -->
<!-- 									</ul> -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="srch_option">
					<div class="btn_drop detail_drop">
						<button type="button" data-toggle="dropdown" class="btn drop_tgl" onClick="changeDetailQuery()"><spring:message code="srch.text.detail.search" text="" /></button>
						<div class="drop_box unhide">
							<input type="text" id="f_search" value="" class="input_txt" style="border:none;font-size: 17px;font-weight: bold;" readonly  >			
							<hr>
							<div class="basic_input">
							   <label for="df1" class="tit"><spring:message code="srch.text.default.search" text="" /></label>
							   <input id="df1" name="const" type="text" value="" class="input_txt" onkeyup="printText()">
							   <label class="guide_txt"><input id="or_check" type="checkbox" value="" class="input_chk" onclick="printText()"> <spring:message code="srch.text.include.contents" text="" /></label>
							</div>
							<div class="more_input">
							   <label for="df2" class="tit"><spring:message code="srch.text.detail.search" text="" /></label>
							   <input name="" id="df2" type="text" placeholder="<spring:message code="srch.text.equals.word" text="" />" class="input_txt" onkeyup="printText()">
							   <input name="" id="df3" type="text" title="<spring:message code="srch.text.default.word" text="" />" placeholder="<spring:message code="srch.text.default.word" text="" />" class="input_txt" onkeyup="printText()">
							   <input name="" id="df4" type="text" title="제외하는 단어" placeholder="<spring:message code="srch.text.exection.word" text="" />" class="input_txt" onkeyup="printText()">							   
							   <div class="guide_txt"><spring:message code="srch.text.divide.word" text="" /></div>
							</div>
							<div class="btn_area">
								<button type="button" class="btn btn_pri" onClick="detailSearch()"><strong><spring:message code="srch.text.search" text="" /></strong></button>
								<button type="button" class="btn" onClick="init()"><spring:message code="srch.text.init" text="" /></button>
							</div>
						</div>
					</div>
					<label class="re_srch"><input name="" type="checkbox" value="" class="input_chk"  id="reChk" onclick="javascript:resultReSearch();"><spring:message code="srch.text.requery" text="" />  </label>
				</div>
			</div>
			<div class="uni_srch_nav">
				<div class="srch_nav">
					<ul class="nav nav_pills">
						<c:forEach var="indexList" items="${searchResult.indexTabList}" varStatus="status">
							<c:set var="count" value="${status.count}" />
							<c:choose>
								<c:when test="${count < 9 }">
									<li id="indexlist${count}" class="<c:if test="${fn:contains(searchResult.index, indexList.indexName )}">active</c:if>" ><a href="#none"  onclick="goIndexSearch('<c:out value="${indexList.indexName}" />');"><c:out value="${indexList.indexKorName}" /><span class="count"><c:out value="${indexList.indexTotalCount}" /></span></a></li>					
								</c:when>  
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div id="uni_srch_content" class="uni_srch_content">
			<div class="area_main">
				<div class="result_top">
					<div class="fl">
						<strong>${searchResult.query}</strong><spring:message code="srch.text.input.all" text="" /> <strong>${searchResult.totalCount }</strong><spring:message code="srch.text.input.document" text="" />
					</div>
					<c:if test="${searchResult.totalCount ne '0'}">
					<div class="fr">
						<div class="combobox">
							<button type="button" data-toggle="dropdown" title="정렬순서" class="select_value"></button>
							<ul class="drop_menu pull_right">
								<li><input name="a" id="a2" type="radio" value="SCORE" class="input_rdo" onClick="javascript:goSorting('SCORE/DESC');" <c:if test="${searchResult.sort eq 'SCORE/DESC'}">checked</c:if>><label for="a2"><spring:message code="srch.text.rank" text="" /></label></li>
								<li><input name="a" id="a1" type="radio" value="doc_reg_dt" class="input_rdo" onClick="javascript:goSorting('doc_reg_dt');" <c:if test="${searchResult.sort eq 'doc_reg_dt'}">checked</c:if>><label for="a1"><spring:message code="srch.text.date" text="" /></label></li>
							</ul>						
						</div>			
					</div>
					</c:if>
				</div>			
				<c:if test="${searchResult.totalCount eq '0'}"> 
					<div class="result_none hide" style="display: block;">
					   <div class="guide_area">
						 <ul class="bu_lst">
							 <li><spring:message code="srch.text.nodata.one" text="" /></li>
							 <li><spring:message code="srch.text.nodata.two" text="" /></li>
							 <li><spring:message code="srch.text.nodata.tree" text="" /></li>
							 <li><spring:message code="srch.text.nodata.four" text="" /></li>
							 <li><spring:message code="srch.text.nodata.five" text="" /></li>
						 </ul>
					   </div>
					</div>
	 			 </c:if>
			<c:forEach var="indexResultList" items="${indexResult}" varStatus="status">
						<c:set var="index" value="${indexResultList.indexName}" /> 
						<c:set var="cnt" value="${indexResultList.indexTotalCount}" /> 
                  <c:choose>
                        <c:when test="${index  eq  'board' && cnt ne '0'}">
                           <%@ include file="./result/board.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'doc' && cnt ne '0'}">
                           <%@ include file="./result/doc.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'eapp' && cnt ne '0'}">
                           <%@ include file="./result/eapp.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'eml' && cnt ne '0'}">
                           <%@ include file="./result/eml.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'gapp' && cnt ne '0'}">
                           <%@ include file="./result/gapp.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'note' && cnt ne '0'}">
                           <%@ include file="./result/note.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'org'  && cnt ne '0'}">
                           <%@ include file="./result/org.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'prj' && cnt ne '0'}">
                           <%@ include file="./result/prj.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'smw' && cnt ne '0'}">
                           <%@ include file="./result/smw.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'wiki'  && cnt ne '0'}">
                           <%@ include file="./result/wiki.jsp" %> 
                        </c:when>
                        <c:when test="${index  eq  'wor'  && cnt ne '0'}">
                           <%@ include file="./result/wor.jsp" %> 
                        </c:when>            
                          <c:otherwise>
                          </c:otherwise>
                     </c:choose>
						</c:forEach> 
						
						<!-- 페이징 -->                                              
						 <!-- 페이징 -->                  
                  <c:if test="${searchResult.individual ne ''}"> 
                  <div class="pagination">  
                     <ul>
                        <c:if test="${pageResult.startPageNo > 0}">
                           <li <c:if test="${searchResult.pageNo eq 1}">class="disabled"</c:if>><a class="page_frst" href="#" onClick="movePage('${pageResult.firstPageNo}');"><span>First</span></a></li>
                           <li><a class="page_prev" href="#" onClick="movePage('${pageResult.prevPageNo}');"><span>Prev</span></a></li>
                           <c:set var="page" value="${searchResult.pageNo}"/>
                           <c:forEach var="nowPage" begin="${pageResult.startPageNo}" end="${pageResult.endPageNo}"  step="1">
                                  <c:choose>
                                         <c:when test="${nowPage eq page}">
                                             <li class="active"><a onClick="movePage('${nowPage}');">${nowPage}</a></li>
                                         </c:when>                 
                                         <c:otherwise>
                                             <li><a href="#" onClick="movePage('${nowPage}');">${nowPage}</a></li>
                                         </c:otherwise>
                                     </c:choose>
                           </c:forEach>            
                           <li><a href="#" class="page_next" onClick="movePage('${pageResult.nextPageNo}');"><span>Next</span></a></li>
                           <li <c:if test="${searchResult.pageNo eq pageResult.finalPageNo}">class="disabled"</c:if>><a href="#" class="page_last" onClick="movePage('${pageResult.finalPageNo}');"><span>Last</span></a></li>
                        </c:if>
                     </ul>
                  </div>
                  </c:if>
			</div>
			<div class="area_aside">
				<div class="aside_cont">
					<div class="uni_srch_optn">
						<div class="optn_box">
							<div class="tit"><strong><spring:message code="srch.text.range" text="" /> </strong></div>
							<div class="cont">
								<ul class="rdo_ul">
									<li class="<c:if test="${'TOTAL' eq searchResult.range || '' eq searchResult.range }">active</c:if>"><label><input name="ra" type="radio" value="" class="input_rdo" checked onClick="setDate('TOTAL')"> <spring:message code="srch.index.name.ALL" text="" /></label></li>
									<li class="<c:if test="${'W' eq searchResult.range  }">active</c:if>"><label><input name="ra" type="radio" value="" class="input_rdo" onClick="setDate('W')"> <spring:message code="srch.text.range.week" text="" /></label></li>
									<li class="<c:if test="${'M' eq searchResult.range  }">active</c:if>"><label><input name="ra" type="radio" value="" class="input_rdo" onClick="setDate('M')"> <spring:message code="srch.text.range.month" text="" /></label></li>
									<li class="<c:if test="${'3M' eq searchResult.range  }">active</c:if>"><label><input name="ra" type="radio" value="" class="input_rdo" onClick="setDate('3M')"> <spring:message code="srch.text.range.3month" text="" /></label></li>
									<li class="<c:if test="${'6M' eq searchResult.range  }">active</c:if>"><label><input name="ra" type="radio" value="" class="input_rdo" onClick="setDate('6M')"> <spring:message code="srch.text.range.6month" text="" /></label></li>
									<li class="<c:if test="${'SELECT' eq searchResult.range  }">active</c:if>">
										<label><input name="ra" type="radio" value="" class="input_rdo"> <spring:message code="srch.text.range.choise" text="" /></label>
										<div class="period">
											<input name="startDate" value="${searchResult.startDate}"  id="startDate" type="text" title="검색기간 시작일" class="input_date" <c:if test="${'SELECT' ne searchResult.range  }">disabled</c:if>   autocomplete="off" >
											<span class="ds">-</span>
											<input name="endDate" value="${searchResult.endDate}"   id="endDate" type="text" title="검색기간 종료일" class="input_date" <c:if test="${'SELECT' ne searchResult.range  }">disabled</c:if> autocomplete="off">
											<button type="button" class="btn btn_submit" <c:if test="${'SELECT' ne searchResult.range  }">disabled</c:if> onClick="setDate('SELECT')"><spring:message code="srch.text.range.use" text="" /></button>
											<input type="hidden" name="startDate"  value="${searchResult.startDate}"> 
											<input type="hidden" name="endDate"  value="${searchResult.endDate}"> 
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="optn_box">
							<div class="tit"><strong><spring:message code="srch.index.name.ALL" text="" /></strong></div>
							<div class="cont">
								<ul class="chk_ul">
									<li class="<c:if test="${fn:indexOf(searchResult.searchField, 'TOTAL') gt -1 }">active</c:if>"><label><input name="ca" type="checkbox" <c:if test="${fn:indexOf(searchResult.searchField, 'TOTAL') gt -1 }">checked</c:if> value="TOTAL" class="input_chk" onClick="goSearchField('TOTAL');" > <spring:message code="srch.index.name.ALL" text="" /></label></li>
									<li class="<c:if test="${fn:indexOf(searchResult.searchField, 'title') gt -1 }">active</c:if>"><label><input name="ca" type="checkbox" <c:if test="${fn:indexOf(searchResult.searchField, 'title') gt -1 }">checked</c:if> value="title" class="input_chk"  onClick="goSearchField('title');" > <spring:message code="srch.text.title" text="" /></label></li>
									<li class="<c:if test="${fn:indexOf(searchResult.searchField, 'content') gt -1 }">active</c:if>"><label><input name="ca" type="checkbox" <c:if test="${fn:indexOf(searchResult.searchField, 'content') gt -1 }">checked</c:if> value="content" class="input_chk" onClick="goSearchField('content');" > <spring:message code="srch.text.content" text="" /></label></li>
									<li class="<c:if test="${fn:indexOf(searchResult.searchField, 'owner') gt -1 }">active</c:if>"><label><input name="ca" type="checkbox" <c:if test="${fn:indexOf(searchResult.searchField, 'owner') gt -1 }">checked</c:if>  value="owner" class="input_chk" onClick="goSearchField('owner');" > <spring:message code="srch.text.writer" text="" /></label></li>
									<li class="<c:if test="${fn:indexOf(searchResult.searchField, 'attach') gt -1 }">active</c:if>"><label><input name="ca" type="checkbox"  <c:if test="${fn:indexOf(searchResult.searchField, 'attach') gt -1 }">checked</c:if> value="attach" class="input_chk" onClick="goSearchField('attach');" > <spring:message code="srch.text.attach" text="" /></label></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="page_top_lyr" class="page_top_lyr">
		<button type="button" id="page_top" title="TOP" class="page_top"><span>TOP</span></button>
	</div>
</div>
<!-- 사용자 정보 레이어 -->
<div id="user_info_dialog" title="사용자 정보">
	<div class="gw_user_lyr">
		<div class="user_info">
			<div class="photo"><img src="http://design7.naonsoft.com//resources/common/img/@tmp_woman13.jpg" alt=""></div>
			<table class="info_tbl">
				<tr>
					<th scope="row">이름</th>
					<td><strong>김설현</strong> <span class="id">&lt;shkim94&gt;</span></td>
				</tr>
				<tr>
					<th scope="row">부서</th>
					<td>UX디자인팀</td>
				</tr>
				<tr>
					<th scope="row">직위</th>
					<td>사원</td>
				</tr>
				<tr>
					<th scope="row">휴대전화</th>
					<td>010-1234-5678</td>
				</tr>
				<tr>
					<th scope="row">회사전화</th>
					<td>075-7500-1234</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td><a href="#">shkim94@naonsoft.com</a></td>
				</tr>
			</table>
		</div>
		<div class="toolbar">
			<button type="button" class="btn">메일보내기</button>
			<button type="button" class="btn">쪽지보내기</button>
		</div>
	</div>
</div>
</form>
<!--// 사용자 정보 레이어 -->
</body>
</html>

