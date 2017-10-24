<?php 
	include "../../config.php";
	include "../../incs/cabecalho.php";
	include "../../incs/menu_superior.php";

	/** Paginação */
	$pagina = (isset($_GET['pg']) ? (int)$_GET['pg'] : 1);
	$url = "http://".$_SERVER["SERVER_NAME"] . $_SERVER["PHP_SELF"];

	$campoBusca = "";
	if (isset($_GET["campoBusca"])) {
		$campoBusca = strip_tags(addslashes($_GET["campoBusca"]));
	}

	$produtos = new Produto();
	$produto = $produtos->buscarProdutos($url, $pagina, $campoBusca);

	// echo "<pre>"; print_r($produto); echo "</pre>";
?>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h2>Resultado da busca</h2><hr/>
	</div>

	<?php include "../../incs/menu_lateral.php"; ?>

	<?php if (!empty($produto["dados"])): ?>
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			<?php foreach ($produto["dados"] as $key => $value): ?>
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 box-produto">
					<div class="thumbnail">
						<a href="<?=BASE_URL;?>view/produtos/index.php?id=<?=$value["id_produto"];?>">
							<img src="<?=BASE_URL;?>imagens/produtos/320x180.png" alt="">
							<!-- <img class="imgProduto" width="320" height="180" src="data:image;base64,<?=base64_encode($value["imagem"][0]["foto"]);?>" alt=""> -->
						</a>
						<div class="caption">
							<h4>
								<a href="<?=BASE_URL;?>view/produtos/index.php?id=<?=$value["id_produto"];?>">
									<?=ucwords(strtolower($value["nome"]));?>
								</a>
							</h4>
							<?php if (!empty($value["compativel"])): ?>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 box-compatibilidade">
									<ul class="list-unstyled">
										<li><strong>Compatibilidade:</strong></li>
										<?php foreach ($value["compativel"] as $kCompativel => $vCompativel): ?>
											<li>
												<?=ucwords(strtolower($vCompativel["montadora"]));?> -
												<?=ucwords(strtolower($vCompativel["modelo"]));?>
											</li>
										<?php endforeach ?>
									</ul>
								</div>
							<?php endif ?>

							<hr/>

							<div class="ratings">
								<p class="pull-right">
									<a href="<?=BASE_URL;?>acoes/carrinho.php?acao=adicionar&id=<?=$value["id_produto"];?>" class="btn btn-primary btn-sm">
										Adicionar
									</a>
								</p>
								<p><?=($value["quantidade"] > 0 ? "Produto em estoque" : "Produto esgotado");?></p>
							</div>
						</div>
					</div>
				</div>
			<?php endforeach; ?>
		</div> <!-- /.col-md-10 -->
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			<?php echo $produto["paginacao"]; ?>
		</div>
	<?php else: ?>
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			Sem produtos para a Categoria selecionada.
		</div>
	<?php endif; ?>
</div> <!-- /.row -->

<?php include "../../incs/rodape.php"; ?>
