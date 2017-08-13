<?php
/**
* 
*/
class Orcamento {
	private $model;
	private $utils;

	function __construct(){
		$this->model = new OrcamentoModel();
		$this->utils = new Utils();
	}

	public function listar($url = "", $pagina = 0, $id = ""){
		$dados = array();
		$retorno = $this->model->listar($id);

		if (!empty($retorno)) {
			foreach ($retorno as $key => $value) {
				$dados[$value["nr_pedido"]][] = $value;
			}
		}

		return $dados;
	}

	public function salvar(){
		if ((isset($_SESSION["nomeProduto"]) && !empty($_SESSION["nomeProduto"])) && 
			(isset($_SESSION["totalProduto"]) && !empty($_SESSION["totalProduto"]))
		) {
			$salvar = array(
				"nr_pedido" => time(),
				"id_cliente" => $_SESSION["id"]
			);

			$idOrcamento = $this->model->salvar($salvar);

			if ($idOrcamento) {
				$modelProduto = new ProdutoModel();
				$total = 0;

				foreach ($_SESSION["carrinho"] as $key => $value) {
					$salvarProduto = array(
						"valor" => $value["preco_compra"] + ($value["preco_compra"] * ($value["margem"] / 100)),
						"id_produto" 	=> $value["id_produto"],
						"id_orcamento" 	=> $idOrcamento,
						"quantidade" 	=> $_SESSION["totalProduto"][$value["id_produto"]]
					);

					$total += $modelProduto->salvarOrcamento($salvarProduto);
				}

				if ($total == count($_SESSION["carrinho"])) {
					return true;
				}
			}
		}

		return false;
	}
}