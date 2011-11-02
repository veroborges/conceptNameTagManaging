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

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.module.conceptsearch.ConceptSearch;
import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;


/**
 * AbstractSearchFormController provides common methods, which
 * are used in BasicSearchFormController and AdvancedSearchFormController.
 * 
 */
public abstract class AbstractSearchFormController {

	/** Logger for this class and subclasses */
    protected final Log log = LogFactory.getLog(getClass());
    
    protected final int DEFAULT_RESULT_PAGE_SIZE = 25;
    

    public void setConceptsPerPage(ModelMap model, WebRequest request, HttpSession session) {    	
    	//set count
    	String count = request.getParameter("count");
    
    	PagedListHolder resListHolder = (PagedListHolder) session.getAttribute("sortResults");
    	if (resListHolder != null) {
    		int cCount = Integer.parseInt(count);
    		if (cCount == -1)
    			cCount = 10000;
    		resListHolder.setPageSize(cCount);
    		resListHolder.setPage(0);
    		model.addAttribute("searchResult", resListHolder);
    	} else {
    		log.warn("Results are gone");
    	}
    }

    public void switchToPage(@RequestParam("page") String page, ModelMap model, WebRequest request, HttpSession session) {
    	
    	PagedListHolder resListHolder = (PagedListHolder) session.getAttribute("sortResults");
    	if (resListHolder != null) {
    		if ("previous".equals(page)) {
    			resListHolder.previousPage();
    		} else if ("next".equals(page)) {
    			resListHolder.nextPage();    			
    		} else {
        		resListHolder.setPage(Integer.parseInt(page));
    		}
    		model.addAttribute("searchResult", resListHolder);
    	} else {
    		log.warn("Results are gone");
    	}
    }

    public void sortResultsView(ModelMap model, WebRequest request, HttpSession session) {
    	String sortFor = request.getParameter("sort");
    	boolean asc = true;
    	
    	if (request.getParameter("order") != null && request.getParameter("order").equals("desc"))
    		asc = false;
    	
    	PagedListHolder resListHolder = (PagedListHolder) session.getAttribute("sortResults");
    	ConceptSearch cs = (ConceptSearch) session.getAttribute("conceptSearch");
    	if (cs != null)
    		model.addAttribute("conceptSearch", cs);
    	
    	if (resListHolder != null) {
//    		List temp = resListHolder.getSource();
//    		Collections.sort((List<ConceptSearchResult>) temp, new ConceptComparator(sortFor, asc));
    		resListHolder.setSort(new MutableSortDefinition(sortFor, true, asc));
    		resListHolder.resort();
    		model.addAttribute("searchResult", resListHolder);
    	} else {
    		log.warn("Results are gone");
    	}
    }

}