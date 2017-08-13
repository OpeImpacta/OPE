<?php
require "../config.php";

$retorno['sucesso'] = false;
$retorno['msg'] = 'Erro: Ocorreu um erro ao recuperar os dados.';

if(isset($_POST) && !empty($_POST['class']) && !empty($_POST['method'])){
	$class = strip_tags($_POST['class']);
	$method = strip_tags($_POST['method']);

	$dados = new $class();

	if (isset($_POST["id"]) && !empty($_POST["id"])) {
		$busca = $dados->$method($_POST["id"]);
	} else {
		$busca = $dados->$method($_POST);
	}

	if ($busca) {
		$retorno['sucesso'] = true;
		$retorno['dados'] = $busca;
		$retorno['msg'] = 'Sucesso!';
	}
}

echo json_encode($retorno);