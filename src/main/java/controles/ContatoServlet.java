package controles;

import java.io.IOException;
import java.util.List;

import dao.ContatoDao; 
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Contato;

@WebServlet("/ContatoServlet")
public class ContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    // CORREÇÃO: Usa o DAO para interagir com o banco
    private ContatoDao dao = new ContatoDao(); 

	public ContatoServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");
		if (acao != null) {
			String idContato = request.getParameter("id");
			// Usa o DAO para buscar o contato pelo ID
			Contato ct = dao.getById(Integer.parseInt(idContato));
			if(acao.equals("editar")) {
				request.setAttribute("contato", ct);
				RequestDispatcher rd = request.getRequestDispatcher("edicao.jsp");
				rd.forward(request, response);				
			}else {
				// Usa o DAO para deletar
				dao.deletar(ct); 
				response.sendRedirect("ContatoServlet");				
			}
						
		} else {
			// Usa o DAO para buscar TODOS os contatos
			List<Contato> contatos = dao.getAll(); 
			request.setAttribute("contatos", contatos);
			RequestDispatcher rd = request.getRequestDispatcher("consulta.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");
        // Coleta todos os campos do formulário (incluindo telefone e empresa)
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone"); 
        String empresa = request.getParameter("empresa");   
        
		try {
            if (acao != null && acao.equals("alterar")) {
                // Modo Alterar
                Contato contato = dao.getById(Integer.parseInt(request.getParameter("id")));
                contato.setNome(nome);
                contato.setEmail(email);
                contato.setTelefone(telefone); 
                contato.setEmpresa(empresa);   
                dao.alterar(contato);
            } else { // Novo Cadastro
                Contato contato = new Contato();
                contato.setNome(nome);
                contato.setEmail(email);
                contato.setTelefone(telefone); 
                contato.setEmpresa(empresa);   
                dao.salvar(contato); // Usa o DAO para salvar no banco
            }
        } catch (RuntimeException e) {
            System.err.println("Erro no doPost do ContatoServlet: " + e.getMessage());
        }
        
		response.sendRedirect("ContatoServlet");
	}
}