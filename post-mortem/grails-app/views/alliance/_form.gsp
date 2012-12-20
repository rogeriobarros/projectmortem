<%@ page import="com.postmortem.alliance.Alliance"%>

<script type="text/javascript">
	function uploadFile() {
		if( $("#textFile").val().length > 0 ) {
			$.ajax({
				  url: "${createLink(controller: 'alliance', action: 'upload')}",
				  success: function(data) {
					  $('.message').html(data);
					  alert('Arquivo carregado');
					}
				};
		}else{
			alert('Deu ruim!');
		}
	}
</script>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'register', 'error')} required">
	<label for="register"> Registro	<span class="required-indicator">*</span></label>
	<g:textArea name="register" cols="40" rows="5" maxlength="5000"	required="" value="${allianceInstance?.register}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'nameTextFile', 'error')} ">
	<label for="nameTextFile">Arquivo de Texto</label>
	
	<span class="lbl">Escolha o arquivo</span>
	<input type="file" class="file" name="textFile" id="textFile" />
	<input type="button" name="upload" onclick="uploadFile(); return false;" value="Enviar Arquivo" class="btn btn1" />
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'nameSoundFile', 'error')} ">
	<label for="nameSoundFile">Arquivo de Som</label>
	<g:textField name="nameSoundFile" maxlength="50" value="${allianceInstance?.nameSoundFile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'soundFile', 'error')} ">
	<label for="soundFile">arquivo</label>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'nameImageFile', 'error')} ">
	<label for="nameImageFile">Arquivo de Imagem</label>
	<g:textField name="nameImageFile" maxlength="50" value="${allianceInstance?.nameImageFile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'imageFile', 'error')} ">
	<label for="imageFile">arquivo</label>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'nameVideoFile', 'error')} ">
	<label for="nameVideoFile">Arquivo de Vídeo	</label>
	<g:textField name="nameVideoFile" maxlength="50" value="${allianceInstance?.nameVideoFile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'videoFile', 'error')} ">
	<label for="videoFile">arquivo </label>
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'alliancePersons', 'error')} ">
	<label for="alliancePersons">Pactuantes</label>
	<g:select name="alliancePersons" from="${com.postmortem.security.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${allianceInstance?.alliancePersons*.id}" class="many-to-many" />
</div>

<div class="fieldcontain ${hasErrors(bean: allianceInstance, field: 'owner', 'error')} required">
	<label for="owner"> Dono do Pacto <span class="required-indicator">*</span>	</label>
	<g:select id="owner" name="owner.id" from="${com.postmortem.security.Person.list()}" optionKey="id"	required="" value="${allianceInstance?.owner?.id}" class="many-to-one" />
</div>

