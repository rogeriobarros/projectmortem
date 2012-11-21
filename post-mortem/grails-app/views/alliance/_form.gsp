<%@ page import="com.postmortem.alliance.Alliance" %>



<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'register', 'error')} required">
	<label for="register">
		<g:message code="alliance.register.label" default="Register" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="register" cols="40" rows="5" maxlength="5000" required="" value="${allianceInstance?.register}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'nameTextFile', 'error')} ">
	<label for="nameTextFile">
		<g:message code="alliance.nameTextFile.label" default="Name Text File" />
		
	</label>
	<g:textField name="nameTextFile" maxlength="50" value="${allianceInstance?.nameTextFile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'textFile', 'error')} ">
	<label for="textFile">
		<g:message code="alliance.textFile.label" default="Text File" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'nameSoundFile', 'error')} ">
	<label for="nameSoundFile">
		<g:message code="alliance.nameSoundFile.label" default="Name Sound File" />
		
	</label>
	<g:textField name="nameSoundFile" maxlength="50" value="${allianceInstance?.nameSoundFile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'soundFile', 'error')} ">
	<label for="soundFile">
		<g:message code="alliance.soundFile.label" default="Sound File" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'nameImageFile', 'error')} ">
	<label for="nameImageFile">
		<g:message code="alliance.nameImageFile.label" default="Name Image File" />
		
	</label>
	<g:textField name="nameImageFile" maxlength="50" value="${allianceInstance?.nameImageFile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'imageFile', 'error')} ">
	<label for="imageFile">
		<g:message code="alliance.imageFile.label" default="Image File" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'nameVideoFile', 'error')} ">
	<label for="nameVideoFile">
		<g:message code="alliance.nameVideoFile.label" default="Name Video File" />
		
	</label>
	<g:textField name="nameVideoFile" maxlength="50" value="${allianceInstance?.nameVideoFile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'videoFile', 'error')} ">
	<label for="videoFile">
		<g:message code="alliance.videoFile.label" default="Video File" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'alliancePersons', 'error')} ">
	<label for="alliancePersons">
		<g:message code="alliance.alliancePersons.label" default="Alliance Persons" />
		
	</label>
	<g:select name="alliancePersons" from="${com.postmortem.security.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${allianceInstance?.alliancePersons*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="alliance.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${com.postmortem.security.Person.list()}" optionKey="id" required="" value="${allianceInstance?.owner?.id}" class="many-to-one"/>
</div>

