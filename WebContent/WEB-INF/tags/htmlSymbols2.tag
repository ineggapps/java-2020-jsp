<%--몸체가 있는 태그 생략하지 않고 선언한 경우 --%>
<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="trim" %>
<jsp:doBody var="content" scope="page"/>
<%--body 내용 자체를 데이터로 처리. 단, 엔터 처리는 안 된다. --%>
<c:out value="${content}" escapeXml="true"/>