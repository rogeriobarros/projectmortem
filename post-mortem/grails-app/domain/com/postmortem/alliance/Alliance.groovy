package com.postmortem.alliance

import java.sql.Blob

import org.hibernate.engine.jdbc.BlobProxy;
//import org.hibernate.lob.BlobImpl;

import com.postmortem.security.Person

class Alliance {
	
	Person owner
	String register
	
	String nameTextFile
	Blob textFile
	
	String nameSoundFile
	Blob soundFile
	
	String nameImageFile
	Blob imageFile
	
	String nameVideoFile
	Blob videoFile
	
	static hasMany = [alliancePersons: Person]

	static belongsTo = [Person]
	
    static constraints = {
		register(blank: false, nullable: false, maxSize: 5000)
		
		nameTextFile(maxSize: 50, blank: false, nullable: true)
		textFile(nullable: true)
		
		nameSoundFile(maxSize: 50, blank: false, nullable: true)
		soundFile(nullable: true)
		
		nameImageFile(maxSize: 50, blank: false, nullable: true)
		imageFile(nullable: true)
		
		nameVideoFile(maxSize: 50, blank: false, nullable: true)
		videoFile(nullable: true)
    }
	
	static transients = [ 'size', 'data' ]
	
	static mapping = { 
		columns { 
			textFile type:'blob'
			soundFile type:'blob'
			imageFile type:'blob'
			videoFile type:'blob'
		} 
	}
	
	Long getSize(file) {
		return file?.length() ?: 0
	}
	
	def setData(InputStream is, long length, type) {
		if ( log.isDebugEnabled() ) {
			log.debug "Fixando dados como File."
		}
		def file = getAllianceFileType(type).last()
			file = new BlobProxy(is, length)
	}
	
	def getData(type) {
		getAllianceFileType(type)
	}
	
	def getAsFile(type) {
		if ( log.isDebugEnabled() ) {
			log.debug "Recuperando dados como File."
		}
		
		def file = getAllianceFileType(type)
		def nameFile = file.first()
		
		def tmpFile = File.createTempFile(nameFile.split(".")[0], nameFile.split(".")[1])
			tmpFile.append(file.last()?.binaryStream)
		
		tmpFile
	}
	
	private getAllianceFileType(type){
		switch(type){
			case AllianceFileType.DOC : return [nameTextFile, textFile]
				break
			case AllianceFileType.SOUND : return [nameSoundFile, soundFile]
				break
			case AllianceFileType.IMAGE : return [nameImageFile, imageFile]
				break
			case AllianceFileType.VIDEO : return [nameVideoFile, videoFile]
				break
		}
	}
}

enum AllianceFileType implements Serializable {
	DOC, SOUND, IMAGE, VIDEO
}
