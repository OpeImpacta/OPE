<?php 
	require "../../../config.php";
	include "../../../incs/cabecalho.php";
	include "../../../incs/menu_superior.php";

	$pagina = (isset($_GET['pg']) ? (int)$_GET['pg'] : 1);
	$url = "http://".$_SERVER["SERVER_NAME"] . $_SERVER["PHP_SELF"];

	$id = "";
	if (isset($_GET["id"])) {
		$id = strip_tags(addslashes($_GET["id"]));
	}

	$orcamentos = new Orcamento();
	$orcamento = $orcamentos->listar($url, $pagina, $id);

	// echo "<pre>"; print_r($orcamento); echo "</pre>";
?>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h2>Meus Orçamentos</h2><hr/>
	</div>

	<?php include "../../../incs/menu_lateral.php"; ?>
	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<?php if (!empty($orcamento)): ?>
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<?php foreach ($orcamento as $key => $value): ?>
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="heading<?=$key;?>">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?=$key;?>" aria-expanded="true" aria-controls="collapse<?=$key;?>">
								ORÇAMENTO Nº <?=$key;?>
							</a>
						</h4>
					</div>
					<div id="collapse<?=$key;?>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading<?=$key;?>">
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Produto</th>
										<th>Montadora</th>
										<th>Modelo</th>
										<th>Quantidade</th>
										<th>Preço</th>
										<th>Subtotal</th>
									</tr>
								</thead>
								<?php if (!empty($value)): ?>
									<tbody>
										<?php foreach ($value as $key2 => $value2): ?>
											<?php $subtotal = ($value2["quantidade"] * $value2["valor"]); ?>
											<tr>
												<td><?=ucwords(strtolower($value2["nome"]));?></td>
												<td><?=ucwords(strtolower($value2["montadora"]));?></td>
												<td><?=ucwords(strtolower($value2["modelo"]));?></td>
												<td><?=str_pad($value2["quantidade"], 2, "0", STR_PAD_LEFT);?> </td>
												<td>R$ <?=number_format($value2["valor"], 2, ',', '.');?></td>
												<td>R$ <?=number_format($subtotal, 2, ',', '.');?></td>
											</tr>
											<?php $valorTotal[$value2["id_produto"]] = $subtotal; ?>
										<?php endforeach; ?>
										<th colspan="5" style="text-align: right; font-size: 15px;">Total:</th>
										<td style="vertical-align: inherit;">R$ <?=number_format(array_sum($valorTotal), 2, ',', '.');?></td>
									</tbody>
								<?php endif; ?>
							</table>
						</div>
					</div>
				</div>
			<?php endforeach; ?>
			</div>
		<?php endif; ?>
	</div> <!-- /.col-md-10 -->
</div> <!-- /.row -->

<?php include "../../../incs/rodape.php"; ?>