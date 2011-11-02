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
import org.openmrs.Concept;
import org.openmrs.api.context.Context;
import org.openmrs.module.conceptsearch.ConceptSearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

/**
 * Controller to handle view requests for concepts
 */
@Controller
public class ConceptEditorController {
	
	/** Logger for this class and subclasses */
	protected final Log log = LogFactory.getLog(getClass());
	
	@RequestMapping(value = "/module/conceptsearch/viewConcept", method = RequestMethod.GET)
	public void showViewPage(ModelMap model, WebRequest request, HttpSession session) {
		System.out.println("show page");
	}
	
	@RequestMapping(value = "/module/conceptsearch/viewConcept", method = RequestMethod.GET, params = "conceptId")
	public void displayConceptPage(ModelMap model, WebRequest request, HttpSession session) {
		ConceptSearchService searchService = (ConceptSearchService) Context.getService(ConceptSearchService.class);
		
		String id = request.getParameter("conceptId");
		int cid = Integer.parseInt(id);
		
		Concept concept = searchService.getConcept(cid);
		
		model.addAttribute("concept", concept);
	}
	
}
