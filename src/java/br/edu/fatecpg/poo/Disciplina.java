/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fatecpg.poo;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rodrigo
 */
public class Disciplina {
    private String nome;
    private String ementa;
    private int ciclo;
    private double nota;
    
    
    public Disciplina(){
        
    }
    
    public Disciplina(String nome, String ementa, int ciclo){
        this.nome=nome;
        this.ementa=ementa;
        this.ciclo=ciclo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }
        
    public static ArrayList<Disciplina> getList(){
       ArrayList<Disciplina> list = new ArrayList();
       list.add(new Disciplina("Programação Orientada a Objeto","Introdução à orientação a objetos."
               + " Conceitos básicos e terminologia de Programação orientada objetos."
               + " Desenvolvimento de aplicações em uma linguagem orientada a objetos. " ,4));
       
       return list;
    }
    
    
    
}
