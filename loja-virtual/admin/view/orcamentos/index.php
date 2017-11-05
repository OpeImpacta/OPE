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

	$count = 0;

	// echo "<pre>"; print_r($orcamento); echo "</pre>";
?>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h2>Meus Orçamentos</h2><hr/>
	</div>

	<?php include "../../../incs/menu_lateral.php"; ?>

	<?php if (isset($_SESSION["orcamento_salvo"]) && $_SESSION["orcamento_salvo"]): ?>
		<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">

			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong>Sucesso!</strong> Orçamento enviado para <strong>Casa de Material do Ônibus</strong>.
			</div>

			<?php
				if (isset($_SESSION["carrinho"])) {
					unset($_SESSION["carrinho"]);
				}

				if (isset($_SESSION["nomeProduto"])) {
					unset($_SESSION["nomeProduto"]);
				}

				if (isset($_SESSION["totalProduto"])) {
					unset($_SESSION["totalProduto"]);
				}

				unset($_SESSION["orcamento_salvo"]);
			?>
		</div> <!-- /.col-md-10 -->
	<?php endif; ?>

	<div class="col-lg-10 col-md-9 col-sm-9 col-xs-12">
		<?php if (!empty($orcamento)): ?>
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<?php foreach ($orcamento as $key => $value): ?>
				<div class="panel panel-primary">
					<div class="panel-heading" role="tab" id="heading<?=$key;?>">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?=$key;?>" aria-expanded="true" aria-controls="collapse<?=$key;?>">
								ORÇAMENTO Nº <?=$key;?>
								<?=($value[0]["orc_aprovado"] == 0 ? " - Aguardando Aprovação" : "");?>
							</a>
						</h4>
					</div>
					<div id="collapse<?=$key;?>" class="panel-collapse collapse <?=($count == 0 ? "in" : "");?>" role="tabpanel" aria-labelledby="heading<?=$key;?>">
						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th>Produto</th>
										<th>Quantidade</th>
										<th>Data</th>
										<th>Preço</th>
										<th>Subtotal</th>
									</tr>
								</thead>
								<tbody>
									<?php if (!empty($value)): $total = array();?>
										<?php foreach ($value as $k => $v): ?>
											<?php $total[$v["id_venda"]][] = ($v["quantidade"] * $v["preco_venda"]); ?>
											<tr>
												<td><?=ucwords(strtolower($v["nome"]));?></td>
												<td><?=str_pad($v["quantidade"], 2, "0", STR_PAD_LEFT);?> </td>
												<td><?=$v["datavenda"];?></td>
												<td>R$ <?=number_format($v["preco_venda"], 2, ',', '.');?></td>
												<td>R$ <?=number_format(($v["quantidade"] * $v["preco_venda"]), 2, ',', '.');?></td>
											</tr>
										<?php endforeach; ?>
										<tr>
											<th colspan="4" style="text-align: right; font-size: 15px;">Total:</th>
											<td style="vertical-align: inherit;">R$ <?=number_format(array_sum($total[$key]), 2, ',', '.');?></td>
										</tr>
									<?php endif; ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			<?php $count++; endforeach; ?>
			</div>
		<?php endif; ?>
	</div> <!-- /.col-md-10 -->
</div> <!-- /.row -->

<?php include "../../../incs/rodape.php"; ?>