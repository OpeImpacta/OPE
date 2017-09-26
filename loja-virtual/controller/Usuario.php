<?php
/**
*
*/
class Usuario {
	private $model;
	private $utils;

	function __construct(){
		$this->model = new UsuarioModel();
		$this->utils = new Utils();
	}

	public function entrar($usuario, $senha){
		return $this->model->entrar(
			$usuario, $senha
		);
	}

	public function recuperarSenha(){

	}

	public function listarId($id){
		return $this->model->listarId(
			$this->utils->validarDados($id)
		);
	}

	public function salvar($dados){
		if ($dados["senha"] != $dados["confirmacaoSenha"]) {
			$_SESSION['msg_tipo'] = 'Erro';
			$_SESSION['msg'] = 'Senhas não conferem.';

			return false;
			exit;
		}

		$cpfCnpj = preg_replace("/[^0-9]/", "", $dados["cpfCnpj"]);
		if (strlen($cpfCnpj) > 11) {
			$valida = $this->utils->validarCnpj($cpfCnpj);
			$tipo = 2; // Juridica
		} else {
			$valida = $this->utils->validarCPF($cpfCnpj);
			$tipo = 1; // Fisica
		}

		if ($valida === false) {
			$_SESSION['msg_tipo'] = 'Erro';
			$_SESSION['msg'] = 'CPF / CNPJ Inválido.';

			return false;
			exit;
		}

		if ($this->model->buscarPorCondicao(array("cpfCnpj" => $dados["cpfCnpj"]))) {
			if ($this->model->buscarPorCondicao(array("email" => $dados["email"]))) {
				$_SESSION['msg_tipo'] = 'Erro';
				$_SESSION['msg'] = 'E-mail em uso por outro usuário.';

				return false;
				exit;
			}

			$_SESSION['msg_tipo'] = 'Erro';
			$_SESSION['msg'] = 'CPF / CNPJ em uso por outro usuário.';

			return false;
			exit;
		}

		$salvar = array(
			"nome" 	=> $dados["nome"],
			"email" => $dados["email"],
			"senha" => $dados["senha"],
			"cpf" 	=> $dados["cpfCnpj"],
			"tipo"	=> $tipo,
			"ativo" => 1
		);

		if (!empty($dados["codigo"])) {
			return $this->model->salvar($salvar, $dados["codigo"]);
		}

		$idCliente = $this->model->salvar($salvar);

		if ($idCliente && $dados["telefone"]) {
			$salvarContato = array(
				"numero" 	=> $dados["telefone"],
				"idCliente" => $idCliente,
				"tipo" 		=> 1
			);

			$idContato = $this->model->salvarContato($salvarContato);

			if ($idContato) {
				$_SESSION["auth"] 	= true;
				$_SESSION["id"] 	= $idCliente;
				$_SESSION["email"] 	= $dados["email"];
				$_SESSION["nome"] 	= $dados["nome"];
				$_SESSION["cpf"] 	= $dados["cpf"];
				$_SESSION["telefone"] = $dados["telefone"];

				header('Location: '.BASE_URL.'admin/view/orcamentos/index.php');
			}
		}
	}
}
