/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package DAO;

import model.Insumo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.ModuloConexao;
import java.util.ArrayList;

/**
 * Classe para...
 * @author Ingryd Salinas
 * @since Classe criada em 3 de jun. de 2026 - 19:38:38
 */
public class InsumoDAO {

    public ArrayList<Insumo> listarTodos() {
        ArrayList<Insumo> lista = new ArrayList<>();
        String sql = "SELECT ins_id, ins_nome FROM insumo ORDER BY ins_nome ASC";
        try (Connection con = ModuloConexao.conectar();
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Insumo i = new Insumo();
                i.setId(rs.getInt("ins_id"));
                i.setNome(rs.getString("ins_nome"));
                lista.add(i);
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return lista;
    }
    
    public int buscarIdPorNome(String nomeInsumo) {
        String sql = "SELECT ins_id FROM insumo WHERE ins_nome = ?";
        try (Connection con = ModuloConexao.conectar();
            PreparedStatement stmt = con.prepareStatement(sql)) {
        
            stmt.setString(1, nomeInsumo);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) 
                    return rs.getInt("ins_id"); // Retorna o ID numérico achado
            }
            
        } catch (SQLException ex) { ex.printStackTrace(); }
        return 0; // Se der erro ou não achar
    }
}
