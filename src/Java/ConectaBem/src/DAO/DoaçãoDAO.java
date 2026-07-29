/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.Doação;
import util.ModuloConexao;
/**
 * Classe para...
 * @author Ingryd Salinas. Isabela Cordeiro
 * @since Classe criada em 1 de jun. de 2026 - 16:46:04
 */
public class DoaçãoDAO {
    
    public void registrarDoacao(Doação d) {
        // Query baseada na estrutura padrão de doações com campos opcionais
        String sql = "call fazerDoacaoCompleta(?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = ModuloConexao.conectar();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, d.getData());
            stmt.setString(2, d.getDescricao());
            
            // Tratamento para valores numéricos (se for 0, salva como NULL ou 0 no banco)
            stmt.setDouble(3, d.getValor());
            stmt.setInt(4, d.getQuantidade());
            
            stmt.setString(5, d.getUsuCpf());
            stmt.setInt(6, d.getEvento().getId());
            
            // Validação da Chave Estrangeira do Insumo 
            if (d.getUtensilio() != null && d.getUtensilio().getId() != 0) 
                stmt.setInt(7, d.getUtensilio().getId()); // Envia o ID para o banco
            else  
                stmt.setNull(7, java.sql.Types.INTEGER); // Salva NULL se não for do tipo insumo

            // Validação da Chave Estrangeira do Utensílio 
            if (d.getInsumo() != null && d.getInsumo().getId() != 0) 
                stmt.setInt(8, d.getInsumo().getId()); // Envia o ID para o banco
            else 
                stmt.setNull(8, java.sql.Types.INTEGER); // Salva NULL se não for do tipo utensílio

            stmt.execute();
            JOptionPane.showMessageDialog(null, "Doação registrada com sucesso! Muito obrigado.");

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao registrar doação: " + ex.getMessage());
        }
    }
}
