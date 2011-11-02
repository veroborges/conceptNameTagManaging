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

import java.util.List;
import java.util.Vector;

import org.apache.commons.lang.builder.CompareToBuilder;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptDatatype;
import org.openmrs.ConceptDescription;
import org.openmrs.ConceptName;

/**
 * Class to store all the needed information about a concept. By storing all data in this class we
 * avoid Hibernate's lazy loading error when not displaying all concepts at once and we can connect
 * some other information with a certain concept (like number of obs)
 */
public class ConceptSearchResult implements Comparable<ConceptSearchResult>{
	
	private int conceptId;
	
	private String conceptName;
	
	private String conceptDescription;
	
	private String conceptClass;
	
	private String conceptDatatype;
	
	private List<String> otherNames;
	
	private Long numberOfObs;
	
	//private String usedInForms;
	//private static Log log = LogFactory.getLog(ConceptSearchResult.class);
	public ConceptSearchResult(int id, ConceptName name, ConceptDescription description, ConceptClass cclass,
	    ConceptDatatype datatype) {
		this.conceptId = id;
		this.conceptName = name.getName();
		this.conceptDescription = description.getDescription();
		this.conceptClass = cclass.getName();
		this.conceptDatatype = datatype.getName();
	}
	
	public ConceptSearchResult(Concept con) {
		this.conceptId = con.getConceptId();
		if (con.getName() != null) {
			this.conceptName = con.getName().getName();
		}
		if (con.getDescription() != null) {
			this.conceptDescription = con.getDescription().getDescription();
		}
		if (con.getConceptClass() != null) {
			this.conceptClass = con.getConceptClass().getName();
		}
		if (con.getDatatype() != null) {
			this.conceptDatatype = con.getDatatype().getName();
		}
		this.otherNames = new Vector<String>();
		for (ConceptName cn : con.getNames()) {
			this.otherNames.add(cn.getName());
		}
		
	}
	
	/**
	 * @return the conceptName
	 */
	public String getConceptName() {
		return conceptName;
	}
	
	/**
	 * @param conceptName the conceptName to set
	 */
	public void setConceptName(String conceptName) {
		this.conceptName = conceptName;
	}
	
	/**
	 * @return the conceptDescription
	 */
	public String getConceptDescription() {
		return conceptDescription;
	}
	
	/**
	 * @param conceptDescription the conceptDescription to set
	 */
	public void setConceptDescription(String conceptDescription) {
		this.conceptDescription = conceptDescription;
	}
	
	/**
	 * @return the conceptClass
	 */
	public String getConceptClass() {
		return conceptClass;
	}
	
	/**
	 * @param conceptClass the conceptClass to set
	 */
	public void setConceptClass(String conceptClass) {
		this.conceptClass = conceptClass;
	}
	
	/**
	 * @return the conceptDatatype
	 */
	public String getConceptDatatype() {
		return conceptDatatype;
	}
	
	/**
	 * @param conceptDatatype the conceptDatatype to set
	 */
	public void setConceptDatatype(String conceptDatatype) {
		this.conceptDatatype = conceptDatatype;
	}
	
	/**
	 * @return the otherNames
	 */
	public List<String> getOtherNames() {
		return otherNames;
	}
	
	/**
	 * @param otherNames the otherNames to set
	 */
	public void setOtherNames(List<String> otherNames) {
		this.otherNames = otherNames;
	}
	
	/**
	 * @return the numberOfObs
	 */
	public Long getNumberOfObs() {
		return numberOfObs;
	}
	
	/**
	 * @param numberOfObs the numberOfObs to set
	 */
	public void setNumberOfObs(Long numberOfObs) {
		this.numberOfObs = numberOfObs;
	}
	
	/**
	 * @return the conceptId
	 */
	public int getConceptId() {
		return conceptId;
	}
	
	/**
	 * @param conceptId the conceptId to set
	 */
	public void setConceptId(int conceptId) {
		this.conceptId = conceptId;
	}

	/* (non-Javadoc)
     * @see java.lang.Comparable#compareTo(java.lang.Object)
     */
    public int compareTo(final ConceptSearchResult other) {
        return new CompareToBuilder().append(conceptId, other.conceptId).append(conceptName, other.conceptName)
                .append(conceptDescription, other.conceptDescription).append(conceptClass, other.conceptClass)
                .append(conceptDatatype, other.conceptDatatype).append(otherNames.toArray(), other.otherNames.toArray())
                .append(numberOfObs, other.numberOfObs).toComparison();
    }


	
}
