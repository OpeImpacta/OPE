<?php 
require_once "../config.php";

if ((isset($_POST["login"]) && !empty($_POST["login"])) && 
	(isset($_POST["senha"]) && !empty($_POST["senha"]))
) {
	$utils = new Utils();
	$dadosPost = $utils->validarDados($_POST);

	$usuario = new Usuario();
	$dados = $usuario->entrar(
		trim($dadosPost["login"]),
		trim($dadosPost["senha"])
	);

	if (!empty($dados)) {
		$_SESSION["auth"] 	= true;
		$_SESSION["id"] 	= $dados[0]["id_cliente"];
		$_SESSION["email"] 	= $dados[0]["email"];
		$_SESSION["nome"] 	= $dados[0]["nome"];
		$_SESSION["cpf"] 	= $dados[0]["cpf"];

		// print_r($_SESSION);exit();

		if (isset($_SESSION["carrinho"])){
			header('Location: '.BASE_URL.'/view/produtos/carrinho.php');
			exit;
		}

		header('Location: '.BASE_URL.'admin/view/orcamentos/index.php');
		exit;
	}

	$_SESSION['msg_tipo'] = 'Erro';
	$_SESSION['msg'] = 'Login ou senha inválido!';

	header('Location: '.BASE_URL.'admin/view/index.php');
	exit;
}

$_SESSION['msg_tipo'] = 'Erro';
$_SESSION['msg'] = 'Preencha os campos de Email e Senha corretamente!';

header('Location: '.BASE_URL.'admin/view/index.php');
exit;