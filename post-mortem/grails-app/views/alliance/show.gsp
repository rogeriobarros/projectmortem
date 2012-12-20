
<%@ page import="com.postmortem.alliance.Alliance"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'alliance.label', default: 'Alliance')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
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
					Pactos
				</g:link>
			</li>
			<li>
				<g:link class="create" action="create">
					Novo Pacto
				</g:link>
			</li>
		</ul>
	</div>
	<div id="show-alliance" class="content scaffold-show" role="main">
		<h1>
			Seu Pacto
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ul class="property-list alliance">

			<g:if test="${allianceInstance?.register}">
				<li class="fieldcontain">
					<span id="register-label" class="property-label">Registro:</span> 
					<span class="property-value" aria-labelledby="register-label">
						<g:fieldValue bean="${allianceInstance}" field="registerDecode" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.nameTextFile}">
				<li class="fieldcontain">
					<span id="nameTextFile-label" class="property-label">Arquivo texto:</span> 
					<span class="property-value" aria-labelledby="nameTextFile-label">
						<g:fieldValue bean="${allianceInstance}" field="nameTextFileDecode" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.textFile}">
				<li class="fieldcontain">
					<span id="textFile-label" class="property-label">arquivo</span>
					<span class="property-value" aria-labelledby="textFile-label">
						<g:fieldValue bean="${allianceInstance}" field="textFile" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.nameSoundFile}">
				<li class="fieldcontain">
					<span id="nameSoundFile-label" class="property-label">Arquivo de Som:</span>
					<span class="property-value" aria-labelledby="nameSoundFile-label">
						<g:fieldValue bean="${allianceInstance}" field="nameSoundFileDecode" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.soundFile}">
				<li class="fieldcontain">
					<span id="soundFile-label" class="property-label">arquivo</span> 
					<span class="property-value" aria-labelledby="soundFile-label">
						<g:fieldValue bean="${allianceInstance}" field="soundFile" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.nameImageFile}">
				<li class="fieldcontain">
					<span id="nameImageFile-label" class="property-label">Arquivo de Imagem:</span>
					<span class="property-value" aria-labelledby="nameImageFile-label">
						<g:fieldValue bean="${allianceInstance}" field="nameImageFileDecode" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.imageFile}">
				<li class="fieldcontain">
					<span id="imageFile-label" class="property-label">arquivo</span> 
					<span class="property-value" aria-labelledby="imageFile-label">
						<g:fieldValue bean="${allianceInstance}" field="imageFile" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.nameVideoFile}">
				<li class="fieldcontain">
					<span id="nameVideoFile-label" class="property-label">Arquivo de Vídeo:</span>
					<span class="property-value" aria-labelledby="nameVideoFile-label">
						<g:fieldValue bean="${allianceInstance}" field="nameVideoFileDecode" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.videoFile}">
				<li class="fieldcontain">
					<span id="videoFile-label" class="property-label">arquivo</span> 
					<span class="property-value" aria-labelledby="videoFile-label">
						<g:fieldValue bean="${allianceInstance}" field="videoFile" />
					</span>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.alliancePersons}">
				<li class="fieldcontain">
					<span id="alliancePersons-label" class="property-label">Pactuantes</span>
					<g:each in="${allianceInstance.alliancePersons}" var="p">
						<span class="property-value" aria-labelledby="alliancePersons-label">
							<g:link	controller="person" action="show" id="${p.id}">
								${p?.encodeAsHTML()}
							</g:link>
						</span>
					</g:each>
				</li>
			</g:if>

			<g:if test="${allianceInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label">
						Dono(s):
					</span> 
					<span class="property-value" aria-labelledby="owner-label">
						<g:link	controller="person" action="show" id="${allianceInstance?.owner?.id}">
							${allianceInstance?.owner?.encodeAsHTML()}
						</g:link>
					</span>
				</li>
			</g:if>

		</ul>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${allianceInstance?.id}" />
				<g:link class="edit" action="edit" id="${allianceInstance?.id}">Atualizar</g:link>
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('Tem certeza?');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
