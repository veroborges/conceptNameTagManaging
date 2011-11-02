/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package org.openmrs.module.conceptsearch.web.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import javax.servlet.http.HttpSession;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptDatatype;
import org.openmrs.api.context.Context;
import org.openmrs.module.conceptsearch.ConceptSearch;
import org.openmrs.module.conceptsearch.ConceptSearchResult;
import org.openmrs.module.conceptsearch.ConceptSearchService;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

/**
 * Controller to handle all searches done by the advancedsearch.jsp. All search criteria will be
 * stored in a ConceptSearch object and the results will be kept in session, because other methods
 * will need them.
 * 
 * 
 */
@Controller
public class AdvancedSearchFormController extends AbstractSearchFormController {
	
	
	@ModelAttribute("dataTypes")
	public List<ConceptDatatype> populateDataTypes() {
		ConceptSearchService service = (ConceptSearchService) Context.getService(ConceptSearchService.class);
		return service.getAllConceptDatatypes();
	}
	
	@ModelAttribute("conceptClasses")
	public List<ConceptClass> populateConceptClasses() {
		ConceptSearchService service = (ConceptSearchService) Context.getService(ConceptSearchService.class);
		return service.getAllConceptClasses();
	}
	
	@RequestMapping(value = "/module/conceptsearch/advancedSearch", method = RequestMethod.GET)
	public void showAdvancedSearch(ModelMap model, WebRequest request, HttpSession session) {
		
		//reset all session objects used by this controller
		session.removeAttribute("searchResult");
		session.removeAttribute("sortResults");
		session.removeAttribute("conceptSearch");
		session.removeAttribute("historyQuery");
	}
	
	@RequestMapping(value = "/module/conceptsearch/advancedSearch", method = RequestMethod.GET, params = "count")
	public void setConceptsPerPage(ModelMap model, WebRequest request, HttpSession session) {
		super.setConceptsPerPage(model, request, session);
	}
	
	@RequestMapping(value = "/module/conceptsearch/advancedSearch", method = RequestMethod.GET, params = "page")
	public void switchToPage(@RequestParam("page") String page, ModelMap model, WebRequest request, HttpSession session) {
		super.switchToPage(page, model, request, session);
	}
	
	@RequestMapping(value = "/module/conceptsearch/advancedSearch", method = RequestMethod.GET, params = "sort")
    public void sortResultsView(ModelMap model, WebRequest request, HttpSession session) {
		super.sortResultsView(model, request, session);
	}
	

	@RequestMapping(value = "/module/conceptsearch/advancedSearch", method = RequestMethod.POST)
	public void performAdvancedSearch(ModelMap model, WebRequest request, HttpSession session) {
		ConceptSearchService searchService = (ConceptSearchService) Context.getService(ConceptSearchService.class);
		Collection<Concept> rslt = new Vector<Concept>();
		ConceptSearch cs = new ConceptSearch("");
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date dateFrom = null;
		Date dateTo = null;
		
		//get all search parameters
		String searchName = request.getParameter("conceptQuery");
		String searchDescription = request.getParameter("conceptDescription");
		String[] searchDatatypes = request.getParameterValues("conceptDatatype");
		String[] searchClassesString = request.getParameterValues("conceptClasses");
		String searchIsSet = request.getParameter("conceptIsSet");
		
		String searchDateFrom = request.getParameter("dateFrom");
		String searchDateTo = request.getParameter("dateTo");
		String[] searchUsedAs = request.getParameterValues("conceptUsedAs");
		
		try {
			if (searchDateFrom != null && !searchDateFrom.isEmpty())
				dateFrom = df.parse(searchDateFrom);
			if (searchDateTo != null && !searchDateTo.isEmpty())
				dateTo = df.parse(searchDateTo);
		}
		catch (ParseException ex) {
			log.error("Error converting strings to date ", ex);
			dateFrom = null;
			dateTo = null;
		}
		;
		
		//check for correct selections
		if (searchDatatypes == null) {
			searchDatatypes = null;
			cs.setDataTypes(new Vector<ConceptDatatype>());
		}
		
		if (searchClassesString == null) {
			searchClassesString = null;
			cs.setConceptClasses(new Vector<ConceptClass>());
		}
		
		if (searchIsSet == null) {
			searchIsSet = null;
			cs.setIsSet(-1);
		} else {
			cs.setIsSet(Integer.parseInt(searchIsSet));
		}
		
		if (searchDateFrom == null || searchDateFrom.isEmpty()) {
			searchDateFrom = null;
		} else {
			cs.setDateFrom(dateFrom);
		}
		
		if (searchDateTo == null || searchDateTo.isEmpty()) {
			searchDateTo = null;
		} else {
			cs.setDateTo(dateTo);
		}
		
		if (searchUsedAs == null) {
			cs.setConceptUsedAs(null);
		} else {
			List<String> usedAsList = Arrays.asList(searchUsedAs);
			cs.setConceptUsedAs(usedAsList);
		}
		
		//maintain cs object: keep track of all entered information
		cs.setSearchQuery(searchName);
		
		if (searchDescription != null) {
			String[] searchTerms = searchDescription.split(" ");
			List<String> searchTermsList = Arrays.asList(searchTerms);
			cs.setSearchTerms(searchTermsList);
		}
		
		if (searchDatatypes != null) {
			List<String> searchDatatypesList = Arrays.asList(searchDatatypes);
			List<ConceptDatatype> dataTypesList = new Vector<ConceptDatatype>();
			
			for (String s : searchDatatypesList) {
				dataTypesList.add(searchService.getConceptDatatypeById(Integer.parseInt(s)));
			}
			cs.setDataTypes(dataTypesList);
		}
		
		if (searchClassesString != null) {
			List<String> searchClassesList = Arrays.asList(searchClassesString);
			List<ConceptClass> classesList = new Vector<ConceptClass>();
			
			for (String s : searchClassesList) {
				classesList.add(searchService.getConceptClassById(Integer.parseInt(s)));
			}
			cs.setConceptClasses(classesList);
		}
		
		//perform search using ConceptSearchService
		rslt = searchService.getConcepts(cs);
		
		//add the results to a DTO to avoid Hibernate's lazy loading
		List<ConceptSearchResult> resList = new ArrayList<ConceptSearchResult>();
		for (Concept c : rslt) {
			if (cs.getConceptUsedAs() == null || searchService.isConceptUsedAs(c, cs)) {
				ConceptSearchResult res = new ConceptSearchResult(c);
				res.setNumberOfObs(searchService.getNumberOfObsForConcept(c.getConceptId()));
				resList.add(res);
			}
		}
		
		// add results to ListHolder
		PagedListHolder resListHolder = new PagedListHolder(resList);
		resListHolder.setPageSize(DEFAULT_RESULT_PAGE_SIZE);

		//add results to view
		model.addAttribute("conceptSearch", cs);
		model.addAttribute("searchResult", resListHolder);
		
		//add search results to session to make them available for other methods
		session.setAttribute("conceptSearch", cs);
		session.setAttribute("searchResult", resListHolder);
		session.setAttribute("sortResults", resListHolder);
		
		
		//remember the last ten search queries
		List<ConceptSearch> historyQueries = (List<ConceptSearch>) session.getAttribute("historyQuery");
		if (historyQueries != null) {
			historyQueries.add(cs);
			
			if (historyQueries.size() > 10) {
				historyQueries.remove(historyQueries.remove(0));
			}
		} else {
			historyQueries = new ArrayList<ConceptSearch>();
			historyQueries.add(cs);
		}
		session.setAttribute("historyQuery", historyQueries);
	}
	
	@RequestMapping(value = "/module/conceptsearch/autocomplete", method = RequestMethod.GET)
	public void doAutocomplete(ModelMap model, WebRequest request, HttpSession session) {
		//ConceptSearchService searchService = (ConceptSearchService) Context.getService(ConceptSearchService.class);
		//String searchFor = request.getParameter("q");
		//List<String> autoResults = searchService.getAutocompleteConcepts(searchFor);
		//model.addAttribute("autoComplete", autoResults);
		
		// -- Autocompletehelper is used to avoid some problems -- 
		log.debug("Accessing autocomplete");
	}
	
	@RequestMapping(value = "/module/conceptsearch/advancedSearch", method = RequestMethod.GET, params = "history")
	public void loadPastSearchResults(ModelMap model, WebRequest request, HttpSession session) {
		String sHistory = request.getParameter("history");
		int iHistory = Integer.parseInt(sHistory);
		
		//get past searches
		List<ConceptSearch> historyQueries = (List<ConceptSearch>) session.getAttribute("historyQuery");
		
		//check if value is valid
		if (historyQueries != null && iHistory > 0 && iHistory <= historyQueries.size()) {
			
			ConceptSearchService searchService = (ConceptSearchService) Context.getService(ConceptSearchService.class);
			Collection<Concept> rslt = new Vector<Concept>();
			
			ConceptSearch cs = historyQueries.get(iHistory - 1);
			
			//perform search using ConceptSearchService
			rslt = searchService.getConcepts(cs);
			
			//add the results to a DTO to avoid Hibernate's lazy loading
			List<ConceptSearchResult> resList = new ArrayList<ConceptSearchResult>();
			for (Concept c : rslt) {
				if (cs.getConceptUsedAs() == null || searchService.isConceptUsedAs(c, cs)) {
					ConceptSearchResult res = new ConceptSearchResult(c);
					res.setNumberOfObs(searchService.getNumberOfObsForConcept(c.getConceptId()));
					resList.add(res);
				}
			}
			
			// add results to ListHolder
			PagedListHolder resListHolder = new PagedListHolder(resList);
			resListHolder.setPageSize(DEFAULT_RESULT_PAGE_SIZE);

			//add results to view
			model.addAttribute("conceptSearch", cs);
			model.addAttribute("searchResult", resListHolder);
			
			//add search results to session to make them available for other methods
			session.setAttribute("conceptSearch", cs);
			session.setAttribute("searchResult", resList);
			session.setAttribute("sortResults", resListHolder);
			
		} else {
			log.error("ConceptSearch (cs) index is invalid!");
		}
	}
	
}