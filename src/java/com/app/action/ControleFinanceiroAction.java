/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.ControleFinanceiro;
import com.app.model.ControleFinanceiroModel;
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
public class ControleFinanceiroAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("pageAdicionar")) {
            this.pageAdicionar(form, request, errors);
        } else if (action.equals("adicionar")) {
            this.adicionar(form, request, errors);
        } else if (action.equals("excluir")) {
            this.excluir(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void pageAdicionar(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleFinanceiroModel controleFinanceiroModel = new ControleFinanceiroModel();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            //obter os dados da tabela controle_financeiro pelo mês vigente
            List<ControleFinanceiroModel> listaControleFinanceiro = ControleFinanceiro.getInstance().obterControleFinanceiroMesVigente(conn);
            
            request.setAttribute("listaControleFinanceiro", listaControleFinanceiro);
            request.setAttribute("ControleFinanceiroModel", controleFinanceiroModel);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void adicionar(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleFinanceiroModel controleFinanceiroModel = (ControleFinanceiroModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //adicionar na tabela controle_financeiro
            ControleFinanceiro.getInstance().inserir(conn, controleFinanceiroModel);
            
            controleFinanceiroModel = new ControleFinanceiroModel();
            
            this.pageAdicionar(form, request, errors);

            request.setAttribute("ControleFinanceiroModel", controleFinanceiroModel);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void excluir(ActionForm form, HttpServletRequest request, Errors errors) {
        ControleFinanceiroModel controleFinanceiroModel = (ControleFinanceiroModel) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            //excluir lancamento por ID
            ControleFinanceiro.getInstance().excluir(conn, controleFinanceiroModel.getId());
            this.pageAdicionar(form, request, errors);

            request.setAttribute("ControleFinanceiroModel", controleFinanceiroModel);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }
}
