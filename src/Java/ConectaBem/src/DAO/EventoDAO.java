/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.ModuloConexao;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.Evento;

/**
 * Classe para...
 * @author Ingryd Salinas, Isabela Cordeiro
 * @since Classe criada em 1 de jun. de 2026 - 16:45:41
 */
public class EventoDAO {
    
    public ArrayList<Evento> listarBusca(String busca){
        
        ArrayList<Evento> lista = new ArrayList<>();
        
        String sql = "{CALL visualizarEventos(?)}";
        
        try (Connection con = ModuloConexao.conectar();
             CallableStatement stmt = con.prepareCall(sql);){
            
            stmt.setString(1, busca);

            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                
                Evento e = new Evento();

                e.setId(rs.getInt("eve_id"));
                e.setNome(rs.getString("eve_nome"));
                e.setStatus(rs.getString("eve_status"));
                e.setData(rs.getString("eve_data"));
                e.setRua(rs.getString("eve_rua"));
                e.setNumero(rs.getString("eve_numero"));
                e.setBairro(rs.getString("eve_bairro"));
                e.setCidade(rs.getString("eve_cidade"));
                e.setUf(rs.getString("eve_uf"));
                
                lista.add(e);
            }//fim while
        } catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Erro ao listar eventos: " + ex.getMessage());
            
        } catch (Exception e) {
            javax.swing.JOptionPane.showMessageDialog(null, "Erro inesperado: " + e.getMessage());
            return null;
        }//fim catch
        
        return lista;
        
    }//fim listar
    
    public ArrayList<Evento> listarTodos(){
        
        ArrayList<Evento> lista = new ArrayList<>();
        
        String sql = "SELECT * FROM evento";
        
        try (Connection con = ModuloConexao.conectar();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()){
            
            while(rs.next()){
                
                Evento e = new Evento();

                e.setId(rs.getInt("eve_id"));
                e.setNome(rs.getString("eve_nome"));
                e.setStatus(rs.getString("eve_status"));
                e.setData(rs.getString("eve_data"));
                e.setRua(rs.getString("eve_rua"));
                e.setNumero(rs.getString("eve_numero"));
                e.setBairro(rs.getString("eve_bairro"));
                e.setCidade(rs.getString("eve_cidade"));
                e.setUf(rs.getString("eve_uf"));
                
                lista.add(e);
            }//fim while
        } catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Erro ao listar eventos: " + ex.getMessage());
            
        } catch (Exception e) {
            javax.swing.JOptionPane.showMessageDialog(null, "Erro inesperado: " + e.getMessage());
            return null;
        }//fim catch
        
        return lista;
        
    }//fim listar
}
