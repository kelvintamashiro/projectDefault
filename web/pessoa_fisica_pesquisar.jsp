<%-- 
    Document   : pessoa_fisica_pesquisar
    Created on : 13/fev/2021, 11:01:19
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function fPesquisar() {
                var nome = document.getElementById("nome").value;
                var email = document.getElementById("email").value;
                var sexo = document.getElementById("sexo").value;
                if (nome.length < 3 && email.search('@') < 0 && sexo === "") {
                    alert("Um dos campos deve ser preenchido!!")
                } else {
                    document.PessoaFisicaModel.action = "PessoaFisica.do?action=pesquisar";
                    document.PessoaFisicaModel.submit();
                }

            }
        </script>

    </head>
    <body>

        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>

        <div align="center">
            <h1>Pesquisa de Pessoa</h1>
            <hr/>
        </div>
        <html:form action="PessoaFisica">
            <table width="80%" border="0" align="center" class="table-condensed">
                <tr>
                    <td width="25%">
                        <div class="col-lg-12">
                            Nome:
                            <html:text styleClass="form-control" name="PessoaFisicaModel" property="nome" styleId="nome"/>        
                        </div>
                    </td>
                    <td width="25%" colspan="2">
                        <div class="col-lg-12">
                            E-mail:
                            <html:text styleClass="form-control" name="PessoaFisicaModel" property="email" styleId="email"/>        
                        </div>
                    </td>
                    <td width="25%">
                        <div class="col-lg-12">
                            Sexo:
                            <html:select styleClass="form-control" name="PessoaFisicaModel" property="sexo" styleId="sexo">
                                <html:option value="">Selecione</html:option>
                                <html:option value="M">Masculino</html:option>
                                <html:option value="F">Feminino</html:option>
                            </html:select>
                        </div>
                    </td>
                    <td width="25%">
                        <div class="col-lg-12">
                            &nbsp; <br/>
                            <input class="btn btn-success" type="button" value="Pesquisar" onClick="fPesquisar();">
                        </div>
                    </td>

                </tr>
            </table>

            <logic:present name="listaPessoaFisica" scope="request">
                
                <table align="center" class="table">
                    <tr style="background-color: #F4F4F4">
                        <td><b>Nome</b></td>
                        <td><b>E-mail</b></td>
                        <td><b>Sexo</b></td>
                        <td><b>Data de Nascimento</b></td>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <logic:iterate name="listaPessoaFisica" scope="request" id="listaP">
                        <tr>
                            <td><bean:write name="listaP" property="nome"/></td>
                            <td><bean:write name="listaP" property="email"/></td>
                            <td><bean:write name="listaP" property="sexo"/></td>
                            <td><bean:write name="listaP" property="dataNascimento"/></td>
                            <td>
                                <input type="button" class="btn btn-info" value="Editar" onclick="fEditar()"/>
                                <input type="button" class="btn btn-danger" value="Excluir" onclick="fEditar()"/>
                            </td>
                        </tr>
                    </logic:iterate>
                    
                </table>
                
            </logic:present>

        </html:form>
    </body>
</html>
