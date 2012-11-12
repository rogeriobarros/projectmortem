package com.postmortem.aggregates

import com.postmortem.security.Person

class Phone implements Serializable {
	
	String ddd
	String number
	String ramal

	static belongsTo = Person
	
	static mapping = {
		id generator: 'native', params: [sequence: 'PHONE_SEQ']
		number column: 'numbr'
	}
	
    static constraints = {
		ddd(nullable: false, blank: false, size: 1..4)
		number(nullable: false, blank: false, size: 7..20)
		ramal(nullable: true, blank: true, size: 1..6)
    }

    def getFormatted(){
    	"${ddd} ${number}"
    }
}
