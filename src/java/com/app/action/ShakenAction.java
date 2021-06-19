/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.PessoaFisicaDAO;
import com.app.dao.ShakenDAO;
import com.app.dao.VeiculoDAO;
import com.app.model.PessoaFisicaModel;
import com.app.model.ShakenModel;
import com.app.model.VeiculoModel;
import com.app.util.Errors;
import java.sql.Connection;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class ShakenAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("carregarMarcaVeiculo")) {
            this.carregarMarcaVeiculo(form, request, errors);
        } else if (action.equals("carregarVeiculos")) {
            this.carregarVeiculos(form, request, errors);
        } else if (action.equals("validarVeiculo")) {
            this.validarVeiculo(form, request, errors);
        } else if (action.equals("salvarShaken")) {
            this.salvarShaken(form, request, errors);
        } else if (action.equals("pageControle")) {
            this.pageControle(form, request, errors);
        } else if (action.equals("pesquisarShaken")) {
            this.pesquisarShaken(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        ShakenModel shakenModel = new ShakenModel();
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            session.removeAttribute("listaTipoVeiculo");
            session.removeAttribute("listaMarcaVeiculo");
            session.removeAttribute("listaVeiculoPorMarca");

            //obter lista de pessoas cadastradas
            PessoaFisicaModel pessoaFisicaModel = new PessoaFisicaModel();
            List<PessoaFisicaModel> listaPessoaFisica = PessoaFisicaDAO.getInstance().searchAll(conn, pessoaFisicaModel);
            session.setAttribute("listaPessoaFisica", listaPessoaFisica);

            //obter a lista do tipo
            List<VeiculoModel> listaTipoVeiculo = VeiculoDAO.getInstance().obterListaTipoVeiculos(conn);
            session.setAttribute("listaTipoVeiculo", listaTipoVeiculo);

            request.setAttribute("ShakenModel", shakenModel);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void carregarMarcaVeiculo(ActionForm form, HttpServletRequest request, Errors errors) {
        ShakenModel shakenModel = (ShakenModel) form;
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            session.removeAttribute("listaVeiculoPorMarca");

            //obter lista das marcas de veiculos ja cadastradas
            List<VeiculoModel> listaMarcaVeiculo = VeiculoDAO.getInstance().obterListaMarcaVeiculoPorTipo(conn, shakenModel.getIdTipoVeiculo());
            session.setAttribute("listaMarcaVeiculo", listaMarcaVeiculo);

            session.setAttribute("ShakenModel", shakenModel);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void carregarVeiculos(ActionForm form, HttpServletRequest request, Errors errors) {
        ShakenModel shakenModel = (ShakenModel) form;
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista dos veiculos cadastrado por marca
            List<VeiculoModel> listaVeiculoPorMarca = VeiculoDAO.getInstance().obterListaVeiculoPorMarca(conn, shakenModel.getIdMarcaVeiculo());
            session.setAttribute("listaVeiculoPorMarca", listaVeiculoPorMarca);

            session.setAttribute("ShakenModel", shakenModel);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void validarVeiculo(ActionForm form, HttpServletRequest request, Errors errors) {
        ShakenModel shakenModel = (ShakenModel) form;
        HttpSession session = request.getSession();

        request.setAttribute("detalhesVeiculo", "true");
        session.setAttribute("ShakenModel", shakenModel);
    }

    private void salvarShaken(ActionForm form, HttpServletRequest request, Errors errors) {
        ShakenModel shakenModel = (ShakenModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            int vlEntrada = Integer.parseInt(shakenModel.getValorEntrada().replace(",", "").replace(".", ""));
            int vlCobrado = Integer.parseInt(shakenModel.getValorCobrado().replace(",", "").replace(".", ""));
            int vlRestante = vlCobrado - vlEntrada;
            int vlParcelas = vlRestante / shakenModel.getQtdParcelas();

            boolean isOK = false;

            if (shakenModel.getDiaPagamentoPrestacao() == 0) {
                //pagamento a vista
                //nesse caso, temos que verificar se o vaor de Entrada eh igual ao valor cobrado
                if (vlCobrado <= vlEntrada) {
                    //ok pode salvar no banco
                    isOK = true;
                } else {
                    isOK = false;
                    errors.error("O valor de Entrada não pode ser menor que o valor Cobrado!!");
                }
            } else {
                //pagamento parcelado, nem que seja 1 parcela
                isOK = true;
            }

            if (isOK) {
                //salva os dados no banco de dados
                int idShaken = ShakenDAO.getInstance().salvarShaken(conn, shakenModel, vlEntrada, vlCobrado, vlRestante);

                //verificar se eu preciso salvar na tabela controle_shaken
                if (shakenModel.getQtdParcelas() > 1) {
                    LocalDate dataAtual = LocalDate.now(ZoneId.systemDefault());
                    for (int i = 1; i <= shakenModel.getQtdParcelas(); i++) {
                        dataAtual = dataAtual.plusMonths(1);
                        int month = dataAtual.getMonth().getValue();
                        ShakenDAO.getInstance().salvarControleShaken(conn, idShaken, shakenModel.getDiaPagamentoPrestacao(), month, vlParcelas);
                    }
                }
                errors.error("Shaken cadastrado com Sucesso!!!");
                this.page(form, request, errors);
            }

            request.setAttribute("detalhesVeiculo", "true");
            request.setAttribute("ShakenModel", shakenModel);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pageControle(ActionForm form, HttpServletRequest request, Errors errors) {
        ShakenModel shakenModel = new ShakenModel();
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista de pessoas cadastradas com shaken
            List<ShakenModel> listaPessoasComShaken = ShakenDAO.getInstance().obterPessoasComShaken(conn);

            session.setAttribute("listaPessoasComShaken", listaPessoasComShaken);
            request.setAttribute("ShakenModel", shakenModel);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void pesquisarShaken(ActionForm form, HttpServletRequest request, Errors errors) {
        ShakenModel shakenModel = (ShakenModel) form;

        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //pesquisar os shakens de uma determinada pessoa
            List<ShakenModel> listaShaken = ShakenDAO.getInstance().obterListaShakenPorPessoa(conn, shakenModel.getIdPessoa());

            request.setAttribute("listaShaken", listaShaken);
            request.setAttribute("ShakenModel", shakenModel);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
