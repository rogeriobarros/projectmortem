<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		
		<%-- ${response.sendRedirect(createLink(controller: 'registration', action: 'create').toString())}--%>
	</head>
	<body>
        <div id="mainHl">
            <h2>Post Mortem</h2>
            <p>Bem-vindo!</p>

            <div class="enterprisePage">
                <h3>Agora ficou facil deixar seus segredos guardados e revela-los sem culpa após partir deste mundo.</h3>
                <ul>
                	<li>
                		<article>
                			<header>
                				<a href="#">Como funciona:</a>
                				<section>
                					<h4>Primeiro passo:</h4>
	                					<p>Cadastre-se em nosso serviço.</p>
	                					<p>É simples, rápido e fácil.</p>
	                				<h4>Segundo passo:</h4>
	                					<p>Vá até a seção segredos e cadastre aquilo que quer compartilhar após sua morte.</p>
	                				<h4>Terceiro passo:</h4>
	                					<p>Convide quem você mais confia para este pacto.</p>
	                					<p>São pelo menos três pessoas as quais você deverá cadastrar os emails e estas receberam uma mensagem
	                					sendo informadas que foram escolhidas por você para um pacto de segredo, alem de diversas informações
	                					do que se trata o serviço e como poderão tomar ciência dos seus segredos.</p>
	                					<p>Estas pessoas deverão tambem efetuar seus cadastros no Post Mortem e após isto estarão aptas a receber
	                					os segredos que você guardou conosco.</p>
	                					<p>Para que seus segredos sejam revelados pelo menos uma destas pessoas cadastradas deverá informar sobre
	                					o falecimento acessando sua conta do Post Mortem. A partir daí as outras pessoas cadastradas tambem serão
	                					informadas e deverão confirmar o fato.</p>
	                					<p><b>Importante:</b> Se pelo menos um dos seus pactuantes não confirmar o fato, não lhes será dado acesso
	                					aos segredos. Por isso mantenha apenas cadastrados pessoas de seu convívio e confiança.</p>
	                				<h4>Garantias:</h4>
	                					<p>Após a comunicação do fato e posterior confirmação pelos pactuantes, será enviado a seu email cadastrado
	                					informando que se iniciou um processo de revelação de segredo. Caso tenha sido uma falsa comunicação, você
	                					poderá cancelar a revelação do segredo e modificar seus pactuantes se assim desejar.</p>
                				</section>
                			</header>
                		</article>
                	</li>
                	<li>
    	                <article>
                			<header>
                				<a href="#">Politica de privacidade:</a>
                				<section>
             				    </section>
                			</header>
                		</article>
                	</li>
                	<li>
                		<article>
                			<header>
                				<g:link controller="registration" action="create">Cadastre-se aqui</g:link>
                				<section>
                					<p>Levam apenas uns minutinhos.</p>
                				</section>
                			</header>
                		</article>
                	</li>
                </ul>
            </div>
            
            <div></div>
		</div>
	</body>
</html>
