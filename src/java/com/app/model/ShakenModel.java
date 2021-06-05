/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.model;

/**
 *
 * @author macuser
 */
public class ShakenModel extends VeiculoModel {

    private int id;
    private String dataRealizacao;
    private String dataVencimento;
    private String valorCobrado;
    private String valorGasto;
    private int qtdParcelas;
    private int diaPagamentoPrestacao;
    private String anoVeiculo;
    private String chassi;
    private String observacao;
    private int idPessoa;
    private String nomePessoa;
    private String enderecoPessoa;
    private String telefonePessoa;
    private String valorEntrada;
    private String valorRestante;

    public String getValorEntrada() {
        return valorEntrada;
    }

    public void setValorEntrada(String valorEntrada) {
        this.valorEntrada = valorEntrada;
    }

    public String getValorRestante() {
        return valorRestante;
    }

    public void setValorRestante(String valorRestante) {
        this.valorRestante = valorRestante;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDataRealizacao() {
        return dataRealizacao;
    }

    public void setDataRealizacao(String dataRealizacao) {
        this.dataRealizacao = dataRealizacao;
    }

    public String getDataVencimento() {
        return dataVencimento;
    }

    public void setDataVencimento(String dataVencimento) {
        this.dataVencimento = dataVencimento;
    }

    public String getValorCobrado() {
        return valorCobrado;
    }

    public void setValorCobrado(String valorCobrado) {
        this.valorCobrado = valorCobrado;
    }

    public String getValorGasto() {
        return valorGasto;
    }

    public void setValorGasto(String valorGasto) {
        this.valorGasto = valorGasto;
    }

    public int getQtdParcelas() {
        return qtdParcelas;
    }

    public void setQtdParcelas(int qtdParcelas) {
        this.qtdParcelas = qtdParcelas;
    }

    public int getDiaPagamentoPrestacao() {
        return diaPagamentoPrestacao;
    }

    public void setDiaPagamentoPrestacao(int diaPagamentoPrestacao) {
        this.diaPagamentoPrestacao = diaPagamentoPrestacao;
    }

    public String getAnoVeiculo() {
        return anoVeiculo;
    }

    public void setAnoVeiculo(String anoVeiculo) {
        this.anoVeiculo = anoVeiculo;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public int getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idPessoa = idPessoa;
    }

    public String getNomePessoa() {
        return nomePessoa;
    }

    public void setNomePessoa(String nomePessoa) {
        this.nomePessoa = nomePessoa;
    }

    public String getEnderecoPessoa() {
        return enderecoPessoa;
    }

    public void setEnderecoPessoa(String enderecoPessoa) {
        this.enderecoPessoa = enderecoPessoa;
    }

    public String getTelefonePessoa() {
        return telefonePessoa;
    }

    public void setTelefonePessoa(String telefonePessoa) {
        this.telefonePessoa = telefonePessoa;
    }

    public String getChassi() {
        return chassi;
    }

    public void setChassi(String chassi) {
        this.chassi = chassi;
    }
    
    
    
    

}
