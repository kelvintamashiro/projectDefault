<%-- 
    Document   : login
    Created on : 6 de mar de 2021, 09:37:33
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Project Defaul - Login</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>
        <style>
            body {
                margin:0;
                padding:0;
            }
        </style>
        <script language="javascript">
            $(function () {
                $("#login").attr("placeholder", "E-mail. Ex. email@email.com");
                $("#senha").attr("placeholder", "Informe sua senha");
            });

            function fAcessar() {
                var login = document.getElementById('login').value.trim();
                var password = document.getElementById('senha').value.trim();
                if (login.length < 2) {
                    alert("Deve ser informado o login corretamente!");
                    document.getElementById('login').focus();
                } else if (password.length < 2) {
                    alert("Deve ser informado a Senha corretamente!");
                    document.getElementById('senha').focus();
                } else {
                    document.LoginModel.action = "Login.do?action=verificarLogin";
                    document.LoginModel.submit();
                }
            }

            function fEsqueceuSenha() {
                document.LoginModel.action = "Login.do?action=pageEsqueceuSenha";
                document.LoginModel.submit();
            }
        </script>
    </head>
    <body>
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="Login">
            <table width="40%" border="0" align="center" class="table-responsive">
                <tr><td style="padding-top: 30%;">&nbsp;</td></tr>
                <tr>
                    <td align="center">
                        <img src="imagens/logo_mitsistemas_nova_preta.png" width="70%"/>
                    </td>
                </tr>
                <tr><td style="padding-top: 10px;">&nbsp;</td></tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="usr">Login:</label>
                            <html:text styleClass="form-control" name="LoginModel" property="login" styleId="login"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="usr">Senha:</label>
                            <html:password styleClass="form-control" name="LoginModel" property="senha" styleId="senha"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="btn btn-success" type="button" value="Acessar Sistema" onClick="fAcessar();">
                        <input class="btn btn-default" type="button" value="Esqueceu Senha?" onClick="fEsqueceuSenha();">
                    </td>
                </tr>
            </table>
            <logic:equal name="erroLogin" value="true">
                <br/>
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Erro de Login e/ou Senha!</b>
                </div>
            </logic:equal>
        </html:form>
    </body>
</html>

