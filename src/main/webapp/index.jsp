<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
	      rel="stylesheet" 
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" 
          crossorigin="anonymous">
          
<style>
	/* Um pequeno ajuste para deixar o corpo da página com um fundo suave */
	body {
		background-color: #f8f9fa;
	}
</style>
</head>
<body>
<div class="container">
	<h1 class="text-center text-primary mt-5 mb-4">Agenda Pessoal Completa</h1>

	<div class="row justify-content-center mt-5">
		
		<div class="col-lg-4 col-md-6 mb-4">
			<div class="card shadow-sm h-100">
				<div class="card-header text-center bg-white border-0 pt-3">
					<h2 class="h5 mb-0 text-primary">Gestão de Contatos</h2>
				</div>
				<div class="card-body p-4 d-flex flex-column">
					<div class="d-grid gap-3 mt-auto">
						<a href="cadastro.jsp" class="btn btn-outline-primary">Cadastrar Contato</a>
						<a href="ContatoServlet" class="btn btn-primary">Consultar Contatos</a>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-4 col-md-6 mb-4">
			<div class="card shadow-sm h-100">
				<div class="card-header text-center bg-white border-0 pt-3">
					<h2 class="h5 mb-0 text-success">Gestão de Compromissos</h2>
				</div>
				<div class="card-body p-4 d-flex flex-column">
					<div class="d-grid gap-3 mt-auto">
						<a href="CompromissoServlet?acao=novo" class="btn btn-outline-success">Cadastrar Compromisso</a>
						<a href="CompromissoServlet" class="btn btn-success">Consultar Compromissos</a>
					</div>
				</div>
			</div>
		</div>
		
	</div> </div> </body>
</html>