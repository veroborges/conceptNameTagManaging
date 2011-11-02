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
import org.openmrs.annotation.Authorized;
import org.openmrs.util.OpenmrsConstants;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service methods for the Concept Search in the Enhanced Concept Management module.
 */
@Transactional
public interface ConceptSearchService {
	
	public void setConceptSearchDAO(ConceptSearchDAO dao);
	
	/**
	 * Returns all concepts that match the criteria in cs
	 * 
	 * @param cs Object that stores all entered search criteria
	 * @return all concepts that match criteria in cs
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public List<Concept> getConcepts(ConceptSearch cs);
	
	/**
	 * Returns concept with given conceptId
	 * 
	 * @param conceptId id of the concept
	 * @return concept with the given conceptId
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public Concept getConcept(Integer conceptId);
	
	/**
	 * Returns the number of observations for this concept
	 * 
	 * @param conceptId id of the concept
	 * @return number of observations for the given concept
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public Long getNumberOfObsForConcept(Integer conceptId);
	
	/**
	 * Returns the number of forms this concept is used by
	 * @param conceptId
	 * @return
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public Long getNumberOfFormsForConcept(Integer conceptId);
	
	/**
	 * Return all Concept Classes
	 * @return all Concept Classes in the database
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public List<ConceptClass> getAllConceptClasses();
	
	/**
	 * Return all Concept Datatypes
	 * @return all Concept Datatypes in the database
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public List<ConceptDatatype> getAllConceptDatatypes();
	
	/**
	 * Return the Datatype of a given id
	 * @param id Datatype id
	 * @return ConceptDatatype with given id
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public ConceptDatatype getConceptDatatypeById(int id);
	
	/**
	 * Return the ConceptClass of a given id
	 * @param id ConceptClass id
	 * @return ConceptClass with given id
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public ConceptClass getConceptClassById(int id);
	
	/**
	 * Checks if the request is used as a question in forms, as an answer to questions, as an observation question, as an observation value.
	 * @param concept Concepts to be checked if it matches the criteria
	 * @param cs object that contains the criteria
	 * @return boolean, true if concept matches all given criteria or no criteria is given, false if not
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public boolean isConceptUsedAs(Concept concept, ConceptSearch cs);
	
	/**
	 * Returns a List of search suggestions depending on the search word entered
	 * @param searchWord the beginning of the concept name
	 * @return List of concepts that match the searchWord
	 */
	@Transactional(readOnly = true)
	@Authorized( { OpenmrsConstants.PRIV_VIEW_CONCEPTS })
	public List<String> getAutocompleteConcepts(String searchWord);
	
}
