$(function(){
	var base_url = $("#base_url").val();
	$("[data-toggle=\"tooltip\"]").tooltip();

	// VALIDAÇÃO DADOS FORM
	$("form").submit(function(e){
		var valida = 0;

		$(".obrigatorio").each(function(i, el){
			if ($(this).val() == "") {
				valida++;
			}
		});

		console.log("valida", valida);

		if( valida > 0 ){
			$(".alert-form").fadeIn("slow").removeClass("hide");
			return false;
		}

		return true;
	});

	// PREENCHE O INPUT ESCONDIDO E MOSTRA MODAL DE CONFIRMAÇÃO DE EXCLUSÃO
	$(".excluir").click(function(e){
		e.preventDefault();
		var id = $(this).prop("rel");

		$("#codigo").val(id);
		$('#modal_confirmacao').modal();
	});

	// MOSTRAR MODAL DE RECUPERAÇÃO DE SENHA
	$("#recuperarSenha").click(function(e){
		e.preventDefault();
		$('#modal_recuperarSenha').modal();
	});

	$(document).ready(function(){
		var SPMaskBehavior = function (val) {
			return val.replace(/\D/g, '').length === 11 ? '(00)00000-0000' : '(00)0000-00009';
		}, spOptions = {
			onKeyPress: function(val, e, field, options) {
				field.mask(SPMaskBehavior.apply({}, arguments), options);
			}
		};
		$('.tel').mask(SPMaskBehavior, spOptions);

		var CPFMaskBehavior = function (val) {
			return val.replace(/\D/g, '').length > 11 ? '00.000.000/0000-00' : '000.000.000-000';
		}, cpfOptions = {
			onKeyPress: function(val, e, field, options) {
				field.mask(CPFMaskBehavior.apply({}, arguments), options);
			}
		};
		$('.cpfCnpj').mask(CPFMaskBehavior, cpfOptions);

		$('.datas').datepicker({format : 'dd/mm/yyyy'});
	});
});