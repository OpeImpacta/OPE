<?php
require_once "../config.php";

$_SESSION['msg_tipo'] = 'Erro';
$_SESSION['msg'] = 'Ocorreu um erro ao alterar os dados.';

if(isset($_POST) && !empty($_POST['class']) && !empty($_POST['method']) && !empty($_POST['path'])){
	$utils = new Utils();
	$dadosPost = $utils->validarDados($_POST);

	$class = base64_decode($dadosPost['class']);
	$method = base64_decode($dadosPost["method"]);
	$path = base64_decode($dadosPost['path']);

	unset($dadosPost['class']);
	unset($dadosPost["method"]);
	unset($dadosPost['path']);

	$dados = new $class();
	$retorno = $dados->$method($dadosPost);

	if($retorno){
		$_SESSION['msg_tipo'] = 'Sucesso';
		$_SESSION['msg'] = $class.' alterado!';
	}
}

header("Location:".BASE_URL.$path);