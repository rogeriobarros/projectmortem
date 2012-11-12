package com.postmortem.security

import org.apache.commons.lang.builder.HashCodeBuilder

class PersonAuthority implements Serializable {

	Person user 
	Authority role
	
	static mapping = {
		id composite: ['role', 'user']
		version false
	}
	
	
	static PersonAuthority get(long userId, long roleId) { 
		find "from ${PersonAuthority.class.name} where user.id=:userId and role.id=:roleId", [userId: userId, roleId: roleId]
	}
	
	static PersonAuthority create(Person user, Authority role, boolean flush = false) { 
		role.save(flush:true)
		new PersonAuthority(user: user, role: role).save(flush: flush, insert: true)
	}
	
	static boolean remove(Person user, Authority role, boolean flush = false) { 
		PersonAuthority instance = PersonAuthority.findByUserAndRole(user, role)
		instance ? instance.delete(flush: flush) : false
	}
	
	static void removeAll(Person user) { 
		executeUpdate "DELETE FROM  ${PersonAuthority.class.name} WHERE user=:user", [user: user]
	}
	
	boolean equals(other) {
		if (!(other instanceof PersonAuthority)) {
			return false
		}
		other.user?.id == user?.id && other.role?.id == role?.id
	}
	
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) {
			builder.append(user.id)
		}
		if (role) {
			builder.append(role.id) builder.toHashCode()
		}
	}
}
