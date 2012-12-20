<%@ page import="com.postmortem.alliance.Alliance"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"	value="${message(code: 'alliance.label', default: 'Alliance')}" />
<title>Novo Pacto</title>
</head>
<body>
	<div class="nav" role="navigation">
		<ul>
			<li>
				<a class="home" href="${createLink(uri: '/')}">
					<g:message code="default.home.label" />
				</a>
			</li>
			<li>
				<g:link class="list" action="list">
					Seus Pactos
				</g:link>
			</li>
		</ul>
	</div>
	<div id="create-alliance" class="content scaffold-create" role="main">
		<h1>
			Criar Pacto
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${allianceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${allianceInstance}" var="error">
					<li	<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if> >
						<g:message error="${error}" />
					</li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form action="save">
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save" value="Criar" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
