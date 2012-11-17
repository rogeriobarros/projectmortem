package com.postmortem.security

import com.postmortem.exceptions.PostMortemException

class PersonService {

    def createOnRegister(registration) {
		if(!Person.findByUsername(registration.email)){
			def person = new Person(username: registration.email, password: registration.password, enabled: true)
			if(!person.save(failOnError: true)){
				log.error "Person: ${person.errors}"
				throw new PostMortemException("Falha ao tentar salvar novo usuário.")
			}
			person
		}else{
			throw new PostMortemException("Usuário já cadastrado!")
		}
    }
}
