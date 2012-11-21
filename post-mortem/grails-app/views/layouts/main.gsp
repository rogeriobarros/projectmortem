<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!-- Managed Server: <g:host/> -->
<!-- Version: <g:appVersion/> -->
<head>
	<g:render template="/layouts/head" />
	<g:layoutHead />
</head>
<!-- Corpo -->
<body>
	<div id="header">
		<div class="header">
			<a class="logo" href="${createLink(uri: '/')}" title="Ir para a página inicial do Post Mortem">
				<img src="${resource(dir:'images', file:'rip-logo.jpg')}" alt="logo rip" />
			</a>
			<div class="topMenu">
				<sec:ifNotLoggedIn>
					<g:set var="postUrl" value="${request.contextPath}${SpringSecurityUtils.securityConfig.apf.filterProcessesUrl}" />
					<form id="login_form" action="${postUrl}" method="post"> <%--"${createLink(controller: 'login', action:'index')}" --%>
						<table cellspacing="0" class="twoCol">
							<tbody>
								<tr>
									<td class="line">
										<label for="username">E-mail</label>
									</td>
									<td class="line">
										<label for="password">Senha</label>
									</td>
								</tr>
								<tr>
									<td>
										<input type='text' class='kanloUrlInput' name='j_username' id='username' value="" tabindex="1"/>
									</td>
									<td>
										<input type='password' class='kanloUrlInput' name='j_password' id='password' tabindex="2"/>
									</td>
									<td>
										<label id="loginbutton" for="submitBtn">
											<input class="formButton" value="Entrar" tabindex="3" type="submit" id="submitBtn" />
										</label>
									</td>
								</tr>
								<tr>
									<td class="line">
										<a rel="nofollow" href="#">Esqueceu sua senha?</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</sec:ifNotLoggedIn>
				<sec:ifLoggedIn>
					<a class="logo" href="${createLink(controller:'logout', action:'index')}" title="Sair do Post Mortem">
						<img src="${resource(dir:'images', file:'logout.jpg')}" alt="logoout" />
					</a>
				</sec:ifLoggedIn>	
			</div>
		</div>
	</div>
	
	<!-- Conteudo -->
	<div id="content">
		<g:layoutBody />
	</div>
	<!-- Fim-Conteudo -->

	<g:render template="/layouts/footer" />
</body>
<!-- Fim-Corpo -->
</html>