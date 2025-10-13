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
	<table class="table table-striped">
	<thead>
		<tr>
			<th>Nome</th>
			<th>Email</th>
			<th>Editar</th>
			<th>Excluir</th>
		<tr>
		<thead>
		<tbody>
			<%
			if (request.getAttribute("contatos") == null) {
				response.sendRedirect("ContatoServlet");
				return;
			}
			List<Contato> contatos = (List<Contato>) request.getAttribute("contatos");
			for (Contato ct : contatos) {
				out.print("<tr><td>"+ct.getNome()+"</td><td>"+ct.getEmail()+"</td>"+
	        			   "<td><a href='ContatoServlet?acao=editar&id="+ct.getId()+"'>editar</a></td>"+
				           "<td><a href='ContatoServlet?acao=excluir&id="+ct.getId()+"'>excluir</a></td>"+
				           "</tr>");           }
			%>
		</tbody>
	</table>

	<hr />
	<a href="index.jsp">Home</a>
		
	</div>
</body>
</html>