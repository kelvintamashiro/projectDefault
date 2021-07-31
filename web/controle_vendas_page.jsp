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
        <title>Controle de Veículo</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript" src="js/mizanscene.js"></script>

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

            function fSalvar() {
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
                var dataVenda = document.getElementById("dataVenda").value;
                var idPessoa = document.ControleVendasModel.idPessoa.value;
                var qtdParcelas = document.ControleVendasModel.qtdParcelas.value;
                var valorEntrada = document.ControleVendasModel.valorEntrada.value;
                var diaPagamentoPrestacao = document.ControleVendasModel.diaPagamentoPrestacao.value;

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
                }  else if (idPessoa === "") {
                    alert("Deve ser informado a Pessoa que foi realizada a Venda do Veículo");
                    document.getElementById("idPessoa").focus();
                } else if (valorEntrada.length < 1) {
                    alert("Deve ser informado o valor de Entrada mesmo que for 0 (Zero) ");
                    document.getElementById("valorEntrada").focus();
                } else if (qtdParcelas > 1 && diaPagamentoPrestacao == 0){
                    alert("A quantidade de parcela não pode ser superior a 1, caso o pagamento seja à Vista. Ou você escolhe um dia de pagamento ou informar a quantidade de parcela 1 para pagamento à vista")
                } 
                else {
                    if (idTipoVeiculo != null && idTipoVeiculo == 1) {
                        var nrPortas = document.ControleVendasModel.nrPortas.value;
                        if (nrPortas === "") {
                            alert("Deve ser informado o número de portas");
                            document.getElementById("nrPortas").focus();
                        } else {
                            document.ControleVendasModel.action = "ControleVendas.do?action=save&dataVenda=" + dataVenda;
                            document.ControleVendasModel.submit();
                        }
                    } else {
                        var freio = document.ControleVendasModel.freio.value;
                        if (freio === "") {
                            alert("Deve ser informado o tipo de Freio");
                            document.getElementById("freio").focus();
                        } else {
                            document.ControleVendasModel.action = "ControleVendas.do?action=save&dataVenda=" + dataVenda;
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
                <h1>Controle Vendas de Veículo</h1>
                <hr/>
            </div>
            <html:form action="ControleVendas" enctype="multipart/form-data">
                <table width="60%" border="0" align="center" class="table-condensed">
                    <tr>
                        <td>
                            <div class="col-lg-12">
                                Tipo de Veículo:
                                <html:select property="idTipoVeiculo" styleClass="form-control" styleId="idTipoVeiculo" onchange="fCarregarMarcaVeiculo()">
                                    <html:option value="">Selecione</html:option>
                                    <html:options collection="listaTipoVeiculo" property="idTipoVeiculo" labelProperty="dsTipoVeiculo"></html:options>
                                </html:select>   
                            </div>
                        </td>
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
                            <td>
                                <br/>
                                <a href="NomeVeiculo.do" style="color: red">
                                    Caso o veículo não esteja cadastrado, <br/>
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
                                    <html:text name="ControleVendasModel" property="precoCompra" styleId="precoCompra" styleClass="form-control" onkeypress="return(validarConteudo(event, 'numero'));"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Preço de Venda:
                                    <html:text name="ControleVendasModel" property="precoVenda" styleId="precoVenda" styleClass="form-control" onkeypress="return(validarConteudo(event, 'numero'));"/>
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
                                    <html:textarea name="ControleVendasModel" property="detalhesExtras" styleClass="form-control" rows="10">
                                    </html:textarea>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-lg-12">
                                    Data da Venda:
                                    <input type="date" class="form-control" id="dataVenda" name="dataVenda"/>
                                </div>
                            </td>
                            <td colspan="3">
                                <div class="col-lg-12">
                                    Escolha a imagem:
                                    <html:file property="fileImg1" styleClass="form-control"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-lg-12">
                                    Pessoa:
                                    <html:select property="idPessoa" styleClass="form-control" styleId="idPessoa">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaPessoaFisica" property="id" labelProperty="nome"></html:options>
                                    </html:select>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Valor de Entrada:
                                    <html:text name="ControleVendasModel" property="valorEntrada" styleId="valorEntrada" styleClass="form-control" onkeypress="return(validarConteudo(event,'numero'));"/>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Quantidade Parcelas:
                                    <html:select property="qtdParcelas" styleClass="form-control" styleId="qtdParcelas">
                                        <html:option value="1">1</html:option>
                                        <html:option value="2">2</html:option>
                                        <html:option value="3">3</html:option>
                                        <html:option value="4">4</html:option>
                                        <html:option value="5">5</html:option>
                                        <html:option value="5">5</html:option>
                                        <html:option value="6">6</html:option>
                                        <html:option value="7">7</html:option>
                                        <html:option value="8">8</html:option>
                                        <html:option value="9">9</html:option>
                                        <html:option value="10">10</html:option>
                                        <html:option value="11">11</html:option>
                                        <html:option value="12">12</html:option>
                                    </html:select>
                                </div>
                            </td>
                            <td>
                                <div class="col-lg-12">
                                    Dia Pagamento Prestação:
                                    <html:select name="ControleVendasModel" property="diaPagamentoPrestacao" styleClass="form-control">
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

                        <tr style="height: 70px">
                            <td colspan="4" align="center">
                                <input class="btn btn-success" style="width: 200px" type="button" value="Salvar" onClick="fSalvar();">
                            </td>
                        </tr>
                    </table>
                    <div style="padding-top: 150px;">
                        &n&nbsp;
                    </div>
                </logic:equal>

            </html:form>

        </logic:notEqual>    
    </body>
</html>
