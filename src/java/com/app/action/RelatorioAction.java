/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.dao.Relatorio;
import com.app.model.RelatorioModel;
import com.app.util.Errors;
import com.app.util.Utilitario;
import java.sql.Connection;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
public class RelatorioAction extends IDRAction {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("relPessoasCadastradas")) {
            this.relPessoasCadastradas(form, request, errors);
        } else if (action.equals("filtrarRelPessoa")) {
            this.filtrarRelPessoa(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void relPessoasCadastradas(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatorioModel relatorioModel = (RelatorioModel) form;
        Connection conn = null;
        HttpSession session = request.getSession();
        try {
            conn = connectionPool.getConnection();

            long qtdDias = Utilitario.getInstance().diferencaDiasEntreData(relatorioModel.getDataInicio(), relatorioModel.getDataFinal());

            if (qtdDias > 365) { //no maximo 1 ano
                errors.error("Deve ser informado uma diferença entre datas no máximo de 1 ano");
            } else {
                List<RelatorioModel> listaPessoasCadastradas = Relatorio.getInstance().obterPessoasCadastradas(conn);
                session.setAttribute("listaPessoasCadastradas", listaPessoasCadastradas);
                request.setAttribute("RelatorioModel", relatorioModel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

    private void filtrarRelPessoa(ActionForm form, HttpServletRequest request, Errors errors) {
        RelatorioModel relatorioModel = (RelatorioModel) form;
        HttpSession session = request.getSession();
        try {
            String tipoFiltro = request.getParameter("tipo");

            ArrayList lista = (ArrayList) session.getAttribute("listaPessoasCadastradas");

            Collections.sort(lista, new Comparator<RelatorioModel>() {
                @Override
                public int compare(RelatorioModel o1, RelatorioModel o2) {

                    Collator collator = Collator.getInstance();
                    if (tipoFiltro.equals("id")) {
                        return o1.getIdPessoa() > o2.getIdPessoa() ? 1 : 0;
                    } else if (tipoFiltro.equals("nome")) {
                        return collator.compare(o1.getNomePessoa(), o2.getNomePessoa());
                    } else if (tipoFiltro.equals("data_nascimento")) {
                        return collator.compare(o1.getDataNascimento(), o2.getDataNascimento());
                    } else if (tipoFiltro.equals("email")) {
                        return collator.compare(o1.getEmail(), o2.getEmail());
                    } else if (tipoFiltro.equals("sexo")) {
                        return collator.compare(o1.getSexo(), o2.getSexo());
                    } else if (tipoFiltro.equals("my_number")) {
                        return collator.compare(o1.getMyNumber(), o2.getMyNumber());
                    } else if (tipoFiltro.equals("telefone")) {
                        return collator.compare(o1.getNumeroTelefone(), o2.getNumeroTelefone());
                    } else if (tipoFiltro.equals("tipo_telefone")) {
                        return collator.compare(o1.getTipoTelefone(), o2.getTipoTelefone());
                    } else if (tipoFiltro.equals("provincia")) {
                        return collator.compare(o1.getProvincia(), o2.getProvincia());
                    } else if (tipoFiltro.equals("cidade")) {
                        return collator.compare(o1.getCidade(), o2.getCidade());
                    } else if (tipoFiltro.equals("cep")) {
                        return collator.compare(o1.getCep(), o2.getCep());
                    } else if (tipoFiltro.equals("endereco")) {
                        return collator.compare(o1.getEndereco(), o2.getEndereco());
                    } else if (tipoFiltro.equals("bairro")) {
                        return collator.compare(o1.getBairro(), o2.getBairro());
                    } else {
                        return 0;
                    }

                }
            });

            session.setAttribute("listaPessoasCadastradas", lista);
            request.setAttribute("RelatorioModel", relatorioModel);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
