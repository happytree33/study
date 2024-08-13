<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><% request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				
	<!-- 직원 <spring:message code="srch.text.search.result" text=""  /> -->
	<div class="result_box">
		<div class="tit_bar">
			<h2 class="tit"><strong>${indexResultList.indexKorName}</strong>
			<spring:message code="srch.text.search.result" text=""  />
			<span class="count">(${indexResultList.indexTotalCount})</span></h2>		
		</div>
		<c:forEach var="indexItemList" items="${indexResultList.items}" varStatus="status">
			<div class="result_lst user_lst">
				<ul class="rs_ul">
					<li class="rs_li">
						<div class="user_box">
							<div class="photo"><img src="http://design7.naonsoft.com//resources/common/img/@tmp_man.jpg" alt=""></div>
							
							<div class="user_info">
								<div class="name"><a href="#"><c:out value="${indexItemList.doc_reg_user_name}" escapeXml="false" /></a>
									<c:out value="${indexItemList.doc_id}"  escapeXml="false" />
								</div>
								<table class="info_tbl">  
									<tr>
										<th scope="row">소속부서</th>        
										<td><c:out value="${indexItemList.doc_reg_dept_name}" escapeXml="false" /></td>
									</tr>
									<tr>
										<th scope="row">직책(직위)</th>
										<td><c:out value="${indexItemList.doc_reg_pos_name}" escapeXml="false" /></td>
									</tr>
									<tr>
										<th scope="row">이메일</th>
										<td><c:out value="${indexItemList.doc_reg_cmp_email}" escapeXml="false" /></td>
									</tr>
									<tr>
										<th scope="row">회사전화</th>
										<td><c:out value="${indexItemList.doc_reg_cmp_phone}" escapeXml="false" /></td>
									</tr>
								</table>
							</div>

						</div>
					</li>
				</ul>
			</div>
		</c:forEach>	
		<c:if test="${searchResult.index eq 'TOTAL' && indexResultList.indexTotalCount ne '0'}">
			<div class="result_more">
				<a href="#none" onclick="goIndexSearch('<c:out value="${indexResultList.indexName}" />');" >${indexResultList.indexKorName} <spring:message code="srch.text.more" text=""  /><i class="ico ico_next"></i></a>
			</div>
		</c:if>
	</div>
	<!--// 직원 <spring:message code="srch.text.search.result" text=""  /> -->
