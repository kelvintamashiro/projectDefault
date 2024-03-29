<%-- 
    Document   : gerenciador_relatorios
    Created on : 28 de ago de 2021, 09:43:59
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html lang="pt-br" class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
    </head>
    <body>

        <logic:notEqual name="nome" value="" scope="session">
            <jsp:include page="topo.jsp"/>
            <div align="center">
                <h1>Relat�rios do Sistema</h1>
                <hr/>
            </div>

            <table width="60%" border="0" align="center" class="table-condensed">
                <tr>
                    <td width="70%">
                        <b>Relat�rio de Pessoas Cadastradas</b>
                    </td>
                    <td>
                        <a href="Relatorio.do?action=relPessoasCadastradasPage" class="btn btn-success">Gerar Relat�rio</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Relat�rio de Ve�culos Cadastrados</b>
                    </td>
                    <td>
                        <a href="Relatorio.do?action=relVeiculosCadatrados" class="btn btn-success" target="_blank">Gerar Relat�rio</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Relat�rio de Ve�culos Vendidos por Data de Venda</b>
                    </td>
                    <td>
                        <a href="RelatorioVendaVeiculo.do?action=relVendasVeiculosRealizadasPage" class="btn btn-success">Gerar Relat�rio</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Relat�rio de Parcelas Pagas de Ve�culos Vendidos por M�s</b>
                    </td>
                    <td>
                        <a href="RelatorioVendaVeiculo.do?action=relParcelasPagasPage" class="btn btn-success">Gerar Relat�rio</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Relat�rio de Shaken Realizados por Data de Venda</b>
                    </td>
                    <td>
                        <a href="RelatorioShakenVeiculo.do?action=relShakenRealizadasPage" class="btn btn-success">Gerar Relat�rio</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Relat�rio de Shaken Realizados por Data do Pr�ximo Vencimento</b>
                    </td>
                    <td>
                        <a href="RelatorioShakenVeiculo.do?action=relShakenVencerPage" class="btn btn-success">Gerar Relat�rio</a>
                    </td>
                </tr>
            </table>

        </logic:notEqual>
        <logic:equal name="nome" value="" scope="session">
            <div style="padding-top: 20%">
                <div class="alert alert-danger" align="center">
                    <img src="imagens/cancel.png" width="50px"/>
                    <br/>
                    <br/>
                    Voc� n�o est� logado no sistema!!
                    <br/>
                    <br/>
                    <a href="index.jsp" class="btn btn-default">Clique aqui para voltar a p�gina de login</a>
                </div>
            </div>
        </logic:equal>

    </body>
</html>

