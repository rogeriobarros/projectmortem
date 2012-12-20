package com.postmortem.alliance

import org.springframework.dao.DataIntegrityViolationException

class AllianceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [allianceInstanceList: Alliance.list(params), allianceInstanceTotal: Alliance.count()]
    }

    def create() {
        [allianceInstance: new Alliance(params)]
    }

    def save() {
        def allianceInstance = new Alliance(params)
        if (!allianceInstance.save(flush: true)) {
            render(view: "create", model: [allianceInstance: allianceInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'alliance.label', default: 'Alliance'), allianceInstance.id])
        redirect(action: "show", id: allianceInstance.id)
    }
	
	def upload = {
		def txtFile = request.getFile('textFile')
		def sndFile = request.getFile('soundFile')
		def imgFile = request.getFile('imageFile')
		def vidFile = request.getFile('videoFile')
		
		def allianceInstance = Alliance.get(params.id)
		try{
			allianceInstance.with{
				textFile: txtFile
				soundFile: sndFile
				imageFile: imgFile
				videoFile: vidFile
			}
			
			allianceInstance.save()
			redirect(action: 'show', params: [id: allianceInstance.id])
		}catch(e){
			log.error e
			flash.message = "Não foi possivel recuperar dados do servido!"
			redirect(action: 'index')
		}
	}

    def show() {
        def allianceInstance = Alliance.get(params.id)
        if (!allianceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alliance.label', default: 'Alliance'), params.id])
            redirect(action: "list")
            return
        }

        [allianceInstance: allianceInstance]
    }

    def edit() {
        def allianceInstance = Alliance.get(params.id)
        if (!allianceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alliance.label', default: 'Alliance'), params.id])
            redirect(action: "list")
            return
        }

        [allianceInstance: allianceInstance]
    }

    def update() {
        def allianceInstance = Alliance.get(params.id)
        if (!allianceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alliance.label', default: 'Alliance'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (allianceInstance.version > version) {
                allianceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'alliance.label', default: 'Alliance')] as Object[],
                          "Another user has updated this Alliance while you were editing")
                render(view: "edit", model: [allianceInstance: allianceInstance])
                return
            }
        }

        allianceInstance.properties = params

        if (!allianceInstance.save(flush: true)) {
            render(view: "edit", model: [allianceInstance: allianceInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'alliance.label', default: 'Alliance'), allianceInstance.id])
        redirect(action: "show", id: allianceInstance.id)
    }

    def delete() {
        def allianceInstance = Alliance.get(params.id)
        if (!allianceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alliance.label', default: 'Alliance'), params.id])
            redirect(action: "list")
            return
        }

        try {
            allianceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'alliance.label', default: 'Alliance'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'alliance.label', default: 'Alliance'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
