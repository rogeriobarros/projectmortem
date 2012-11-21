package com.postmortem.security

class Registration implements Serializable{
	
	String name
	String email
	String password
	String passwordConfirmation
	String activationCode
	Date dateCreated, lastUpdated

	static transients = ['passwordConfirmation']

    static constraints = {
		name(blank: false)
		email(unique: true, blank: false, email: true)
		activationCode(nullable: true, blank: false)
		password(blank: false, minSize:  6, validator:  { password, obj ->
			if(obj.passwordConfirmation != null){
				(obj.passwordConfirmation == password) ?: ['registration.password.notmatching']
			}
		})
	}
	
	def beforeInsert = {
		this.activationCode = UUID.randomUUID().toString()
		this.encodePassword()
	}
	
	def activate(){
		this.activationCode = null
	}
	
	private void encodePassword(){
		this.passwordConfirmation = null
		this.password = this.password.encodeAsBase64()
	}
}
