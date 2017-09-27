<?php

class Produto {
	private $model;
	private $utils;

	function __construct(){
		$this->model = new ProdutoModel();
		$this->utils = new Utils();
	}

	public function listar($url = "", $pagina = 0, $id = ""){
		$dados = array();
		$dados["dados"] = $this->model->listar($id);

		if (!empty($dados["dados"])) {
			foreach ($dados["dados"] as $key => $value) {
				$dados["dados"][$key]["compativel"] = $this->model->listarPorMontadora($value["id_produto"]);
				$dados["dados"][$key]["imagem"] = $this->model->listarImagem($value["id_produto"]);
			}

			/** Paginação */
			if (!empty($url)) {
				$inicio = 1;
				$limite = 12;
				$totalPorPagina = 12;

				if ($pagina > 1) {
					$limite = $pagina * $limite;
					$inicio = $limite - ($totalPorPagina - 1);
				}

				$dados["paginacao"] = $this->utils->paginacao($url, $inicio, count($dados["dados"]), $limite);
			}
		}

		return $dados;
	}

	public function listarPorCategoria($url = "", $pagina = 0, $categoria){
		$dados = array();
		$dados["dados"] = $this->model->listarPorCategoria($categoria);

		if (!empty($dados["dados"])) {
			foreach ($dados["dados"] as $key => $value) {
				$dados["dados"][$key]["compativel"] = $this->model->listarPorMontadora($value["id_produto"]);
				$dados["dados"][$key]["imagem"] = $this->model->listarImagem($value["id_produto"]);
			}

			/** Paginação */
			if (!empty($url)) {
				$inicio = 1;
				$limite = 12;
				$totalPorPagina = 12;

				if ($pagina > 1) {
					$limite = $pagina * $limite;
					$inicio = $limite - ($totalPorPagina - 1);
				}

				$dados["paginacao"] = $this->utils->paginacao($url, $inicio, count($dados["dados"]), $limite);
			}
		}

		return $dados;
	}
}