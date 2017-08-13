<?php 
require "../config.php";

if(isset($_POST)){

	$dados = new Login();
	$send = $dados->recuperarSenha( strip_tags($_POST["nm_email"]) );

	if( $send ){
		$_SESSION['msg_tipo'] = 'Sucesso';
		$_SESSION['msg'] = 'Dados de acesso enviados ao e-mail informado!';
	} else{
		$_SESSION['msg_tipo'] = 'Erro';
		$_SESSION['msg'] = 'Ocorreu um erro ao enviar o email!';
	}
}

header("Location:".$_SERVER["HTTP_REFERER"]);