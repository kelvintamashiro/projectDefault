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
        <script language="javascript" src="js/mizanscene.js"></script>

        <script type="text/javascript">

            function fCarregarMarcaVeiculo() {
                document.ShakenModel.action = "Shaken.do?action=carregarMarcaVeiculo";
                document.ShakenModel.submit();
            }

            function fCarregarVeiculosPorMarca() {
                document.ShakenModel.action = "Shaken.do?action=carregarVeiculos";
                document.ShakenModel.submit();
            }

            function fValidarVeiculo() {
                document.ShakenModel.action = "Shaken.do?action=validarVeiculo";
                document.ShakenModel.submit();
            }


            function fSalvar() {
                var idPessoa = document.ShakenModel.idPessoa.value;
                var idVeiculo = document.ShakenModel.idVeiculo.value;

                var dataRealizacao = document.getElementById("dataRealizacao").value;
                var dataVencimento = document.getElementById("dataVencimento").value;

                var valorGasto = document.ShakenModel.valorGasto.value;
                var valorCobrado = document.ShakenModel.valorCobrado.value;
                var anoVeiculo = document.ShakenModel.anoVeiculo.value;
                var chassi = document.ShakenModel.chassi.value;
                var valorEntrada = document.ShakenModel.valorEntrada.value;
                var qtdParcelas = document.ShakenModel.qtdParcelas.value;
                var diaPagamentoPrestacao = document.ShakenModel.diaPagamentoPrestacao.value;

                if (idVeiculo === "") {
                    alert("Deve ser informado o Veículo Corretamente");
                    document.getElementById("idVeiculo").focus();
                } else if (idPessoa === "") {
                    alert("Deve ser informado a Pessoa que foi realizada o Shaken");
                    document.getElementById("idPessoa").focus();
                } else if (dataRealizacao === "") {
                    alert("Deve ser informado a data da Realizacao do Shaken");
                    document.getElementById("dataRealizacao").focus();
                } else if (dataVencimento === "") {
                    alert("Deve ser informado a data de Vencimento do Próximo Shaken");
                    document.getElementById("dataVencimento").focus();
                } else if (valorGasto.length < 1) {
                    alert("Deve ser informado o valor Gasto");
                    document.getElementById("valorGasto").focus();
                } else if (valorCobrado.length < 1) {
                    alert("Deve ser informado o valor Cobrado");
                    document.getElementById("valorCobrado").focus();
                } else if (anoVeiculo === "") {
                    alert("Deve ser informado o ano do Veiculo");
                    document.getElementById("anoVeiculo").focus();
                } else if (chassi === "") {
                    alert("Deve ser informado o chassi do Veículo");
                    document.getElementById("chassi").focus();
                } else if (valorEntrada.length < 1) {
                    alert("Deve ser informado o valor de Entrada mesmo que for 0 (Zero) ");
                    document.getElementById("valorEntrada").focus();
                } else if (qtdParcelas > 1 && diaPagamentoPrestacao == 0){
                    alert("A quantidade de parcela não pode ser superior a 1, caso o pagamento seja à Vista. Ou você escolhe um dia de pagamento ou informar a quantidade de parcela 1 para pagamento à vista")
                } 
                else {
                    document.ShakenModel.action = "Shaken.do?action=salvarShaken";
                    document.ShakenModel.submit();
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
                        <logic:present name="listaVeiculoPorMarca" scope="session">
                            <td>
                                <div class="col-lg-12">
                                    Veículo:
                                    <html:select property="idVeiculo" styleClass="form-control" styleId="idVeiculo" onchange="fValidarVeiculo()">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaVeiculoPorMarca" property="idVeiculo" labelProperty="nomeVeiculo"></html:options>
                                    </html:select>   
                                </div>
                            </td>
                        </logic:present>
                    </tr>
                    <logic:equal name="detalhesVeiculo" value="true">
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
                                    <html:text name="ShakenModel" property="valorGasto" styleId="valorGasto" styleClass="form-control" onkeypress="return(validarConteudo(event, 'numero'));"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Valor Cobrado:
                                    <html:text name="ShakenModel" property="valorCobrado" styleId="valorCobrado" styleClass="form-control" onkeypress="return(validarConteudo(event,'numero'));"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-lg-12">
                                    Ano Veículo:
                                    <html:text name="ShakenModel" property="anoVeiculo" styleId="anoVeiculo" styleClass="form-control" onkeypress="return(validarConteudo(event,'numero'));"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Chassi Veículo:
                                    <html:text name="ShakenModel" property="chassi" styleId="chassi" styleClass="form-control"/>
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
                        <tr>
                            <td colspan="2" style="color: red" align="center">
                                Caso o pagamento seja parcelado, deve ser informado uma dia para efetuação do pagamento. Caso o pagamento seja à vista, informe apenas 1 parcela.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-lg-12">
                                    Valor de Entrada:
                                    <html:text name="ShakenModel" property="valorEntrada" styleId="valorEntrada" styleClass="form-control" onkeypress="return(validarConteudo(event,'numero'));"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Observação:
                                    <html:text name="ShakenModel" property="observacao" styleId="observacao" styleClass="form-control"/>
                                </div>
                            </td>
                        </tr>

                        <tr style="height: 70px">
                            <td colspan="4" align="center">
                                <input class="btn btn-success" style="width: 200px" type="button" value="Salvar" onClick="fSalvar();">
                            </td>
                        </tr>
                    </logic:equal>


                </table>


            </html:form>

        </logic:notEqual>    
    </body>
</html>

