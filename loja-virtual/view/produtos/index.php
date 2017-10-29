<?php 
	include "../../config.php";
	include "../../incs/cabecalho.php";
	include "../../incs/menu_superior.php";

	/** Paginação */
	$pagina = (isset($_GET['pg']) ? (int)$_GET['pg'] : 1);
	$url = "http://".$_SERVER["SERVER_NAME"] . $_SERVER["PHP_SELF"];

	$id = "";
	if (isset($_GET["id"])) {
		$id = strip_tags(addslashes($_GET["id"]));
	}

	$produtos = new Produto();
	$produto = $produtos->listar($url, $pagina, $id);

	// echo "<pre>"; print_r($produto); echo "</pre>";
?>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h2><?=ucwords(strtolower($produto["dados"][0]["nome"]));?></h2><hr/>
	</div>

	<?php include "../../incs/menu_lateral.php"; ?>

	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<div class="row">
			<div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<!-- <img src="http://placehold.it/620x350" alt=""> -->
							<img src="<?=BASE_URL;?>imagens/produtos/620x350.png" alt="">
							<div class="carousel-caption">
								<h3>Imagem 1</h3>
							</div>
						</div>
						<div class="item">
							<!-- <img src="http://placehold.it/620x350" alt=""> -->
							<img src="<?=BASE_URL;?>imagens/produtos/620x350.png" alt="">
							<div class="carousel-caption">
								<h3>Imagem 2</h3>
							</div>
						</div>
						<div class="item">
							<!-- <img src="http://placehold.it/620x350" alt=""> -->
							<img src="<?=BASE_URL;?>imagens/produtos/620x350.png" alt="">
							<div class="carousel-caption">
								<h3>Imagem 3</h3>
							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>

			<div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
				<div class="panel panel-primary">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							Descrição do Produto
						</h4>
					</div>
					<div class="panel-body">
						<div class="row">
							<?php if (!empty($produto["dados"][0]["compativel"])): ?>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-group">
									<strong>Compatibilidade:</strong>
									<?php foreach ($produto["dados"][0]["compativel"] as $kCompativel => $vCompativel): ?>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											- <strong>Montadora:</strong> <?=ucwords(strtolower($vCompativel["montadora"]));?> / 
											<strong>Modelo:</strong> <?=ucwords(strtolower($vCompativel["modelo"]));?>
										</div>
									<?php endforeach ?>
								</div>
							<?php endif ?>

							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 form-group">
								<?=$produto["dados"][0]["descricao"];?>
								<hr/>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 form-group">
								<?=($produto["dados"][0]["quantidade"] > 0 ? "Produto em estoque" : "Produto esgotado");?>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 form-group">
								<?php if (!empty($_SESSION["totalProduto"])): ?>
									<a href="<?=BASE_URL;?>acoes/carrinho.php?acao=remover&id=<?=$id;?>" class="btn btn-danger btn-sm">Remover</a>
								<?php endif; ?>
<?php
	$classeBtn = "disabled";
	if ($produto["dados"][0]["quantidade"] > 0) {
		$classeBtn = "";
	}
?>
								<a href="<?=BASE_URL;?>acoes/carrinho.php?acao=adicionar&id=<?=$id;?>" class="btn btn-primary btn-sm <?=$classeBtn;?>">Adicionar</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <br/>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="panel panel-primary">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							Informações adicionais
						</h4>
					</div>
					<div class="panel-body">
						Informações gerais aplicáveis aos produtos <br/>
						Informações gerais aplicáveis aos produtos <br/>
						Informações gerais aplicáveis aos produtos <br/>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- /.col-md-10 -->
</div> <!-- /.row -->

<?php include "../../incs/rodape.php"; ?>