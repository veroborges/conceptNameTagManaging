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
package org.openmrs.module.conceptsearch;

import junit.framework.TestCase;

import org.junit.Test;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;

/**
 * TestCase to test the ConceptSearchResult
 */
public class ConceptSearchResultTest extends TestCase {
	
    private static final int concept_ID_1 = 1;
    private static final int concept_ID_2 = 2;

	/**
	 * Test ConceptSearchResult()
	 */
	@Test
	public void testConceptSearchResult() {
		
		Concept emptyConcept = new Concept();
		ConceptSearchResult conceptSearchResult = null;
		
        try {
	        conceptSearchResult = new ConceptSearchResult(emptyConcept);
	        fail("Exception should be thrown if concept doesn't contain an Id");
        }
        catch (Exception e) {
	        // expected
        }

		Concept simpleConcept = emptyConcept;
		simpleConcept.setConceptId(concept_ID_2);
		conceptSearchResult = new ConceptSearchResult(emptyConcept);
		assertNotNull("conceptSearchResult should not be null", conceptSearchResult);

	
		simpleConcept.setConceptClass(new ConceptClass());
		
		conceptSearchResult = new ConceptSearchResult(emptyConcept);
		assertEquals("conceptSearchResult should not be null", concept_ID_2, conceptSearchResult.getConceptId());
	}
	
	/**
	 * Test method for {@link org.openmrs.module.conceptsearch.ConceptSearchResult#compareTo(org.openmrs.module.conceptsearch.ConceptSearchResult)}.
	 */
	@Test
	public void testCompareTo() {
		Concept simpleConcept_1 = new Concept();
		simpleConcept_1.setConceptId(concept_ID_1);
		simpleConcept_1.setConceptClass(new ConceptClass());

		ConceptSearchResult conceptSearchResult_1 = new ConceptSearchResult(simpleConcept_1);
		assertTrue("identical objects should be the same", conceptSearchResult_1.compareTo(conceptSearchResult_1) == 0);
		
		ConceptSearchResult copy_of_conceptSearchResult = new ConceptSearchResult(simpleConcept_1);
		assertTrue("copied object should be the same", conceptSearchResult_1.compareTo(copy_of_conceptSearchResult) == 0);

		Concept simpleConcept_2 = new Concept();
		simpleConcept_2.setConceptId(concept_ID_2);
		simpleConcept_2.setConceptClass(new ConceptClass());		

		ConceptSearchResult conceptSearchResult_2 = new ConceptSearchResult(simpleConcept_2);
		
		assertTrue("two different object", conceptSearchResult_1.compareTo(conceptSearchResult_2) != 0);
	}
}
