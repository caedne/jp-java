<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Novo Compromisso</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2 class="text-center m-4 text-success">Novo Compromisso</h2>
		<form action="CompromissoServlet" method="post">

			<label class="form-label">Descrição</label>
			<input class="form-control" type="text" placeholder="Ex: Reunião com Cliente" name="descricao" required="required" />

			<div class="row">
			    <div class="col-md-6">
			        <label class="form-label mt-2">Data</label>
			        <input class="form-control" type="date" name="data" required="required">
			    </div>
			    <div class="col-md-6">
			        <label class="form-label mt-2">Hora</label>
			        <input class="form-control" type="time" name="hora" required="required">
			    </div>
			</div>

			<label class="form-label mt-2">Local</label>
			<input class="form-control" type="text" placeholder="Ex: Sala 301" name="local" required="required" />

			<label class="form-label mt-2">Contato Envolvido</label>
			<input class="form-control" type="text" placeholder="Ex: Carlos Silva" name="contato" required="required" />
			
			<button class="btn btn-primary mt-3 w-100">Salvar Compromisso</button>
		</form>

		<hr />
		<a href="index.jsp" class="btn btn-secondary">Voltar para Home</a>

	</div>
</body>
</html>