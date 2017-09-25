package br.edu.impacta.controller;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Named;

import org.apache.commons.collections.map.HashedMap;
import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.VendaDAO;
import br.edu.impacta.entity.ItemVenda;
import br.edu.impacta.entity.Venda;

/**
 * @author Stefany Souza
 */

@Named(value = "orcControl")
@ViewScoped
public class OrcamentoController extends BasicControlCad<Venda> implements Serializable {


	private static final long serialVersionUID = 1L;

	private static VendaDAO vendaDAO = new VendaDAO();

	@javax.inject.Inject
	private ConfigEmailController configEmailController;


	private String opcao;
	private List<Venda> orcamentos;
	private String headerDt;
	private Venda vendaSelecionada;
	private List<ItemVenda> itemVendaList;

	private BigDecimal desconto;
	private BigDecimal descontoTotal;
	private BigDecimal subTotal;
	
	private String subTotalFormatado;

	private Boolean disableAprovar;
	private Boolean disableCancelar;
	private Boolean disableReenviar;
	private Boolean disableVisualizar;


	// *******************************************
	// * Alterar somente neste construtor
	// *******************************************
	public OrcamentoController() throws Exception {
		super(Venda.class,  vendaDAO);
	}

	//preenche tabela orcamentos conforme a opção selecionada
	public void preencheOrcamentos() {
		disableAprovar = disableCancelar = disableReenviar = disableVisualizar = true;
		vendaSelecionada = null;
		orcamentos = new ArrayList<>();
		if(opcao.equals("1") || opcao == null) {
			orcamentos = vendaDAO.findOrcamentosAguardAprovacao();
			headerDt = "Orçamentos Pendentes";
		}else if(opcao.equals("2")) {
			orcamentos = vendaDAO.findOrcamentosAprovados();
			headerDt = "Orçamentos Aprovados";
		}else if(opcao.equals("3")) {
			orcamentos = vendaDAO.findOrcamentosFinalizados();
			headerDt = "Orçamentos Finalizados";
		}else if(opcao.equals("4")) {
			orcamentos = vendaDAO.findOrcamentosCancelados();
			headerDt = "Orçamentos Cancelados";
		}else {
			orcamentos = vendaDAO.findOrcamentosTodos();
			headerDt = "Todos";
		}
	}

	public void openDialogAprovar() {
		if(vendaSelecionada != null){
			calculaTotalItens();
			UtilityTela.executarJavascript("PF('dlgAprovar').show();");
		}
	}

	public void openDialogVisualizar() {
		if(vendaSelecionada != null){
			calculaTotalItens();
			UtilityTela.executarJavascript("PF('dlgVisualizar').show();");
		}
	}

	//cancela o orçamento
	public void cancelaOrcamento(){
		vendaSelecionada.setAtivo(false);
		vendaDAO.update(vendaSelecionada);
		vendaSelecionada = null;

		orcamentos = vendaDAO.findOrcamentosAprovados();
		UtilityTela.criarMensagem("Sucesso!", "Orçamento cancelado com sucesso.");
	}

	//aprova o orçamento e manda por email
	public void aprovaOrcamento(){
		vendaSelecionada.setAprovado(true);
		vendaDAO.update(vendaSelecionada);
		UtilityTela.criarMensagem("Sucesso!", "Orçamento Aprovado.");

		enviarEmail(vendaSelecionada.getIdVenda());
	}


	//verifica se o orçamento tem cliente e se o cliente tem email
	public void enviarEmail(int idVenda){
		HashedMap param = new HashedMap();
		param.put("idVenda", idVenda);

		if(vendaSelecionada.getCliente() != null){
			if(vendaSelecionada.getCliente().getEmail() != null){
				if(configEmailController.enviarEmailAnexo(vendaSelecionada.getCliente().getEmail(), param , "orcamentoEmail")){
					UtilityTela.criarMensagem("Sucesso!", "E-mail enviado.");
				}else{
					UtilityTela.criarMensagemAviso("Aviso!", "Não foi possivel enviar E-mail.");
				}
			}
		}
		vendaSelecionada = new Venda();
	}

	//calcula total de cada item e calcula o total da orcamento caso venha da vitrine virtual
	public void calculaTotalItens() {
		for (ItemVenda item : vendaSelecionada.getItens()) {
			if(vendaSelecionada.getAprovado() == false){
				vendaSelecionada.setTotal(vendaSelecionada.getTotal().add(item.getTotalItemVenda()));
			}
			this.setSubTotal(vendaSelecionada.getTotal().add(vendaSelecionada.getDesconto()));
		}
	}

	//calcula total desconto em reais
	public void calculaDescontoReal() {
		if(this.getDesconto() != null && this.getDesconto() != BigDecimal.ZERO && vendaSelecionada.getTotal().compareTo(this.getDesconto()) == 1) {
			vendaSelecionada.setTotal(vendaSelecionada.getTotal().subtract(this.getDesconto()));
			vendaSelecionada.setDesconto(getDescontoTotal().add(this.getDesconto()));
			this.setDescontoTotal(getDescontoTotal().add(this.getDesconto()));
			this.setDesconto(null);
		}
	}

	//calcula total desconto em porcentagem
	public void calculaDescontoPorcentagem() {
		if(this.getDesconto() != null && this.getDesconto() != BigDecimal.ZERO && vendaSelecionada.getTotal().compareTo(this.getDesconto()) == 1) {
			BigDecimal mult = this.getDesconto().multiply(vendaSelecionada.getTotal());
			BigDecimal div = mult.divide(new BigDecimal(100));

			vendaSelecionada.setTotal((vendaSelecionada.getTotal().subtract(div)));
			vendaSelecionada.setDesconto(this.getDescontoTotal().add(div));
			this.setDescontoTotal(this.getDescontoTotal().add(div));
			this.setDesconto(null);
		}
	}

	public void onRowSelectVenda() {
		disableVisualizar = false;

		if(getOpcao().equals("1") || opcao == null) {
			this.disableAprovar = false;
		}else if(getOpcao().equals("2")){
			this.disableAprovar = true;
			this.disableCancelar = false;
			this.disableReenviar = false;
		}else if(getOpcao().equals("3")){
			this.disableAprovar = true;
			this.disableReenviar = true;
			this.disableCancelar = true;
		}else if(getOpcao().equals("4")){
			this.disableAprovar = true;
			this.disableReenviar = true;
			this.disableCancelar = true;
		}

	}

	public String getOpcao() {
		if(opcao == null) {
			return "1";
		}
		return opcao;
	}

	public void setOpcao(String opcao) {
		this.opcao = opcao;
	}

	public List<Venda> getOrcamentos() {
		if(orcamentos == null) {
			return vendaDAO.findOrcamentosAguardAprovacao();
		}
		return orcamentos;
	}

	public void setOrcamentos(List<Venda> orcamentos) {
		this.orcamentos = orcamentos;
	}

	public String getHeaderDt() {
		if(headerDt == null) {
			return "Orçamentos Pendentes";
		}
		return headerDt;
	}

	public void setHeaderDt(String headerDt) {
		this.headerDt = headerDt;
	}

	public Venda getVendaSelecionada() {
		return vendaSelecionada;
	}

	public void setVendaSelecionada(Venda vendaSelecionada) {
		this.vendaSelecionada = vendaSelecionada;
	}

	public Boolean getDisableAprovar() {
		if(disableAprovar == null){
			disableAprovar = true;
		}
		return disableAprovar;
	}

	public Boolean getDisableCancelar() {
		if(disableCancelar == null){
			disableCancelar = true;
		}
		return disableCancelar;
	}

	public void setDisableCancelar(Boolean disableCancelar) {
		this.disableCancelar = disableCancelar;
	}

	public Boolean getDisableReenviar() {
		if(disableReenviar == null){
			disableReenviar = true;
		}
		return disableReenviar;
	}

	public Boolean getDisableVisualizar() {
		if(disableVisualizar == null){
			disableVisualizar = true;
		}
		return disableVisualizar;
	}

	public void setDisableVisualizar(Boolean disableVisualizar) {
		this.disableVisualizar = disableVisualizar;
	}

	public void setDisableReenviar(Boolean disableReenviar) {
		this.disableReenviar = disableReenviar;
	}

	public void setDisableAprovar(Boolean disableExcluirVenda) {
		this.disableAprovar = disableExcluirVenda;
	}

	public List<ItemVenda> getItemVendaList() {
		return itemVendaList;
	}

	public void setItemVendaList(List<ItemVenda> itemVendaList) {
		this.itemVendaList = itemVendaList;
	}

	public BigDecimal getDesconto() {
		if(desconto == null){
			desconto = new BigDecimal(0);
		}
		return desconto;
	}

	public void setDesconto(BigDecimal desconto) {
		this.desconto = desconto;
	}

	public BigDecimal getDescontoTotal() {
		if(descontoTotal == null){
			descontoTotal = new BigDecimal(0);
		}
		return descontoTotal;
	}

	public void setDescontoTotal(BigDecimal descontoTotal) {
		this.descontoTotal = descontoTotal;
	}

	public BigDecimal getSubTotal() {
		if(subTotal == null){
			subTotal = new BigDecimal(0);
		}
		return subTotal;
	}

	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
	}

	public String getSubTotalFormatado() {
		if(subTotal != null){
			return NumberFormat.getCurrencyInstance().format(subTotal);
		}
		return subTotalFormatado;
	}

	public void setSubTotalFormatado(String subTotalFormatado) {
		this.subTotalFormatado = subTotalFormatado;
	}

}
