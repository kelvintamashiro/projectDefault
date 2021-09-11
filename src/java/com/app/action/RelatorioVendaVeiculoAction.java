/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.RelatorioVendaVeiculo;
import com.app.model.RelatorioVendaVeiculoModel;
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
public class RelatorioVendaVeiculoAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("relVendasVeiculosRealizadas")) {
            this.relVendasVeiculosRealizadas(form, request, errors);
        } 

        return mapping.findForward(forward);
    }

    private void relVendasVeiculosRealizadas(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatorioVendaVeiculoModel relModel = (RelatorioVendaVeiculoModel) form;
        Connection conn = null;
        HttpSession session = request.getSession();
        try {
            conn = connectionPool.getConnection();
            
            List<RelatorioVendaVeiculoModel> listaVendasVeiculos = 
                    RelatorioVendaVeiculo.getInstance().obterVendasRealizadasPorData(conn, relModel.getDataInicio(), relModel.getDataFinal());
            
            session.setAttribute("listaVendasVeiculos", listaVendasVeiculos);
            request.setAttribute("RelatorioVendaVeiculoModel", relModel);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }
    
}
