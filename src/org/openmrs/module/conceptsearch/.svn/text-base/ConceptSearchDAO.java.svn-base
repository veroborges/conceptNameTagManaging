package org.openmrs.module.conceptsearch;

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

import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptDatatype;
import org.openmrs.api.db.DAOException;

/**
 *
 */
public interface ConceptSearchDAO {
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getConcepts(org.openmrs.module.conceptsearch.ConceptSearch)
	 */
	public List<Concept> getConcepts(ConceptSearch cs) throws DAOException;
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getConcept(java.lang.Integer)
	 */
	public Concept getConcept(Integer conceptId) throws DAOException;
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getNumberOfObsForConcept(java.lang.Integer)
	 */
	public Long getNumberOfObsForConcept(Integer conceptId) throws DAOException;
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getNumberOfFormsForConcept(java.lang.Integer)
	 */
	public Long getNumberOfFormsForConcept(Integer conceptId) throws DAOException;
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getAllConceptClasses()
	 */
	public List<ConceptClass> getAllConceptClasses() throws DAOException;
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getAllConceptDatatypes()
	 */
	public List<ConceptDatatype> getAllConceptDatatypes() throws DAOException;
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getConceptDatatypeById(int)
	 */
	public ConceptDatatype getConceptDatatypeById(int id) throws DAOException;
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#getConceptClassById(int)
	 */
	public ConceptClass getConceptClassById(int id) throws DAOException;
	
	/**
	 * @see org.openmrs.module.conceptsearch.ConceptSearchService#isConceptUsedAs(org.openmrs.Concept, org.openmrs.module.conceptsearch.ConceptSearch)
	 */
	public boolean isConceptUsedAs(Concept concept, ConceptSearch cs) throws DAOException;
	
	/**
     * @see org.openmrs.module.conceptsearch.ConceptSearchService#getAutocompleteConcepts(java.lang.String)
     */
    public List<String> getAutocompleteConcepts(String searchWord) throws DAOException;
	
}
