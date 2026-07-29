/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package DAO;

import model.Utensilio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.ModuloConexao;
import java.util.ArrayList;

/**
 * Classe para...
 * @author Ingryd Salinas
 * @since Classe criada em 3 de jun. de 2026 - 19:38:45
 */
public class UtensilioDAO {

    public ArrayList<Utensilio> listarTodos() {
        ArrayList<Utensilio> lista = new ArrayList<>();
        String sql = "SELECT ute_id, ute_nome FROM utensilio ORDER BY ute_nome ASC";
        try (Connection con = ModuloConexao.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Utensilio u = new Utensilio();
                u.setId(rs.getInt("ute_id"));
                u.setNome(rs.getString("ute_nome"));
                lista.add(u);
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return lista;
    }
}
