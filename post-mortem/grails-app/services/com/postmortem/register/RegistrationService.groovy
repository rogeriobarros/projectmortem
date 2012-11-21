package com.postmortem.register

import com.postmortem.security.Registration

class RegistrationService {
	
	def grailsApplication, mailService
	
	def createRegistration(params){
		log.info "Criando nova registration: ${params.findAll { (it.key != 'passwordConfirmation' && it.key != 'password')} }"
		def registration = new Registration(params)
		registration.validate()
		registration
	}
	
	void sendActivationEmail(registration){
		try{
			def model = [registration: registration]
			log.info "[EMAIL] enviando email de ativacao de para: ${registration.email} "
			
			mailService.sendMail {
				from 'noreply-postmorte@postmortem.com' //grailsApplication.config.'default'.from
				to registration.email
				subject "Ativação da sua conta Post Mortem"
				body(view:"/registration/activation", model: model)
		    }
		}catch(e){
			log.error "[EMAIL] Erro ao enviar email de ativacao para (${registration.email})", e
		}
	}

}
