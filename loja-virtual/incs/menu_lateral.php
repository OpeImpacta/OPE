<?php 
	$menu = new ConfiguracaoSistema();
	$menuItens = $menu->listarMenuLateral();
?>

<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">Categorias</div>
		<div class="list-group">
			<?php if(!empty($menuItens)): ?>
				<?php foreach ($menuItens as $key => $value): ?>
					<a href="<?=BASE_URL;?>view/categorias/index.php?categoria=<?=$value["id_categoria"];?>" class="list-group-item">
						<?=ucwords(strtolower($value["nome"]));?>
					</a>
				<?php endforeach; ?>
			<?php else: ?>
				Sem categorias cadastradas
			<?php endif; ?>
		</div>
	</div>
</div>