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

<body>
<p>test</p>
-------------------------------
<p>${indexResult}</p>
=================
<c:forEach var="index" items="${indexResult}">
    <p>${index.indexName}</p>
</c:forEach>
-------------------------------
<p>${searchResult}</p>
-------------------------------
<p>${pageResult}</p>
</body>
</html>