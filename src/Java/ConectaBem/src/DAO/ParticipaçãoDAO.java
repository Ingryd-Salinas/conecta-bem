/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package DAO;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.Doação;
import util.ModuloConexao;

/**
 * Classe para...
 * @author Ingryd Salinas
 * @since Classe criada em 1 de jun. de 2026 - 16:45:53
 */
public class ParticipaçãoDAO {
    
    public void escolherCargo(Doação doacao) {
        // Sintaxe JDBC para chamar Stored Procedures
        String sql = "{call escolherCargo(?, ?, ?, ?, ?)}";

        try (Connection con = ModuloConexao.conectar();
             CallableStatement cstmt = con.prepareCall(sql)) {

            // Preenche os parâmetros na ordem exata definida na PROCEDURE
            cstmt.setString(1, doacao.getData());       // IN doadata DATE (Java aceita String em formato YYYY-MM-DD)
            cstmt.setString(2, doacao.getDescricao());  // IN descricao VARCHAR(200)
            cstmt.setString(3, doacao.getUsuCpf());     // IN usuario VARCHAR(14)
            cstmt.setInt(4, doacao.getEvento().getId());// IN evento INT (Pega o ID do objeto Evento)
            
            // Validação da Chave Estrangeira Função 
            if (doacao.getFunção() != null && doacao.getFunção().getId() != 0) 
                cstmt.setInt(5, doacao.getFunção().getId()); // Envia o ID para o banco
            else 
                cstmt.setNull(5, java.sql.Types.INTEGER); // Salva NULL se não for do tipo função

            // Executa a procedure no MySQL
            cstmt.execute();
            
            JOptionPane.showMessageDialog(null, "Participação registrada com sucesso!");

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao registrar participação: " + ex.getMessage());
        }
    }
    
    //Operação que cancela a participação
    public boolean cancelarParticipacao(String cpf, int idEvento, int idFuncao) {

        String sql = "{call excluirCargo(?, ?, ?)}";
        
        try (Connection con = ModuloConexao.conectar();
             CallableStatement cstmt = con.prepareCall(sql)) {
            
            cstmt.setString(1, cpf);
            cstmt.setInt(2, idEvento);
            cstmt.setInt(3, idFuncao);     
            
            cstmt.execute();
            
            JOptionPane.showMessageDialog(null, "Participação cancelada com sucesso!");
            
            return true;

        } catch (SQLException ex) {
            
            JOptionPane.showMessageDialog(
                null,
                "Erro ao cancelar participação: " + ex.getMessage()
            );

            return false;
        } 
    }
}
