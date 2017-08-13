<?php $menu = new ConfiguracaoSistema(); ?>

<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">Menu Principal</div>
		<div class="list-group">
			<?php foreach ($menu->listarMenuLateral() as $key => $value): ?>
				<a href="<?=BASE_URL;?>view/categorias/index.php?categoria=<?=$value["id_categoria"];?>" class="list-group-item">
					<?=utf8_encode(ucwords(strtolower($value["nome"])));?>
				</a>
			<?php endforeach; ?>
		</div>
	</div>
</div>