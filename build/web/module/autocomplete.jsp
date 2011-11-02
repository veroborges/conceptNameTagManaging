<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.openmrs.module.conceptsearch.AutocompleteHelper"%>
<%
	AutocompleteHelper ah = new AutocompleteHelper();

	String query = request.getParameter("q");

	List<String> concepts = ah.getAutocompleteConcepts(query);

	Iterator<String> iterator = concepts.iterator();
	while(iterator.hasNext()) {
		String concept = (String)iterator.next();
		out.println(concept);
	}
%>
