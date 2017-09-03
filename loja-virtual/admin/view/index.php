<?php
	require_once "../../config.php";

	if (isset($_SESSION["auth"]) && $_SESSION["auth"]) {
		header('Location: '.BASE_URL.'admin/view/orcamentos/index.php');
	}

	include_once "../../incs/cabecalho.php";
	include_once "../../incs/menu_superior.php";
?>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h2>Acessar Área Restrita</h2><hr/>
	</div>

	<?php include "../../incs/menu_lateral.php"; ?>
	<div class="col-lg-5 col-md-5 col-sm-5 col-xs-9 login col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-1">
		<h3>
			<u>Solicitar Orçamento</u> <br />
			Faça Login Para Finalizar<hr/>
		</h3>

		<?php if ( isset($_SESSION['msg_tipo']) && isset($_SESSION['msg']) ): ?>
			<div class="alert alert-<?=($_SESSION['msg_tipo'] == "Erro" ? "danger" : "success");?> alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong><?=$_SESSION['msg_tipo'];?>:</strong> <?=$_SESSION['msg'];?>
			</div>
			<?php unset($_SESSION['msg_tipo']); unset($_SESSION['msg']); ?>
		<?php endif; ?>

		<form class="login-inner" action="<?=BASE_URL;?>acoes/entrar.php" method="POST">
			<input type="email" class="form-control email" id="email-input" placeholder="Digite Seu Email" name="login" />
			<input type="password" class="form-control password" id="password-input" placeholder="Digite Sua Senha" name="senha" />
			<input class="btn btn-block btn-lg btn-primary submit" type="submit" value="Entrar" />
		</form>

		<a href="<?=BASE_URL;?>admin/view/usuarios/index.php" class="btn btn-sm btn-default">Criar conta</a>
		<a href="#" class="btn btn-sm btn-default forgot">Esqueceu a senha?</a>
	</div>
</div>

<?php include_once "../../incs/rodape.php"; ?>