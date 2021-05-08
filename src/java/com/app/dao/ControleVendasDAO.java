/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.ControleVendasModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class ControleVendasDAO {

    private static ControleVendasDAO controleVendasDAO = null;

    public static final ControleVendasDAO getInstance() {
        if (controleVendasDAO == null) {
            controleVendasDAO = new ControleVendasDAO();
        }
        return controleVendasDAO;
    }

    public void save(Connection conn, ControleVendasModel controleVendasModel) throws SQLException {
        String query = "INSERT INTO controle_vendas (id_tipo_veiculo, id_marca_veiculo, id_veiculo, chassi, cor, ano, preco_compra, preco_venda,"
                + " cambio, motor, combustivel, km, shaken, capacidade_pessoa, nr_portas, detalhes_extras, freio, data_insercao) "
                + " VALUES (?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, now())";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, controleVendasModel.getIdTipoVeiculo());
        prep.setInt(2, controleVendasModel.getIdMarcaVeiculo());
        prep.setInt(3, controleVendasModel.getIdVeiculo());
        prep.setString(4, controleVendasModel.getChassi());
        prep.setString(5, controleVendasModel.getCor());
        prep.setString(6, controleVendasModel.getAno());
        prep.setDouble(7, controleVendasModel.getPrecoCompra());
        prep.setDouble(8, controleVendasModel.getPrecoVenda());
        prep.setString(9, controleVendasModel.getCambio());
        prep.setString(10, controleVendasModel.getMotor());
        prep.setString(11, controleVendasModel.getCombustivel());
        prep.setString(12, controleVendasModel.getKm());
        prep.setString(13, controleVendasModel.getShaken());
        prep.setInt(14, controleVendasModel.getCapacidadePessoa());
        prep.setInt(15, controleVendasModel.getNrPortas());
        prep.setString(16, controleVendasModel.getDetalhesExtras());
        prep.setString(17, controleVendasModel.getFreio());
        prep.execute();
        prep.close();
    }

    public List<ControleVendasModel> pesquisarVeiculos(Connection conn, ControleVendasModel controleVendasModel) throws SQLException {
        List<ControleVendasModel> listaVeiculos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append(" select * from controle_vendas c ");
        sb.append(" where c.id_tipo_veiculo = ").append(controleVendasModel.getIdTipoVeiculo());
        if (controleVendasModel.getIdMarcaVeiculo() != 0) {
            sb.append(" and c.id_marca_veiculo = ").append(controleVendasModel.getIdMarcaVeiculo());
        }
        if (controleVendasModel.getIdVeiculo() != 0) {
            sb.append(" and c.id_veiculo = ").append(controleVendasModel.getIdVeiculo());
        }
        
        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while(rs.next()) {
            ControleVendasModel controlForm = new ControleVendasModel();
            controlForm.setIdVeiculo(rs.getInt("id_veiculo"));
            controlForm.setAno(rs.getString("ano"));
            controlForm.setPrecoVenda(rs.getDouble("preco_venda"));
            controlForm.setCor(rs.getString("cor"));
            listaVeiculos.add(controlForm);
        }
        rs.close();
        prep.close();
        
        return listaVeiculos;
        
    }

}
