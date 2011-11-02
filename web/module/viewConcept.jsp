<%@ include file="/WEB-INF/template/include.jsp"%>

<openmrs:require privilege="View Concept Classes" otherwise="/login.htm" redirect="/module/conceptsearch/viewConcept.form" />

<%@ include file="/WEB-INF/template/header.jsp"%>


<style type="text/css">
	#conceptTabs {
		margin: 10px auto 7px auto;
		padding-top: 5px;
		padding-left: 5px;
		padding-bottom: 2px;
		border-bottom: 1px solid navy;
		width: 99%;
	}
	
	#conceptTabs ul, #conceptTabs li {
		display: inline;
		list-style-type: none;
		padding: 0px 0px 0px 0px;
	}
	
	#conceptTabs a:link, #conceptTabs a:visited {
		border: 1px solid navy;
		font-size: small;
		font-weight: bold;
		margin-right: 8px;
		padding: 2px 10px 2px 10px;
		text-decoration: none;
		color: navy;
		background: #E0E0F0;
	}
	#conceptTabs a:link.active, #conceptTabs a:visited.active {
		border-bottom: 1px solid #FFFFFF;
	}
	#conceptTabs a.current, #conceptTabs a:link.current, #conceptTabs a:visited.current, #conceptTabs a.current:hover {
		background: #FFFFFF;
		border-bottom: 1px solid #FFFFFF;
		color: navy;
		text-decoration: none;
	}
	#conceptTabs a:hover {
		text-decoration: underline;
	}
</style>

<script type="text/javascript">
	var timeOut = null;
	addEvent(window, 'load', initTabs);

	var userId = "1";

	function initTabs() {
		var c = getTabCookie();
		if (c == null) {
			var tabs = document.getElementById("conceptTabs").getElementsByTagName("a");
			if (tabs.length && tabs[0].id)
				c = tabs[0].id;
		}
		changeTab(c);
	}
	
	function setTabCookie(tabType) {
		document.cookie = "conceptTab-" + userId + "="+escape(tabType);
	}
	
	function getTabCookie() {
		var cookies = document.cookie.match('conceptTab-' + userId + '=(.*?)(;|$)');
		if (cookies) {
			return unescape(cookies[1]);
		}
		return null;
	}
	
	function changeTab(tabObj) {
		if (!document.getElementById || !document.createTextNode) {return;}
		if (typeof tabObj == "string")
			tabObj = document.getElementById(tabObj);
		
		if (tabObj) {
			var tabs = tabObj.parentNode.parentNode.getElementsByTagName('a');
			for (var i=0; i<tabs.length; i++) {
				if (tabs[i].className.indexOf('current') != -1) {
					manipulateClass('remove', tabs[i], 'current');
				}
				var divId = tabs[i].id.substring(0, tabs[i].id.lastIndexOf("Tab"));
				var divObj = document.getElementById(divId);
				if (divObj) {
					if (tabs[i].id == tabObj.id)
						divObj.style.display = "";
					else
						divObj.style.display = "none";
				}
			}
			addClass(tabObj, 'current');
			
			setTabCookie(tabObj.id);
		}
		return false;
    }
</script>

<h2><spring:message code="conceptsearch.viewconcept" /></h2>
<br />
<h3><spring:message code="conceptsearch.viewingconcept" /> ${concept.name} (${concept.conceptId})</h3>

<div id="conceptTabs">
	<ul>		
			<li><a id="conceptOverviewTab" href="#" onclick="return changeTab(this);" hidefocus="hidefocus">Overview</a></li>
		
			<li><a id="conceptDetailsTab" href="#" onclick="return changeTab(this);" hidefocus="hidefocus">Details</a></li>	
		
			<li><a id="conceptMetadataTab" href="#" onclick="return changeTab(this);" hidefocus="hidefocus">Metadata</a></li>
	</ul>
</div>

<div id="conceptOverview" style="display:none;">
<div class="boxHeader"><spring:message code="conceptsearch.overview" /></div>
<div class="box">
<table>
	<tr>
		<td><b><spring:message code="general.id" /></b></td>
		<td>${concept.conceptId}</td>
	</tr>
	<tr>
		<td><b><spring:message code="general.name" /></b></td>
		<td>${concept.name}</td>
	</tr>
	<tr>
		<td><b><spring:message code="general.description" /></b></td>
		<td>${concept.description}</td>
	</tr>
	<tr>
		<td><b><spring:message code="Concept.conceptClass" /></b></td>
		<td>${concept.conceptClass.name}</td>
	</tr>
	<tr>
		<td><b><spring:message code="Concept.datatype" /></b></td>
		<td>${concept.datatype.name}</td>
	</tr>
</table>
</div>
</div> <!-- end conceptOverview -->

<div id="conceptDetails" style="display:none;">
<div class="boxHeader"><spring:message code="conceptsearch.details" /></div>
<div class="box">
<table>
	<tr>
		<td><b><spring:message code="general.id" /></b></td>
		<td>${concept.conceptId}</td>
	</tr>
	<tr>
		<td><b>UUID</b></td>
		<td>${concept.uuid}</td>
	</tr>
	<tr>
		<td><b><spring:message code="general.name" /></b></td>
		<td>${concept.name}</td>
	</tr>
	<tr>
		<td><b><spring:message code="general.description" /></b></td>
		<td>${concept.description}</td>
	</tr>
	<tr>
		<td><b><spring:message code="Concept.conceptClass" /></b></td>
		<td>${concept.conceptClass.name}</td>
	</tr>
	<tr>
		<td><b><spring:message code="Concept.datatype" /></b></td>
		<td>${concept.datatype.name}</td>
	</tr>
	<tr>
		<td><b><spring:message code="general.retired" /></b></td>
		<td>${concept.retired} <c:if test="${concept.retired==true}"> <spring:message code="conceptsearch.on" /> <openmrs:formatDate date="${concept.dateRetired}" type="short" /> <spring:message code="conceptsearch.by" /> ${concept.retiredBy.personName}: ${concept.retireReason}</c:if></td>
	</tr>
	<tr>
		<td><b><spring:message code="Concept.answers" /></b></td>
	</tr>
	<c:forEach var="answer" items="${concept.answers}">
		<tr>
			<td></td>
			<td><a href="?conceptId=${answer.answerConcept.conceptId}">${answer.answerConcept.name}</a></td>
		</tr>
	</c:forEach>
	<tr>
		<td><b><spring:message code="Concept.mappings" /></b></td>
	</tr>
	<c:forEach var="mapping" items="${concept.conceptMappings}">
		<tr>
			<td></td>
			<td><a href="?conceptId=${mapping.concept.conceptId}">${mapping.concept.name}</a></td>
		</tr>
	</c:forEach>
	<tr>
		<td><b><spring:message code="conceptsearch.set" /></b></td>
	</tr>
	<c:forEach var="set" items="${concept.conceptSets}">
		<tr>
			<td></td>
			<td><a href="?conceptId=${set.conceptSet.conceptId}">${set.conceptSet.name}</a> parent of <a href="?conceptId=${set.concept.conceptId}">${set.concept.name}</a></td>
		</tr>
	</c:forEach>
</table>
</div>
</div> <!-- end conceptDetails -->

<div id="conceptMetadata" style="display:none;">
<div class="boxHeader"><spring:message code="conceptsearch.metadata" /></div>
<div class="box">
<table>
	<tr>
		<td><b><spring:message code="Concept.version" /></b></td>
		<c:choose>
			<c:when test='${concept.version==""}'>
				<td><spring:message code="conceptsearch.none" /></td>
			</c:when>
			<c:otherwise>
				<td>${concept.version}</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td><b><spring:message code="conceptsearch.created" /></b></td>
		<td><spring:message code="conceptsearch.createdon" /> <openmrs:formatDate date="${concept.dateCreated}" type="short" /> <spring:message code="conceptsearch.by" /> ${concept.creator.personName} (id: ${concept.creator.userId})</td>
	</tr>
	<tr>
		<td><b><spring:message code="conceptsearch.changed" /></b></td>
		<td><spring:message code="conceptsearch.changedon" /> <openmrs:formatDate date="${concept.dateChanged}" type="short" /> <spring:message code="conceptsearch.by" /> ${concept.creator.personName} (id: ${concept.creator.userId})</td>
	</tr>
</table>
</div>
</div> <!-- end conceptMetadata -->

<%@ include file="/WEB-INF/template/footer.jsp"%>