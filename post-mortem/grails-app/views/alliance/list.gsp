
<%@ page import="com.postmortem.alliance.Alliance"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"	value="${message(code: 'alliance.label', default: 'Alliance')}" />
<title>Seus Pactos</title>
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
				<g:link class="create" action="create">
					Novo Pacto
				</g:link>
			</li>
		</ul>
	</div>
	<div id="list-alliance" class="content scaffold-list" role="main">
		<h1>
			Seus Pactos
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="register" title="Registro" />
					<g:sortableColumn property="nameTextFile" title="Arquivo Texto" />
					<g:sortableColumn property="textFile" title="arquivo" />
					<g:sortableColumn property="nameSoundFile" title="Arquivo de Som" />
					<g:sortableColumn property="soundFile" title="arquivo" />
					<g:sortableColumn property="nameImageFile" title="Arquivo de imagem" />
					<g:sortableColumn property="imageFile" title="arquivo" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${allianceInstanceList}" status="i"	var="allianceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							<g:link action="show" id="${allianceInstance.id}">
								${fieldValue(bean: allianceInstance, field: "register")}
							</g:link>
						</td>
						<td>
							${fieldValue(bean: allianceInstance, field: "nameTextFile")}
						</td>
						<td>
							${fieldValue(bean: allianceInstance, field: "textFile")}
						</td>
						<td>
							${fieldValue(bean: allianceInstance, field: "nameSoundFile")}
						</td>
						<td>
							${fieldValue(bean: allianceInstance, field: "soundFile")}
						</td>
						<td>
							${fieldValue(bean: allianceInstance, field: "nameImageFile")}
						</td>
						<td>
							${fieldValue(bean: allianceInstance, field: "imageFile")}
						</td>
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
