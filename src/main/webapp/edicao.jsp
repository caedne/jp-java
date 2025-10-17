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
		<h2 class="text-center m-4 text-warning">Editar Contato</h2>
		<form action="ContatoServlet?acao=alterar" method="post" >
		<input type="hidden" name="id"	value="<%out.print(ct.getId());%>" />
				
				<label class="form-label">Informe Nome</label>
		    	 <input class="form-control" type="text"
				value="<%out.print(ct.getNome());%>" placeholder="Ex: Carlos"
				name="nome" required="required" /> 
				
				<label class="form-label">Informe Telefone</label>
		    	 <input class="form-control" type="tel"
				value="<%out.print(ct.getTelefone());%>" placeholder="Ex: 47 99665 4383"
				name="telefone" required="required" /> 
				
				<label class="form-label mt-2">Informe Email</label> 
				<input class="form-control" type="email"
				value="<%out.print(ct.getEmail());%>"
				placeholder="Ex: carlos@gmail.com" name="email" required="required" />
				
				<label class="form-label mt-2">Informe Empresa</label> 
				<input class="form-control" type="text"
				value="<%out.print(ct.getEmpresa());%>"
				name="empresa" required="required" />

			<button class="btn btn-success mt-3 me-2">Salvar Alterações</button>
			
			<a href='ContatoServlet?acao=excluir&id=<%out.print(ct.getId());%>' 
			   class='btn btn-danger mt-3' 
			   onclick='return confirm("Tem certeza que deseja excluir o contato: " + "<%out.print(ct.getNome());%>" + "?");'>
			   Excluir Contato
			</a>
			
		</form>
		
		<hr>
		<a href="ContatoServlet" class="btn btn-secondary mt-2">Voltar para a Lista</a>
	</div>

</body>
</html>