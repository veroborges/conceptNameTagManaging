<%@ include file="/WEB-INF/template/include.jsp"%>

<openmrs:require privilege="View Concept Classes" otherwise="/login.htm" redirect="/module/conceptsearch/manageConceptName.form" />

<%@ include file="/WEB-INF/template/header.jsp"%>

<!-- Tell 1.7+ versions of core to not include JQuery themselves. Also, on 1.7+ we may get different jquery and jquery-ui versions than 1.3.2 and 1.7.2 -->
<c:set var="DO_NOT_INCLUDE_JQUERY" value="true"/>

<!-- Include css from conceptmanagement module -->
<openmrs:htmlInclude file="${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery/autocomplete/css/jquery.autocomplete.css" />

<!-- Include javascript from conceptmanagement module -->
<openmrs:htmlInclude file='${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery/autocomplete/jquery.autocomplete.min.js'/>
<openmrs:htmlInclude file='${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery/autocomplete/jquery.js'/>
<openmrs:htmlInclude file="${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery-ui/js/jquery-ui-1.7.2.custom.min.js"/>
<openmrs:htmlInclude file='${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery/autocomplete/jquery.autocomplete.js'/>

<h2><spring:message code="conceptsearch.manageconceptnameheading" /></h2>
<br />
<spring:hasBindErrors name="conceptQuery">
	<spring:message code="fix.error"/>
	<div class="error">
		<c:forEach items="${errors.allErrors}" var="error">
			<spring:message code="${error.code}" text="${error.code}"/><br/>
		</c:forEach>
	</div>
	<br />
</spring:hasBindErrors>
<form method="post">
<div class="boxHeader"><b><spring:message code="Concept.find" /></b></div>
<div class="box">
<table>
	<tr>
		<td><input id="conceptQuery" type="text" name="conceptQuery" size="25"
			value="${conceptSearch.searchQuery}">
			<script>
			$("#conceptQuery").autocomplete("<%=request.getContextPath()%>/module/conceptsearch/autocomplete.form");
			</script></td>
	</tr>
</table>
</div>
</form>
<br />
<openmrs:portlet url="searchresult" id="searchresult" moduleId="conceptsearch" />

<%@ include file="/WEB-INF/template/footer.jsp"%>