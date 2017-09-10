<?php
require_once 'BD/MYSQL.php';

class UsuarioModel {
	private $bd;

	function __construct(){
		$this->bd = new MYSQL("localhostMYSQL"); 
	}

	public function entrar($usuario, $senha, $ativo = true){
		return $this->bd->query(
			"SELECT C.*, TC.* 
			FROM cliente AS C
			LEFT JOIN tel_cliente AS TC ON TC.idCliente = C.id_cliente
			WHERE C.email = \"{$usuario}\"
				AND C.senha = \"{$senha}\"
				AND C.ativo = {$ativo}"
		);
	}

	public function listarId($id){
		return $this->bd->query(
			"SELECT C.*, TC.* 
			FROM cliente AS C
			LEFT JOIN tel_cliente AS TC ON TC.idCliente = C.id_cliente
			WHERE C.id_cliente = {$id}"
		);
	}

	public function salvar($dados, $id = ""){
		if (!empty($id)) {
			return $this->bd->alterar(
				"cliente", $dados, array("id_cliente" => $id)
			);
		}

		return $this->bd->salvar(
			"cliente", $dados
		);
	}

	public function salvarContato($dados, $id = ""){
		if (!empty($id)) {
			return $this->bd->alterar(
				"tel_cliente", $dados, array("id" => $id)
			);
		}

		return $this->bd->salvar(
			"tel_cliente", $dados
		);
	}

	public function buscarPorCondicao($condicao){
		if (isset($condicao["email"]) && !empty($condicao["email"])) {
			$whereClause = " AND email = \"{$condicao["email"]}\"";
		}

		if (isset($condicao["cpfCnpj"]) && !empty($condicao["cpfCnpj"])) {
			$whereClause = " AND cpf = \"{$condicao["cpfCnpj"]}\"";
		}

		return $this->bd->query(
			"SELECT C.*
			FROM cliente AS C
			WHERE 0 = 0 ".$whereClause
		);
	}
}