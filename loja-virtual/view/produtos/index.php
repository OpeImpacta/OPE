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

			<div class="col-lg-5 col-md-5 col-sm-6 col-xs-12 pull-right">
				<div class="thumbnail">
					<div class="caption">
						<h3>
							R$ <?=number_format(($produto["dados"][0]["preco_compra"] + ($produto["dados"][0]["preco_compra"] * ($produto["dados"][0]["margem"] / 100))), 2, ",", ",");?>
						</h3>
						<?php if (!empty($produto["dados"][0]["compativel"])): ?>
							<p>
								<ul class="list-unstyled">
									<li><strong>Compatibilidade:</strong></li>
									<?php foreach ($produto["dados"][0]["compativel"] as $kCompativel => $vCompativel): ?>
										<li>
											<?=ucwords(strtolower($vCompativel["montadora"]));?> - 
											<?=ucwords(strtolower($vCompativel["modelo"]));?>
										</li>
									<?php endforeach ?>
								</ul>
							</p>
						<?php endif ?>
						<p>
							<label for="">Obs: </label> <br/>
							Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
							3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
						</p>
						<hr/>
						<div class="ratings">
							<p class="pull-right">
								<?php if (!empty($_SESSION["totalProduto"])): ?>
									<a href="<?=BASE_URL;?>acoes/carrinho.php?acao=remover&id=<?=$id;?>" class="btn btn-danger btn-sm">Remover</a>
								<?php endif; ?>

								<a href="<?=BASE_URL;?>acoes/carrinho.php?acao=adicionar&id=<?=$id;?>" class="btn btn-primary btn-sm">Adicionar</a>
							</p>
							<p><?=($produto["dados"][0]["quantidade"] > 0 ? "Produto em estoque" : "Produto esgotado");?></p>
						</div>
					</div>
				</div>
			</div>
		</div><br/>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									Descrição do Produto
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
								3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
								Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
								Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. 
								Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth 
								nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									Informações adicionais
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
								3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
								Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
								Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. 
								Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth 
								nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- /.col-md-10 -->
</div> <!-- /.row -->

<?php include "../../incs/rodape.php"; ?>