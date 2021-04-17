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
        <title>Tipo de Ve�culo</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function fCarregarMarcaVeiculo() {
                document.VeiculoModel.action = "NomeVeiculo.do?action=carregarMarcaVeiculo";
                document.VeiculoModel.submit();
            }
            
            function fCarregarVeiculosPorMarca() {
                document.VeiculoModel.action = "NomeVeiculo.do?action=carregarVeiculoPorMarca";
                document.VeiculoModel.submit();
            }

            function fCadastrar() {
                var idTipoVeiculo = document.getElementById("idTipoVeiculo").value;
                var idMarcaVeiculo = document.getElementById("idMarcaVeiculo").value;
                var nomeVeiculo = document.getElementById("nomeVeiculo").value;

                if (idTipoVeiculo == "") {
                    alert("Deve ser informado o Tipo de Ve�culo corretamente!!");
                    document.getElementById("idTipoVeiculo").focus();
                } else if (idMarcaVeiculo == "") {
                    alert("Deve ser informado a marca do Ve�culo corretamente!!");
                    document.getElementById("idMarcaVeiculo").focus();
                } else if (nomeVeiculo.length < 2) {
                    alert("Deve ser informado o nome do Ve�culo corretamente!!");
                    document.getElementById("nomeVeiculo").focus();
                } else {
                    document.VeiculoModel.action = "NomeVeiculo.do?action=save";
                    document.VeiculoModel.submit();
                }

            }
            

            function fExcluir(idMarcaVeiculo) {
                if (confirm("Voc� deseja realmente excluir???")) {
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
                <h1>Gerenciador de Ve�culo</h1>
                <hr/>
            </div>
            <html:form action="NomeVeiculo">
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
                            <td>
                                <div class="col-lg-12">
                                    Nome do Ve�culo:
                                    <html:text styleClass="form-control" name="VeiculoModel" property="nomeVeiculo" styleId="nomeVeiculo"/>        
                                </div>
                            </td>
                            <td>
                                <br/>
                                <input class="btn btn-success" type="button" value="CADASTRAR" onClick="fCadastrar();">
                            </td>
                        </logic:present>

                    </tr>
                </table>
                
                <logic:present name="listaVeiculoPorMarca" scope="session">
                    <table width="60%" border="0" align="center" class="table-condensed">
                        <tr>
                            <td><b>Marca Ve�culo</b></td>
                            <td><b>Nome Ve�culo</b></td>
                        </tr>
                        <logic:iterate name="listaVeiculoPorMarca" scope="session" id="listaNomeVeiculo">
                            <tr>
                                <td>
                                    <bean:write name="listaNomeVeiculo" property="dsMarcaVeiculo"/>
                                </td>
                                <td>
                                    <bean:write name="listaNomeVeiculo" property="nomeVeiculo"/>
                                </td>
                            </tr>
                        </logic:iterate>
                    </table>
                </logic:present>
                
            </html:form>

        </logic:notEqual>    
    </body>
</html>
