/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.ControleVendasModel;
import com.app.util.Utilitario;
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
        String query = "INSERT INTO venda_veiculo (id_tipo_veiculo, id_marca_veiculo, id_veiculo, chassi, cor, ano, preco_compra, preco_venda,"
                + " cambio, motor, combustivel, km, shaken, capacidade_pessoa, nr_portas, detalhes_extras, freio, data_venda, data_insercao, path_img_1) "
                + " VALUES (?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, now(),?)";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, controleVendasModel.getIdTipoVeiculo());
        prep.setInt(2, controleVendasModel.getIdMarcaVeiculo());
        prep.setInt(3, controleVendasModel.getIdVeiculo());
        prep.setString(4, controleVendasModel.getChassi());
        prep.setString(5, controleVendasModel.getCor());
        prep.setString(6, controleVendasModel.getAno());
        prep.setString(7, controleVendasModel.getPrecoCompra().replace(",", "").replace(".", ""));
        prep.setString(8, controleVendasModel.getPrecoVenda().replace(",", "").replace(".", ""));
        prep.setString(9, controleVendasModel.getCambio());
        prep.setString(10, controleVendasModel.getMotor());
        prep.setString(11, controleVendasModel.getCombustivel());
        prep.setString(12, controleVendasModel.getKm());
        prep.setString(13, controleVendasModel.getShaken());
        prep.setInt(14, controleVendasModel.getCapacidadePessoa());
        prep.setInt(15, controleVendasModel.getNrPortas());
        prep.setString(16, controleVendasModel.getDetalhesExtras());
        prep.setString(17, controleVendasModel.getFreio());
        prep.setString(18, controleVendasModel.getDataVenda());
        prep.setString(19, controleVendasModel.getPathImg1());
        prep.execute();
        prep.close();
    }

    public List<ControleVendasModel> pesquisarVeiculos(Connection conn, ControleVendasModel controleVendasModel) throws SQLException {
        List<ControleVendasModel> listaVeiculos = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append(" select c.*, tp.ds_tipo_veiculo, mv.ds_marca_veiculo, v.nome_veiculo");
        sb.append(" from venda_veiculo c, tipo_veiculo tp, marca_veiculo mv, veiculo v");
        sb.append(" where c.id_tipo_veiculo = tp.id");
        sb.append(" and c.id_marca_veiculo = mv.id");
        sb.append(" and c.id_veiculo = v.id");
        sb.append(" and c.id_tipo_veiculo = ").append(controleVendasModel.getIdTipoVeiculo());
        if (controleVendasModel.getIdMarcaVeiculo() != 0) {
            sb.append(" and c.id_marca_veiculo = ").append(controleVendasModel.getIdMarcaVeiculo());
        }
        if (controleVendasModel.getIdVeiculo() != 0) {
            sb.append(" and c.id_veiculo = ").append(controleVendasModel.getIdVeiculo());
        }

        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            ControleVendasModel controlForm = new ControleVendasModel();
            controlForm.setIdControleVendas(rs.getInt("id"));
            controlForm.setIdVeiculo(rs.getInt("id_veiculo"));
            controlForm.setAno(rs.getString("ano"));
            controlForm.setKm(rs.getString("km"));
            controlForm.setCor(rs.getString("cor"));
            controlForm.setDsTipoVeiculo(rs.getString("ds_tipo_veiculo"));
            controlForm.setDsMarcaVeiculo(rs.getString("ds_marca_veiculo"));
            controlForm.setDsVeiculo(rs.getString("nome_veiculo"));
            controlForm.setPathImg1(rs.getString("path_img_1"));

            long precoVendaSemFormatacao = rs.getLong("preco_venda");
            String precoVendaFormatado = Utilitario.getInstance().formatacaoIene(precoVendaSemFormatacao);
            controlForm.setPrecoVenda(precoVendaFormatado);

            listaVeiculos.add(controlForm);
        }
        rs.close();
        prep.close();

        return listaVeiculos;

    }

    public ControleVendasModel detalhesVeiculo(Connection conn, int idControleVendas) throws SQLException {
        ControleVendasModel controlForm = new ControleVendasModel();

        String query = "select c.*, tp.ds_tipo_veiculo, mv.ds_marca_veiculo, v.nome_veiculo "
                + " from venda_veiculo c, tipo_veiculo tp, marca_veiculo mv, veiculo v"
                + " where c.id_tipo_veiculo = tp.id"
                + " and c.id_marca_veiculo = mv.id"
                + " and c.id_veiculo = v.id"
                + " and c.id = ?";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idControleVendas);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            controlForm.setIdControleVendas(rs.getInt("id"));
            controlForm.setIdTipoVeiculo(rs.getInt("id_tipo_veiculo"));
            controlForm.setIdMarcaVeiculo(rs.getInt("id_marca_veiculo"));
            controlForm.setIdVeiculo(rs.getInt("id_veiculo"));
            controlForm.setChassi(rs.getString("chassi"));
            controlForm.setAno(rs.getString("ano"));
            controlForm.setCambio(rs.getString("cambio"));
            controlForm.setMotor(rs.getString("motor"));
            controlForm.setCombustivel(rs.getString("combustivel"));
            controlForm.setKm(rs.getString("km"));
            controlForm.setShaken(rs.getString("shaken"));
            controlForm.setCapacidadePessoa(rs.getInt("capacidade_pessoa"));
            controlForm.setNrPortas(rs.getInt("nr_portas"));
            controlForm.setFreio(rs.getString("freio"));
            controlForm.setDetalhesExtras(rs.getString("detalhes_extras"));
            controlForm.setDataInsercao(rs.getString("data_insercao"));
            controlForm.setDataVenda(rs.getString("data_venda"));
            controlForm.setCor(rs.getString("cor"));
            controlForm.setDsTipoVeiculo(rs.getString("ds_tipo_veiculo"));
            controlForm.setDsMarcaVeiculo(rs.getString("ds_marca_veiculo"));
            controlForm.setDsVeiculo(rs.getString("nome_veiculo"));

            long precoCompraSemFormatacao = rs.getLong("preco_compra");
            String precoCompraFormatado = Utilitario.getInstance().formatacaoIene(precoCompraSemFormatacao);
            controlForm.setPrecoCompra(precoCompraFormatado);

            long precoVendaSemFormatacao = rs.getLong("preco_venda");
            String precoVendaFormatado = Utilitario.getInstance().formatacaoIene(precoVendaSemFormatacao);
            controlForm.setPrecoVenda(precoVendaFormatado);
            
            controlForm.setPathImg1(rs.getString("path_img_1"));

        }
        rs.close();
        prep.close();
        return controlForm;
    }

    public void atualizar(Connection conn, ControleVendasModel controleVendasModel) throws SQLException {

        String query = "UPDATE venda_veiculo SET chassi=?, cor=?, ano=?, preco_compra=?, preco_venda=?, "
                + " cambio=?, motor=?, combustivel=?, km=?, shaken=?, capacidade_pessoa=?, nr_portas=?, "
                + " detalhes_extras=?, freio=?, data_venda = ?, path_img_1 = ? "
                + " WHERE id=?";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, controleVendasModel.getChassi());
        prep.setString(2, controleVendasModel.getCor());
        prep.setString(3, controleVendasModel.getAno());
        prep.setString(4, controleVendasModel.getPrecoCompra().replace(",", "").replace(".", ""));
        prep.setString(5, controleVendasModel.getPrecoVenda().replace(",", "").replace(".", ""));
        prep.setString(6, controleVendasModel.getCambio());
        prep.setString(7, controleVendasModel.getMotor());
        prep.setString(8, controleVendasModel.getCombustivel());
        prep.setString(9, controleVendasModel.getKm());
        prep.setString(10, controleVendasModel.getShaken());
        prep.setInt(11, controleVendasModel.getCapacidadePessoa());
        prep.setInt(12, controleVendasModel.getNrPortas());
        prep.setString(13, controleVendasModel.getDetalhesExtras());
        prep.setString(14, controleVendasModel.getFreio());
        prep.setString(15, controleVendasModel.getDataVenda());
        prep.setString(16, controleVendasModel.getPathImg1());
        prep.setInt(17, controleVendasModel.getIdControleVendas());
        prep.execute();
        prep.close();

    }

    public void excluir(Connection conn, int idControleVendas) throws SQLException {
        String query = "DELETE FROM venda_veiculo WHERE id=?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idControleVendas);
        prep.execute();
        prep.close();
    }

}
