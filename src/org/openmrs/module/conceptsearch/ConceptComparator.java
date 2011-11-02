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

import java.util.Comparator;

/**
 * This class is made for a sorting-routine to determine which concept has a lower alphanumeric
 * value. Can also be used on concepts datatype, class and number of obs.
 */
public class ConceptComparator implements Comparator<ConceptSearchResult> {
	
	private static final int SORT_FOR_NAME = 0;
	
	private static final int SORT_FOR_DATATYPE = 1;
	
	private static final int SORT_FOR_CLASS = 2;
	
	private static final int SORT_FOR_OBS = 3;
	
	private int ascSort;
	
	private int descSort;
	
	private int sortFor;
	
	public ConceptComparator(String sortCrit, boolean asc) {
		if (sortCrit.equals("class"))
			this.sortFor = SORT_FOR_CLASS;
		else if (sortCrit.equals("datatype"))
			this.sortFor = SORT_FOR_DATATYPE;
		else if (sortCrit.equals("obs"))
			this.sortFor = SORT_FOR_OBS;
		else
			this.sortFor = SORT_FOR_NAME;
		
		if (asc) {
			this.ascSort = 1;
			this.descSort = 0;
		} else {
			this.ascSort = 0;
			this.descSort = 1;
		}
		
	}
	
	/**
	 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
	 */
	@Override
	public int compare(ConceptSearchResult arg0, ConceptSearchResult arg1) {
		switch (sortFor) {
			case SORT_FOR_DATATYPE:
				if ((arg0.getConceptDatatype().compareToIgnoreCase(arg1.getConceptDatatype())) > 0)
					return ascSort;
				else
					return descSort;
			case SORT_FOR_CLASS:
				if ((arg0.getConceptClass().compareToIgnoreCase(arg1.getConceptClass())) > 0)
					return ascSort;
				else
					return descSort;
			case SORT_FOR_OBS:
				if (arg0.getNumberOfObs() > arg1.getNumberOfObs())
					return ascSort;
				else
					return descSort;
			default:
				if ((arg0.getConceptName().compareToIgnoreCase(arg1.getConceptName())) > 0)
					return ascSort;
				else
					return descSort;
		}
	}
	
}
