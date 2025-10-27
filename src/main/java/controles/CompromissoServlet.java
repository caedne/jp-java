package controles;

import java.io.IOException;
import java.util.Collections; // Import para criar lista vazia
import java.util.List;

import dao.CompromissoDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Compromisso;
import dao.ContatoDao;
import modelos.Contato;

@WebServlet("/CompromissoServlet")
public class CompromissoServlet extends HttpServlet {
   
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CompromissoDao dao = new CompromissoDao();
        ContatoDao contatoDao = new ContatoDao();
        String acao = request.getParameter("acao");

        if (acao != null) {
            
            if (acao.equals("novo")) {
                List<Contato> contatos = Collections.emptyList(); // Inicializa como lista vazia
                try {
                    // Tenta puxar a lista de contatos do DAO
                    contatos = contatoDao.getAll(); 
                } catch (RuntimeException e) {
                    // Se falhar, registra o erro no console (não congela o servidor)
                    System.err.println("Erro ao buscar contatos para novo compromisso: " + e.getMessage());
                    // E continua com a lista vazia
                }
                
                // CÓDIGO FINAL DE ENCAMINHAMENTO: Sempre carrega o JSP
                request.setAttribute("contatos", contatos);
                RequestDispatcher rd = request.getRequestDispatcher("cadastro_compromisso.jsp");
                rd.forward(request, response);
                
                return; 
            }
            
                        
            String idCompromisso = request.getParameter("id");
            Compromisso cp = dao.getById(Integer.parseInt(idCompromisso));

            if (acao.equals("editar")) {
                request.setAttribute("compromisso", cp);
              
                try {
                    // CÓDIGO CORRETO: Puxa a lista de contatos também para o modo edição
                    List<Contato> contatos = contatoDao.getAll(); 
                    request.setAttribute("contatos", contatos);
                } catch (RuntimeException e) {
                    System.err.println("Erro ao buscar contatos para edição: " + e.getMessage());
                }
                
                RequestDispatcher rd = request.getRequestDispatcher("edicao_compromisso.jsp");
                rd.forward(request, response);
            } else { // Deletar
                try {
                    dao.deletar(cp);
                } catch (RuntimeException e) {
                    System.err.println("Erro ao deletar compromisso: " + e.getMessage());
                }
                response.sendRedirect("CompromissoServlet");
            }

        } else { // Consulta Geral de Compromissos
            try {
                List<Compromisso> compromissos = dao.getAll();
                request.setAttribute("compromissos", compromissos);
            } catch (RuntimeException e) {
                System.err.println("Erro ao buscar Compromissos: " + e.getMessage());
            }

            RequestDispatcher rd = request.getRequestDispatcher("consulta_compromisso.jsp");
            rd.forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CompromissoDao dao = new CompromissoDao();
		String acao = request.getParameter("acao");

		try {
			if (acao != null && acao.equals("alterar")) { 
				
				Compromisso compromisso = dao.getById(Integer.parseInt(request.getParameter("id")));
				
				
				compromisso.setDescricao(request.getParameter("descricao"));
				compromisso.setData(request.getParameter("data"));
				compromisso.setHora(request.getParameter("hora"));
				compromisso.setLocal(request.getParameter("local"));
				compromisso.setContato(request.getParameter("contato"));
				compromisso.setStatus(request.getParameter("status"));
				
				dao.alterar(compromisso); 
				
			} else { 
				Compromisso compromisso = new Compromisso();
				compromisso.setDescricao(request.getParameter("descricao"));
				compromisso.setData(request.getParameter("data"));
				compromisso.setHora(request.getParameter("hora"));
				compromisso.setLocal(request.getParameter("local"));
				compromisso.setContato(request.getParameter("contato"));
				
				compromisso.setStatus("Agendado"); 
				
				dao.salvar(compromisso);
			}
		} catch (RuntimeException e) {
			System.err.println("Erro no doPost do CompromissoServlet: " + e.getMessage());
		}

		response.sendRedirect("CompromissoServlet");
	}

}