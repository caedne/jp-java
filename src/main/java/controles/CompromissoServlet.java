package controles;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Compromisso;

@WebServlet("/CompromissoServlet")
public class CompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private List<Compromisso> compromissos = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");
		
		if (acao != null) {
			String idCompromisso = request.getParameter("id");
	
			if (idCompromisso != null && !idCompromisso.isEmpty()) {
			    Compromisso cp = getById(Integer.parseInt(idCompromisso));
			    
			    if(acao.equals("editar")) {
			    	request.setAttribute("compromisso", cp);
			    
			    	RequestDispatcher rd = request.getRequestDispatcher("edicao_compromisso.jsp"); 
			    	rd.forward(request, response);				
			    } else if (acao.equals("excluir")) {
			    	compromissos.remove(cp);
			    	response.sendRedirect("CompromissoServlet");				
			    }
			} else {
			   
			    response.sendRedirect("CompromissoServlet");
			}
						
		} else {
		
			request.setAttribute("compromissos", compromissos);
			RequestDispatcher rd = request.getRequestDispatcher("consulta_compromisso.jsp");
			rd.forward(request, response);
		}
	}

	// ... dentro de CompromissoServlet.java

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String acao = request.getParameter("acao");

			if (acao != null && acao.equals("alterar")) { // Edição
				// ... Lógica de edição, onde o status vem do formulário
				Compromisso compromisso = getById(Integer.parseInt(request.getParameter("id")));
	            // ... (outros setters)
				compromisso.setStatus(request.getParameter("status")); 

			} else { // Novo Cadastro
				Compromisso compromisso = new Compromisso();
	            // ... Lógica de cadastro
				
				// Deve existir uma linha como esta:
				compromisso.setStatus("Agendado"); // <--- ISSO DEVE ESTAR AQUI!
				
				// ...
				compromissos.add(compromisso);
			}

			response.sendRedirect("CompromissoServlet");
		}

	private Compromisso getById(int id) {
		for (Compromisso cp : compromissos) {
			if (cp.getId()==id) {
				return cp;
			}
		}
		return null;
	}

}