package controles;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import dao.ContatoDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Contato;
import utils.ConectaDB;

@WebServlet("/ContatoServlet")
public class ContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// REMOVIDA A LISTA 'contatos'

	public ContatoServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ContatoDao dao = new ContatoDao();
		String acao = request.getParameter("acao");
		if (acao != null) {
			String idContato = request.getParameter("id");
			Contato ct = dao.getById(Integer.parseInt(idContato)); // Busca pelo DAO
			
			if (acao.equals("editar")) {
				request.setAttribute("contato", ct);
				RequestDispatcher rd = request.getRequestDispatcher("edicao.jsp");
				rd.forward(request, response);
			} else { // acao.equals("excluir")
				try {
					dao.deletar(ct); // Deleção pelo DAO
				} catch (RuntimeException e) {
					JOptionPane.showMessageDialog(null, "Erro ao deletar: " + e.getMessage());
				}
				response.sendRedirect("ContatoServlet");
			}

		} else { // Consulta Geral
			List<Contato> contatos = dao.getAll(); // Busca todos pelo DAO
			request.setAttribute("contatos", contatos);
			RequestDispatcher rd = request.getRequestDispatcher("consulta.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ContatoDao dao = new ContatoDao();
		String acao = request.getParameter("acao");
		
		try {
			if (acao != null && acao.equals("alterar")) { // Alteração
				// No alterar, o ID deve vir do campo hidden do formulário de edicao.jsp
				Contato contato = dao.getById(Integer.parseInt(request.getParameter("id"))); 
				contato.setNome(request.getParameter("nome"));
				contato.setTelefone(request.getParameter("telefone"));
				contato.setEmail(request.getParameter("email"));
				contato.setEmpresa(request.getParameter("empresa"));
				dao.alterar(contato); // Alteração pelo DAO
				
			} else { // Novo Cadastro
				Contato contato = new Contato();
				contato.setNome(request.getParameter("nome"));
				contato.setTelefone(request.getParameter("telefone"));
				contato.setEmail(request.getParameter("email"));
				contato.setEmpresa(request.getParameter("empresa"));
				dao.salvar(contato); // Salvamento pelo DAO
			}
		} catch (RuntimeException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
		
		response.sendRedirect("ContatoServlet");
	}
	
	// REMOVIDO: O método getById privado não é mais necessário.
}