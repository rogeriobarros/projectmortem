package com.postmortem.security

import com.postmortem.aggregates.*
import com.sun.xml.internal.bind.v2.runtime.RuntimeUtil.ToStringAdapter;


class Person implements Serializable {

	String name
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

	private void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	@Override
	public String toString() {
		name
	}
	
}
