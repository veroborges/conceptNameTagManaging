<%@ include file="/WEB-INF/template/include.jsp" %>

<openmrs:require privilege="Manage Concept Name Tags" otherwise="/login.htm" redirect="/module/conceptsearch/conceptNameTag.list" />

<%@ include file="/WEB-INF/template/header.jsp" %>

<h2><spring:message code="conceptsearch.conceptnametaglistheading"/></h2>

<a href="conceptNameTag.form"><spring:message code="conceptsearch.addtag"/></a>

<openmrs:extensionPoint pointId="org.openmrs.admin.concepts.conceptNameTagList.afterAdd" type="html" />

<br /><br />

<b class="boxHeader"><spring:message code="conceptsearch.taglisttitle"/></b>
<form method="post" class="box">
	<table>
		<tr>
			<th> </th>
			<th> <spring:message code="general.name"/> </th>
			<th> <spring:message code="general.description"/> </th>
		</tr>
		<c:forEach var="conceptNameTag" items="${conceptNameTagList}">
			<tr> 
				<td valign="top"><input type="checkbox" name="conceptNameTagId" value="${conceptNameTag.conceptNameTagId}"></td>
				<td valign="top"><a href="conceptNameTag.form?conceptNameTagId=${conceptNameTag.conceptNameTagId}">
					   ${conceptNameTag.tag}
					</a>
				</td>
				<td valign="top">${conceptNameTag.description}</td>
			</tr>
		</c:forEach>
	</table>
	
	<openmrs:extensionPoint pointId="org.openmrs.admin.concepts.conceptNameTagList.inForm" type="html" />
	
	<input type="submit" value="<spring:message code="conceptsearch.deletetag"/>" name="action">
</form>

<openmrs:extensionPoint pointId="org.openmrs.admin.concepts.conceptNameTagList.footer" type="html" />

<%@ include file="/WEB-INF/template/footer.jsp" %>