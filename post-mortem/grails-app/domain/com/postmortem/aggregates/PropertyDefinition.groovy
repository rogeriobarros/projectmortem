package com.postmortem.aggregates

class PropertyDefinition implements Serializable {

	Class type
	String name
	Integer length
	boolean required
	boolean softDeleted
	
	static transients = ['humanReadableType']
	
	static constraints = {
		name(nullable:false, blank:false, validator: {val, obj ->
			if(!obj.softDeleted && PropertyDefinition.findBySoftDeletedAndName(false, obj.name)){
				return ['propertyDefinition.error.unique']
			}
			return true
		})
		length(nullable:true)
	}
	
	static mapping = {
		id generator:'native', params:[sequence:'PROP_DEF_SEQ']
		table name:'PROP_DEF'
	}
	
	static possibleTypes = ["Texto": String.name, "Numeral": BigDecimal.name, "Data": Date.name, "Booleano": Boolean.name]
	
	def getHumanReadableType(){
		possibleTypes.find{ it.value == type.name }.key
	}
}
