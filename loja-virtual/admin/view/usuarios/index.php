<?php 
	require "../../../config.php";
	include "../../../incs/cabecalho.php";
	include "../../../incs/menu_superior.php";

	$dados = array(
		0 => array(
			"id" 	=> "",
			"nome" 	=> "",
			"email" => "",
			"cpf" => "",
			"numero" => ""
		)
	);

	$btnAcao = "Cadastrar";
	$tituloPagina = "Novo Cadastro";

	if (isset($_GET["id"]) && !empty($_GET["id"])) {
		$usuarios = new Usuario();
		$dados = $usuarios->listarId($_GET["id"]);
		$btnAcao = "Confirmar Alterações";
		$tituloPagina = "Atualizar Cadastro";
	}
?>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h2><?=$tituloPagina;?></h2><hr/>
	</div>

	<?php include "../../../incs/menu_lateral.php"; ?>
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<h5 class="bold">* Campos Obrigatórios</h5>

		<div class="alert alert-danger alert-dismissible hide alert-form" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>Atenção!</strong> Preencha todos os campos obrigatórios do formulário.
		</div>

		<?php if ( isset($_SESSION['msg_tipo']) && isset($_SESSION['msg']) ): ?>
			<div class="alert alert-<?=($_SESSION['msg_tipo'] == "Erro" ? "danger" : "success");?> alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong><?=$_SESSION['msg_tipo'];?></strong> <?=$_SESSION['msg'];?>
			</div>
			<?php unset($_SESSION['msg_tipo']); unset($_SESSION['msg']); ?>
		<?php endif; ?>

		<form action="<?=BASE_URL;?>acoes/rota.php" method="POST">
			<div class="row form-group">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<label for="nome">* NOME: </label>
					<input type="text" name="nome" id="nome" class="form-control obrigatorio" value="<?=$dados[0]["nome"];?>" />
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<label for="cpfCnpj">* CPF / CNPJ: </label>
					<input type="text" name="cpfCnpj" id="cpfCnpj" class="form-control obrigatorio cpfCnpj" value="<?=$dados[0]["cpf"];?>" />
				</div>
			</div>
			<div class="row form-group">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<label for="email">* EMAIL: </label>
					<input type="text" name="email" id="email" class="form-control obrigatorio" value="<?=$dados[0]["email"];?>" />
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<label for="telefone">* TELEFONE: </label>
					<input type="text" name="telefone" id="telefone" class="form-control obrigatorio tel" value="<?=$dados[0]["numero"];?>" />
				</div>
			</div>
			<div class="row form-group">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<label for="senha">* SENHA: </label>
					<input type="password" name="senha" id="senha" class="form-control obrigatorio" />
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<label for="confirmacaoSenha">* CONFIRME A SENHA: </label>
					<input type="password" name="confirmacaoSenha" id="confirmacaoSenha" class="form-control obrigatorio" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<input type="hidden" name="class" value="<?=base64_encode("Usuario");?>">
					<input type="hidden" name="method" value="<?=base64_encode("salvar");?>">
					<input type="hidden" name="path" value="<?=base64_encode("admin/view/usuarios/index.php?id=".$dados[0]["id"]);?>">
					<input type="hidden" name="codigo" value="<?=$dados[0]["id"];?>">

					<input type="submit" class="btn btn-primary btn-sm pull-right" value="<?=$btnAcao;?>" />
				</div>
			</div>
		</form>
	</div> <!-- /.col-md-10 -->
</div> <!-- /.row -->

<?php include "../../../incs/rodape.php"; ?>