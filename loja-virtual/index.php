<?php 
	include "config.php";
	include "incs/cabecalho.php";
	include "incs/menu_superior.php";

	/** Paginação */
	$pagina = (isset($_GET['pg']) ? (int)$_GET['pg'] : 1);
	$url = "http://".$_SERVER["SERVER_NAME"] . $_SERVER["PHP_SELF"];

	$produto = new Produto();
	$produtos = $produto->listar($url, $pagina);

	// echo "<pre>"; print_r($produtos); echo "</pre>";
?>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-8 form-group"></div>
		<div class="col-md-3 form-group">
			<input type="text" name="" class="form-control input-sm" placeholder="Buscar">
		</div>
		<div class="col-md-1 form-group">
			<a href="#" class="btn btn-default btn-sm">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span> Buscar
			</a>
		</div>
	</div>

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h2>Produtos em destaque</h2>
		<hr/>
	</div>

	<?php include "incs/menu_lateral.php"; ?>

	<?php if (!empty($produtos["dados"])): ?>
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			<?php foreach ($produtos["dados"] as $key => $value): ?>
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 box-produto">
					<div class="thumbnail">
						<a href="<?=BASE_URL;?>view/produtos/index.php?id=<?=$value["id_produto"];?>">
							<!-- <img src="<?=$value["imagem"]?>" alt=""> -->
							<!-- <img src="http://placehold.it/320x180" alt=""> -->
							<img src="<?=BASE_URL;?>imagens/produtos/320x180.png" alt="">
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
							<h4>
								R$ <?=number_format(($value["preco_compra"] + ($value["preco_compra"] * ($value["margem"] / 100))), 2, ",", ",");?>
							</h4>
							<hr/>
							<div class="ratings">
								<?php
									$status =  "Produto esgotado";
									$url = "#";
									$classeBtn = "disabled";

									if ($value["quantidade"] > 0) {
										$status = "Produto em estoque";
										$url = BASE_URL."acoes/carrinho.php?acao=adicionar&id=".$value["id_produto"];
										$classeBtn = "";
									}
								?>
								<p class="pull-right">
									<a href="<?=$url;?>" class="btn btn-primary btn-sm <?=$classeBtn;?>">
										Adicionar
									</a>
								</p>
								<p><?=$status;?></p>
							</div>
						</div>
					</div>
				</div>
			<?php endforeach; ?>
		</div> <!-- /.col-md-10 -->
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			<?php echo $produtos["paginacao"]; ?>
		</div>
	<?php else: ?>
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
			Sem produtos cadastrados.
		</div>
	<?php endif; ?>
</div> <!-- /.row -->

<?php include "incs/rodape.php"; ?>