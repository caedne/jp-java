<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "modelos.Contato"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>
	<%
	Contato ct = (Contato) request.getAttribute("contato");
	%>

	<div class="container">
		<h2 class="text-center m-4">Editar Contato</h2>
		<form action="ContatoServlet?acao=alterar" method="post" >
		<input type="hidden" name="id"	value="<%out.print(ct.getId());%>" />
				
				<label>Informe Nome</label>
		    	 <input class="form-control" type="text"
				value="<%out.print(ct.getNome());%>" placeholder="Ex: Carlos"
				name="nome" required="required" /> 
				<label>Informe Email</label> 
				<input class="form-control" type="email"
				value="<%out.print(ct.getEmail());%>"
				placeholder="Ex: carlos@gmail.com" name="email" required="required" />

			<button class="btn btn-primary mt-3">Salvar</button>
		</form>
		
		<hr>
		<a href="index.jsp">Home</a>
	</div>

</body>
</html>