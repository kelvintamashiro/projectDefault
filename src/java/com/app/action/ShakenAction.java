/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.PessoaFisicaDAO;
import com.app.dao.VeiculoDAO;
import com.app.model.PessoaFisicaModel;
import com.app.model.ShakenModel;
import com.app.model.VeiculoModel;
import com.app.util.Errors;
import java.sql.Connection;
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
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        ShakenModel shakenModel = new ShakenModel();
        HttpSession session = request.getSession();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
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
    
}
