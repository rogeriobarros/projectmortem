package com.postmortem.security

import java.io.Serializable;

class Authority implements Serializable {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
