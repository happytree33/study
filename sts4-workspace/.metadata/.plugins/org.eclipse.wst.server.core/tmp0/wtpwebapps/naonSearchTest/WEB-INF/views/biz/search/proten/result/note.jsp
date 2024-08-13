<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%><% request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="result_box">
		<div class="tit_bar">
			<h2 class="tit"><strong>${indexResultList.indexKorName}</strong>
			<spring:message code="srch.text.search.result" text=""  />
			<span class="count">(${indexResultList.indexTotalCount})</span></h2>
		</div>
		<c:forEach var="indexItemList" items="${indexResultList.items}" varStatus="status">
			<div class="result_lst">
				<ul class="rs_ul">
					<li class="rs_li">
						<div class="sub">
							<a href="#" class="subject"><c:out value="${indexItemList.doc_subject}" escapeXml="false" /></a>
							<c:out value="${indexItemList.doc_id}" escapeXml="false" />
						</div>
						<div class="desc">
						<c:out value="${indexItemList.doc_content}" escapeXml="false"  />
						</div>
						<div class="info">
							<span class="dir">
								<a href="#" title="<c:out value="${indexItemList.field_category_name_path}" escapeXml="false"  />">
								<c:out value="${indexItemList.field_category_name_path}"  escapeXml="false" /></a>
							</span>
							<span class="user">
								<em>발신자:</em><a href="#" class="ui"><c:out value="${indexItemList.doc_reg_user_name}" escapeXml="false" /></a>
							</span>
							<span class="user">
								<em>수신자:</em><a href="#" class="ui"><c:out value="${indexItemList.recv_name}" escapeXml="false" /></a>
							</span>
<!-- 						<span class="date">
								<em><spring:message code="srch.text.writer" text=""  />:</em>
								<c:out value="${indexItemList.FIELD_MOD_DATE}" escapeXml="false" />
							</span> -->
							<fmt:parseDate var="dateString" value="${indexItemList.doc_reg_dt}" pattern="yyyyMMddHHmmss" />
							<span class="date">
								<em><spring:message code="srch.text.writer.date" text=""  />:</em>
								<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss" />
							</span>
						</div>
						<!-- 첨부파일 -->
<%-- 						<c:set var="attachCount" value="${fn:length(indexItemList.FIELD_FILE)} " /> --%>
						<%-- 
							<c:if test="${fn:length(indexItemList.FIELD_FILE) > 0 }">
							<div class="atch_box">
								<div class="tit"><strong><spring:message code="srch.text.attach" text=""  /></strong></div>
								<div class="atch_lst">
									<ul>
										<c:forEach var="attachList"  items="${indexItemList.FIELD_FILE}" varStatus="attachListStatus"  >
											<li class="prvw_open">
												<div class="atch_info">
													<i class="fico fico_ppt"><span>[<c:out value="${attachList.FIELD_FILE_EXTSN}" />]</span></i>
													<a href="#"><c:out value="${attachList.FIELD_REAL_FILE_NAME}"  escapeXml="false"  /></a>
													<span class="size"><c:out value="${attachList.FIELD_FILE_SIZE}"  escapeXml="false"  />KB</span>
													<a href="#" class="prvw"><spring:message code="srch.text.attach.view" text=""  /></a>
												</div>
												<div class="atch_prvw"><c:out value="${attachList.FIELD_FILE_CONTENT}" escapeXml="false"  /></div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:if>
						--%>
						<!--// 첨부파일 -->
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
<!--// 게시판 <spring:message code="srch.text.search.result" text=""  /> -->