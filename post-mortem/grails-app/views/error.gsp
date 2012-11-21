<!doctype html>
<html>
	<head>
		<title>Grails Runtime Exception</title>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
	</head>
	<body>
		<g:if test="${flash.message}">
			<div class="alert">
				<span class="alert-error">${flash.message}</span>
			</div>
		</g:if>
		<g:renderException exception="${exception}" />
	</body>
</html>