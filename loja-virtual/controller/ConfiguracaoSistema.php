<?php

class ConfiguracaoSistema {
	private $model;
	private $utils;

	function __construct(){
		$this->model = new ConfiguracaoSistemaModel();
		$this->utils = new Utils();
	}

	public function listarMenuLateral(){
		return $this->model->listarMenuLateral();
	}
}