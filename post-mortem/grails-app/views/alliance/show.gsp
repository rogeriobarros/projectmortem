
<%@ page import="com.postmortem.alliance.Alliance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alliance.label', default: 'Alliance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-alliance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-alliance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list alliance">
			
				<g:if test="${allianceInstance?.register}">
				<li class="fieldcontain">
					<span id="register-label" class="property-label"><g:message code="alliance.register.label" default="Register" /></span>
					
						<span class="property-value" aria-labelledby="register-label"><g:fieldValue bean="${allianceInstance}" field="register"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.nameTextFile}">
				<li class="fieldcontain">
					<span id="nameTextFile-label" class="property-label"><g:message code="alliance.nameTextFile.label" default="Name Text File" /></span>
					
						<span class="property-value" aria-labelledby="nameTextFile-label"><g:fieldValue bean="${allianceInstance}" field="nameTextFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.textFile}">
				<li class="fieldcontain">
					<span id="textFile-label" class="property-label"><g:message code="alliance.textFile.label" default="Text File" /></span>
					
						<span class="property-value" aria-labelledby="textFile-label"><g:fieldValue bean="${allianceInstance}" field="textFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.nameSoundFile}">
				<li class="fieldcontain">
					<span id="nameSoundFile-label" class="property-label"><g:message code="alliance.nameSoundFile.label" default="Name Sound File" /></span>
					
						<span class="property-value" aria-labelledby="nameSoundFile-label"><g:fieldValue bean="${allianceInstance}" field="nameSoundFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.soundFile}">
				<li class="fieldcontain">
					<span id="soundFile-label" class="property-label"><g:message code="alliance.soundFile.label" default="Sound File" /></span>
					
						<span class="property-value" aria-labelledby="soundFile-label"><g:fieldValue bean="${allianceInstance}" field="soundFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.nameImageFile}">
				<li class="fieldcontain">
					<span id="nameImageFile-label" class="property-label"><g:message code="alliance.nameImageFile.label" default="Name Image File" /></span>
					
						<span class="property-value" aria-labelledby="nameImageFile-label"><g:fieldValue bean="${allianceInstance}" field="nameImageFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.imageFile}">
				<li class="fieldcontain">
					<span id="imageFile-label" class="property-label"><g:message code="alliance.imageFile.label" default="Image File" /></span>
					
						<span class="property-value" aria-labelledby="imageFile-label"><g:fieldValue bean="${allianceInstance}" field="imageFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.nameVideoFile}">
				<li class="fieldcontain">
					<span id="nameVideoFile-label" class="property-label"><g:message code="alliance.nameVideoFile.label" default="Name Video File" /></span>
					
						<span class="property-value" aria-labelledby="nameVideoFile-label"><g:fieldValue bean="${allianceInstance}" field="nameVideoFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.videoFile}">
				<li class="fieldcontain">
					<span id="videoFile-label" class="property-label"><g:message code="alliance.videoFile.label" default="Video File" /></span>
					
						<span class="property-value" aria-labelledby="videoFile-label"><g:fieldValue bean="${allianceInstance}" field="videoFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.alliancePersons}">
				<li class="fieldcontain">
					<span id="alliancePersons-label" class="property-label"><g:message code="alliance.alliancePersons.label" default="Alliance Persons" /></span>
					
						<g:each in="${allianceInstance.alliancePersons}" var="a">
						<span class="property-value" aria-labelledby="alliancePersons-label"><g:link controller="person" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${allianceInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="alliance.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="person" action="show" id="${allianceInstance?.owner?.id}">${allianceInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${allianceInstance?.id}" />
					<g:link class="edit" action="edit" id="${allianceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
