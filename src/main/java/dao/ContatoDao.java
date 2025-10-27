package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelos.Contato;
import utils.ConectaDB;

public class ContatoDao {

	// REMOVIDO: private Connection con = ConectaDB.getConexao();

	public Contato salvar(Contato contato) {
		String sql = "insert into tb_contatos(nome, telefone, email, empresa)values(?,?,?, ?)";
		
		// 1. Pega e fecha a conexão para este método
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql)) {
			
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getTelefone());
			stm.setString(3, contato.getEmail());
			stm.setString(4, contato.getEmpresa());
			stm.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}
		return contato;
	}
	
	public List<Contato> getAll(){
		List<Contato> contatos = new ArrayList<Contato>();
		String sql = "select * from tb_contatos"; // 2. SQL foi movido para cima
		
		// 3. Pega e fecha a conexão, statement e resultset
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql);
			 ResultSet rs = stm.executeQuery()) {
			
			while(rs.next()) {
				Contato ct = new Contato();
				ct.setId(rs.getInt("id"));
				ct.setNome(rs.getString("nome"));
				ct.setTelefone(rs.getString("telefone"));
				ct.setEmail(rs.getString("email"));
				ct.setEmpresa(rs.getString("empresa"));
				
				contatos.add(ct);				
			}
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}
		return contatos; // 4. Retorna a lista (pode estar vazia, mas não dará erro)
	}
	
	
	public void deletar(Contato contato) {		
		String sql = "delete from tb_contatos where id = ?";
		
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql)) {
			
			stm.setInt(1, contato.getId());
			stm.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
	
	public Contato getById(int id) {
		String sql = "select * from tb_contatos where id = ?";
		
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql)) {
			
			stm.setInt(1, id);
			
			try (ResultSet rs = stm.executeQuery()) {
				if (rs.next()) {
					Contato ct = new Contato();
					ct.setId(rs.getInt("id"));
					ct.setNome(rs.getString("nome"));
					ct.setTelefone(rs.getString("telefone"));
					ct.setEmail(rs.getString("email"));
					ct.setEmpresa(rs.getString("empresa"));
					return ct;
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;		
	}


	public void alterar(Contato contato) {
		String sql = "update tb_contatos set nome = ?, telefone = ?, email = ?, empresa = ? where id = ?";
		
		try (Connection con = ConectaDB.getConexao();
			 PreparedStatement stm = con.prepareStatement(sql)) {
			
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getTelefone());
			stm.setString(3, contato.getEmail());
			stm.setString(4, contato.getEmpresa());
			stm.setInt(5, contato.getId());
			stm.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}
	}
}