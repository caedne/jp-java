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

	// Simula um "banco de dados" em memória
	private List<Compromisso> compromissos = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Encaminha a lista para a página de consulta
		request.setAttribute("compromissos", compromissos);
		RequestDispatcher rd = request.getRequestDispatcher("consulta_compromisso.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Cadastro de Novo Compromisso
		Compromisso compromisso = new Compromisso();
		compromisso.setId(compromissos.size() + 1);
		
		// Note que o request.getParameter usa os nomes dos campos do JSP (ver item 1.3)
		compromisso.setDescricao(request.getParameter("descricao"));
		compromisso.setData(request.getParameter("data"));
		compromisso.setHora(request.getParameter("hora"));
		compromisso.setLocal(request.getParameter("local"));
		compromisso.setContato(request.getParameter("contato"));
		compromisso.setStatus(request.getParameter("status"));
		
		compromissos.add(compromisso);
		
		// Redireciona para o doGet, que lista os compromissos
		response.sendRedirect("CompromissoServlet");
	}
}