<%-- 
    Document   : controle_vendas_detalhes
    Created on : 15 de mai de 2021, 10:27:20
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Controle de Veículo</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
            function fImprimir() {
                window.print();
            }
        </script>
    </head>
    <body>

        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>

        <logic:notEqual name="nome" value="" scope="session">
            <html:form action="ControleVendas">
                <h1 align="center">Detalhes do Veículo</h1>
                <hr/>
                <div align="center">
                    <img src="<bean:write name="ControleVendasModel" property="pathImg1"/>" width="80%"/>
                </div>
                <br/>
                <table width="80%" border="1" align="center" class="table-condensed">
                    <tr>
                        <td width="50%">
                            <b>ID:</b> <bean:write name="ControleVendasModel" property="idControleVendas"/>
                        </td>
                        <td>
                            <b>Tipo Veículo:</b> <bean:write name="ControleVendasModel" property="dsTipoVeiculo"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Data Inserção:</b> <bean:write name="ControleVendasModel" property="dataInsercao"/>
                        </td>
                        <td>
                            <b>Data Venda:</b> <bean:write name="ControleVendasModel" property="dataVenda"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Marca:</b> <bean:write name="ControleVendasModel" property="dsMarcaVeiculo"/>
                        </td>
                        <td>
                            <b>Nome Veículo:</b> <bean:write name="ControleVendasModel" property="dsVeiculo"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Cor:</b> <bean:write name="ControleVendasModel" property="cor"/>
                        </td>
                        <td>
                            <b>Ano:</b> <bean:write name="ControleVendasModel" property="ano"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Preço de Compra:</b> <bean:write name="ControleVendasModel" property="precoCompra"/>
                        </td>
                        <td>
                            <b>Preço de Venda:</b> <bean:write name="ControleVendasModel" property="precoVenda"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Câmbio:</b> 
                            <logic:equal name="ControleVendasModel" property="cambio" value="A">Automático</logic:equal>
                            <logic:equal name="ControleVendasModel" property="cambio" value="M">Manual</logic:equal>
                            <logic:equal name="ControleVendasModel" property="cambio" value="AM">Automático/Manual</logic:equal>
                        </td>
                        <td>
                            <b>Motor:</b> <bean:write name="ControleVendasModel" property="motor"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Combustível:</b> 
                            <logic:equal name="ControleVendasModel" property="combustivel" value="E">Etanol</logic:equal>
                            <logic:equal name="ControleVendasModel" property="combustivel" value="G">Gasolina</logic:equal>
                            <logic:equal name="ControleVendasModel" property="combustivel" value="D">Diesel</logic:equal>
                            <logic:equal name="ControleVendasModel" property="combustivel" value="H">Híbrido</logic:equal>
                        </td>
                        <td>
                            <b>Quilometragem:</b> <bean:write name="ControleVendasModel" property="km"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Shaken:</b> <bean:write name="ControleVendasModel" property="shaken"/>
                        </td>
                        <td>
                            <b>Chassi</b> <bean:write name="ControleVendasModel" property="chassi"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Capacidade de Pessoa:</b> <bean:write name="ControleVendasModel" property="capacidadePessoa"/>
                        </td>
                        <td>
                            <logic:equal name="ControleVendasModel" property="idTipoVeiculo" value="1">
                                <b>N. Portas</b> <bean:write name="ControleVendasModel" property="nrPortas"/>
                            </logic:equal>
                            <logic:equal name="ControleVendasModel" property="idTipoVeiculo" value="2">
                                <b>Freio</b> <bean:write name="ControleVendasModel" property="freio"/>
                            </logic:equal>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <b>Detalhes Extras</b> <bean:write name="ControleVendasModel" property="detalhesExtras"/>
                        </td>
                    </tr>    
                </table>

                <div align="center" style="padding-top: 50px">
                    <input class="btn btn-default" style="width: 200px" type="button" value="Imprimir" onClick="fImprimir();">
                </div>
            </html:form>
        </logic:notEqual>    
    </body>
</html>

