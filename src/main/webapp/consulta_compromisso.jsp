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
<style>
	body { background-color: #f8f9fa; }
</style>
</head>
<body>
	<div class="container">
		<div class="card shadow-sm mt-5">
			<div class="card-body p-4 p-md-5">

				<h2 class="text-center text-success mb-4">Compromissos Agendados</h2>

				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
					<a href="CompromissoServlet?acao=novo" class="btn btn-success">Novo Compromisso</a>
				</div>
				
				<div class="table-responsive">
					<table class="table table-striped table-hover">
						<thead class="table-success">
							<tr>
								<th>Descrição</th>
								<th>Data</th>
								<th>Hora</th>
								<th>Local</th>
								<th>Contato</th>
								<th>Status</th>
								<th>Editar</th>
								<th>Excluir</th>
							</tr>
						</thead>
						<tbody>
							<%
							List<Compromisso> compromissos = (List<Compromisso>) request.getAttribute("compromissos");
							if (compromissos != null && !compromissos.isEmpty()) {
								for (Compromisso cp : compromissos) {
									// Define a cor de fundo com base no status
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
											   "<td><a href='CompromissoServlet?acao=editar&id="+cp.getId()+"' class='btn btn-sm btn-info'>Editar</a></td>"+
											   "<td><a href='CompromissoServlet?acao=excluir&id="+cp.getId()+"' class='btn btn-sm btn-danger' onclick='return confirm(\"Deseja excluir: " + cp.getDescricao() + "?\");'>Excluir</a></td>"+
											   "</tr>");
								}
							} else {
								out.print("<tr><td colspan='8' class='text-center'>Nenhum compromisso encontrado.</td></tr>");
							}
							%>
						</tbody>
					</table>
				</div>
				
				<hr />
				<a href="index.jsp" class="btn btn-secondary">Voltar para Home</a>
				
			</div>
		</div>
	</div>
</body>
</html>