<%-- 
    Document   : nome_veiculo
    Created on : 10 de abr de 2021, 11:32:31
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Tipo de Veículo</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function fCarregarMarcaVeiculo() {
                document.VeiculoModel.action = "NomeVeiculo.do?action=carregarMarcaVeiculo";
                document.VeiculoModel.submit();
            }

            function fCadastrar() {
                var idTipoVeiculo = document.getElementById("idTipoVeiculo").value;
                var dsMarcaVeiculo = document.getElementById("dsMarcaVeiculo").value;

                if (idTipoVeiculo == "") {
                    alert("Deve ser informado o Tipo de Veículo corretamente!!");
                    document.getElementById("idTipoVeiculo").focus();
                } else if (dsMarcaVeiculo.length < 2) {
                    alert("Deve ser informado o nome da marca do Veículo corretamente!!");
                    document.getElementById("dsMarcaVeiculo").focus();
                } else {
                    document.VeiculoModel.action = "MarcaVeiculo.do?action=save";
                    document.VeiculoModel.submit();
                }

            }

            function fExcluir(idMarcaVeiculo) {
                if (confirm("Você deseja realmente excluir???")) {
                    document.VeiculoModel.action = "MarcaVeiculo.do?action=excluir&idMarcaVeiculo=" + idMarcaVeiculo;
                    document.VeiculoModel.submit();
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
                <h1>Gerenciador Nome de Veículo</h1>
                <hr/>
            </div>
            <html:form action="NomeVeiculo">
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
                                    <html:select property="idMarcaVeiculo" styleClass="form-control" styleId="idTipoVeiculo">
                                        <html:option value="">Selecione</html:option>
                                        <html:options collection="listaMarcaVeiculo" property="idMarcaVeiculo" labelProperty="dsMarcaVeiculo"></html:options>
                                    </html:select>   
                                </div>
                            </td>
                            <td>
                            <div class="col-lg-12">
                                Marca do Veículo:
                                <html:text styleClass="form-control" name="VeiculoModel" property="dsMarcaVeiculo" styleId="dsMarcaVeiculo"/>        
                            </div>
                        </td>
                        </logic:present>

                        <!--                        <td>
                                                    <br/>
                                                    <input class="btn btn-success" type="button" value="CADASTRAR" onClick="fCadastrar();">
                                                </td>-->
                    </tr>
                </table>
            </html:form>

            <div align="center" style="margin-top: 150px">
                <h1>Lista Tipo/Marca de Veículo Cadastrados</h1>
            </div>
            <%--
                        <logic:present name="listaMarcaVeiculo" scope="request">
                            <table align="center" class="table">
                                <tr style="background-color: #F4F4F4">
                                    <td width='10%'>&nbsp;</td>
                                    <td>
                                        <b>ID</b>
                                    </td>
                                    <td>
                                        <b>Tipo Veículo</b>
                                    </td>
                                    <td>
                                        <b>Marca Veículo</b>
                                    </td>
                                    <td width='10%'>&nbsp;</td>
                                    <td width='10%'>&nbsp;</td>
                                </tr>
                                <logic:iterate name="listaMarcaVeiculo" id="listaMarca" scope="request">
                                    <tr>
                                        <td width='10%'>&nbsp;</td>
                                        <td>
                                            <bean:write name="listaMarca" property="idMarcaVeiculo"/>
                                        </td>
                                        <td>
                                            <bean:write name="listaMarca" property="dsTipoVeiculo"/>
                                        </td>
                                        <td>
                                            <bean:write name="listaMarca" property="dsMarcaVeiculo"/>
                                        </td>
                                        <td width='10%'>
                                            <input type="button" class="btn btn-danger" value="Excluir" onclick="fExcluir(<bean:write name="listaMarca" property="idMarcaVeiculo"/>)"/>
                                        </td>
                                        <td width='10%'>&nbsp;</td>
                                    </tr>
                                </logic:iterate>
                            </table>
                        </logic:present>
            --%>
        </logic:notEqual>    
    </body>
</html>
