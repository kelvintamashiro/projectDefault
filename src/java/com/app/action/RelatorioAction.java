/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.Relatorio;
import com.app.model.RelatorioModel;
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
public class RelatorioAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("relPessoasCadastradas")) {
            this.relPessoasCadastradas(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void relPessoasCadastradas(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatorioModel relModel = new RelatorioModel();
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();
            
            List<RelatorioModel> listaPessoasCadastradas = Relatorio.getInstance().obterPessoasCadastradas(conn);
            request.setAttribute("listaPessoasCadastradas", listaPessoasCadastradas);
             
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
