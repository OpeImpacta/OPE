<?php
	include "../config.php";

	if (isset($_SESSION["carrinho"])) {
		unset($_SESSION["carrinho"]);
	}

	if (isset($_SESSION["nomeProduto"])) {
		unset($_SESSION["nomeProduto"]);
	}

	if (isset($_SESSION["totalProduto"])) {
		unset($_SESSION["totalProduto"]);
	}

	include "../incs/cabecalho.php";
	include "../incs/menu_superior.php";
?>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h2>Pedido de Orçamento Concluído</h2><hr/>
	</div>

	<?php include "../incs/menu_lateral.php"; ?>
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<h1><?php echo "ORCAMENTO ENVIADO COM SUCESSO!"; ?></h1>
	</div> <!-- /.col-md-10 -->
</div> <!-- /.row -->

<?php include "../incs/rodape.php"; ?>