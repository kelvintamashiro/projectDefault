<%-- 
    Document   : controle_vendas_page
    Created on : 1 de mai de 2021, 09:58:49
    Author     : macuser
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Controle de Ve�culo</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function fCarregarMarcaVeiculo() {
                document.ControleVendasModel.action = "ControleVendas.do?action=carregarMarcaVeiculo";
                document.ControleVendasModel.submit();
            }

            function fCarregarVeiculosPorMarca() {
                document.ControleVendasModel.action = "ControleVendas.do?action=carregarVeiculos";
                document.ControleVendasModel.submit();
            }

            function fValidarVeiculo() {
                document.ControleVendasModel.action = "ControleVendas.do?action=validarVeiculo";
                document.ControleVendasModel.submit();
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
            <jsp:include page="topo.jsp"/>

            <div align="center">
                <h1>Controle Vendas de Ve�culo</h1>
                <hr/>
            </div>
            <html:form action="ControleVendas">
                <table width="60%" border="0" align="center" class="table-condensed">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Tipo de Ve�culo:
                                <html:select property="idTipoVeiculo" styleClass="form-control" styleId="idTipoVeiculo" onchange="fCarregarMarcaVeiculo()">
                                    <html:option value="">Selecione</html:option>
                                    <html:options collection="listaTipoVeiculo" property="idTipoVeiculo" labelProperty="dsTipoVeiculo"></html:options>
                                </html:select>   
                            </div>
                        </td>
                        <logic:present name="listaMarcaVeiculo" scope="session">
                            <td>
                                <div class="col-lg-12">
                                    Marca de Ve�culo:
                                    <html:select property="idMarcaVeiculo" styleClass="form-control" styleId="idMarcaVeiculo" onchange="fCarregarVeiculosPorMarca()">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaMarcaVeiculo" property="idMarcaVeiculo" labelProperty="dsMarcaVeiculo"></html:options>
                                    </html:select>   
                                </div>
                            </td>
                        </logic:present>
                        <logic:present name="listaVeiculoPorMarca" scope="session">
                            <td>
                                <div class="col-lg-12">
                                    Ve�culo:
                                    <html:select property="idVeiculo" styleClass="form-control" styleId="idVeiculo" onchange="fValidarVeiculo()">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaVeiculoPorMarca" property="idVeiculo" labelProperty="nomeVeiculo"></html:options>
                                    </html:select>   
                                </div>
                            </td>
                            <td>
                                <br/>
                                <a href="NomeVeiculo.do" style="color: red">
                                    Caso o ve�culo n�o esteja cadastrado, <br/>
                                    Clique aqui para cadastrar
                                </a>
                            </td>
                        </logic:present>
                    </tr>
                </table>

                <logic:equal name="detalhesVeiculo" value="true">
                    <table width="60%" border="0" align="center" class="table-condensed">
                        <tr style="height: 70px">
                            <td>
                                <div class="col-lg-12">
                                    Chassi:
                                    <html:text name="ControleVendasModel" property="chassi" styleClass="form-control"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Cor:
                                    <html:text name="ControleVendasModel" property="cor" styleClass="form-control"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Ano:
                                    <html:text name="ControleVendasModel" property="ano" styleClass="form-control"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    C�mbio:
                                    <html:select name="ControleVendasModel" property="cambio" styleClass="form-control" styleId="cambio">
                                        <html:option value="">Selecione</html:option>
                                        <html:option value="A">Autom�tico</html:option>
                                        <html:option value="M">Manual</html:option>
                                        <html:option value="AM">Autom�tico/Manual</html:option>
                                    </html:select> 
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 70px">
                            <td>
                                <div class="col-lg-12">
                                    Pre�o de Compra:
                                    <html:text name="ControleVendasModel" property="precoCompra" styleClass="form-control"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Pre�o de Venda:
                                    <html:text name="ControleVendasModel" property="precoVenda" styleClass="form-control"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Motor:
                                    <html:text name="ControleVendasModel" property="motor" styleClass="form-control"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Combust�vel:
                                    <html:select name="ControleVendasModel" property="combustivel" styleClass="form-control" styleId="cambio">
                                        <html:option value="">Selecione</html:option>
                                        <html:option value="E">Etanol</html:option>
                                        <html:option value="G">Gasolina</html:option>
                                        <html:option value="D">Diesel</html:option>
                                        <html:option value="H">H�brido</html:option>
                                    </html:select> 
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 70px">
                            <td>
                                <div class="col-lg-12">
                                    KM rodados:
                                    <html:text name="ControleVendasModel" property="km" styleClass="form-control"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Shaken:
                                    <html:text name="ControleVendasModel" property="shaken" styleClass="form-control"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Capacidade de Pessoas:
                                    <html:select name="ControleVendasModel" property="capacidadePessoa" styleClass="form-control" styleId="capacidadePessoa">
                                        <html:option value="">Selecione</html:option>
                                        <html:option value="1">1</html:option>
                                        <html:option value="2">2</html:option>
                                        <html:option value="3">3</html:option>
                                        <html:option value="4">4</html:option>
                                        <html:option value="5">5</html:option>
                                        <html:option value="6">6</html:option>
                                        <html:option value="7">7</html:option>
                                        <html:option value="8">8</html:option>
                                        <html:option value="9">9</html:option>
                                        <html:option value="10">10</html:option>
                                        <html:option value="11">+10</html:option>
                                    </html:select> 
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    N. Portas:
                                    <html:select name="ControleVendasModel" property="nrPortas" styleClass="form-control" styleId="nrPortas">
                                        <html:option value="">Selecione</html:option>
                                        <html:option value="1">1</html:option>
                                        <html:option value="2">2</html:option>
                                        <html:option value="3">3</html:option>
                                        <html:option value="4">4</html:option>
                                        <html:option value="5">5</html:option>
                                        <html:option value="6">6</html:option>
                                        <html:option value="7">7</html:option>
                                    </html:select>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 70px">
                            <td colspan="4">
                                <div class="col-lg-12">
                                    Detalhes Extras:
                                    <html:textarea name="ControleVendasModel" property="detalhesExtras" styleClass="form-control" rows="10"></html:textarea>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 70px">
                            <td colspan="4" align="center">
                                <input class="btn btn-success" style="width: 200px" type="button" value="Salvar" onClick="fSalvar();">
                            </td>
                        </tr>
                    </table>
                </logic:equal>

            </html:form>

        </logic:notEqual>    
    </body>
</html>
