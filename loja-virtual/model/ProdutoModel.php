<?php
require_once 'BD/MYSQL.php';

class ProdutoModel {
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
			"SELECT p.*,
				m.nome AS modelo,
				(SELECT c.nome FROM categoria c WHERE c.id_categoria = p.id_categoria) AS categoria,
				(SELECT i.foto FROM imagem i WHERE i.id_imagem = p.id_imagem) AS imagem,
				(SELECT mt.nome FROM montadora mt WHERE mt.id_montadora = m.id_montadora) AS montadora
			FROM produto p,
				produto_modelo pm,
				modelo m
			WHERE m.id_modelo = pm.id_modelo
				AND p.id_produto = pm.id_produto
				AND p.ativo = 1
				AND p.mostra_vitrine = 1" . $condicao
		);
	}

	public function listarPorCategoria($categoria){
		return $this->bd->query(
			"SELECT p.*,
				m.nome AS modelo,
				(SELECT c.nome FROM categoria c WHERE c.id_categoria = p.id_categoria) AS categoria,
				(SELECT i.foto FROM imagem i WHERE i.id_imagem = p.id_imagem) AS imagem,
				(SELECT mt.nome FROM montadora mt WHERE mt.id_montadora = m.id_montadora) AS montadora
			FROM produto p, 
				produto_modelo pm, 
				modelo m 
			WHERE m.id_modelo = pm.id_modelo 
				AND p.id_produto = pm.id_produto
				AND p.ativo = 1
				AND p.mostra_vitrine = 1
				AND p.id_categoria = ".$categoria
		);
	}

	public function salvarOrcamento($dados, $id = ""){
		if (!empty($id)) {
			return $this->bd->alterar("produto_orcamento", $dados, array("id_produto" => $id));
		}

		return $this->bd->salvar("produto_orcamento", $dados);
	}
}