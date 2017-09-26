<?php 
session_start();

$httpServer = "http://".$_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"]."/";
$rootPath = realpath($_SERVER["DOCUMENT_ROOT"]);

if ($_SERVER["SERVER_NAME"] == "localhost") {
	$httpServer.= "projetos/loja-virtual/";
	$rootPath.= "/projetos/loja-virtual/";
}

define('REALPATH', $rootPath);
define('_DS', DIRECTORY_SEPARATOR);
define('BASE_URL', $httpServer);


// FUNÇÃO DE AUTOLOAD DE CLASSES
function myAutoload($classe){
	global $rootPath;

	if (file_exists($rootPath."model"._DS.$classe.".php")) {
		include_once $rootPath."model"._DS.$classe.".php";
	} 
	
	if (file_exists($rootPath."controller"._DS.$classe.".php")) {
		include_once $rootPath."controller"._DS.$classe.".php";
	} 
	
	if (file_exists($rootPath."model"._DS.$classe.".php") && 
		file_exists($rootPath."controller"._DS.$classe.".php")
	) {
		die("Classe ".$classe." não localizada!");
	}
}

spl_autoload_register("myAutoload");