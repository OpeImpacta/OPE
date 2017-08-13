<?php
require_once 'BD/MYSQL.php';

class OrcamentoModel {
	private $bd;

	function __construct(){
		$this->bd = new MYSQL("localhostMYSQL"); 
	}

	public function listar($id = ""){
		$condicao = "";

		if (!empty($id)) {
			$condicao = " AND p.id_produto = ".$id;
		}

		return $this->bd->query(
			"SELECT p.*, o.*, po.*,
				m.nome AS modelo,
				(SELECT c.nome FROM categoria c WHERE c.id_categoria = p.id_categoria) AS categoria,
				(SELECT i.foto FROM imagem i WHERE i.id_imagem = p.id_imagem) AS imagem,
				(SELECT mt.nome FROM montadora mt WHERE mt.id_montadora = m.id_montadora) AS montadora
			FROM orcamento o,
				produto_orcamento po,
				produto p,
				produto_modelo pm,
				modelo m
			WHERE po.id_orcamento 	= o.id
				AND po.id_produto 	= p.id_produto
				AND m.id_modelo 	= pm.id_modelo
				AND p.id_produto 	= pm.id_produto
			"
		);
	}

	public function salvar($dados, $id = ""){
		if (!empty($id)) {
			return $this->bd->alterar("orcamento", $dados, array("id" => $id));
		}

		return $this->bd->salvar("orcamento", $dados);
	}
}