/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.LoginDAO;
import com.app.model.LoginModel;
import com.app.util.Errors;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class LoginAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("verificarLogin")){
            return verificarLogin(mapping, form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        LoginModel loginModel = new LoginModel();
        request.setAttribute("LoginModel", loginModel);
    }

    private ActionForward verificarLogin(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        LoginModel loginModel = (LoginModel) form;
        String forward = "";
        Connection conn = null;
        try { 
            conn = connectionPool.getConnection();
            //verificar se o usuario informou um login e senha existente
            boolean isLoginExiste = LoginDAO.getInstance().verificarLoginExistente(conn, loginModel);
            if(isLoginExiste){
                forward = "sucessoLogin";
            } else {
                errors.error("Login e/ou Senha estão incorretos. Favor verificar!!");
                forward = "erroLogin";
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        
        return mapping.findForward(forward);
        
    }
    
}
