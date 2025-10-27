<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, modelos.Contato, modelos.Compromisso"%>
<%
	
	Compromisso cpErro = (Compromisso) request.getAttribute("compromissoComErro");
	
	
	String descricaoVal = (cpErro != null) ? cpErro.getDescricao() : "";
	String dataVal = (cpErro != null) ? cpErro.getData() : "";
	String horaVal = (cpErro != null) ? cpErro.getHora() : "";
	String localVal = (cpErro != null) ? cpErro.getLocal() : "";
	String contatoVal = (cpErro != null) ? cpErro.getContato() : "";
	

	String erroDescricao = (String) request.getAttribute("erroDescricao");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Novo Compromisso</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
		      rel="stylesheet" 
	          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" 
	          crossorigin="anonymous">
<style>
	body { background-color: #f8f9fa; }
</style>
</head>
<body <%= (erroDescricao != null) ? "onload='mostrarErro()'" : "" %>>

	<script>
		function mostrarErro() {
			alert("<% out.print(erroDescricao); %>");
			'
			var campoDescricao = document.forms[0].descricao;
			campoDescricao.focus();
			campoDescricao.select();
		}
	</script>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="card shadow-sm mt-5">
					<div class="card-body p-5">
						<h2 class="text-center text-success mb-4">Novo Compromisso</h2>
						
						<form action="CompromissoServlet" method="post">

							<div class="mb-3">
								<label class="form-label">Descrição</label>
								<textarea class="form-control" name="descricao" rows="3" placeholder="Ex: Reunião com Cliente para fechar contrato..." 
										  required="required"><% out.print(descricaoVal); %></textarea>
							</div>

							<div class="row mb-3">
								<div class="col-md-6">
									<label class="form-label">Data</label>
									<input class="form-control" type="date" name="data" 
										   value="<% out.print(dataVal); %>" required="required">
								</div>
								<div class="col-md-6">
									<label class="form-label">Hora</label>
									<input class="form-control" type="time" name="hora" 
										   value="<% out.print(horaVal); %>" required="required">
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label">Local</label>
								<input class="form-control" type="text" placeholder="Ex: Sala 301" name="local" 
									   value="<% out.print(localVal); %>" required="required" />
							</div>

							<div class="mb-3">
								<label class="form-label">Contato Envolvido</label>
								<select class="form-select" name="contato" required="required"
										onchange="if (this.value === '__addNew__') { window.location.href = 'cadastro.jsp'; }">
										
									<option value="" selected disabled>-- Selecione um contato --</option>
									<% 
									List<Contato> contatos = (List<Contato>) request.getAttribute("contatos");
									if (contatos != null && !contatos.isEmpty()) { 
										for (Contato ct : contatos) {
											
											String selected = ct.getNome().equals(contatoVal) ? "selected" : "";
											out.print("<option value='" + ct.getNome() + "' " + selected + ">" + ct.getNome() + "</option>");
										}
									} else {
										out.print("<option value='' disabled>Nenhum contato encontrado</option>");
									}
									%>
									<option value="" disabled style="border-top: 1px solid #ccc;">──────────────────────────</option>
									<option value="__addNew__" style="font-style: italic; color: #0d6efd;">
										+ Adicionar Novo Contato...
									</option>
								</select>
							</div>

							<button class="btn btn-success w-100 mt-3">Salvar Compromisso</button>
						</form>
					</div>
				</div>
				<div class="text-center mt-3">
					<a href="CompromissoServlet" class="btn btn-secondary">Ir para a Lista de Compromissos</a>
					<a href="index.jsp" class="btn btn-secondary">Voltar para Home</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>