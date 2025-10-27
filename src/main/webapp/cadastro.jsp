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
<style>
	body { background-color: #f8f9fa; }
</style>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				
				<div class="card shadow-sm mt-5">
					<div class="card-body p-5">

						<h2 class="text-center text-primary mb-4">Novo Contato</h2>
						
						<form action="ContatoServlet" method="post">
							<div class="mb-3">
								<label class="form-label">Nome Completo</label>
								<input class="form-control" type="text" name="nome" 
									   placeholder="Ex: Carlos Eduardo Neves" required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Telefone</label>
								<input class="form-control" type="tel" name="telefone" 
									   placeholder="Ex: (47) 99999-8888">
							</div>
							
							<div class="mb-3">
								<label class="form-label">E-mail</label>
								<input class="form-control" type="email" name="email" 
									   placeholder="Ex: carlos.neves@email.com">
							</div>

							<div class="mb-3">
								<label class="form-label">Empresa (Opcional)</label>
								<input class="form-control" type="text" name="empresa" 
									   placeholder="Ex: Neves Soluções Tech">
							</div>

							<button class="btn btn-primary w-100 mt-3">Salvar Contato</button>
						</form>
						
					</div>
				</div>
				
				<div class="text-center mt-3">
					<a href="ContatoServlet" class="btn btn-secondary">Ir para a Lista de Contatos</a>
					<a href="index.jsp" class="btn btn-secondary">Voltar para Home</a>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>