/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

/**
 * Classe para...
 * @author Ingryd Salinas, Isabela Cordeiro
 * @since Classe criada em 1 de jun. de 2026 - 16:45:05
 */
public class Evento {
    
    //id, nome, status, data, rua, numero, bairro, cidade, uf
    protected int id;
    protected String nome;
    protected String status;
    protected String data;
    protected String rua;
    protected String numero;
    protected String bairro;
    protected String cidade;
    protected String uf;

    public Evento() {
        
    }

    public Evento(String nome, String status, String data, String rua, String numero, String bairro, String cidade, String uf) {
        this.nome = nome;
        this.status = status;
        this.data = data;
        this.rua = rua;
        this.numero = numero;
        this.bairro = bairro;
        this.cidade = cidade;
        this.uf = uf;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

}
