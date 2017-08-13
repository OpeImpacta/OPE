<?php 
require_once "../config.php";

$id = strip_tags(addslashes($_GET["id"]));
$acao = strip_tags($_GET["acao"]);

$produtos = new Produto();
$produto = $produtos->listar("", 0, $id);

if (!empty($produto["dados"][0])) {
	$_SESSION["carrinho"][$id] = $produto["dados"][0];
	$_SESSION["nomeProduto"][$id] = $produto["dados"][0]["nome"];

	if (!isset($_SESSION["totalProduto"][$id])) {
		$_SESSION["totalProduto"][$id] = 0;
	}

	switch ($acao) {
		case "adicionar":
			$_SESSION["totalProduto"][$id]++;
		break;
		case "remover":
			if ($_SESSION["totalProduto"][$id] > 1) {
				$_SESSION["totalProduto"][$id]--;
			} else {
				unset($_SESSION["totalProduto"][$id]);
				unset($_SESSION["nomeProduto"][$id]);
				unset($_SESSION["carrinho"][$id]);
			}
		break;
		case "limpar":
			$_SESSION["totalProduto"][$id] = 0;
		break;
	}
}

header("Location:".$_SERVER["HTTP_REFERER"]);