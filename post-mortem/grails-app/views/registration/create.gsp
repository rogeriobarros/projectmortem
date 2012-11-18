<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<title>Faça seu cadastro</title>
	<meta name="layout" content="main" />
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#tos').click(function() {
		        if ($(this).is(':checked')) {
		            $('#submit').removeAttr('disabled');
		        } else {
		            $('#submit').attr('disabled', 'disabled');
		        }
	        });
		});
		
		function removeInvalidCharacters(word) {
			var invalidCharacters = 'áàãâäéèêëíìîïóòõôöúùûüçÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÖÔÚÙÛÜÇ';
			var validCharacters = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';
			var newString = ''
			for(i=0 ; i < word.length ; i++) {
				if(invalidCharacters.search(word.substr(i,1)) >= 0) {
					newString += validCharacters.substr(invalidCharacters.search(word.substr(i,1)), 1)
				}else {
					newString += word.substr(i,1);
				}
			}
			return newString.toLowerCase().split(' ').join('');
		}
		
	</script>

</head>

<body>
	


	<article id="page">
		<!-- header -->

		<!-- conteudo principal -->
		<section id="content">

			<nav class="bCrumbs">
				<a href="/">home</a> &gt;
				<b>faça seu registro</b>
			</nav>

			<section class="pageIntro">
				<h1 class="pageTitle">Faça seu registro</h1>
				<p class="intro">Você está a um passo de realizar seu cadastro.</p>
			</section>

			<g:if test="${registration?.errors?.getFieldError('email')?.code == 'unique'}">
				<div style="" class="alert alert-info"> 
					O email ${registration.email} já está sendo utilizado. Se você se cadastrou e não recebeu o email de ativação
					<a href="${createLink(action:'resendActivation', params:[email:registration.email])}">clique aqui</a> para reenviar.
				</div>
			</g:if>

			<div class="box1 storeCreation">
				<div class="box1-inner">
					<form class="storeCreationForm" action="save" method="post" >
						<div class="twoCol">
							<div class="col1">
									<g:if test="${registration?.errors?.getFieldError('name')}">
										<g:set var="nameError" value="error" />
									</g:if>
									<div class="line ${nameError}">
										<label for="name">Nome Completo:</label>
										<g:textField name="name" value="${registration?.name}" />
										<g:if test="${registration?.errors?.getFieldError('name')}">
											<p class="alert"><g:message error="${registration?.errors?.getFieldError('name')}" /> </p>
										</g:if>
									</div>
									<g:if test="${registration?.errors?.getFieldError('email')}">
										<g:set var="emailError" value="error" />
									</g:if>
									<div class="line ${emailError}">
										<label for="email">E-mail:</label>
										<g:textField name="email" value="${registration?.email}" />
										<g:if test="${registration?.errors?.getFieldError('email')}">
											<p class="alert"><g:message error="${registration?.errors?.getFieldError('email')}" /> </p>
										</g:if>
									</div>
									<g:if test="${registration?.errors?.getFieldError('password')}">
										<g:set var="passwordError" value="error" />
									</g:if>
									<div class="line ${passwordError}">
										<label for="password">Senha:</label>
										<g:passwordField name="password"/>
										<g:if test="${registration?.errors?.getFieldError('password')}">
											<p class="alert"><g:message error="${registration?.errors?.getFieldError('password')}" /> </p>
										</g:if>
									</div>
									<div class="line">
										<label for="passwordConfirmation">Confirmação de senha:</label>
										<g:passwordField name="passwordConfirmation" />
									</div>
							</div>
							<div class="col2">

							</div>
						</div>

						<div class="oneCol">
							<div class="line">
								<label for="userAgreement">Termos de uso:</label>
								<textarea id="userAgreement" readonly><content:render name="tos-v1"/></textarea>
							</div>
							<div class="line">
								<label for="tos"><g:checkBox name="tos"/> Li estou de acordo com os termos de uso</label>
									<g:if test="${flash.tosError}">
										<p class="alert">${flash.tosError}</p>
									</g:if>
							</div>
							<div class="line">
								<g:submitButton name="submit" value="Registe-se" class="formButton big" disabled="disabled"/>
							</div>
						</div>
					</form>
				</div>
			</div>

		</section>

		<!-- footer -->
		
	</article>

</body>
</html>
