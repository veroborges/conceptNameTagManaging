<%@ include file="/WEB-INF/template/include.jsp"%>

<openmrs:require privilege="View Concept Classes" otherwise="/login.htm" redirect="/module/conceptsearch/advancedSearch.form" />

<%@ include file="/WEB-INF/template/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Tell 1.7+ versions of core to not include JQuery themselves. Also, on 1.7+ we may get different jquery and jquery-ui versions than 1.3.2 and 1.7.2 -->
<c:set var="DO_NOT_INCLUDE_JQUERY" value="true"/>

<!-- Include css from conceptmanagement module -->
<openmrs:htmlInclude file="${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery/autocomplete/css/jquery.autocomplete.css" />

<!-- Include javascript from core -->
<openmrs:htmlInclude file="/scripts/calendar/calendar.js"/>

<!-- Include javascript from conceptmanagement module -->
<openmrs:htmlInclude file='${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery/autocomplete/jquery.autocomplete.min.js'/>
<openmrs:htmlInclude file='${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery/autocomplete/jquery.js'/>
<openmrs:htmlInclude file="${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery-ui/js/jquery-ui-1.7.2.custom.min.js"/>
<openmrs:htmlInclude file='${pageContext.request.contextPath}/moduleResources/conceptsearch/scripts/jquery/autocomplete/jquery.autocomplete.js'/>

<script type="text/javascript" language="JavaScript">

jQuery(document).ready(function() {
	// register toggle functions 
	$('#divData').hide();
	$('#divClass').hide();
	$('#linkHistory').show();
	
	
	$("#linkData").click(function(){
		$('#divData').slideToggle("slow");
		return false; //Prevent the browser jump to the link anchor
	});
	
	$("#linkClass").click(function(){
		$('#divClass').slideToggle("slow");
		return false; //Prevent the browser jump to the link anchor
	});
	
	$("#linkHistory").click(function(){
		$('#rowHistory').toggle();
		$('#linkHistory').html(($('#linkHistory').html() == '<spring:message code="conceptsearch.historyenablelink" />') ? '<spring:message code="conceptsearch.historydisablelink" />' : '<spring:message code="conceptsearch.historyenablelink" />');

		return false; //Prevent the browser jump to the link anchor
	});
	
	$('#rowHistory').toggle();

	$("#conceptQuery").autocomplete("<%=request.getContextPath()%>/module/conceptsearch/autocomplete.form");
});


//-->
</script>
<h2><spring:message code="conceptsearch.advancedheading" /></h2>

<spring:hasBindErrors name="command">
	<spring:message code="fix.error"/>
	<div class="error">
		<c:forEach items="${errors.allErrors}" var="error">
			<spring:message code="${error.code}" text="${error.code}"/><br/>
		</c:forEach>
	</div>
	<br />
</spring:hasBindErrors>
<br />
<div style="float:left; width:25%;">
<div class="boxHeader"><b><spring:message code="Concept.find" /></b></div>
<div class="box">
<form method="post" name="frmSearch">
<table>
	<tr>
		<td valign="top"><spring:message code="conceptsearch.keyword" />:</td>
		<td><input id="conceptQuery" type="text" name="conceptQuery" size="25"
			value="${conceptSearch.searchQuery}"><br/><a href="#" id='linkHistory' style="display:none;"><spring:message code="conceptsearch.historyenablelink" /></a> 
		</td>
	</tr>
	<tr id="rowHistory" valign="top" >
	    <td><spring:message code="conceptsearch.history" />: 
		</td>
		<td>
			<c:set var="histIter" value="1"></c:set>	
			<c:forEach var="history" items="${historyQuery}">
				<a href='advancedSearch.form?history=${histIter}'>${histIter}. ${history.searchQuery}</a><br />
				<c:set var="histIter" value="${histIter+1}"></c:set>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td valign="top"><spring:message code="Concept.datatype" />:</td>
		<td><a href="#" id='linkData'>Show Datatypes</a> 
		<div id="divData" style="display:none;">
			<c:forEach var="dataType" items="${dataTypes}">
				<input type="checkbox" <c:if test="${fn:contains(conceptSearch.dataTypes, dataType)}"> checked </c:if> name="conceptDatatype" value="${dataType.id}">${dataType.name}<br />
			</c:forEach>
	    </div>
		</td>
	</tr>
	<tr>
		<td valign="top"><spring:message code="Concept.conceptClass" />:</td>
		<td><a href="#" id='linkClass'>Show Classes</a> 
		<div id="divClass" style="display:none;">
			<c:forEach var="class" items="${conceptClasses}">
				<input type="checkbox" <c:if test="${fn:contains(conceptSearch.conceptClasses, class)}"> checked </c:if> name="conceptClasses" value="${class.id}">${class.name}<br />
			</c:forEach>
		</div>
		</td>
	</tr>
	<tr>
		<td valign="top"><spring:message code="conceptsearch.isset" /></td>
		<td>
			<input type="checkbox" <c:if test="${conceptSearch.isSet == 1}"> checked </c:if> name="conceptIsSet" value="1" onClick="document.frmSearch.conceptIsSet[1].checked = false";><spring:message code="general.yes" /><br />
			<input type="checkbox" <c:if test="${conceptSearch.isSet == 0}"> checked </c:if> name="conceptIsSet" value="0" onClick="document.frmSearch.conceptIsSet[0].checked = false";><spring:message code="general.no" />
		</td>
	</tr>
	<tr>
		<td><spring:message code="conceptsearch.createdbetween" />:</td>
		<fmt:formatDate var="datFrom" value="${conceptSearch.dateFrom}" pattern="dd/MM/yyyy"/>
		<fmt:formatDate var="datTo" value="${conceptSearch.dateTo}" pattern="dd/MM/yyyy"/>
		<td><input type="text" name="dateFrom" size="10" value="${datFrom}" onClick="showCalendar(this)"> <spring:message code="conceptsearch.todate" /> <input type="text" name="dateTo" size="10" value="${datTo}" onClick="showCalendar(this)"></td>
	</tr>
	<tr>
	<td valign="top"><spring:message code="conceptsearch.conceptsusedas" />:</td>
	<td>
		<input type="checkbox" name="conceptUsedAs" <c:if test="${fn:contains(conceptSearch.conceptUsedAs, 'formQuestion')}"> checked </c:if> value="formQuestion"><spring:message code="conceptsearch.asformquestion" /><br />
		<input type="checkbox" name="conceptUsedAs" <c:if test="${fn:contains(conceptSearch.conceptUsedAs, 'formAnswer')}"> checked </c:if> value="formAnswer"><spring:message code="conceptsearch.asformanswer" /><br />
		<input type="checkbox" name="conceptUsedAs" <c:if test="${fn:contains(conceptSearch.conceptUsedAs, 'obsQuestion')}"> checked </c:if> value="obsQuestion"><spring:message code="conceptsearch.asobsquestion" /><br />
		<input type="checkbox" name="conceptUsedAs" <c:if test="${fn:contains(conceptSearch.conceptUsedAs, 'obsValue')}"> checked </c:if> value="obsValue"><spring:message code="conceptsearch.asobsvalue" /><br />
	</td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="action" value="<spring:message code="general.search" />">
		<a href="basicSearch.form"><spring:message code="conceptsearch.basicheading" /></a>
		</td>
	</tr>
</table>
</form>
</div>
</div>

<div style="width:74%;  overflow: hidden; float:right">
  <openmrs:portlet url="searchresult" id="searchresult" moduleId="conceptsearch" />
</div>

<div style="clear: both;"></div>
<%@ include file="/WEB-INF/template/footer.jsp"%>