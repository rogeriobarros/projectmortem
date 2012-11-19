package com.postmortem.security

import com.postmortem.exceptions.PostMortemException

class PersonService {

    def createOnRegister(registration) {
		if(!Person.findByUsername(registration.email)){
			def personUser = new Person(username: registration.email, password: registration.password, enabled: true)
			if(!personUser.save(failOnError: true)){
				log.error "Person: ${personUser.errors}"
				throw new PostMortemException("Falha ao tentar salvar novo usuario.")
			}
			
			def userAuth = Authority.findByAuthority('ROLE_USER')
			
			if (!personUser.authorities.contains(userAuth)) {
				PersonAuthority.create personUser, userAuth
			}
			
			registration.activate()
			registration.save()
			
			personUser
		}else{
			throw new PostMortemException("Usuario ja cadastrado!")
		}
    }
}
