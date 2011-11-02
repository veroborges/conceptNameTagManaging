<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
Parameters:
	conceptsPerPage: (integer, default = 25) tells how many concepts should be displayed
	page: page number, or previous or next
--%>

<%--
	passed from controller:
	* searchResult: list of concepts
--%>
<script type="text/javascript" language="JavaScript">
<!--
jQuery(document).ready(function() {
  $('#conceptsPerPage').change(function()
  {
	  window.location.replace( window.location.pathname  + '?count='+ $(this).attr('value'));
  });
});
//-->
</script>
<div class="boxHeader">
<form name="frmConceptCount">
<div style="float:left;"><b><spring:message code="conceptsearch.searchresults" /></b>&nbsp;<c:if test="${!(searchResult == null)}">(${searchResult.nrOfElements} <spring:message code="conceptsearch.resultsreturned" />)</c:if></div>
<div style="float:right;">Show <select id="conceptsPerPage" size="1">
							<option <c:if test="${searchResult.pageSize==25}"> selected </c:if> value="25">25</option>
							<option <c:if test="${searchResult.pageSize==50}"> selected </c:if> value="50">50</option>
							<option <c:if test="${searchResult.pageSize==100}"> selected </c:if> value="100">100</option>
							<option <c:if test="${searchResult.pageSize==10000}"> selected </c:if> value="-1"><spring:message code="conceptsearch.all" /></option>
						</select><spring:message code="conceptsearch.conceptsperpage" /></div></form>
						&nbsp;
</div>

<c:if test="${searchResult != null}">
<div class="box">
<span class="openmrsSearchDiv">
<c:choose>
<c:when test="${searchResult.nrOfElements==0}">
	<div><spring:message code="conceptsearch.noresults" />.</div>
</c:when>
<c:otherwise>

<table class="openmrsSearchTable">
	<tr>
		<th></th>
		<th><spring:message code="Concept" /><a href="?sort=conceptName&order=desc"><img style="width: 14px; height: 14px;" border="0" src="<%=request.getContextPath()%>/images/movedown.gif"></a><a href="?sort=conceptName&order=asc"><img style="width: 14px; height: 14px;" border="0" src="<%=request.getContextPath()%>/images/moveup.gif"></a></th>
		<th><spring:message code="Concept.conceptClass" /><a href="?sort=conceptClass&order=desc"><img style="width: 14px; height: 14px;" border="0" src="<%=request.getContextPath()%>/images/movedown.gif"></a><a href="?sort=conceptClass&order=asc"><img style="width: 14px; height: 14px;" border="0" src="<%=request.getContextPath()%>/images/moveup.gif"></a></th>
		<th><spring:message code="Concept.datatype" /><a href="?sort=conceptDatatype&order=desc"><img style="width: 14px; height: 14px;" border="0" src="<%=request.getContextPath()%>/images/movedown.gif"></a><a href="?sort=conceptDatatype&order=asc"><img style="width: 14px; height: 14px;" border="0" src="<%=request.getContextPath()%>/images/moveup.gif"></a></th>
		<!-- <th>Other Names</th> -->
		<th><spring:message code="conceptsearch.numberofobs" /><a href="?sort=numberOfObs&order=desc"><img style="width: 13px; height: 13px;" border="0" src="<%=request.getContextPath()%>/images/movedown.gif"></a><a href="?sort=numberOfObs&order=asc"><img style="width: 14px; height: 14px;" border="0" src="<%=request.getContextPath()%>/images/moveup.gif"></a></th>
	</tr>

	<c:forEach var="concept" items="${searchResult.pageList}" varStatus="rowStatus">
		<tr class='${rowStatus.index % 2 == 0 ? "evenRow" : "oddRow"}'>
			<td class="searchIndex">${rowStatus.index + (searchResult.page * searchResult.pageSize + 1)}.</td>
			<td><a class="searchHit"
				href="viewConcept.form?conceptId=${concept.conceptId}" title="${concept.conceptDescription}">${concept.conceptName}</a></td>
			<td>${concept.conceptClass}</td>
			<td>${concept.conceptDatatype}</td>
			<!--  <td>${concept.otherNames}</td> -->
			<td>${concept.numberOfObs}</td>
		</tr>
	</c:forEach>
</table>

	

<table><tr><td> <spring:message code="conceptsearch.page" />
<c:if test="${!searchResult.firstPage}">
<a href="?page=previous">&lt;&lt; <spring:message code="general.previous" /></a>
</c:if>
</td> 
<td> <c:forEach begin="${searchResult.firstLinkedPage}" end="${searchResult.lastLinkedPage}" var="crtpg">
<c:choose>
<c:when test="${crtpg == searchResult.page}">
<c:out value="${crtpg+1}"/> &nbsp;
</c:when>
<c:otherwise>
<a href="?page=<c:url value="${crtpg}"></c:url>"><c:out value="${crtpg+1}"/></a>
&nbsp;
</c:otherwise>
</c:choose>


</c:forEach>
</td>
<td>
<c:if test="${!searchResult.lastPage}">
<a href="?page=next"><spring:message code="general.next" /> &gt;&gt;</a>
</c:if>
</td>
</tr>
</table> 


</c:otherwise>
</c:choose>
</span>
</div>
</c:if>
