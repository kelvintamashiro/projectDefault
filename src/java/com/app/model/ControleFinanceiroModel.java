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
public class ControleFinanceiroModel extends FormBasico {
    
    private int id;
    private String tipo; //entrada ou saida
    private String dataReferencia;
    private String valor;
    private String descricao;
    
    private String vlTotalSaida;
    private String vlTotalEntrada;
    private String vlTotalLiquido;
    
    private int mes;
    private int ano;

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDataReferencia() {
        return dataReferencia;
    }

    public void setDataReferencia(String dataReferencia) {
        this.dataReferencia = dataReferencia;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getVlTotalSaida() {
        return vlTotalSaida;
    }

    public void setVlTotalSaida(String vlTotalSaida) {
        this.vlTotalSaida = vlTotalSaida;
    }

    public String getVlTotalEntrada() {
        return vlTotalEntrada;
    }

    public void setVlTotalEntrada(String vlTotalEntrada) {
        this.vlTotalEntrada = vlTotalEntrada;
    }

    public String getVlTotalLiquido() {
        return vlTotalLiquido;
    }

    public void setVlTotalLiquido(String vlTotalLiquido) {
        this.vlTotalLiquido = vlTotalLiquido;
    }
    
    
    
    
}
