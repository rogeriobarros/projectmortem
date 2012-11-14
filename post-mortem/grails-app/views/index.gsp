<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		
		${response.sendRedirect(createLink(controller: 'login', action: 'index').toString())}
	</head>
	<body>
        <div id="pageBody">
            <h1>Post Mortem</h1>
            <p>Bem-vindo!</p>

            <div id="controllerList" class="dialog">
                <h2>Controllers disponíveis:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
		</div>
	</body>
</html>
