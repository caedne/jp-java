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
                List<Contato> contatos = Collections.emptyList();
                try {
                    
                    contatos = contatoDao.getAll(); 
                } catch (RuntimeException e) {
                  
                    System.err.println("Erro ao buscar contatos para novo compromisso: " + e.getMessage());
                    
                }
                
                
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
                 
                    List<Contato> contatos = contatoDao.getAll(); 
                    request.setAttribute("contatos", contatos);
                } catch (RuntimeException e) {
                    System.err.println("Erro ao buscar contatos para edição: " + e.getMessage());
                }
                
                RequestDispatcher rd = request.getRequestDispatcher("edicao_compromisso.jsp");
                rd.forward(request, response);
            } else { 
                try {
                    dao.deletar(cp);
                } catch (RuntimeException e) {
                    System.err.println("Erro ao deletar compromisso: " + e.getMessage());
                }
                response.sendRedirect("CompromissoServlet");
            }

        } else { 
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
		
	
		Compromisso compromisso = null;
		String jspParaEncaminhar = ""; 
		boolean eraEdicao = (acao != null && acao.equals("alterar"));

		try {
			if (eraEdicao) { 
				
				compromisso = dao.getById(Integer.parseInt(request.getParameter("id")));
				jspParaEncaminhar = "edicao_compromisso.jsp"; 
			} else { 
				
				compromisso = new Compromisso();
				compromisso.setStatus("Agendado"); 
				jspParaEncaminhar = "cadastro_compromisso.jsp"; 
			}
			
			
			compromisso.setDescricao(request.getParameter("descricao"));
			compromisso.setData(request.getParameter("data"));
			compromisso.setHora(request.getParameter("hora"));
			compromisso.setLocal(request.getParameter("local"));
			compromisso.setContato(request.getParameter("contato"));
			if (eraEdicao) {
				compromisso.setStatus(request.getParameter("status"));
			}

			
			if (eraEdicao) {
				dao.alterar(compromisso); 
			} else { 
				dao.salvar(compromisso);
			}
			
			
			response.sendRedirect("CompromissoServlet");

		} catch (RuntimeException e) {
			
			
			System.err.println("Erro no doPost do CompromissoServlet: " + e.getMessage());
			
			
			if (e.getMessage().contains("Data truncation") && e.getMessage().contains("descricao")) {
				
				
				request.setAttribute("erroDescricao", "O texto da descrição é muito longo! Por favor, resuma.");
				
				
				request.setAttribute("compromissoComErro", compromisso); 
				
				
				try {
					ContatoDao contatoDao = new ContatoDao();
					request.setAttribute("contatos", contatoDao.getAll());
				} catch (RuntimeException e2) {
					System.err.println("Erro aninhado ao buscar contatos após falha: " + e2.getMessage());
				}

				
				RequestDispatcher rd = request.getRequestDispatcher(jspParaEncaminhar);
				rd.forward(request, response);
				
			} else {
				
				throw new ServletException("Falha ao salvar/alterar. Erro inesperado: " + e.getMessage(), e);
			}
		}
	}
}