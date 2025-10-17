<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.List" pageEncoding="UTF-8"%>
<%@ page import="modelos.Compromisso"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta de Compromissos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<h2 class="text-center m-4 text-primary">Compromissos Agendados</h2>
	<table class="table table-striped table-hover">
	<thead>
		<tr class="table-success">
            <th>Descrição</th>
            <th>Data</th>
            <th>Hora</th>
            <th>Local</th>
            <th>Contato</th>
            <th>Status</th>
            <th>Editar</th>   <th>Excluir</th>  </tr>
	</thead>
		<tbody>
			<%
			List<Compromisso> compromissos = (List<Compromisso>) request.getAttribute("compromissos");
			if (compromissos != null) {
				for (Compromisso cp : compromissos) {
					// Define a cor de fundo com base no status para deixar 'bonito'
					String statusClass = "";
					if (cp.getStatus().equals("Concluído")) {
					    statusClass = "table-success";
					} else if (cp.getStatus().equals("Cancelado")) {
					    statusClass = "table-danger";
					} else if (cp.getStatus().equals("Em Andamento")) {
					    statusClass = "table-warning";
					}
					
					out.print("<tr class='"+statusClass+"'><td>"+cp.getDescricao()+"</td>"+
					           "<td>"+cp.getData()+"</td>"+
					           "<td>"+cp.getHora()+"</td>"+
					           "<td>"+cp.getLocal()+"</td>"+
					           "<td>"+cp.getContato()+"</td>"+
					           "<td>"+cp.getStatus()+"</td>"+
                               
                               // BOTÃO EDITAR (AZUL CLARO - btn-info)
					           "<td><a href='CompromissoServlet?acao=editar&id="+cp.getId()+"' class='btn btn-sm btn-info'>Editar</a></td>"+
                               
                               // BOTÃO EXCLUIR (VERMELHO - btn-danger)
					           "<td><a href='CompromissoServlet?acao=excluir&id="+cp.getId()+"' class='btn btn-sm btn-danger' onclick='return confirm(\"Deseja excluir: " + cp.getDescricao() + "?\");'>Excluir</a></td>"+
                               
					           "</tr>");
				}
			} else {
			    // O colspan agora é 8 para cobrir todas as colunas
			    out.print("<tr><td colspan='8' class='text-center'>Nenhum compromisso encontrado.</td></tr>");
			}
			%>
		</tbody>
	</table>
	
	<p class="text-end"><a href="cadastro_compromisso.jsp" class="btn btn-primary">Novo Compromisso</a></p>

	<hr />
	<a href="index.jsp" class="btn btn-secondary">Voltar para Home</a>
		
	</div>
</body>
</html>