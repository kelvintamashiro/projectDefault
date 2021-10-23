<%-- 
    Document   : controle_financeiro_comparacao
    Created on : 23 de out de 2021, 09:53:03
    Author     : macuser
--%>

<%-- 
    Document   : controle_financeiro_pesquisar
    Created on : 9 de out de 2021, 10:33:26
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
        <script type="text/javascript">
            function fComparar() {
            var mes = document.getElementById("mes").value;
            var mesComparacao = document.getElementById("mesComparacao").value;
            var ano = document.getElementById("ano").value;
            var anoComparacao = document.getElementById("anoComparacao").value;
            
            if (ano.length < 4 || anoComparacao.length < 4) {
                alert("Deve ser informado o ano corretamente!!");
            } else if (mes === mesComparacao && ano === anoComparacao){
                alert("Deve ser informado meses diferentes")
            }else {
            document.ControleFinanceiroModel.action = "ControleFinanceiro.do?action=compararMeses";
            document.ControleFinanceiroModel.target = "_self";
            document.ControleFinanceiroModel.submit();
            }
            }


        </script>


    </head>
    <body>

        <logic:notEqual name="nome" value="" scope="session">
            <jsp:include page="topo.jsp"/>
            <div align="center">
                <h1>Comparativo entre 2 meses</h1>
                <hr/>
            </div>

            <html:form action="ControleFinanceiro">
                <table width="40%" border="0" align="center" class="table-condensed">
                    <tr>
                        <td colspan="2" align="center">
                            Informe dois meses para que o sistema faça uma análise comparativa do controle financeiro
                        </td>
                    </tr>
                    <tr>
                        <td width="55%">
                            <label>Mês Comparativo - 1</label>
                            <html:select name="ControleFinanceiroModel" property="mes" styleId="mes" styleClass="form-control">
                                <html:option value="1">Janeiro</html:option>
                                <html:option value="2">Fevereiro</html:option>
                                <html:option value="3">Março</html:option>
                                <html:option value="4">Abril</html:option>
                                <html:option value="5">Maio</html:option>
                                <html:option value="6">Junho</html:option>
                                <html:option value="7">Julho</html:option>
                                <html:option value="8">Agosto</html:option>
                                <html:option value="9">Setembro</html:option>
                                <html:option value="10">Outubro</html:option>
                                <html:option value="11">Novembro</html:option>
                                <html:option value="12">Dezembro</html:option>
                            </html:select>
                        </td>
                        <td width="15%">
                            <label>Ano Comparativo - 1</label>
                            <html:text name="ControleFinanceiroModel" property="ano" styleId="ano" styleClass="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="55%">
                            <label>Mês Comparativo - 2</label>
                            <html:select name="ControleFinanceiroModel" property="mesComparacao" styleId="mesComparacao" styleClass="form-control">
                                <html:option value="1">Janeiro</html:option>
                                <html:option value="2">Fevereiro</html:option>
                                <html:option value="3">Março</html:option>
                                <html:option value="4">Abril</html:option>
                                <html:option value="5">Maio</html:option>
                                <html:option value="6">Junho</html:option>
                                <html:option value="7">Julho</html:option>
                                <html:option value="8">Agosto</html:option>
                                <html:option value="9">Setembro</html:option>
                                <html:option value="10">Outubro</html:option>
                                <html:option value="11">Novembro</html:option>
                                <html:option value="12">Dezembro</html:option>
                            </html:select>
                        </td>
                        <td width="15%">
                            <label>Ano Comparativo - 2</label>
                            <html:text name="ControleFinanceiroModel" property="anoComparacao" styleId="anoComparacao" styleClass="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            <a href="javascript:fComparar()" class="btn btn-success">Comparar</a>
                        </td>
                    </tr>
                </table>
                <hr/>
                <logic:equal name="result" scope="request" value="true">
                    <table width="90%" border="0" align="center" class="table-condensed">
                        <tr>
                            <td width="50%" valign="top" style="background-color: #FFF8DC; padding: 40px"> <!-- coluna 1 -->
                                <table width="100%" border="0" align="center" class="table-condensed">
                                    <tr>
                                        <td colspan="5" align="center">
                                            <h2>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="1">Janeiro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="2">Fevereiro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="3">Março</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="4">Abril</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="5">Maio</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="6">Junho</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="7">Julho</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="8">Agosto</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="9">Setembro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="10">Outubro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="11">Novembro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mes" value="12">Dezembro</logic:equal>
                                                / <bean:write name="ControleFinanceiroModel" property="ano"/>
                                            </h2>
                                            <hr/>
                                        </td>
                                    </tr>
                                    <logic:present name="listaControleFinanceiro" scope="request">
                                        <tr>
                                            <td><label>ID</label></td>
                                            <td><label>Tipo</label></td>
                                            <td><label>Data de Referência</label></td>
                                            <td><label>Valor</label></td>
                                            <td><label>Descrição</label></td>
                                        </tr>
                                        <logic:iterate name="listaControleFinanceiro" id="lista" scope="request">
                                            <tr>
                                                <td>
                                                    <bean:write name="lista" property="id"/>
                                                </td>
                                                <td>
                                                    <bean:write name="lista" property="tipo"/>
                                                </td>
                                                <td>
                                                    <bean:write name="lista" property="dataReferencia"/>
                                                </td>
                                                <td>
                                                    ¥<bean:write name="lista" property="valor"/>
                                                </td>
                                                <td>
                                                    <bean:write name="lista" property="descricao"/>
                                                </td>
                                            </tr>
                                        </logic:iterate>
                                        <tr>
                                            <td colspan="5">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <b>Valor Total Entrada: <bean:write name="ControleFinanceiroModel" property="vlTotalEntrada"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <b>Valor Total Saída: <bean:write name="ControleFinanceiroModel" property="vlTotalSaida"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <b>Valor Total Líquido: <bean:write name="ControleFinanceiroModel" property="vlTotalLiquido"/></b>
                                            </td>
                                        </tr>
                                    </logic:present>
                                    <logic:notPresent name="listaControleFinanceiro" scope="request">
                                        <tr>
                                            <td colspan="5" align="center">
                                                <div class="alert alert-danger">
                                                    Nenhum registro cadastrado para o mês    
                                                </div>

                                            </td>
                                        </tr>
                                    </logic:notPresent>
                                </table>
                            </td><!-- final coluna 1 -->
                            <td width="50%" valign="top" style="background-color: #E0FFFF; padding: 40px"> <!-- coluna 2 -->
                                <table width="100%" border="0" align="center" class="table-condensed">
                                    <tr>
                                        <td colspan="5" align="center">
                                            <h2>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="1">Janeiro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="2">Fevereiro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="3">Março</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="4">Abril</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="5">Maio</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="6">Junho</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="7">Julho</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="8">Agosto</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="9">Setembro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="10">Outubro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="11">Novembro</logic:equal>
                                                <logic:equal name="ControleFinanceiroModel" property="mesComparacao" value="12">Dezembro</logic:equal>
                                                / <bean:write name="ControleFinanceiroModel" property="anoComparacao"/>
                                            </h2>
                                            <hr/>
                                        </td>
                                    </tr>
                                    <logic:present name="listaControleFinanceiroComparacao" scope="request">
                                        <tr>
                                            <td><label>ID</label></td>
                                            <td><label>Tipo</label></td>
                                            <td><label>Data de Referência</label></td>
                                            <td><label>Valor</label></td>
                                            <td><label>Descrição</label></td>
                                        </tr>
                                        <logic:iterate name="listaControleFinanceiroComparacao" id="listaC" scope="request">
                                            <tr>
                                                <td>
                                                    <bean:write name="listaC" property="id"/>
                                                </td>
                                                <td>
                                                    <bean:write name="listaC" property="tipo"/>
                                                </td>
                                                <td>
                                                    <bean:write name="listaC" property="dataReferencia"/>
                                                </td>
                                                <td>
                                                    ¥<bean:write name="listaC" property="valor"/>
                                                </td>
                                                <td>
                                                    <bean:write name="listaC" property="descricao"/>
                                                </td>
                                            </tr>
                                        </logic:iterate>
                                        <tr>
                                            <td colspan="5">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <b>Valor Total Entrada: <bean:write name="ControleFinanceiroModelComparacao" property="vlTotalEntrada"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <b>Valor Total Saída: <bean:write name="ControleFinanceiroModelComparacao" property="vlTotalSaida"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <b>Valor Total Líquido: <bean:write name="ControleFinanceiroModelComparacao" property="vlTotalLiquido"/></b>
                                            </td>
                                        </tr>
                                    </logic:present>
                                    <logic:notPresent name="listaControleFinanceiroComparacao" scope="request">
                                        <tr>
                                            <td colspan="5" align="center">
                                                <div class="alert alert-danger">
                                                    Nenhum registro cadastrado para o mês    
                                                </div>

                                            </td>
                                        </tr>
                                    </logic:notPresent>
                                </table>
                            </td> <!-- final coluna 2 -->
                        </tr>

                    </table>

                    <table width="90%" border="0" align="center" class="table-condensed">
                        <tr>
                            <td width="50%" style="background-color: #FFF8DC">
                                <canvas class="line-chart"></canvas>
                            </td>
                            <td width="50%" style="background-color: #E0FFFF">
                                <canvas class="line-chart-comparacao"></canvas>
                            </td>
                        </tr>
                    </table>
                    <script>
                        var ctx = document.getElementsByClassName("line-chart");
                        var chartGraph = new Chart(ctx, {
                        type: "bar",
                                data: {
                                labels: ["Resultado Final"],
                                        datasets: [{
                                        label: "Entrada",
                                                data: [<bean:write name="ControleFinanceiroModel" property="vlTotalEntradaGrafico"/>],
                                                borderWidth: 1,
                                                backgroundColor: "#7CFC00"
                                        }, {
                                        label: "Saida",
                                                data: [<bean:write name="ControleFinanceiroModel" property="vlTotalSaidaGrafico"/>],
                                                borderWidth: 1,
                                                backgroundColor: "#FFA500"
                                        }, {
                                        label: "Liquido",
                                                data: [<bean:write name="ControleFinanceiroModel" property="vlTotalLiquidoGrafico"/>],
                                                borderWidth: 1,
                        <logic:greaterEqual name="ControleFinanceiroModel" property="vlTotalLiquidoGrafico" value="0">
                                        backgroundColor: "#00BFFF"
                        </logic:greaterEqual>
                        <logic:lessThan name="ControleFinanceiroModel" property="vlTotalLiquidoGrafico" value="0">
                                        backgroundColor: "#FF0000"
                        </logic:lessThan>

                                        }
                                        ]
                                },
                                options: {
                                scales: {
                                yAxes: [{
                                display: true,
                                        ticks: {
                                        beginAtZero: true,
                        <logic:greaterEqual name="ControleFinanceiroModel" property="vlTotalLiquidoGrafico" value="0">
                                        min: 0
                        </logic:greaterEqual>
                        <logic:lessThan name="ControleFinanceiroModel" property="vlTotalLiquidoGrafico" value="0">
                                        min: <bean:write name="ControleFinanceiroModel" property="vlTotalLiquidoGrafico"/>
                        </logic:lessThan>

                                        }
                                }]
                                }
                                }
                        });
                    </script>
                    <script>
                        var ctx = document.getElementsByClassName("line-chart-comparacao");
                        var chartGraph = new Chart(ctx, {
                        type: "bar",
                                data: {
                                labels: ["Resultado Final"],
                                        datasets: [{
                                        label: "Entrada",
                                                data: [<bean:write name="ControleFinanceiroModelComparacao" property="vlTotalEntradaGrafico"/>],
                                                borderWidth: 1,
                                                backgroundColor: "#7CFC00"
                                        }, {
                                        label: "Saida",
                                                data: [<bean:write name="ControleFinanceiroModelComparacao" property="vlTotalSaidaGrafico"/>],
                                                borderWidth: 1,
                                                backgroundColor: "#FFA500"
                                        }, {
                                        label: "Liquido",
                                                data: [<bean:write name="ControleFinanceiroModelComparacao" property="vlTotalLiquidoGrafico"/>],
                                                borderWidth: 1,
                        <logic:greaterEqual name="ControleFinanceiroModelComparacao" property="vlTotalLiquidoGrafico" value="0">
                                        backgroundColor: "#00BFFF"
                        </logic:greaterEqual>
                        <logic:lessThan name="ControleFinanceiroModelComparacao" property="vlTotalLiquidoGrafico" value="0">
                                        backgroundColor: "#FF0000"
                        </logic:lessThan>

                                        }
                                        ]
                                },
                                options: {
                                scales: {
                                yAxes: [{
                                display: true,
                                        ticks: {
                                        beginAtZero: true,
                        <logic:greaterEqual name="ControleFinanceiroModelComparacao" property="vlTotalLiquidoGrafico" value="0">
                                        min: 0
                        </logic:greaterEqual>
                        <logic:lessThan name="ControleFinanceiroModelComparacao" property="vlTotalLiquidoGrafico" value="0">
                                        min: <bean:write name="ControleFinanceiroModelComparacao" property="vlTotalLiquidoGrafico"/>
                        </logic:lessThan>

                                        }
                                }]
                                }
                                }
                        });


                    </script>

                </logic:equal>
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
    </body>
</html>



