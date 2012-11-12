package com.postmortem.app.info
import grails.util.*

class AppInfoTagLib {
	def grailsApplication
	
	def host =  {
		this.out << InetAddress.getLocalHost().getCanonicalHostName()
	}
	
	def appVersion = {
		def date = Calendar.getInstance(new Locale("pt","BR"))
		this.out << grailsApplication.metadata['app.version']+" deployado em: ${date.format('dd/MM/yyyy HH:MM:ss')}" 
	}
	
}