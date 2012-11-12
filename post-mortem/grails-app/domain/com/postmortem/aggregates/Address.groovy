package com.postmortem.aggregates

import com.postmortem.security.Person

class Address implements Serializable {
	
	String street
	String numbr
	String complement
	String province
	String city
	String state
	String zipcode
	String zipcodePrefix
	String zipcodeSuffix
	String reference
	
	Date dateCreated = new Date()
	Date lastUpdated
	
	static belongsTo = [Person]
	
    static transients = ['zipcodePrefix', 'zipcodeSuffix']
	                    
    static constraints = {
		street(blank: false, size: 1..255)
		numbr(blank: false, size: 1..20)
		province(blank: false, size: 1..255)
		city(blank: false, size: 1..255)
		state(blank: false, size: 1..255)
		zipcode(blank: false, size: 8..8)
		zipcodePrefix(blank: false, size: 5..5)
		zipcodeSuffix(blank: false, size: 3..3)
		complement(blank: true, nullable: true, size: 0..255)
		reference(blank: true, nullable: true, size: 0..255)
    }

	static mapping = {
		id generator: 'native', params: [sequence: 'ADDRESS_SEQ']
	}
}
