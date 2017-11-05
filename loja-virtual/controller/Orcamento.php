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

		// echo "<pre>"; print_r($retorno); echo "</pre>"; exit;

		if (!empty($retorno)) {
			foreach ($retorno as $key => $value) {
				$dadosRetorno[$value["id_venda"]][] = $value;
			}

			return $dadosRetorno;
		}

		// echo "<pre>"; print_r($dadosRetorno); echo "</pre>"; exit;
		return $retorno;
	}

	public function salvar(){
		if ((isset($_SESSION["nomeProduto"]) && !empty($_SESSION["nomeProduto"])) && 
			(isset($_SESSION["totalProduto"]) && !empty($_SESSION["totalProduto"]))
		) {
			$salvarOrcamento = array(
				"id_cliente" => $_SESSION["id"],
				"tipo" => 2,
				"aprovado" => "0",
				"finalizado" => "0",
				"ativo" => 1,
				"data" => date("Y-m-d H:i:s")
			);

			$idOrcamento = $this->model->salvar($salvarOrcamento);

			if ($idOrcamento) {
				$total = 0;

				foreach ($_SESSION["carrinho"] as $key => $value) {
					$itemVenda = array(
						"id_produto" 	=> $value["id_produto"],
						"quantidade" 	=> $_SESSION["totalProduto"][$value["id_produto"]],
						"venda_id_venda" => $idOrcamento
					);

					if ($this->model->salvarItensVenda($itemVenda)) {
						$total++;
					}
				}

				if ($total == count($_SESSION["carrinho"])) {
					$_SESSION["orcamento_salvo"] = true;
					return true;
				}
			}
		}

		return false;
	}
}