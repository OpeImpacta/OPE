<?php
require_once 'BD/MYSQL.php';

class ConfiguracaoSistemaModel {
	private $bd;

	function __construct(){
		$this->bd = new MYSQL("localhostMYSQL"); 
	}

	public function listarMenuLateral(){
		return $this->bd->buscar("categoria", array("ativo = " => 1), "", "", "", "nome asc");
	}
}