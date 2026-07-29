/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package util;

/**
 * Classe para gerenciar e fornecer a conexão com o banco de dados MySQL.
 * @author Ingryd Salinas, Isabela Cordeiro
 * @since Classe criada em 1 de jun. de 2026 - 14:09:48
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ModuloConexao {
    // O final da URL tem o nome do nosso banco e os novos parâmetros de segurança
    private static final String URL = "jdbc:mysql://localhost:3306/conectabem?serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false";
    private static final String USUARIO = "root";
    private static final String SENHA = "root"; // Coloque aqui a senha do seu MySQL

    public static Connection conectar() {
        try {
            // Opcional, mas boa prática: Força o carregamento do novo driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection conexao = DriverManager.getConnection(URL, USUARIO, SENHA);
            return conexao;
            
        } catch (ClassNotFoundException e) {
            javax.swing.JOptionPane.showMessageDialog(null, "Driver JDBC não encontrado! Verifique as Bibliotecas.");
            return null;
            
        } catch (SQLException e) {
            javax.swing.JOptionPane.showMessageDialog(null, "Erro ao conectar com o Banco:\n" + e.getMessage());
            return null;
            
        } catch (Exception e) {
            javax.swing.JOptionPane.showMessageDialog(null, "Erro inesperado: " + e.getMessage());
            return null;
        }

    }
}
