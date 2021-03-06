/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.LoginModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author macuser
 */
public class LoginDAO {

    private static LoginDAO loginDao = null;

    public static final LoginDAO getInstance() {
        if (loginDao == null) {
            loginDao = new LoginDAO();
        }
        return loginDao;
    }

    public boolean verificarLoginExistente(Connection conn, LoginModel loginModel) throws SQLException {
        boolean isLoginExiste = false;
        String query = "select * from pessoa p where p.email = ? and p.senha = ? and p.tipo_login = 1";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, loginModel.getLogin());
        prep.setString(2, loginModel.getSenha());
        ResultSet rs = prep.executeQuery();
        if(rs.next()) {
            isLoginExiste = true;
        }
        rs.close();
        prep.close();
        
        return isLoginExiste;
    }
    
    

}
