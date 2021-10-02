/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.ControleFinanceiroModel;
import com.app.util.Utilitario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class ControleFinanceiro {

    private static ControleFinanceiro controleFinanceiro = null;

    public static final ControleFinanceiro getInstance() {
        if (controleFinanceiro == null) {
            controleFinanceiro = new ControleFinanceiro();
        }
        return controleFinanceiro;
    }

    public void inserir(Connection conn, ControleFinanceiroModel controleFinanceiroModel) throws SQLException {
        String query = "INSERT INTO controle_financeiro (tipo, data_referencia, valor, descricao) "
                + " VALUES (?, ?, ?, ?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, controleFinanceiroModel.getTipo());
        prep.setString(2, controleFinanceiroModel.getDataReferencia());
        prep.setString(3, controleFinanceiroModel.getValor());
        prep.setString(4, controleFinanceiroModel.getDescricao());
        prep.execute();
        prep.close();
        
    }

    public List<ControleFinanceiroModel> obterControleFinanceiroMesVigente(Connection conn) throws SQLException {
        List<ControleFinanceiroModel> listaControleFinanceiro = new ArrayList<>();
        String query = "select * from controle_financeiro c where c.data_referencia between ? and ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, String.valueOf(LocalDate.now().with(TemporalAdjusters.firstDayOfMonth())));
        prep.setString(2, String.valueOf(LocalDate.now().with(TemporalAdjusters.lastDayOfMonth())));
        ResultSet rs = prep.executeQuery();
        while(rs.next()) {
            ControleFinanceiroModel controleFinanceiroModel = new ControleFinanceiroModel();
            controleFinanceiroModel.setId(rs.getInt("id"));
            controleFinanceiroModel.setTipo(rs.getString("tipo"));
            controleFinanceiroModel.setDataReferencia(rs.getString("data_referencia"));
            Long vl = rs.getLong("valor");
            String vlFormatado = Utilitario.getInstance().formatacaoIene(vl);
            controleFinanceiroModel.setValor(vlFormatado);
            controleFinanceiroModel.setDescricao(rs.getString("descricao"));
            listaControleFinanceiro.add(controleFinanceiroModel);
        }
        rs.close();
        prep.close();
        
        return listaControleFinanceiro;
    }
}
