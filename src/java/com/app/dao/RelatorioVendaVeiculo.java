/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.RelatorioVendaVeiculoModel;
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
public class RelatorioVendaVeiculo {

    private static RelatorioVendaVeiculo relatorio = null;

    public static final RelatorioVendaVeiculo getInstance() {
        if (relatorio == null) {
            relatorio = new RelatorioVendaVeiculo();
        }
        return relatorio;
    }

    public List<RelatorioVendaVeiculoModel> obterVendasRealizadasPorData(Connection conn, String dataInicio, String dataFinal) throws SQLException {
        List<RelatorioVendaVeiculoModel> listaVendasVeiculos = new ArrayList<>();
        String query = "select vv.id, tv.ds_tipo_veiculo, mv.ds_marca_veiculo, v.nome_veiculo, vv.preco_compra, vv.preco_venda, vv.data_venda,"
                + " vv.qtd_parcelas, p.nome, p.email, t.numero"
                + " from venda_veiculo vv, tipo_veiculo tv, marca_veiculo mv, veiculo v, pessoa p, telefone t"
                + " where vv.id_tipo_veiculo = tv.id"
                + " and vv.id_marca_veiculo = mv.id"
                + " and vv.id_veiculo = v.id"
                + " and vv.id_pessoa = p.id"
                + " and p.id = t.id_pessoa"
                + " and vv.data_venda between ? and ?"
                + " order by vv.data_venda";
        
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, dataInicio);
        prep.setString(2, dataFinal);
        ResultSet rs = prep.executeQuery();
        while(rs.next()) {
            RelatorioVendaVeiculoModel relVenda = new RelatorioVendaVeiculoModel();
            relVenda.setIdVenda(rs.getInt("id"));
            relVenda.setDsTipoVeiculo(rs.getString("ds_tipo_veiculo"));
            relVenda.setDsMarcaVeiculo(rs.getString("ds_marca_veiculo"));
            relVenda.setDsVeiculo(rs.getString("nome_veiculo"));
            relVenda.setPrecoCompra(rs.getString("preco_compra"));
            relVenda.setPrecoVenda(rs.getString("preco_venda"));
            relVenda.setDataVenda(rs.getString("data_venda"));
            relVenda.setQtdParcelas(rs.getInt("qtd_parcelas"));
            relVenda.setNomePessoa(rs.getString("nome"));
            relVenda.setEmailPessoa(rs.getString("email"));
            relVenda.setTelefonePessoa(rs.getString("numero"));
            
            listaVendasVeiculos.add(relVenda);
        }
        rs.close();
        prep.close();
        
        return listaVendasVeiculos;
    }

}
