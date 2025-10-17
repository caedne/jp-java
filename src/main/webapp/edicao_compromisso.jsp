<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "modelos.Compromisso"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Compromisso</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>
	<%
	Compromisso cp = (Compromisso) request.getAttribute("compromisso");
	%>

	<div class="container">
		<h2 class="text-center m-4 text-warning">Editar Compromisso</h2>
		<form action="CompromissoServlet?acao=alterar" method="post" >
		
		    <input type="hidden" name="id"	value="<%out.print(cp.getId());%>" />
				
				<label class="form-label">Descrição</label>
		    	 <input class="form-control" type="text"
				value="<%out.print(cp.getDescricao());%>" placeholder="Ex: Reunião"
				name="descricao" required="required" /> 
				
				<div class="row">
				    <div class="col-md-6">
				        <label class="form-label mt-2">Data</label>
				        <input class="form-control" type="date" name="data"
				        value="<%out.print(cp.getData());%>" required="required">
				    </div>
				    <div class="col-md-6">
				        <label class="form-label mt-2">Hora</label>
				        <input class="form-control" type="time" name="hora"
				        value="<%out.print(cp.getHora());%>" required="required">
				    </div>
				</div>
				
				<label class="form-label mt-2">Local</label>
				<input class="form-control" type="text"
				value="<%out.print(cp.getLocal());%>" placeholder="Ex: Sala 301"
				name="local" required="required" />
				
				<label class="form-label mt-2">Contato Envolvido</label>
				<input class="form-control" type="text"
				value="<%out.print(cp.getContato());%>" placeholder="Ex: Carlos"
				name="contato" required="required" />

				<label class="form-label mt-2">Status</label>
				<select class="form-select" name="status" required="required">
				    <option value="Agendado" <%= cp.getStatus().equals("Agendado") ? "selected" : "" %>>Agendado</option>
				    <option value="Em Andamento" <%= cp.getStatus().equals("Em Andamento") ? "selected" : "" %>>Em Andamento</option>
				    <option value="Concluído" <%= cp.getStatus().equals("Concluído") ? "selected" : "" %>>Concluído</option>
				    <option value="Cancelado" <%= cp.getStatus().equals("Cancelado") ? "selected" : "" %>>Cancelado</option>
				</select>
			    
			<button class="btn btn-success mt-3 me-2">Salvar Alterações</button>
			
			<a href='CompromissoServlet?acao=excluir&id=<%out.print(cp.getId());%>' 
			   class='btn btn-danger mt-3' 
			   onclick='return confirm("Tem certeza que deseja excluir o compromisso: " + "<%out.print(cp.getDescricao());%>" + "?");'>
			   Excluir Compromisso
			</a>
			
		</form>
		
		<hr>
		<a href="CompromissoServlet" class="btn btn-secondary mt-2">Voltar para a Lista</a>
	</div>

</body>
</html>