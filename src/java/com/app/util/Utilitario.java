/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.util;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author macuser
 */
public class Utilitario {

    private static Utilitario utilitario = null;

    public static final Utilitario getInstance() {
        if (utilitario == null) {
            utilitario = new Utilitario();
        }
        return utilitario;
    }

    public String formatacaoIene(long valor) {

        NumberFormat n = NumberFormat.getCurrencyInstance(Locale.JAPAN);
        String precoFormatado = n.format(valor);

        return precoFormatado.substring(1);
    }

}
