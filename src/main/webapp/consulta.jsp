<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.List" pageEncoding="UTF-8"%>
<%@ page import="modelos.Contato"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta de Contatos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<h2 class="text-center m-4 text-primary">Contatos Cadastrados</h2>
	<table class="table table-striped table-hover">
	<thead>
		<tr class="table-primary">
			<th>Nome</th>
			<th>Telefone</th>
			<th>Email</th>
			<th>Empresa</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>
	</thead>
		<tbody>
			<%
			if (request.getAttribute("contatos") == null) {
				response.sendRedirect("ContatoServlet");
				return;
			}
			List<Contato> contatos = (List<Contato>) request.getAttribute("contatos");
			if (contatos != null) {
			    for (Contato ct : contatos) {
				    // ESTRUTURA CORRIGIDA: Uma linha (<tr>) e 6 células (<td>)
				    out.print("<tr>" +
				               "<td>"+ct.getNome()+"</td>" + // Célula 1: Nome
				               "<td>"+ct.getTelefone()+"</td>" + // Célula 2: Telefone
				               "<td>"+ct.getEmail()+"</td>" + // Célula 3: Email
				               "<td>"+ct.getEmpresa()+"</td>" + // Célula 4: Empresa
	        			   
	        			   // Célula 5: Botão Editar
	        			   "<td><a href='ContatoServlet?acao=editar&id="+ct.getId()+"' class='btn btn-sm btn-info'>Editar</a></td>" +
				           
	        			   // Célula 6: Botão Excluir
	        			   "<td><a href='ContatoServlet?acao=excluir&id="+ct.getId()+"' class='btn btn-sm btn-danger' onclick='return confirm(\"Deseja excluir o contato: " + ct.getNome() + "?\");'>Excluir</a></td>" +
				           "</tr>");
			    }
			} else {
			     // Colspan ajustado para 6 colunas
			     out.print("<tr><td colspan='6' class='text-center'>Nenhum contato encontrado.</td></tr>");
			}
			%>
		</tbody>
	</table>

	<p class="text-end"><a href="cadastro.jsp" class="btn btn-primary">Novo Contato</a></p>

	<hr />
	<a href="index.jsp" class="btn btn-secondary">Voltar para Home</a>
		
	</div>
</body>
</html>