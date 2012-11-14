<%@page import="org.codehaus.groovy.grails.commons.ConfigurationHolder"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <title>Kanlo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="background:#ffb02d;text-align:center;" bgcolor="#ffb02d">
<table id="Table_01" width="581" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;" bgcolor="#FFFFFF">
  <tr>
    <td>
      <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td>
            <img style="display:block;margin:0;padding:0;" src="http://static.kanlo.com.br/static/img/MktKanloforum_01.png" width="581" height="205" alt="">
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td style="background:#ffb02d;" bgcolor="#ffb02d">
      <table border="0" cellpadding="0" cellspacing="0" style="background:#FFFFFF;" bgcolor="#FFFFFF">
        <tr>
          <td width="44">
            <img style="display:block;margin:0;padding:0;height:450px;width:44px;" src="http://static.kanlo.com.br/static/img/MktKanloforum_02.png" width="44" height="450" />
          </td>
          <td valign="top" style="width:493px;height:400px;text-align:left;" >
            <font face="Arial, Helvetica, sans-serif" style="color:#666;font-family:arial;font-size:13px;">
              <p>
                Agora, a melhor tecnologia de e-commerce do mercado brasileiro está a serviço do seu negócio através do  Kanlo (${planName}).
              </p>

              <ul>
                <li>${products} produtos</li>
                <li>${users} usuário(s)</li>
                <li>${(domains) ? (domains - 1) + ' domínio(s) próprio(s)' : 'Domínios próprios ilimitados'}  </li>
              </ul>

              <p>Criar e gerir a sua loja on-line ficou muito mais simples. Veja só:</p>

              <ol>
                <li>Primeiro de tudo, ative sua loja <a href="${createLink(absolute:true, controller:'store', action:'activate', params:[id: registration.activationCode])}" target="blank"> clicando aqui</a>.</li>
                <li>Para configurar sua loja e fazer o acompanhamento de vendas, acesse: <a href="https://${registration.storeSymbol}.kanlo.com.br/admin/">http://${registration.storeSymbol}.kanlo.com.br/admin/</a></li>
                <li> O Kanlo oferece uma série de documentos tutoriais. Com eles, você aprende mais sobre a plataforma e pode otimizar o desempenho da sua loja. <a href="http://docs.kanlo.com.br/">http://docs.kanlo.com.br/</a></li>
              </ol>
              
              <p>
              Dúvidas? Entre em contato conosco: <a href="https://kanlo.zendesk.com/home/">http://kanlo.zendesk.com</a>
              <br/><br/>
              Agora é com você. Basta cumprir esses passos e pronto!
              <br/><br/>
              Boas vendas!
              </p>
              
            </font>
          </td>

          <td width="44">
            <img style="display:block;margin:0;padding:0;height:450px;" src="http://static.kanlo.com.br/static/img/MktKanloforum_04.png" width="44" height="450" />
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