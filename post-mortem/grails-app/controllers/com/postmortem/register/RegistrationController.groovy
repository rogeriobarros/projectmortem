package com.postmortem.register

import com.postmortem.security.Registration;

class RegistrationController {
	
	def registrationService, jcaptchaService, personService
	
	def create = { }
	
	def save = {
		def registration = registrationService.createRegistration(params)
		if(checkTos() & !registration.hasErrors()) {
			registration.save()
			registrationService.sendActivationEmail(registration)
			log.info "Registration ${registration.id} salva com sucesso."
			flash.message = g.message(code:'registration.creation.success', args:[registration.email])
			//render view: 'success'
			redirect(controller: "person",  action: "list")
		}else{
			render view: 'create', model: [registration: registration]
		}
	}
	
	
	def tos = {
		render view: 'tos'		
	}

	def resendActivation = {
		def registration = Registration.findByEmail(params.email)
		registrationService.sendActivationEmail(registration)
		flash.message = g.message(code:'registration.activation.sent')
		render view: 'success'
	}
	
	def activate = {
		def registration = Registration.get(params.id)
		
		if(registration && registration.activationCode == params.activation){
			
			def person = personService.createOnRegister(registration)
			
			flash.message = g.message(code:'registration.activation.active')
			redirect(controller: "person",  action: "show", id: person.id)
		}else{
			flash.message = g.message(code:'registration.activation.failed')
			render view: 'error'
		}
	}
	
	def success = { }

	private checkCaptcha(){
		def captchaOk = jcaptchaService.validateResponse("imageCaptcha", session.id, params.captcha)
		if(!captchaOk){
			flash.captchaError = g.message(code:'registration.captcha.failed')
		}
		captchaOk
	}

	private checkTos() {
		def tosOk = (params.tos == "on")
		if(!tosOk){
			flash.tosError = g.message(code:'registration.tos.blank')
		}
		tosOk
	}
}
