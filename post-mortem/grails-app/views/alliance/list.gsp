
<%@ page import="com.postmortem.alliance.Alliance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alliance.label', default: 'Alliance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-alliance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-alliance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="register" title="${message(code: 'alliance.register.label', default: 'Register')}" />
					
						<g:sortableColumn property="nameTextFile" title="${message(code: 'alliance.nameTextFile.label', default: 'Name Text File')}" />
					
						<g:sortableColumn property="textFile" title="${message(code: 'alliance.textFile.label', default: 'Text File')}" />
					
						<g:sortableColumn property="nameSoundFile" title="${message(code: 'alliance.nameSoundFile.label', default: 'Name Sound File')}" />
					
						<g:sortableColumn property="soundFile" title="${message(code: 'alliance.soundFile.label', default: 'Sound File')}" />
					
						<g:sortableColumn property="nameImageFile" title="${message(code: 'alliance.nameImageFile.label', default: 'Name Image File')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${allianceInstanceList}" status="i" var="allianceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${allianceInstance.id}">${fieldValue(bean: allianceInstance, field: "register")}</g:link></td>
					
						<td>${fieldValue(bean: allianceInstance, field: "nameTextFile")}</td>
					
						<td>${fieldValue(bean: allianceInstance, field: "textFile")}</td>
					
						<td>${fieldValue(bean: allianceInstance, field: "nameSoundFile")}</td>
					
						<td>${fieldValue(bean: allianceInstance, field: "soundFile")}</td>
					
						<td>${fieldValue(bean: allianceInstance, field: "nameImageFile")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${allianceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
