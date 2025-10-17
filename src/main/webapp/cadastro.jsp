<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Novo Contato</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
		      rel="stylesheet" 
	          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" 
	          crossorigin="anonymous">
</head>
<body>
	<div class="container">
	    <h2 class="text-center m-4 text-primary">Novo Contato</h2>
		<form action="ContatoServlet" method="post">
			
			<label class="form-label">Informe Nome</label>
			<input class="form-control" type="text" placeholder="Ex: Carlos" name="nome" required="required"> 
			
			<label class="form-label mt-2">Informe Email</label>
			<input class="form-control" type="email" placeholder="Ex: carlos@gmail.com" name="email" required="required"> 	
			
			<button class="btn btn-primary mt-3 w-100">Salvar Contato</button>
		</form>

		<hr>
		<a href="index.jsp" class="btn btn-secondary">Voltar para Home</a>

	</div>

</body>
</html>