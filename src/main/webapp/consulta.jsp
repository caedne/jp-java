<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.List" pageEncoding="UTF-8"%>
<%@ page import="modelos.Contato"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agenda de Contatos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
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

				<h2 class="text-center text-primary mb-4">Agenda de Contatos</h2>
				
				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
					<a href="cadastro.jsp" class="btn btn-primary">Adicionar Novo Contato</a>
				</div>

				<div class="table-responsive">
					<table class="table table-striped table-hover">
						<thead class="table-primary">
							<tr>
								<th>Nome</th>
								<th>Telefone</th>
								<th>E-mail</th>
								<th>Empresa</th>
								<th>Editar</th>
								<th>Excluir</th>
							</tr>
						</thead>
						<tbody>
							<%
							List<Contato> contatos = (List<Contato>) request.getAttribute("contatos");
							if (contatos != null && !contatos.isEmpty()) {
								for (Contato ct : contatos) {
									out.print("<tr><td>" + ct.getNome() + "</td>" + 
											  "<td>" + ct.getTelefone() + "</td>" + 
											  "<td>" + ct.getEmail() + "</td>" + 
											  "<td>" + ct.getEmpresa() + "</td>" + 
											  "<td><a href='ContatoServlet?acao=editar&id=" + ct.getId() + "' class='btn btn-sm btn-info'>Editar</a></td>" + 
											  "<td><a href='ContatoServlet?acao=excluir&id=" + ct.getId() + "' class='btn btn-sm btn-danger' onclick='return confirm(\"Deseja excluir: " + ct.getNome() + "?\");'>Excluir</a></td>" + 
											  "</tr>");
								}
							} else {
								out.print("<tr><td colspan='6' class='text-center'>Nenhum contato encontrado.</td></tr>");
							}
							%>
						</tbody>
					</table>
				</div>
				
				<hr>
				<a href="index.jsp" class="btn btn-secondary">Voltar para Home</a>

			</div>
		</div>
	</div>
</body>
</html>