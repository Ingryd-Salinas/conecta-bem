/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

/**
 * Classe para...
 * @author Ingryd Salinas
 * @since Classe criada em 1 de jun. de 2026 - 16:45:30
 */
public class Doação{
    
    private int id;
    private String data;       // Mapeia IN doadata DATE
    private String descricao;  // Mapeia IN descricao VARCHAR
    private String usuCpf;     // Mapeia IN usuario VARCHAR(14)
    private Evento evento;     // Mapeia IN evento INT (Associação)
    private double valor;      // Mapeia IN valor VARCHAR(60)
    private int quantidade;    // Mapeia IN quantidade VARCHAR(60)
    // Novas associações baseadas nas chaves estrangeiras
    private Insumo insumo;       // Representa o ins_id
    private Utensilio utensilio; // Representa o ute_id
    private Função funcao;       // Representa o fun_id

    // Construtor padrão
    public Doação() {}
    
    // Construtor cheio (Útil para criar o objeto na tela)
    public Doação(String data, String descricao, String usuCpf, Evento evento) {
        this.data = data;
        this.descricao = descricao;
        this.usuCpf = usuCpf;
        this.evento = evento;
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public double getValor() { return valor; }
    public void setValor(double valor) { this.valor = valor; }

    public int getQuantidade() { return quantidade; }
    public void setQuantidade(int quantidade) { this.quantidade = quantidade; }

    public Insumo getInsumo() { return insumo; }
    public void setInsumo(Insumo insumo) { this.insumo = insumo; }

    public Utensilio getUtensilio() { return utensilio; }
    public void setUtensilio(Utensilio utensilio) { this.utensilio = utensilio; }
    
    public Função getFunção() { return funcao; }
    public void setFunção(Função funcao) { this.funcao = funcao; }

    public String getData() { return data; }
    public void setData(String data) { this.data = data; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getUsuCpf() { return usuCpf; }
    public void setUsuCpf(String usuCpf) { this.usuCpf = usuCpf; }

    public Evento getEvento() { return evento; }
    public void setEvento(Evento evento) { this.evento = evento; }
    
}
