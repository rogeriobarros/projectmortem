<%@page import="org.codehaus.groovy.grails.commons.ConfigurationHolder"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <title>Post Mortem</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="background:#ffb02d;text-align:center;" bgcolor="#ffb02d">
<table id="Table_01" width="581" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;" bgcolor="#FFFFFF">
  <tr>
    <td>
    </td>
  </tr>
  <tr>
    <td style="background:#ffb02d;" bgcolor="#ffb02d">
      <table border="0" cellpadding="0" cellspacing="0" style="background:#FFFFFF;" bgcolor="#FFFFFF">
        <tr>
          <td width="44">
          </td>
          <td valign="top" style="width:493px;height:400px;text-align:left;" >
            <font face="Arial, Helvetica, sans-serif" style="color:#666;font-family:arial;font-size:13px;">
              <p>
                Agora, você já pode criar seus pactos de segredos com pessoas de sua confiança.
              </p>

              <ol>
                <li>Primeiro de tudo, ative sua loja <a href="${createLink(absolute:true, controller:'registration', action:'activate', params:[id: registration.id, activation: registration.activationCode])}" target="blank"> clicando aqui</a>.</li>
                <li>Se não conseguir copie e cole este link na barra de endereços de seu navegador: ${createLink(controller:'registration', action:'activate', params:[id: registration.id, activation: registration.activationCode])} </li>
                <li>Para convidar as pessoas para compartilhar seu pacto de segredo, acesse: <a href="http://${InetAddress.getLocalHost()}/person/">http://${InetAddress.getLocalHost()}/person/</a></li>
              </ol>
              
              <p>
              Dúvidas? Entre em contato conosco: 
              <br/><br/>
              Agora é com você. Basta cumprir esses passos e pronto!
              <br/><br/>
              Boas vendas!
              </p>
              
            </font>
          </td>

          <td width="44">
          </td>
        </tr>
      </table>
    </td> 
  </tr>

  <tr>
    <td>
      <table border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <img style="display:block;margin:0;padding:0;" src="http://static.kanlo.com.br/static/img/MktKanloforum_10.png" width="581" height="54" alt="">
          </td>
        </tr>
      </table>
    </td>
  </tr>

  <tr>
    <td>
      <table border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td>
            <a href="http://www.kanlo.com.br" style="border:0" border="0"><img style="display:block;margin:0;padding:0;" src="http://static.kanlo.com.br/static/img/MktKanloforum_11.png" width="287" height="73" border="0"></a>
          </td>
          <td>
            <img style="display:block;margin:0;padding:0;" src="http://static.kanlo.com.br/static/img/MktKanloforum_12.png" width="70" height="73" alt="">
          </td>
          <td>
            <a href="http://www.ideais.com.br" style="border:0" border="0"><img style="display:block;margin:0;padding:0;" src="http://static.kanlo.com.br/static/img/MktKanloforum_13.png" width="224" height="73" border="0"></a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>