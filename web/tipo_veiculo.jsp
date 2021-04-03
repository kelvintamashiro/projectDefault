<%-- 
    Document   : tipo_veiculo
    Created on : 3 de abr de 2021, 09:57:10
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Tipo de Ve�culo</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript">
            function fCadastrar() {
                var tipoVeiculo = document.getElementById("dsTipoVeiculo").value;

                if (tipoVeiculo.length < 3) {
                    alert("Deve ser informado o Tipo de Ve�culo corretamente!!");
                    document.getElementById("dsTipoVeiculo").focus();
                } else {
                    document.VeiculoModel.action = "TipoVeiculo.do?action=save";
                    document.VeiculoModel.submit();
                }

            }

            function fExcluir(idTipoVeiculo) {
                if (confirm("Voc� deseja realmente excluir???")) {
                    document.VeiculoModel.action = "TipoVeiculo.do?action=excluir&idTipoVeiculo=" + idTipoVeiculo;
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
                <h1>Gerenciador Tipo de Ve�culo</h1>
                <hr/>
            </div>
            <html:form action="TipoVeiculo">
                <table width="60%" border="0" align="center" class="table-condensed">
                    <tr>
                        <td width="90%">
                            <div class="col-lg-12">
                                Tipo de Ve�culo:
                                <html:text styleClass="form-control" name="VeiculoModel" property="dsTipoVeiculo" styleId="dsTipoVeiculo"/>        
                            </div>
                        </td>
                        <td>
                            <br/>
                            <input class="btn btn-success" type="button" value="CADASTRAR" onClick="fCadastrar();">
                        </td>
                    </tr>
                </table>
            </html:form>

            <div align="center" style="margin-top: 150px">
                <h1>Lista Tipo de Ve�culo Cadastrados</h1>
            </div>

            <logic:present name="listaTipoVeiculos" scope="request">
                <table align="center" class="table">
                    <tr style="background-color: #F4F4F4">
                        <td width='10%'>&nbsp;</td>
                        <td>
                            <b>ID</b>
                        </td>
                        <td>
                            <b>Tipo Ve�culo</b>
                        </td>
                        <td width='10%'>&nbsp;</td>
                        <td width='10%'>&nbsp;</td>
                    </tr>
                    <logic:iterate name="listaTipoVeiculos" id="listaTipo" scope="request">
                        <tr>
                            <td width='10%'>&nbsp;</td>
                            <td>
                                <bean:write name="listaTipo" property="idTipoVeiculo"/>
                            </td>
                            <td>
                                <bean:write name="listaTipo" property="dsTipoVeiculo"/>
                            </td>
                            <td width='10%'>
                                <input type="button" class="btn btn-danger" value="Excluir" onclick="fExcluir(<bean:write name="listaTipo" property="idTipoVeiculo"/>)"/>
                            </td>
                            <td width='10%'>&nbsp;</td>
                        </tr>
                    </logic:iterate>
                </table>
            </logic:present>

        </logic:notEqual>    
    </body>
</html>
