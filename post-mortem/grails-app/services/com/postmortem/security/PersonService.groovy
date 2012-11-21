package com.postmortem.security

import com.postmortem.exceptions.PostMortemException

import org.codehaus.groovy.grails.plugins.codecs.*

class PersonService {

    def createOnRegister(registration) {
		if(!Person.findByUsername(registration.email)){
			def personUser = new Person(name: registration.name, username: registration.email, password: decodePassword(registration.password), enabled: true)
			if(!personUser.save(failOnError: true)){
				log.error "Person: ${personUser.errors}"
				throw new PostMortemException("Falha ao tentar salvar novo usuário.")
			}
			
			def userAuth = Authority.findByAuthority('ROLE_USER')
			
			if (!personUser.authorities.contains(userAuth)) {
				PersonAuthority.create personUser, userAuth
			}
			
			registration.activate()
			registration.save()
			
			personUser
		}else{
			throw new PostMortemException("Usuário já cadastrado!")
		}
    }
	
	private decodePassword(encodedPassword){
		new String(encodedPassword.decodeBase64())
	}
}
