/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.Função;
import util.ModuloConexao;
/**
 * Classe para...
 * @author Ingryd Salinas
 * @since Classe criada em 3 de jun. de 2026 - 18:35:19
 */
public class FunçãoDAO {

    public ArrayList<Função> listarTodas() {
        ArrayList<Função> lista = new ArrayList<>();
        String sql = "SELECT * FROM funcao ORDER BY fun_nome ASC";

        try (Connection con = ModuloConexao.conectar();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Função f = new Função();
                f.setId(rs.getInt("fun_id"));
                f.setNome(rs.getString("fun_nome"));
                f.setDescricao(rs.getString("fun_desc"));
                lista.add(f);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao carregar funções: " + ex.getMessage());
        }
        return lista;
    }
}
