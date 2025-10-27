<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="modelos.Compromisso, java.util.List, modelos.Contato"%>
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
<style>
body {
	background-color: #f8f9fa;
}
</style>
</head>
<body>
	<%
	Compromisso cp = (Compromisso) request.getAttribute("compromisso");
	%>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">

				<div class="card shadow-sm mt-5">
					<div class="card-body p-5">

						<h2 class="text-center text-success mb-4">Editar Compromisso</h2>

						<form action="CompromissoServlet?acao=alterar" method="post">

							<input type="hidden" name="id" value="<%out.print(cp.getId());%>" />

							<div class="mb-3">
								<label class="form-label">Descrição</label>
								<textarea class="form-control" name="descricao" rows="3"
									placeholder="Ex: Reunião com Cliente..." required="required">
									<%
									out.print(cp.getDescricao());
									%>
								</textarea>
							</div>

							<div class="row mb-3">
								<div class="col-md-6">
									<label class="form-label">Data</label> <input
										class="form-control" type="date" name="data"
										value="<%out.print(cp.getData());%>" required="required">
								</div>
								<div class="col-md-6">
									<label class="form-label">Hora</label> <input
										class="form-control" type="time" name="hora"
										value="<%out.print(cp.getHora());%>" required="required">
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label">Local</label> <input
									class="form-control" type="text"
									value="<%out.print(cp.getLocal());%>"
									placeholder="Ex: Sala 301" name="local" required="required" />
							</div>

							<div class="mb-3">
								<label class="form-label">Contato Envolvido</label> <select
									class="form-select" name="contato" required="required"
									onchange="if (this.value === '__addNew__') { window.location.href = 'cadastro.jsp'; }">

									<option value="" disabled>-- Selecione um contato --</option>
									<%
									List<Contato> contatos = (List<Contato>) request.getAttribute("contatos");
									if (contatos != null) {
										for (Contato ct : contatos) {
											String selected = ct.getNome().equals(cp.getContato()) ? "selected" : "";
											out.print("<option value='" + ct.getNome() + "' " + selected + ">" + ct.getNome() + "</option>");
										}
									}
									%>
									<option value="" disabled style="border-top: 1px solid #ccc;">──────────────────────────</option>
									<option value="__addNew__"
										style="font-style: italic; color: #0d6efd;">+
										Adicionar Novo Contato...</option>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Status</label> <select
									class="form-select" name="status" required="required">
									<option value="Agendado"
										<%=cp.getStatus().equals("Agendado") ? "selected" : ""%>>Agendado</option>
									<option value="Em Andamento"
										<%=cp.getStatus().equals("Em Andamento") ? "selected" : ""%>>Em
										Andamento</option>
									<option value="Concluído"
										<%=cp.getStatus().equals("Concluído") ? "selected" : ""%>>Concluído</option>
									<option value="Cancelado"
										<%=cp.getStatus().equals("Cancelado") ? "selected" : ""%>>Cancelado</option>
								</select>
							</div>

							<div class="d-grid gap-2 mt-4">
								<button class="btn btn-success">Salvar Alterações</button>

								<a
									href='CompromissoServlet?acao=excluir&id=<%out.print(cp.getId());%>'
									class='btn btn-outline-danger'
									onclick='return confirm("Tem certeza que deseja excluir o compromisso: " + "<%out.print(cp.getDescricao());%>" + "?");'>
									Excluir Compromisso </a>
							</div>

						</form>
					</div>
				</div>

				<div class="text-center mt-3">
					<a href="CompromissoServlet" class="btn btn-secondary">Ir para
						a Lista de Compromissos</a> <a href="index.jsp"
						class="btn btn-secondary">Voltar para Home</a>
				</div>

			</div>
		</div>
	</div>
</body>
</html>