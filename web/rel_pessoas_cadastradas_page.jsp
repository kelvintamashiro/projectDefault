<%-- 
    Document   : rel_pessoas_cadastradas_page
    Created on : 4 de set de 2021, 10:57:33
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html lang="pt-br" class="js-disabled">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project Default - Tela Inicial</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" media="all" type="text/css" href="css/estilo.css" />

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
        <script type="text/javascript">
            function fVisualizar() {
                var dataInicio = document.getElementById("dataInicio").value;
                var dataFinal = document.getElementById("dataFinal").value;

                if (dataInicio.length < 1) {
                    alert("Deve ser informado a data de Início!!");
                } else if (dataFinal.length < 1) {
                    alert("Deve ser informado a data Final!!");
                } else {
                    document.RelatorioModel.action = "Relatorio.do?action=relPessoasCadastradas";
                    document.RelatorioModel.target = "_blank";
                    document.RelatorioModel.submit();
                }
            }
        </script>
    </head>
    <body>

        <logic:notEqual name="nome" value="" scope="session">
            <jsp:include page="topo.jsp"/>
            <div align="center">
                <h1>Relatórios de Pessoas Cadastradas</h1>
                <hr/>
            </div>

            <html:form action="Relatorio">
                <table width="60%" border="0" align="center" class="table-condensed">
                    <tr>
                        <td>
                            <label>Data de Início</label>
                            <input type="date" class="form-control" id="dataInicio" name="dataInicio"/>
                        </td>
                        <td>
                            <label>Data Final</label>
                            <input type="date" class="form-control" id="dataFinal" name="dataFinal"/>
                        </td>
                        <td>
                            <br/>
                            <a href="javascript:fVisualizar()" class="btn btn-success">Visualizar</a>
                        </td>
                    </tr>
                </table>
            </html:form>

        </logic:notEqual>
        <logic:equal name="nome" value="" scope="session">
            <div style="padding-top: 20%">
                <div class="alert alert-danger" align="center">
                    <img src="imagens/cancel.png" width="50px"/>
                    <br/>
                    <br/>
                    Você não está logado no sistema!!
                    <br/>
                    <br/>
                    <a href="index.jsp" class="btn btn-default">Clique aqui para voltar a página de login</a>
                </div>
            </div>
        </logic:equal>

        <div>
            <%--<jsp:include page="footer.jsp"/>--%>
        </div>
    </body>
</html>

