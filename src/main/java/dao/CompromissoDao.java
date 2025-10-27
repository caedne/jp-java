package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelos.Compromisso;
import utils.ConectaDB;

public class CompromissoDao {
	
	
	public Compromisso salvar(Compromisso compromisso) {
		String sql = "INSERT INTO tb_compromissos (descricao, data, hora, local, contato, status) VALUES (?, ?, ?, ?, ?, ?)";

		
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql)) {
			
			stm.setString(1, compromisso.getDescricao());
			stm.setString(2, compromisso.getData());
			stm.setString(3, compromisso.getHora());
			stm.setString(4, compromisso.getLocal());
			stm.setString(5, compromisso.getContato());
			stm.setString(6, compromisso.getStatus());
			stm.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao salvar Compromisso: " + e.getMessage());
		}
		return compromisso;
	}
	
	public List<Compromisso> getAll(){
		List<Compromisso> compromissos = new ArrayList<>();
		String sql = "SELECT * FROM tb_compromissos";
		
		
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql);
			 ResultSet rs = stm.executeQuery()) {
			
			while(rs.next()) {
				Compromisso cp = new Compromisso();
				cp.setId(rs.getInt("id"));
				cp.setDescricao(rs.getString("descricao"));
				cp.setData(rs.getString("data"));
				cp.setHora(rs.getString("hora"));
				cp.setLocal(rs.getString("local"));
				cp.setContato(rs.getString("contato"));
				cp.setStatus(rs.getString("status"));
				
				compromissos.add(cp);				
			}
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao buscar todos Compromissos: " + e.getMessage());
		}
		return compromissos;
		
	}
	
	public Compromisso getById(int id) {
		String sql = "SELECT * FROM tb_compromissos WHERE id = ?";
		
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql)) {
			
			stm.setInt(1, id);
			
			
			try (ResultSet rs = stm.executeQuery()) {
				if (rs.next()) {
					Compromisso cp = new Compromisso();
					cp.setId(rs.getInt("id"));
					cp.setDescricao(rs.getString("descricao"));
					cp.setData(rs.getString("data"));
					cp.setHora(rs.getString("hora"));
					cp.setLocal(rs.getString("local"));
					cp.setContato(rs.getString("contato"));
					cp.setStatus(rs.getString("status"));
					return cp;
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao buscar Compromisso por ID: " + e.getMessage());
		}
		return null;		
	}
	
	public void deletar(Compromisso compromisso) {		
		String sql = "DELETE FROM tb_compromissos WHERE id = ?";
		
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql)) {
			
			stm.setInt(1, compromisso.getId());
			stm.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao deletar Compromisso: " + e.getMessage());
		}
	}
	
	public void alterar(Compromisso compromisso) {
		String sql = "UPDATE tb_compromissos SET descricao = ?, data = ?, hora = ?, local = ?, contato = ?, status = ? WHERE id = ?";
		
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql)) {
			
			stm.setString(1, compromisso.getDescricao());
			stm.setString(2, compromisso.getData());
			stm.setString(3, compromisso.getHora());
			stm.setString(4, compromisso.getLocal());
			stm.setString(5, compromisso.getContato());
			stm.setString(6, compromisso.getStatus());
			stm.setInt(7, compromisso.getId());
			stm.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao alterar Compromisso: " + e.getMessage());
		}
	}

}