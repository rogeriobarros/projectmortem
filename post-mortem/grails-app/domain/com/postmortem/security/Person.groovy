package com.postmortem.security

import com.postmortem.aggregates.*


class Person implements Serializable {
		
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	transient springSecurityService

	static constraints = {
		username (blank: false, unique: true, email: true)
		password (blank: false)
		addresses (nullable:true)
		propertyValues (nullable:true)
	}

	static mapping = {
		password column: '`password`'
	}
	
	static hasMany = [addresses: Address, propertyValues : PersonPropertyValue]

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
		
}
