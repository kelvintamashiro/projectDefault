/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.PessoaFisicaDAO;
import com.app.model.EnderecoModel;
import com.app.model.PessoaFisicaModel;
import com.app.model.TelefoneModel;
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
public class PessoaFisicaAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("save")) {
            this.save(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaModel pessoaFisicaModel = new PessoaFisicaModel();
        EnderecoModel endereco = new EnderecoModel();
        TelefoneModel telefone = new TelefoneModel();
        pessoaFisicaModel.setEndereco(endereco);
        pessoaFisicaModel.setTelefone(telefone);

        request.setAttribute("PessoaFisicaModel", pessoaFisicaModel);
    }

    private void save(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaModel pessoaFisicaModel = (PessoaFisicaModel) form;
        
        //setar endereco no form
        EnderecoModel endereco = new EnderecoModel();

        String provincia = request.getParameter("provincia");
        String cidade = request.getParameter("cidade");
        String bairro = request.getParameter("bairro");
        String dsEndereco = request.getParameter("dsEndereco");
        String cep = request.getParameter("cep");

        endereco.setProvincia(provincia);
        endereco.setCidade(cidade);
        endereco.setBairro(bairro);
        endereco.setDsEndereco(dsEndereco);
        endereco.setCep(cep);

        pessoaFisicaModel.setEndereco(endereco);

        //setar telefone no form
        TelefoneModel telefone = new TelefoneModel();

        String nrTelefone = request.getParameter("nrTelefone");
        String tipoTelefone = request.getParameter("tipoTelefone");

        telefone.setNrTelefone(nrTelefone);
        telefone.setTipoTelefone(tipoTelefone);

        pessoaFisicaModel.setTelefone(telefone);

        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar se ja existe email cadastrado
            //se existir nao permite cadastrar novo usuario
            boolean isExisteEmail = PessoaFisicaDAO.getInstance().isExisteEmail(conn, pessoaFisicaModel.getEmail());

            if (isExisteEmail) {
                errors.error("Esse e-mail já existe cadastrado em nosso banco de dados. Favor informar um outro.");
            } else {
                //salvar dados da pessoa e retornar o ID
                int idPessoa = PessoaFisicaDAO.getInstance().savePessoa(conn, pessoaFisicaModel);

                if (idPessoa != 0) {
                    //salvar os dados de endereco pelo idPessoa
                    PessoaFisicaDAO.getInstance().saveAddress(conn, idPessoa, endereco);
                    
                    
                    //salvar os dados de telefone pelo idPessoa
                    errors.error("Cadastro com Sucesso!!");
                } else {
                    errors.error("Ocorreu algum erro no sistema!!Favor contactar o suporte!");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }

    }

}
