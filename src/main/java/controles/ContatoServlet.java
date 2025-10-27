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

    private ContatoDao dao = new ContatoDao(); 

	public ContatoServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");
		if (acao != null) {
			String idContato = request.getParameter("id");
			
			Contato ct = dao.getById(Integer.parseInt(idContato));
			if(acao.equals("editar")) {
				request.setAttribute("contato", ct);
				RequestDispatcher rd = request.getRequestDispatcher("edicao.jsp");
				rd.forward(request, response);				
			}else {
				
				dao.deletar(ct); 
				response.sendRedirect("ContatoServlet");				
			}
						
		} else {
			
			List<Contato> contatos = dao.getAll(); 
			request.setAttribute("contatos", contatos);
			RequestDispatcher rd = request.getRequestDispatcher("consulta.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");
        
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone"); 
        String empresa = request.getParameter("empresa");   
        
		try {
            if (acao != null && acao.equals("alterar")) {
                
                Contato contato = dao.getById(Integer.parseInt(request.getParameter("id")));
                contato.setNome(nome);
                contato.setEmail(email);
                contato.setTelefone(telefone); 
                contato.setEmpresa(empresa);   
                dao.alterar(contato);
            } else { 
                Contato contato = new Contato();
                contato.setNome(nome);
                contato.setEmail(email);
                contato.setTelefone(telefone); 
                contato.setEmpresa(empresa);   
                dao.salvar(contato); 
            }
        } catch (RuntimeException e) {
            System.err.println("Erro no doPost do ContatoServlet: " + e.getMessage());
        }
        
		response.sendRedirect("ContatoServlet");
	}
}