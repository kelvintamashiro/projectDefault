/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.EnderecoModel;
import com.app.model.PessoaFisicaModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author macuser
 */
public class PessoaFisicaDAO {

    private static PessoaFisicaDAO pessoaFisicaDAO = null;

    public static final PessoaFisicaDAO getInstance() {
        if (pessoaFisicaDAO == null) {
            pessoaFisicaDAO = new PessoaFisicaDAO();
        }
        return pessoaFisicaDAO;
    }

    public boolean isExisteEmail(Connection conn, String email) throws SQLException {
        boolean isExiste = false;
        String query = "select * from pessoa p where p.email = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, email);
        ResultSet rs = prep.executeQuery();
        if (rs.next()) {
            isExiste = true;
        }
        rs.close();
        prep.close();

        return isExiste;
    }

    public int savePessoa(Connection conn, PessoaFisicaModel pessoaFisicaModel) throws SQLException {
        int idPessoa = 0;
        String query = "INSERT into pessoa (nome, data_nascimento, sexo, login, senha, email) values (?,?,?,?,?,?)";
        PreparedStatement prep = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
        prep.setString(1, pessoaFisicaModel.getNome());
        prep.setString(2, pessoaFisicaModel.getDataNascimento());
        prep.setString(3, pessoaFisicaModel.getSexo());
        prep.setString(4, pessoaFisicaModel.getLogin());
        prep.setString(5, pessoaFisicaModel.getSenha());
        prep.setString(6, pessoaFisicaModel.getEmail());
        prep.execute();
        ResultSet rs = prep.getGeneratedKeys();
        if (rs.next()) {
            idPessoa = rs.getInt(1);
        }
        rs.close();
        prep.close();

        return idPessoa;
    }

    public void saveAddress(Connection conn, int idPessoa, EnderecoModel endereco) throws SQLException {
        String query = "INSERT into endereco (id_pessoa, provincia, cidade, ds_endereco, cep, status) VALUES (?,?,?,?,?,1)";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setInt(1, idPessoa);
        prep.setString(2, endereco.getProvincia());
        prep.setString(3, endereco.getCidade());
        prep.setString(4, endereco.getDsEndereco());
        prep.setString(5, endereco.getCep());
        prep.execute();
        prep.close();
    }

}
