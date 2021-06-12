/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.ShakenModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author macuser
 */
public class ShakenDAO {

    private static ShakenDAO shakenDAO = null;

    public static final ShakenDAO getInstance() {
        if (shakenDAO == null) {
            shakenDAO = new ShakenDAO();
        }
        return shakenDAO;
    }

    public int salvarShaken(Connection conn, ShakenModel shakenModel, int vlEntrada, int vlCobrado, int vlRestante) throws SQLException {
        String query = "INSERT INTO shaken (data_realizacao, data_vencimento, id_tipo_veiculo, id_marca_veiculo, id_veiculo, valor_gasto,"
                + " valor_cobrado, dia_pagamento_prestacao, ano_veiculo, chassi, id_pessoa, observacao, qtd_parcelas, valor_entrada, valor_restante) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        int idShaken = 0;
        PreparedStatement prep = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
        prep.setString(1, shakenModel.getDataRealizacao());
        prep.setString(2, shakenModel.getDataVencimento());
        prep.setInt(3, shakenModel.getIdTipoVeiculo());
        prep.setInt(4, shakenModel.getIdMarcaVeiculo());
        prep.setInt(5, shakenModel.getIdVeiculo());
        prep.setString(6, shakenModel.getValorGasto());
        prep.setInt(7, vlCobrado);
        prep.setInt(8, shakenModel.getDiaPagamentoPrestacao());
        prep.setString(9, shakenModel.getAnoVeiculo());
        prep.setString(10, shakenModel.getChassi());
        prep.setInt(11, shakenModel.getIdPessoa());
        prep.setString(12, shakenModel.getObservacao());
        prep.setInt(13, shakenModel.getQtdParcelas());
        prep.setInt(14, vlEntrada);
        prep.setInt(15, vlRestante);
        prep.execute();
        ResultSet rs = prep.getGeneratedKeys();
        if (rs.next()) {
            idShaken = rs.getInt(1);
        }
        rs.close();
        prep.close();

        return idShaken;

    }

    public void salvarControleShaken(Connection conn, int idShaken, int diaPagamentoPrestacao, int mesPagamento, int vlParcelas) throws SQLException {
        String query = "INSERT INTO controle_shaken (id_shaken, dia_pagamento, mes_pagamento, valor) VALUES (?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idShaken);
        prep.setInt(2, diaPagamentoPrestacao);
        prep.setInt(3, mesPagamento);
        prep.setInt(4, vlParcelas);
        prep.execute();
        prep.close();
    }

}
