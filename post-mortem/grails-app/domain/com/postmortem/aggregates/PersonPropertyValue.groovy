package com.postmortem.aggregates

import java.text.NumberFormat;

import com.postmortem.security.Person

class PersonPropertyValue {
	
	String value
	PropertyDefinition propertyDefinition
	Person user

	static belongsTo = [user: Person, propertyDefinition: PropertyDefinition]
	
	static mapping = {
		id generator:'native', params:[sequence:'PROP_VAL_SEQ']
		value type:'text'
		table name:'PROP_VAL'
	}
	
    static constraints = {
    	value(nullable: true, blank: true, validator:{val,obj ->
			obj.propertyDefinition.with{
				if(!required && !val) return true;
				if(required && !val) return ['person.property.required']
				try{
					if(type == Date){
						Date.parse('dd/MM/yyyy',val) as Boolean
					}else if(type ==  BigDecimal){
						NumberFormat.getNumberInstance(new Locale('pt', 'BR')).parse(val) as Boolean
					}else{
						type.newInstance(val)
						if(length && val)//TODO bug? melhorar.
							((val?.size() <= length)) ?: ['person.property.invalidLength']
					}
				}catch(e){
					return ['person.property.invalidFormat']
				}
			}
		})
    }
	
	def getTypedValue(){
		if(propertyDefinition.type == Date){
			Date.parse('dd/MM/yyyy', value)
		}else if(propertyDefinition.type == BigDecimal){
		 	new BigDecimal(NumberFormat.getNumberInstance(new Locale('pt', 'BR')).parse(val))
		}else{
			propertyDefinition.type.newInstance(value)
		}
	}
}
