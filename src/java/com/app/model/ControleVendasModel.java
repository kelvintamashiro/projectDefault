/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.model;

import org.apache.struts.upload.FormFile;

/**
 *
 * @author macuser
 */
public class ControleVendasModel extends FormBasico {
    
    public static String folderImg = "imagens_veiculos";
    
    private int idControleVendas;
    
    private int idTipoVeiculo;
    private String dsTipoVeiculo;
    
    private int idMarcaVeiculo;
    private String dsMarcaVeiculo;
    
    private int idVeiculo;
    private String dsVeiculo;
    
    //dados de detalhes do veiculo
    private String chassi;
    private String cor;
    private String ano;
    private String precoCompra;
    private String precoVenda;
    private String cambio;
    private String motor;
    private String combustivel;
    private String km;
    private String shaken;
    private int capacidadePessoa;
    private int nrPortas;
    private String detalhesExtras;
    private String freio;
    private String dataInsercao;
    private String dataVenda;
    private FormFile fileImg1;
    private String pathImg1;

    public FormFile getFileImg1() {
        return fileImg1;
    }

    public void setFileImg1(FormFile fileImg1) {
        this.fileImg1 = fileImg1;
    }

    public String getPathImg1() {
        return pathImg1;
    }

    public void setPathImg1(String pathImg1) {
        this.pathImg1 = pathImg1;
    }
    
    
    public String getDataInsercao() {
        return dataInsercao;
    }

    public void setDataInsercao(String dataInsercao) {
        this.dataInsercao = dataInsercao;
    }

    public String getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(String dataVenda) {
        this.dataVenda = dataVenda;
    }
    
    public String getFreio() {
        return freio;
    }

    public void setFreio(String freio) {
        this.freio = freio;
    }
    
    public int getIdControleVendas() {
        return idControleVendas;
    }

    public void setIdControleVendas(int idControleVendas) {
        this.idControleVendas = idControleVendas;
    }

    public int getIdTipoVeiculo() {
        return idTipoVeiculo;
    }

    public void setIdTipoVeiculo(int idTipoVeiculo) {
        this.idTipoVeiculo = idTipoVeiculo;
    }

    public String getDsTipoVeiculo() {
        return dsTipoVeiculo;
    }

    public void setDsTipoVeiculo(String dsTipoVeiculo) {
        this.dsTipoVeiculo = dsTipoVeiculo;
    }

    public int getIdMarcaVeiculo() {
        return idMarcaVeiculo;
    }

    public void setIdMarcaVeiculo(int idMarcaVeiculo) {
        this.idMarcaVeiculo = idMarcaVeiculo;
    }

    public String getDsMarcaVeiculo() {
        return dsMarcaVeiculo;
    }

    public void setDsMarcaVeiculo(String dsMarcaVeiculo) {
        this.dsMarcaVeiculo = dsMarcaVeiculo;
    }

    public int getIdVeiculo() {
        return idVeiculo;
    }

    public void setIdVeiculo(int idVeiculo) {
        this.idVeiculo = idVeiculo;
    }

    public String getDsVeiculo() {
        return dsVeiculo;
    }

    public void setDsVeiculo(String dsVeiculo) {
        this.dsVeiculo = dsVeiculo;
    }

    public String getChassi() {
        return chassi;
    }

    public void setChassi(String chassi) {
        this.chassi = chassi;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getPrecoCompra() {
        return precoCompra;
    }

    public void setPrecoCompra(String precoCompra) {
        this.precoCompra = precoCompra;
    }

    public String getPrecoVenda() {
        return precoVenda;
    }

    public void setPrecoVenda(String precoVenda) {
        this.precoVenda = precoVenda;
    }

    public String getCambio() {
        return cambio;
    }

    public void setCambio(String cambio) {
        this.cambio = cambio;
    }

    public String getMotor() {
        return motor;
    }

    public void setMotor(String motor) {
        this.motor = motor;
    }

    public String getCombustivel() {
        return combustivel;
    }

    public void setCombustivel(String combustivel) {
        this.combustivel = combustivel;
    }

    public String getKm() {
        return km;
    }

    public void setKm(String km) {
        this.km = km;
    }

    public String getShaken() {
        return shaken;
    }

    public void setShaken(String shaken) {
        this.shaken = shaken;
    }

    public int getCapacidadePessoa() {
        return capacidadePessoa;
    }

    public void setCapacidadePessoa(int capacidadePessoa) {
        this.capacidadePessoa = capacidadePessoa;
    }

    public int getNrPortas() {
        return nrPortas;
    }

    public void setNrPortas(int nrPortas) {
        this.nrPortas = nrPortas;
    }

    public String getDetalhesExtras() {
        return detalhesExtras;
    }

    public void setDetalhesExtras(String detalhesExtras) {
        this.detalhesExtras = detalhesExtras;
    }
    
    
    
    
    
}
