/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;
/**
 * Classe para...
 * @author Ingryd Salinas
 * @since Classe criada em 3 de jun. de 2026 - 19:34:04
 */
public class Insumo {

    private int id;
    private String nome;
    private double peso;
    private int qtd;

    //cbb deve armazenar o objeto diretamente, e não apenas a String
    @Override
    public String toString() {
        return this.nome; // Faz o ComboBox mostrar o texto do nome do produto
    }
    
    public Insumo() { }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public double getPeso() { return peso; }
    public void setPeso(double peso) { this.peso = peso; }

    public int getQtd() { return qtd; }
    public void setQtd(int qtd) { this.qtd = qtd; }
    
}
