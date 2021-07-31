<%-- 
    Document   : controle_vendas_pesquisar
    Created on : 8 de mai de 2021, 10:50:21
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
            function fCarregarMarcaVeiculo() {
                document.ControleVendasModel.action = "ControleVendas.do?action=carregarMarcaVeiculoP";
                document.ControleVendasModel.submit();
            }

            function fCarregarVeiculosPorMarca() {
                document.ControleVendasModel.action = "ControleVendas.do?action=carregarVeiculosP";
                document.ControleVendasModel.submit();
            }

            function fPesquisar() {
                document.ControleVendasModel.action = "ControleVendas.do?action=pesquisarVeiculos";
                document.ControleVendasModel.submit();
            }

            function fDetalhes(id) {
                window.open('ControleVendas.do?action=detalhesVeiculo&idVendaVeiculo=' + id, 'DetalhesVeiculo', 'width=800; height=600');
            }

            function fEditar(id) {
                document.ControleVendasModel.action = "ControleVendas.do?action=pageAtualizar&idVendaVeiculo=" + id;
                document.ControleVendasModel.submit();
            }

            function fExcluir(id) {
                if (confirm("Deseja realmente excluir??")) {
                    document.ControleVendasModel.action = "ControleVendas.do?action=excluir&idVendaVeiculo=" + id;
                    document.ControleVendasModel.submit();
                }
            }
            
            function fParcelas(id) {
                document.ControleVendasModel.action = "ControleVendas.do?action=pageParcela&idVendaVeiculo=" + id;
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
                <h1>Pesquisa Veículos Vendidos</h1>
                <hr/>
            </div>
            <html:form action="ControleVendas">
                <table width="60%" border="0" align="center" class="table-condensed">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Tipo de Veículo:
                                <html:select property="idTipoVeiculo" styleClass="form-control" styleId="idTipoVeiculo" onchange="fCarregarMarcaVeiculo()">
                                    <html:option value="0">Selecione</html:option>
                                    <html:options collection="listaTipoVeiculo" property="idTipoVeiculo" labelProperty="dsTipoVeiculo"></html:options>
                                </html:select>   
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <logic:present name="listaMarcaVeiculo" scope="session">
                            <td>
                                <div class="col-lg-12">
                                    Marca de Veículo:
                                    <html:select property="idMarcaVeiculo" styleClass="form-control" styleId="idMarcaVeiculo" onchange="fCarregarVeiculosPorMarca()">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaMarcaVeiculo" property="idMarcaVeiculo" labelProperty="dsMarcaVeiculo"></html:options>
                                    </html:select>   
                                </div>
                            </td>
                        </logic:present>
                    </tr>
                    <tr>
                        <logic:present name="listaVeiculoPorMarca" scope="session">
                            <td>
                                <div class="col-lg-12">
                                    Veículo:
                                    <html:select property="idVeiculo" styleClass="form-control" styleId="idVeiculo">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaVeiculoPorMarca" property="idVeiculo" labelProperty="nomeVeiculo"></html:options>
                                    </html:select>   
                                </div>
                            </td>
                        </logic:present>
                    </tr>
                    <logic:present name="listaMarcaVeiculo" scope="session">
                        <tr style="height: 70px">
                            <td>
                                <input class="btn btn-success" style="width: 200px" type="button" value="Pesquisar" onClick="fPesquisar();">
                            </td>
                        </tr>
                    </logic:present>
                </table>


                <logic:present name="listaVeiculos" scope="request">
                    <logic:iterate name="listaVeiculos" id="lista" scope="request">
                        <table width="60%" border="0" align="center" class="table-condensed" style="background-color: #F4F4F4">
                            <tr>
                                <td style="padding-left: 30px"> <!-- coluna 1 -->
                                    <table border="0">
                                        <tr>
                                            <td width="20%">
                                                <b>ID:</b> <bean:write name="lista" property="idVendaVeiculo"/>
                                            </td>
                                            <td width="20%">
                                                <b>Ano:</b> <bean:write name="lista" property="ano"/>
                                            </td>
                                            <td width="20%">
                                                <b>Tipo Veículo:</b> <bean:write name="lista" property="dsTipoVeiculo"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>Cor:</b> <bean:write name="lista" property="cor"/>
                                            </td>
                                            <td>
                                                <b>Marca:</b> <bean:write name="lista" property="dsMarcaVeiculo"/>
                                            </td>
                                            <td>
                                                <b>KM:</b> <bean:write name="lista" property="km"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>Nome Veículo:</b> <bean:write name="lista" property="dsVeiculo"/>
                                            </td>
                                            <td>
                                                <b>Preço Venda:</b> <bean:write name="lista" property="precoVenda"/>
                                            </td>
                                            <td>
                                                <b>Valor Restante:</b> <bean:write name="lista" property="valorRestante"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>Pessoa Venda:</b> <bean:write name="lista" property="nomePessoa"/>
                                            </td>
                                            <td>
                                                <b>Valor Entrada:</b> <bean:write name="lista" property="valorEntrada"/>
                                            </td>
                                            <td>
                                                <b>Quantidade Parcelas:</b> <bean:write name="lista" property="qtdParcelas"/>
                                            </td>

                                        </tr>
                                    </table>
                                </td> 
                                <td> <!-- coluna 2 -->
                                    <table border="0">
                                        <tr>
                                            <td style="padding: 5px">
                                                <input class="btn btn-warning" style="width: 100px" type="button" value="Detalhes" onClick="fDetalhes(<bean:write name="lista" property="idVendaVeiculo"/>);">
                                            </td>
                                            <td>
                                                <input class="btn btn-primary" style="width: 100px" type="button" value="Editar" onClick="fEditar(<bean:write name="lista" property="idVendaVeiculo"/>);">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px">
                                                <input class="btn btn-default" style="width: 100px" type="button" value="Parcelas" onClick="fParcelas(<bean:write name="lista" property="idVendaVeiculo"/>);">
                                            </td>
                                            <td>
                                                <input class="btn btn-danger" style="width: 100px" type="button" value="Excluir" onClick="fExcluir(<bean:write name="lista" property="idVendaVeiculo"/>);">
                                            </td>
                                        </tr>
                                    </table>
                                </td> 
                                <td>
                                    <table border="0">
                                        <tr>
                                            <td>
                                                <img src="<bean:write name="lista" property="pathImg1"/>" width="200px"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                        
                        <br/>
                    </logic:iterate>
                </logic:present>


            </html:form>

        </logic:notEqual>    
    </body>
</html>

