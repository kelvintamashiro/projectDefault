/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.VeiculoDAO;
import com.app.model.VeiculoModel;
import com.app.util.Errors;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class TipoVeiculoAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("save")) {
            this.save(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        }
        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        VeiculoModel veiculoModel = new VeiculoModel();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter lista dos tipos cadastrados
            List<VeiculoModel> listaTipoVeiculos = VeiculoDAO.getInstance().obterListaTipoVeiculos(conn);
            if (listaTipoVeiculos.size() > 0) {
                request.setAttribute("listaTipoVeiculos", listaTipoVeiculos);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("VeiculoModel", veiculoModel);
    }

    private void save(ActionForm form, HttpServletRequest request, Errors errors) {
        VeiculoModel veiculoModel = (VeiculoModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            boolean isExisteTipoVeiculo = VeiculoDAO.getInstance().isExisteTipoVeiculo(conn, veiculoModel);
            if (!isExisteTipoVeiculo) {
                VeiculoDAO.getInstance().save(conn, veiculoModel);
                errors.error("Cadastro TIpo de Veículo Realizado com Sucesso!!");
                veiculoModel.setDsTipoVeiculo(null);
                request.setAttribute("save", "true");
            } else {
                errors.error("Tipo de Veículo já existe cadastrado");
                request.setAttribute("save", "false");
            }

            this.page(form, request, errors);
            request.setAttribute("VeiculoModel", veiculoModel);
        } catch (Exception e) {
            e.printStackTrace();
            errors.error("Erro ao Cadastrar tipo de veículo!!");
            request.setAttribute("save", "false");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        VeiculoModel veiculoModel = new VeiculoModel();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            String tipoVeiculo = request.getParameter("idTipoVeiculo");
            if(tipoVeiculo != null && !tipoVeiculo.equals("")) {
                int idTipoVeiculo = Integer.parseInt(tipoVeiculo);
                VeiculoDAO.getInstance().excluirTipoVeiculo(conn, idTipoVeiculo);
                errors.error("Exclusão realizada com Sucesso!!");
            } else {
                errors.error("Ocorreu um erro ao excluir tipo do veiculo. Entrar em contato com o suporte.");
            }
            
            this.page(form, request, errors);
            request.setAttribute("VeiculoModel", veiculoModel);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
