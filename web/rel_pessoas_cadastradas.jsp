<%-- 
    Document   : rel_pessoas_cadastradas
    Created on : 28 de ago de 2021, 10:41:25
    Author     : macuser
--%>


<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Relatórios</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" media="all" type="text/css" href="css/estilo.css" />

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
    </head>
    <body>
        <div align="center">
            <img src="imagens/logo_mitsistemas_nova_preta.png"/>
            <hr/>
        </div>

        <table width="90%" class="table-condensed" align="center">
            <tr style="background-color: #D3D3D3">
                <td><b>ID</b></td>
                <td><b>Nome</b></td>
                <td><b>Data Nascimento</b></td>
                <td><b>Sexo</b></td>
                <td><b>E-mail</b></td>
                <td><b>MyNumber</b></td>
                <td><b>Telefone</b></td>
                <td><b>Tipo Telefone</b></td>
                <td><b>Província</b></td>
                <td><b>Cidade</b></td>
                <td><b>CEP</b></td>
                <td><b>Endereço</b></td>
                <td><b>Bairro</b></td>
            </tr>
            <logic:present name="listaPessoasCadastradas" scope="request">
                <logic:iterate name="listaPessoasCadastradas" id="lista" scope="request">
                    <tr>
                        <td><bean:write name="lista" property="idPessoa"/></td>
                        <td><bean:write name="lista" property="nomePessoa"/></td>
                        <td><bean:write name="lista" property="dataNascimento"/></td>
                        <td><bean:write name="lista" property="sexo"/></td>
                        <td><bean:write name="lista" property="email"/></td>
                        <td><bean:write name="lista" property="myNumber"/></td>
                        <td><bean:write name="lista" property="numeroTelefone"/></td>
                        <td><bean:write name="lista" property="tipoTelefone"/></td>
                        <td><bean:write name="lista" property="provincia"/></td>
                        <td><bean:write name="lista" property="cidade"/></td>
                        <td><bean:write name="lista" property="cep"/></td>
                        <td><bean:write name="lista" property="endereco"/></td>
                        <td><bean:write name="lista" property="bairro"/></td>
                    </tr>
                </logic:iterate>
                    <tr><td colspan="13" align="center">&nbsp;</td></tr>
                    <tr><td colspan="13" align="center">&nbsp;</td></tr>
                    <tr>
                        <td colspan="13" align="center">
                            <input type="button" class="btn btn-default" value="Imprimir" onclick="javascript: style.display='none', window.print()"/>
                        </td>
                    </tr>
            </logic:present>
                    
                    
        </table>



    </body>
</html>
