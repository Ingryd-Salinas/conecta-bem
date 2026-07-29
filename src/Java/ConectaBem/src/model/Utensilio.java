/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

/**
 * Classe para...
 * @author Ingryd Salinas
 * @since Classe criada em 3 de jun. de 2026 - 19:34:17
 */
public class Utensilio {

    private int id;
    private String nome;
    private String descricao;
    private int qtd;

    //cbb deve armazenar o objeto diretamente, e não apenas a String
    @Override
    public String toString() {
        return this.nome; // Faz o ComboBox mostrar o texto do nome do produto
    }
    
    public Utensilio() { }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    
    public int getQtd() { return qtd; }
    public void setQtd(int qtd) { this.qtd = qtd; }
    
}
