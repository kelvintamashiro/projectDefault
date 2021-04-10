<%-- 
    Document   : tela_inicial
    Created on : 6 de mar de 2021, 10:38:56
    Author     : macuser
--%>

<%-- 
    Document   : tela_interativa
    Created on : 24/02/2020, 20:47:19
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html lang="pt-br" class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project Default - Tela Inicial</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" media="all" type="text/css" href="css/estilo.css" />

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
    </head>
    <body>

        <logic:notEqual name="nome" value="" scope="session">
            <jsp:include page="topo.jsp"/>
            <div class="row" align="center" style="padding-top: 10%">
                <div class="col-12 col-s-12">
                    <button class="btn-tela" onclick="window.location.href = 'PessoaFisica.do'">
                        Cadastro <br/>de Pessoa
                    </button>
                    <button class="btn-tela" onclick="window.location.href = 'PessoaFisica.do?action=pagePesquisa'">
                        Pesquisa <br/>de Pessoa
                    </button>
                    <button class="btn-tela" onclick="window.location.href = 'TipoVeiculo.do'">
                        Gerenciador <br/>Tipo Veículos
                    </button>
                    <button class="btn-tela" onclick="window.location.href = 'MarcaVeiculo.do'">
                        Gerenciador <br/>Marca Veículos
                    </button>
                    <button class="btn-tela" onclick="window.location.href = 'NomeVeiculo.do'">
                        Gerenciador <br/>Nome Veículos
                    </button>
<!--                    <button class="btn-tela" onclick="window.location.href = 'links_doc_alunos.jsp'">
                        Gerenciador <br/>Venda de Carro
                    </button>-->
                </div>
            </div>
        </logic:notEqual>
        <logic:equal name="nome" value="" scope="session">
            <div style="padding-top: 20%">
                <div class="alert alert-danger" align="center">
                    <img src="imagens/cancel.png" width="50px"/>
                    <br/>
                    <br/>
                    Você não está logado no sistema!!
                    <br/>
                    <br/>
                    <a href="index.jsp" class="btn btn-default">Clique aqui para voltar a página de login</a>
                </div>
            </div>
        </logic:equal>

        <div>
            <%--<jsp:include page="footer.jsp"/>--%>
        </div>
    </body>
</html>

