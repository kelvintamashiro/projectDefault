<%-- 
    Document   : controle_vendas_atualizar
    Created on : 22 de mai de 2021, 09:07:15
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
            function fAtualizar() {
                var idTipoVeiculo = document.ControleVendasModel.idTipoVeiculo.value;
                var chassi = document.ControleVendasModel.chassi.value;
                var cor = document.ControleVendasModel.cor.value;
                var ano = document.ControleVendasModel.ano.value;
                var cambio = document.ControleVendasModel.cambio.value;
                var precoVenda = document.ControleVendasModel.precoVenda.value;
                var motor = document.ControleVendasModel.motor.value;
                var combustivel = document.ControleVendasModel.combustivel.value;
                var km = document.ControleVendasModel.km.value;
                var shaken = document.ControleVendasModel.shaken.value;
                var capacidadePessoa = document.ControleVendasModel.capacidadePessoa.value;


                if (chassi === "") {
                    alert("Deve ser informado o Chassi");
                    document.getElementById("chassi").focus();
                } else if (cor === "") {
                    alert("Deve ser informado a Cor");
                    document.getElementById("cor").focus();
                } else if (ano === "") {
                    alert("Deve ser informado o Ano");
                    document.getElementById("ano").focus();
                } else if (cambio === "") {
                    alert("Deve ser informado o Câmbio");
                    document.getElementById("cambio").focus();
                } else if (precoVenda.length < 4) {
                    alert("Deve ser informado o Preco de Venda Corretamente");
                    document.getElementById("precoVenda").focus();
                } else if (motor === "") {
                    alert("Deve ser informado o Motor");
                    document.getElementById("motor").focus();
                } else if (combustivel === "") {
                    alert("Deve ser informado a Tipo de Combustível");
                    document.getElementById("combustivel").focus();
                } else if (km === "") {
                    alert("Deve ser informado a quilometragem");
                    document.getElementById("km").focus();
                } else if (shaken === "") {
                    alert("Deve ser informado o Shaken do veículo");
                    document.getElementById("shaken").focus();
                } else if (capacidadePessoa === "") {
                    alert("Deve ser informado a capacidade de pessoas");
                    document.getElementById("capacidadePessoa").focus();
                } else {
                    if (idTipoVeiculo != null && idTipoVeiculo == 1) {
                        var nrPortas = document.ControleVendasModel.nrPortas.value;
                        if (nrPortas === "") {
                            alert("Deve ser informado o número de portas");
                            document.getElementById("nrPortas").focus();
                        } else {
                            document.ControleVendasModel.action = "ControleVendas.do?action=atualizar";
                            document.ControleVendasModel.submit();
                        }
                    } else {
                        var freio = document.ControleVendasModel.freio.value;
                        if (freio === "") {
                            alert("Deve ser informado o tipo de Freio");
                            document.getElementById("freio").focus();
                        } else {
                            document.ControleVendasModel.action = "ControleVendas.do?action=atualizar";
                            document.ControleVendasModel.submit();
                        }
                    }
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

        <logic:notEqual name="nome" value="" scope="session">
            <jsp:include page="topo.jsp"/>

            <div align="center">
                <h1>Controle Vendas de Veículo - Atualizar</h1>
                <hr/>
            </div>
            <html:form action="ControleVendas" enctype="multipart/form-data">
                <html:hidden property="idControleVendas"/>
                <html:hidden property="idTipoVeiculo"/>
                <table width="60%" border="0" align="center" class="table-condensed">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Tipo de Veículo:
                                <html:text property="dsTipoVeiculo" styleId="dsTipoVeiculo" styleClass="form-control" readonly="true"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Marca de Veículo:
                                <html:text property="dsMarcaVeiculo" styleId="dsMarcaVeiculo" styleClass="form-control" readonly="true"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Veículo:
                                <html:text property="dsVeiculo" styleId="dsVeiculo" styleClass="form-control" readonly="true"/>
                            </div>
                        </td>
                    </tr>
                </table>

                <table width="60%" border="0" align="center" class="table-condensed">
                    <tr style="height: 70px">
                        <td>
                            <div class="col-lg-12">
                                Chassi:
                                <html:text name="ControleVendasModel" property="chassi" styleId="chassi" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Cor:
                                <html:text name="ControleVendasModel" property="cor" styleId="cor" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Ano:
                                <html:text name="ControleVendasModel" property="ano" styleId="ano" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Câmbio:
                                <html:select name="ControleVendasModel" property="cambio" styleClass="form-control" styleId="cambio">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="A">Automático</html:option>
                                    <html:option value="M">Manual</html:option>
                                    <html:option value="AM">Automático/Manual</html:option>
                                </html:select> 
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 70px">
                        <td>
                            <div class="col-lg-12">
                                Preço de Compra:
                                <html:text name="ControleVendasModel" property="precoCompra" styleId="precoCompra" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Preço de Venda:
                                <html:text name="ControleVendasModel" property="precoVenda" styleId="precoVenda" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Motor:
                                <html:text name="ControleVendasModel" property="motor" styleId="motor" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Combustível:
                                <html:select name="ControleVendasModel" property="combustivel" styleClass="form-control" styleId="combustivel">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="E">Etanol</html:option>
                                    <html:option value="G">Gasolina</html:option>
                                    <html:option value="D">Diesel</html:option>
                                    <html:option value="H">Híbrido</html:option>
                                </html:select> 
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 70px">
                        <td>
                            <div class="col-lg-12">
                                KM rodados:
                                <html:text name="ControleVendasModel" property="km" styleId="km" styleClass="form-control"/>
                            </div>
                        </td>
                        <td>
                            <div class="col-lg-12">
                                Shaken:
                                <html:text name="ControleVendasModel" property="shaken" styleId="shaken" styleClass="form-control"/>
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
                                <logic:equal name="ControleVendasModel" property="idTipoVeiculo" value="1">
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
                                </logic:equal>
                                <logic:equal name="ControleVendasModel" property="idTipoVeiculo" value="2">
                                    Tipo de Freio:
                                    <html:select name="ControleVendasModel" property="freio" styleClass="form-control" styleId="freio">
                                        <html:option value="">Selecione</html:option>
                                        <html:option value="Tambor">Tambor</html:option>
                                        <html:option value="Disco">Disco</html:option>
                                        <html:option value="ABS">ABS</html:option>
                                    </html:select>
                                </logic:equal>
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
                        <tr>
                            <td colspan="4">
                                <div class="col-lg-12">
                                    Escolha a imagem:
                                <html:file name="ControleVendasModel" property="fileImg1" styleClass="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 70px">
                        <td colspan="4" align="center">
                            <input class="btn btn-success" style="width: 200px" type="button" value="Atualizar" onClick="fAtualizar();">
                            <a href="ControleVendas.do?action=pesquisarVeiculosVenda" class="btn btn-default" style="width: 200px">Voltar</a>
                        </td>
                    </tr>
                </table>

            </html:form>

        </logic:notEqual>    
    </body>
</html>
