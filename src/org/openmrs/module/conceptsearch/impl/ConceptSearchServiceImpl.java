package org.openmrs.module.conceptsearch.impl;

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

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptDatatype;
import org.openmrs.ConceptNameTag;
import org.openmrs.module.conceptsearch.ConceptSearch;
import org.openmrs.module.conceptsearch.ConceptSearchDAO;
import org.openmrs.module.conceptsearch.ConceptSearchService;

/**
 * Implementation of the ConceptSearchService
 * 
 * @see org.openmrs.module.conceptsearch.ConceptSearchService
 */
public class ConceptSearchServiceImpl implements ConceptSearchService {
	
	private Log log = LogFactory.getLog(this.getClass());
	
	private ConceptSearchDAO dao;
	
	public ConceptSearchServiceImpl() {
	}
	
	private ConceptSearchDAO getConceptSearchDAO() {
		return dao;
	}
	
	public void setConceptSearchDAO(ConceptSearchDAO dao) {
		this.dao = dao;
	}
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getConcept(java.lang.Integer)
	 */
	@Override
	public Concept getConcept(Integer conceptId) {
		return dao.getConcept(conceptId);
	}
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getConcepts(org.openmrs.module.conceptsearch.ConceptSearch)
	 */
	@Override
	public List<Concept> getConcepts(ConceptSearch cs) {
		return dao.getConcepts(cs);
	}
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getNumberOfObsForConcept(java.lang.Integer)
	 */
	@Override
	public Long getNumberOfObsForConcept(Integer conceptId) {
		return dao.getNumberOfObsForConcept(conceptId);
	}
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getNumberOfFormsForConcept(java.lang.Integer)
	 */
	@Override
	public Long getNumberOfFormsForConcept(Integer conceptId) {
		return dao.getNumberOfFormsForConcept(conceptId);
	}
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getAllConceptClasses()
	 */
	@Override
	public List<ConceptClass> getAllConceptClasses() {
		return dao.getAllConceptClasses();
	}
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getAllConceptDatatypes()
	 */
	@Override
	public List<ConceptDatatype> getAllConceptDatatypes() {
		return dao.getAllConceptDatatypes();
	}
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getConceptClassById(int)
	 */
	@Override
	public ConceptClass getConceptClassById(int id) {
		return dao.getConceptClassById(id);
	}
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getConceptDatatypeById(int)
	 */
	@Override
	public ConceptDatatype getConceptDatatypeById(int id) {
		return dao.getConceptDatatypeById(id);
	}

	/**
     * @see org.openmrs.module.conceptsearch.ConceptSearchService#isConceptUsedAs(org.openmrs.Concept, org.openmrs.module.conceptsearch.ConceptSearch)
     */
    @Override
    public boolean isConceptUsedAs(Concept concept, ConceptSearch cs) {
    	return dao.isConceptUsedAs(concept, cs);
    }

	/**
     * @see org.openmrs.module.conceptsearch.ConceptSearchService#getAutocompleteConcepts(java.lang.String)
     */
    @Override
    public List<String> getAutocompleteConcepts(String searchWord) {
    	return dao.getAutocompleteConcepts(searchWord);
    }
    
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#purgeConceptNameTag(org.openmrs.ConceptNameTag)
	 * TODO: check if tag is in use?
	 */
	@Override
	public void purgeConceptNameTag(ConceptNameTag nameTag) {
		dao.purgeConceptNameTag(nameTag);
	}
	
}
