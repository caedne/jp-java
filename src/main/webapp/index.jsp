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
</head>
<body>
<div class="container">
<h1 class="text-center text-primary mt-4">Agenda Pessoal Completa</h1>
<hr>	

<h2 class="mt-4">Gestão de Contatos</h2>
<a href="cadastro.jsp" class="btn btn-outline-primary m-1">Cadastrar Contato</a>
<a href="consulta.jsp" class="btn btn-outline-primary m-1">Consultar Contatos</a>

<h2 class="mt-4">Gestão de Compromissos</h2>
<a href="cadastro_compromisso.jsp" class="btn btn-outline-success m-1">Cadastrar Compromisso</a>
<a href="CompromissoServlet" class="btn btn-outline-success m-1">Consultar Compromissos</a>



<hr>
</div>
</body>
</html>