/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.ControleVendasDAO;
import com.app.dao.VeiculoDAO;
import com.app.model.ControleVendasModel;
import com.app.model.VeiculoModel;
import com.app.util.Errors;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileUpload;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author macuser
 */
public class ControleVendasAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page") || action.equals("pesquisarVeiculosVenda")) {
            this.page(form, request, errors);
        } else if (action.equals("carregarMarcaVeiculo") || action.equals("carregarMarcaVeiculoP")) {
            this.carregarMarcaVeiculo(form, request, errors);
        } else if (action.equals("carregarVeiculos") || action.equals("carregarVeiculosP")) {
            this.carregarVeiculos(form, request, errors);
        } else if (action.equals("validarVeiculo")) {
            this.validarVeiculo(form, request, errors);
        } else if (action.equals("save")) {
            this.save(form, request, errors);
        } else if (action.equals("pesquisarVeiculos")) {
            this.pesquisarVeiculos(form, request, errors);
        } else if (action.equals("detalhesVeiculo")) {
            this.detalhesVeiculo(form, request, errors);
        } else if (action.equals("pageAtualizar")) {
            this.detalhesVeiculo(form, request, errors);
        } else if (action.equals("atualizar")) {
            this.atualizar(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = new ControleVendasModel();
        HttpSession session = request.getSession();
        Connection conn = null;

        try {
            conn = connectionPool.getConnection();

            session.removeAttribute("listaTipoVeiculo");
            session.removeAttribute("listaMarcaVeiculo");
            session.removeAttribute("listaVeiculoPorMarca");
            session.removeAttribute("ControleVendasModel");

            //obter lista dos tipos de veiculos
            List<VeiculoModel> listaTipoVeiculo = VeiculoDAO.getInstance().obterListaTipoVeiculos(conn);
            session.setAttribute("listaTipoVeiculo", listaTipoVeiculo);

            controleVendasModel.setIdTipoVeiculo(0);
            session.setAttribute("ControleVendasModel", controleVendasModel);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void carregarMarcaVeiculo(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = (ControleVendasModel) form;
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            session.removeAttribute("listaVeiculoPorMarca");

            //obter lista das marcas de veiculos ja cadastradas
            List<VeiculoModel> listaMarcaVeiculo = VeiculoDAO.getInstance().obterListaMarcaVeiculoPorTipo(conn, controleVendasModel.getIdTipoVeiculo());
            session.setAttribute("listaMarcaVeiculo", listaMarcaVeiculo);

            session.setAttribute("ControleVendasModel", controleVendasModel);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void carregarVeiculos(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = (ControleVendasModel) form;
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista dos veiculos cadastrado por marca
            List<VeiculoModel> listaVeiculoPorMarca = VeiculoDAO.getInstance().obterListaVeiculoPorMarca(conn, controleVendasModel.getIdMarcaVeiculo());
            session.setAttribute("listaVeiculoPorMarca", listaVeiculoPorMarca);

            session.setAttribute("ControleVendasModel", controleVendasModel);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void validarVeiculo(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = (ControleVendasModel) form;
        HttpSession session = request.getSession();

        request.setAttribute("detalhesVeiculo", "true");
        session.setAttribute("ControleVendasModel", controleVendasModel);
    }

    private void save(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = (ControleVendasModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //fazer upload da imagem caso tenha no servidor na pasta imagens_veiculos e salvar no banco
            boolean isMultipart = FileUpload.isMultipartContent(request);
            String path = getServlet().getServletContext().getRealPath("/") + "imagens_veiculos";
            String nomeArquivo = null;

            if (isMultipart) {
                FormFile formFile = controleVendasModel.getFileImg1();
                nomeArquivo = controleVendasModel.getIdVeiculo() + ".jpg";

                File folder = new File(path);
                if (!folder.exists()) {
                    folder.mkdirs();
                }

                File newFile = new File(path, nomeArquivo);
                if (!newFile.exists()) {
                    FileOutputStream fos = new FileOutputStream(newFile);
                    fos.write(formFile.getFileData());
                    fos.flush();
                    fos.close();
                }

            }

            //ControleVendasDAO.getInstance().save(conn, controleVendasModel);
            controleVendasModel.setIdVeiculo(0);

            errors.error("Salvo com Sucesso!!");
            request.setAttribute("ControleVendasModel", controleVendasModel);

        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um Erro!!");
        } finally {
            connectionPool.free(conn);
        }

    }

    private void pesquisarVeiculos(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = (ControleVendasModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            List<ControleVendasModel> listaVeiculos = ControleVendasDAO.getInstance().pesquisarVeiculos(conn, controleVendasModel);

            request.setAttribute("listaVeiculos", listaVeiculos);
            request.setAttribute("ControleVendasModel", controleVendasModel);
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um Erro!!");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void detalhesVeiculo(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = (ControleVendasModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            controleVendasModel = ControleVendasDAO.getInstance().detalhesVeiculo(conn, controleVendasModel.getIdControleVendas());

            request.setAttribute("ControleVendasModel", controleVendasModel);
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um Erro!!");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = (ControleVendasModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            ControleVendasDAO.getInstance().atualizar(conn, controleVendasModel);

            errors.error("Atualizado com Sucesso!!");
            request.setAttribute("ControleVendasModel", controleVendasModel);
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um Erro!!");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleVendasModel controleVendasModel = (ControleVendasModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            ControleVendasDAO.getInstance().excluir(conn, controleVendasModel.getIdControleVendas());

            //carregar a lista atualizada
            List<ControleVendasModel> listaVeiculos = ControleVendasDAO.getInstance().pesquisarVeiculos(conn, controleVendasModel);

            request.setAttribute("listaVeiculos", listaVeiculos);

            errors.error("Excluído com Sucesso!!");
            request.setAttribute("ControleVendasModel", controleVendasModel);
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Ocorreu um Erro!!");
        } finally {
            connectionPool.free(conn);
        }
    }

}
