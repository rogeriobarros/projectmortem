<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		
		<%-- ${response.sendRedirect(createLink(controller: 'registration', action: 'create').toString())}--%>
	</head>
	<body>
        <div id="mainHl">
            <h1>Post Mortem</h1>
            <p>Bem-vindo!</p>

            <div class="enterprisePage">
                <h2>Controllers disponíveis:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
		</div>
	</body>
</html>
