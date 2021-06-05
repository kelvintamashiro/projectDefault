<%-- 
    Document   : shaken_page
    Created on : 5 de jun de 2021, 10:59:22
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Controle de Veículo</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function fSalvar() {
//                var idTipoVeiculo = document.ControleVendasModel.idTipoVeiculo.value;
//                var chassi = document.ControleVendasModel.chassi.value;
//                var cor = document.ControleVendasModel.cor.value;
//                var ano = document.ControleVendasModel.ano.value;
//                var cambio = document.ControleVendasModel.cambio.value;
//                var precoVenda = document.ControleVendasModel.precoVenda.value;
//                var motor = document.ControleVendasModel.motor.value;
//                var combustivel = document.ControleVendasModel.combustivel.value;
//                var km = document.ControleVendasModel.km.value;
//                var shaken = document.ControleVendasModel.shaken.value;
//                var capacidadePessoa = document.ControleVendasModel.capacidadePessoa.value;
//                var dataVenda = document.getElementById("dataVenda").value;
//
//                document.ControleVendasModel.action = "ControleVendas.do?action=save&dataVenda=" + dataVenda;
//                document.ControleVendasModel.submit();
//
//
//                if (chassi === "") {
//                    alert("Deve ser informado o Chassi");
//                    document.getElementById("chassi").focus();
//                } else if (cor === "") {
//                    alert("Deve ser informado a Cor");
//                    document.getElementById("cor").focus();
//                } else if (ano === "") {
//                    alert("Deve ser informado o Ano");
//                    document.getElementById("ano").focus();
//                } else if (cambio === "") {
//                    alert("Deve ser informado o Câmbio");
//                    document.getElementById("cambio").focus();
//                } else if (precoVenda.length < 4) {
//                    alert("Deve ser informado o Preco de Venda Corretamente");
//                    document.getElementById("precoVenda").focus();
//                } else if (motor === "") {
//                    alert("Deve ser informado o Motor");
//                    document.getElementById("motor").focus();
//                } else if (combustivel === "") {
//                    alert("Deve ser informado a Tipo de Combustível");
//                    document.getElementById("combustivel").focus();
//                } else if (km === "") {
//                    alert("Deve ser informado a quilometragem");
//                    document.getElementById("km").focus();
//                } else if (shaken === "") {
//                    alert("Deve ser informado o Shaken do veículo");
//                    document.getElementById("shaken").focus();
//                } else if (capacidadePessoa === "") {
//                    alert("Deve ser informado a capacidade de pessoas");
//                    document.getElementById("capacidadePessoa").focus();
//                } 
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
                <h1>Cadastro de Shaken</h1>
                <hr/>
            </div>
            <html:form action="Shaken">
                <table width="60%" border="0" align="center" class="table-condensed">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Nome Pessoa Física:
                                <html:select property="idPessoa" styleClass="form-control" styleId="idPessoa">
                                    <html:option value="">Selecione</html:option>
                                    <html:options collection="listaPessoaFisica" property="id" labelProperty="nome"></html:options>
                                </html:select>   
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Tipo de Veículo:
                                <html:select property="idTipoVeiculo" styleClass="form-control" styleId="idTipoVeiculo" onchange="fCarregarMarcaVeiculo()">
                                    <html:option value="">Selecione</html:option>
                                    <html:options collection="listaTipoVeiculo" property="idTipoVeiculo" labelProperty="dsTipoVeiculo"></html:options>
                                </html:select>   
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Data Realização do Shaken:
                                <input type="date" class="form-control" id="dataRealizacao" name="dataRealizacao"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Data de Vencimento do Shaken:
                                <input type="date" class="form-control" id="dataVencimento" name="dataVencimento"/>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Valor Gasto:
                                <html:text name="ShakenModel" property="valorGasto" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Valor Cobrado:
                                <html:text name="ShakenModel" property="valorCobrado" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Ano Veículo:
                                <html:text name="ShakenModel" property="anoVeiculo" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Chassi Veículo:
                                <html:text name="ShakenModel" property="chassi" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Quantidade Parcelas:
                                <html:select name="ShakenModel" property="qtdParcelas" styleClass="form-control">
                                    <html:option value="1">1</html:option>
                                    <html:option value="2">2</html:option>
                                    <html:option value="3">3</html:option>
                                    <html:option value="4">4</html:option>
                                    <html:option value="5">5</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Dia Pagamento Prestação:
                                <html:select name="ShakenModel" property="diaPagamentoPrestacao" styleClass="form-control">
                                    <html:option value="0">Pagamento à vista</html:option>
                                    <html:option value="1">1</html:option>
                                    <html:option value="5">5</html:option>
                                    <html:option value="10">10</html:option>
                                    <html:option value="15">15</html:option>
                                    <html:option value="20">20</html:option>
                                    <html:option value="25">25</html:option>
                                    <html:option value="30">30</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>




                </table>


            </html:form>

        </logic:notEqual>    
    </body>
</html>

