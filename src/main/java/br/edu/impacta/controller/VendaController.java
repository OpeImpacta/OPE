package br.edu.impacta.controller;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.Normalizer;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.StringUtils;
import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.dao.VendaDAO;
import br.edu.impacta.entity.ItemVenda;
import br.edu.impacta.entity.Produto;
import br.edu.impacta.entity.Venda;

/**
 * @author Stefany Souza
 */

@Named(value = "vendaControl")
@ViewScoped
public class VendaController extends BasicControlCad<Venda> implements Serializable  {

	private static final long serialVersionUID = 1L;


	private static VendaDAO vendaDAO = new VendaDAO();

	@Inject
	private ProdutoDAO produtoDAO;

	private ItemVenda itemVenda;
	private ItemVenda itemVendaSelecionado;

	private Boolean disableExcluir;

	private BigDecimal total;
	private BigDecimal subTotal;
	private BigDecimal desconto;
	private BigDecimal descontoTotal;
	private BigDecimal vlRecebido;
	private BigDecimal troco;

	private String totalFormatado;
	private String subTotalFormatado;
	private String descontoFormatado;
	private String descontoTotalFormatado;
	private String trocoFormatado;
	private String pagamento;

	private List<Venda> orcamentosPendentes;	
	private Integer idOrcamento;
	private Venda orcamentoSelecionado;

	private String opcao;
	private List<Venda> vendas;
	private String headerDt;
	private Venda vendaSelecionada;
	private Boolean disableExcluirVenda;
	private List<ItemVenda> itemVendaList;

	private Boolean semEstoque;


	// *******************************************
	// * Alterar somente neste construtor
	// *******************************************
	public VendaController() throws Exception {
		super(Venda.class,  vendaDAO);
	}


	//adiciona item na lista
	public void addItem(boolean venda) {

		if(venda == true && validaQuantidade() == false) {
			return;
		}

		if(validaCampos()) {
			for(ItemVenda item : ((Venda)this.getSelected()).getItens()) {

				//se o produto j� estiver na lista seta a nova quantidade e o novo valor
				if(item.getProduto().getIdProduto() == itemVenda.getProduto().getIdProduto() && item.getQuantidade() != itemVenda.getQuantidade()) {
					item.setQuantidade(itemVenda.getQuantidade());

					this.setTotal(this.getTotal().subtract(item.getTotalItemVenda()));
					this.setSubTotal(this.getSubTotal().subtract(item.getTotalItemVenda()));

					item.setTotalItemVenda(BigDecimal.ZERO);
					item.setTotalItemVenda(this.calculaTotalItem(item.getQuantidade(), item.getProduto().getPrecoVenda()));

					this.setTotal(this.getTotal().add(item.getTotalItemVenda()));
					this.setSubTotal(this.getSubTotal().add(item.getTotalItemVenda()));
				}

			}

			if(!((Venda)this.getSelected()).getItens().contains(itemVenda)) {
				itemVenda.setTotalItemVenda(this.calculaTotalItem(itemVenda.getQuantidade(), itemVenda.getProduto().getPrecoVenda()));
				((Venda)this.getSelected()).addItem(itemVenda);

				this.setTotal(this.getTotal().add(itemVenda.getTotalItemVenda()));
				this.setSubTotal(this.getSubTotal().add(itemVenda.getTotalItemVenda()));
			}

			itemVenda= null;
		}
	}

	//remove item da lista e ajusta o valor total
	public void delItem() {
		((Venda)this.getSelected()).getItens().remove(this.getItemVendaSelecionado());

		if(verificaEstoque(getItemVendaSelecionado()) == true) {
			this.setTotal(this.getTotal().subtract(this.getItemVendaSelecionado().getTotalItemVenda()));
			this.setSubTotal(this.getSubTotal().subtract(this.getItemVendaSelecionado().getTotalItemVenda()));
		}


		if(((Venda)this.getSelected()).getItens().isEmpty()) {
			desconto = total = subTotal = null;
			descontoFormatado = totalFormatado = subTotalFormatado = null;
		}

		disableExcluir = null;
	}


	//verifica se � uma venda ou um or�amento e grava no banco
	public void recordVenda() {
		if(getVlRecebido() != null && getVlRecebido().compareTo(total) == -1) {
			UtilityTela.criarMensagemErro("Erro" ,"O valor Recebido está menor do valor Total");
		} else {
			((Venda)this.getSelected()).setDesconto(getDescontoTotal());
			((Venda)this.getSelected()).setTotal(getTotal());
			((Venda)this.getSelected()).setData(new Date());
			((Venda)this.getSelected()).setAtivo(true);
	
			((Venda)this.getSelected()).setTipo(1);
			((Venda)this.getSelected()).setFinalizado(true);
			((Venda)this.getSelected()).setFormaPgto(this.tipoPgto());
	
			this.retiraProdutoSemEstoque();
			this.gravaOrcamento();
	
			gravaProdutos();
			this.treatRecord();
			limpaForm();
			UtilityTela.executarJavascript("PF('dlgFinalizacao').hide()");
		}
	}



	//se a venda for finalizacao de um or�amento verifica o estoque novamente
	public void retiraProdutoSemEstoque() {
		List<ItemVenda> itensAux = new ArrayList<>();
		for(ItemVenda item : ((Venda)getSelected()).getItens()) {
			if(verificaEstoque(item) == false) {
				itensAux.add(item);
			}
		}

		((Venda)getSelected()).getItens().removeAll(itensAux);
	}

	//altera o status do orcamento para finalizado
	public void gravaOrcamento() {
		if(orcamentoSelecionado != null) {
			orcamentoSelecionado.setFinalizado(true);
			vendaDAO.update(orcamentoSelecionado);
		}
	}

	//grava nova quantidade de produtos no banco de dados
	public void gravaProdutos() {
		if(!((Venda)this.getSelected()).getItens().isEmpty()) {
			for(ItemVenda item : ((Venda)this.getSelected()).getItens()) {
				if(item.getProduto().getControlaEstoque() == true) {
					item.getProduto().setQuantidade(item.getProduto().getQuantidade() - item.getQuantidade());
					produtoDAO.update(item.getProduto());
				}
			}
		}
	}

	//limpa formulario para nova venda
	public void limpaForm() {
		desconto = total = subTotal = descontoTotal = null;
		descontoFormatado = totalFormatado = subTotalFormatado = null;
		itemVenda = itemVendaSelecionado = null;
		orcamentoSelecionado = null;
		idOrcamento = null;
		disableExcluir = true;
		semEstoque = false;
		newInSelected();
	}

	//verifica se tem o produto em estoque
	public boolean validaQuantidade() {
		if(verificaEstoque(itemVenda) == false) {
			UtilityTela.criarMensagemAviso("Aviso!", "Estoque do produto insuficiente, não é possivel adiciona-lo à venda");
			return false;
		}
		return true;
	}

	//valida os campos antes de inserir item na venda
	public boolean validaCampos() {
		if(itemVenda.getProduto() == null) {
			return false;
		}

		if(itemVenda.getQuantidade() == null || itemVenda.getQuantidade() <= 0) {
			return false;
		}

		return true;
	}


	public void onRowSelect() {
		this.disableExcluir = false;
	}


	//limpa valores ao fechar dialog
	public void onCloseDialog() {
		this.vlRecebido = null;
		this.troco = null;
	}

	//tipo de pagamento selecionado
	public Integer tipoPgto() {
		switch (this.getPagamento()) {
		case "1":
			return 1;
		case "2":
			return 2;	
		case "3":
			return 3;
		case "4":
			return 4;
		default:
			return 1;
		}
	}

	public void abrirDialog() {
		System.out.println("***************** Abrindo Dialog ********************");
		vlRecebido = troco = null;
		UtilityTela.executarJavascript("PF('dlgFinalizacao').show();");
	}

	//calcula o valor do troco conforme valor recebido
	public void calculaTroco() {
		if(getVlRecebido() != null && getVlRecebido().compareTo(total) == -1) {
			UtilityTela.criarMensagemErroSemDetail("O valor Recebido está menor do valor Total");
			setVlRecebido(BigDecimal.ZERO);
			setTroco(BigDecimal.ZERO);
			return;
		}
		if(getVlRecebido() != null && getVlRecebido().compareTo(BigDecimal.ZERO) == 1 ) {
			this.setTroco(this.getVlRecebido().subtract(this.getTotal()));
		}
	}

	//calcula total desconto em reais
	public void calculaDescontoReal() {
		if(this.getDesconto() != null && this.getDesconto() != BigDecimal.ZERO && this.getTotal().compareTo(this.getDesconto()) == 1) {
			this.setTotal(this.getTotal().subtract(this.getDesconto()));
			this.setDescontoTotal(this.getDescontoTotal().add(this.getDesconto()));
		}
	}

	//calcula total desconto em porcentagem
	public void calculaDescontoPorcentagem() {
		if(this.getDesconto() != null && this.getDesconto() != BigDecimal.ZERO && this.getTotal().compareTo(this.getDesconto()) == 1) {
			BigDecimal mult = this.getDesconto().multiply(this.getTotal());
			BigDecimal div = mult.divide(new BigDecimal(100));

			this.setTotal(this.getTotal().subtract(div));
			this.setDescontoTotal(this.getDescontoTotal().add(div));
		}
	}


	//calcula o total do item conforme a quantidade
	public BigDecimal calculaTotalItem(Integer quantidade, BigDecimal vlItem) {
		return vlItem.multiply(new BigDecimal(quantidade));
	}


	//verifica o estado do estoque do produto
	public boolean verificaEstoque(ItemVenda item) {
		if((item.getProduto().getQuantidade() <= 0 || item.getProduto().getQuantidade() < item.getQuantidade()) && item.getProduto().getControlaEstoque() == true) {
			return false;
		}
		return true;
	}


	//***********************************************
	//**************** ORCAMENTO ********************
	//***********************************************

	public void recordOrcamento() {
		if(((Venda)this.getSelected()).getItens().size() != 0) {

			((Venda)this.getSelected()).setDesconto(getDescontoTotal());
			((Venda)this.getSelected()).setTotal(getTotal());
			((Venda)this.getSelected()).setData(new Date());
			((Venda)this.getSelected()).setAtivo(true);

			((Venda)this.getSelected()).setTipo(2);
			((Venda)this.getSelected()).setAprovado(true);
			((Venda)this.getSelected()).setFinalizado(false);

			super.treatRecord();
			limpaForm();
		}
	}

	//busca os orcamentos pendentes aprovados
	public void buscaOrcamentosPendentes() {
		this.orcamentosPendentes = vendaDAO.findOrcamentosPendentes();
		UtilityTela.executarJavascript("PF('dlgOrcamentos').show();");
	}

	//mostra os dados do or�amento selecionado na tela
	public void setaOrcamento() {
		if(idOrcamento != null) {

			orcamentoSelecionado = vendaDAO.findById(idOrcamento);

			if(verificaOrcamento()) {
				this.setaValores(orcamentoSelecionado);
				this.setSelected(orcamentoSelecionado.clone());

				for(ItemVenda i : orcamentoSelecionado.getItens()) {
					i.setTotalItemVenda(i.getProduto().getPrecoVenda().multiply(new BigDecimal(i.getQuantidade())));
				}

				configSelected();
			} else {
				UtilityTela.criarMensagemAviso("Aviso:", "Orçamento não encontrado ou finalizado!");
			}
		}
	}

	//verifica se � um or�amento e se j� n�o esta finalizado
	public boolean verificaOrcamento() {
		if(orcamentoSelecionado == null) {
			return false;
		}

		if( orcamentoSelecionado.getTipo() == 1) {
			return false;
		}

		if(orcamentoSelecionado.getFinalizado() == true) {
			return  false;
		}

		return true;	
	}

	//seta valores da venda
	public void setaValores(Venda venda) {
		setTotal(venda.getTotal());
		setDescontoTotal(venda.getDesconto());
		setSubTotal(venda.getTotal().add(venda.getDesconto()));
	}

	public void configSelected() {
		((Venda)getSelected()).setIdVenda(null);
		List<ItemVenda> itens = ((Venda)getSelected()).getItens();

		((Venda)getSelected()).setItens(null);

		for (ItemVenda item : itens) {

			if(verificaEstoque(item) == false) {
				semEstoque = true;
				setTotal(getTotal().subtract(item.getTotalItemVenda()));
				setSubTotal(getSubTotal().subtract(item.getTotalItemVenda()));
			}

			ItemVenda i = new ItemVenda();
			i.setTotalItemVenda(item.getTotalItemVenda());
			i.setProduto(item.getProduto());
			i.setQuantidade(item.getQuantidade());
			i.setVenda((Venda)getSelected());

			((Venda)getSelected()).getItens().add(i);
		}
	}

	public void cancelOrcamento() {
		if(orcamentoSelecionado != null) {
			((Venda)getSelected()).setItens(null);
			this.limpaForm();
		}
	}


	public void onRowSelectOrc() {
		if(this.getOrcamentoSelecionado() != null) {
			this.idOrcamento = orcamentoSelecionado.getIdVenda();
			this.setaOrcamento();
		}
	}

	//***********************************************
	//**************** CONSULTAR VENDAS *************
	//***********************************************

	//preenche tabela vendas conforme op��o selecionada
	public void preencheVendas() {
		disableExcluirVenda = true;
		vendas = new ArrayList<>();
		if(opcao.equals("1") || opcao == null) {
			vendas = vendaDAO.findVendasRealizadas();
			headerDt = "Vendas Realizadas";
		}else if(opcao.equals("2")) {
			vendas = vendaDAO.findVendasCanceladas();
			headerDt = "Vendas Canceladas";
		}else {
			vendas = vendaDAO.findVendasTodas();
			headerDt = "Todas";
		}
	}

	public void onRowSelectVenda() {
		this.disableExcluirVenda = false;
	}

	public void disableButtons() {
		this.setTotal(null);
		this.setSubTotal(null);
		this.setDescontoTotal(null);
		disableExcluirVenda = true;
	}

	//inativa venda e estorna produtos
	public void cancelaVenda() {
		if(getOpcao().equals("2")){
			return;
		}
		
		vendaSelecionada.setAtivo(false);
		vendaDAO.update(vendaSelecionada);
		estornaProdutos(vendaSelecionada.getItens());

		vendaSelecionada = null;
		disableButtons();

		UtilityTela.criarMensagem("Sucesso", "Venda cancelada com sucesso!");
	}

	//estorna produtos para estoque ao cancelar venda
	public void estornaProdutos(List<ItemVenda> itens) {
		for(ItemVenda item : itens) {
			if(item.getProduto().getControlaEstoque() == true) {
				item.getProduto().setQuantidade(item.getProduto().getQuantidade() + item.getQuantidade());
				produtoDAO.update(item.getProduto());
			}
		}
	}

	//estorna o estoque dos produtos, se n�o ficar nenhum item na venda ela � cancelada
	public void recordDevolucoes() {
		estornaProdutos(getItemVendaList());
		if(vendaSelecionada.getItens().size() == 1 || vendaSelecionada.getItens().size() == getItemVendaList().size()) {
			vendaSelecionada.setAtivo(false);
		}
		removeItensVenda();
		vendaDAO.update(vendaSelecionada);
		this.disableButtons();
		UtilityTela.criarMensagem("Sucesso", "Devolução realizada com sucesso!");
	}

	//remove o item da venda e altera o valor total
	public void removeItensVenda() {
		for(ItemVenda item : getItemVendaList()) {
			vendaSelecionada.removeItem(item);
			vendaSelecionada.setTotal(vendaSelecionada.getTotal().subtract(item.getTotalItemVenda()));
		}
	}

	public void openDialogItens() {
		calculaTotalItens();
		setaValores(vendaSelecionada);
		UtilityTela.executarJavascript("PF('dlgItemVenda').show();");
	}

	public void openDialogDevolucao() {
		if(getOpcao().equals("2")){
			return;
		}
		
		calculaTotalItens();
		setaValores(vendaSelecionada);
		UtilityTela.executarJavascript("PF('dlgExclusao').show();");
	}

	public void calculaTotalItens() {
		for (ItemVenda item : vendaSelecionada.getItens()) {
			item.setTotalItemVenda(calculaTotalItem(item.getQuantidade(), item.getProduto().getPrecoVenda()));
		}
	}



	//*****************************************************
	//**************** AUTOCOMPLETE ***********************
	//*****************************************************
	public List<Produto> completeProdutos(String query){
		List<Produto> allProdutos = produtoDAO.findAtivos();
		List<Produto> filteredProdutos = new ArrayList<>();

		if(allProdutos != null) {
			for(Produto produto : allProdutos) {
				query = Normalizer.normalize(query, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
				if(containsOnlyNumbers(query)) {
					Integer codProduto = Integer.parseInt(query);
					if(produto.getIdProduto().intValue() == codProduto.intValue()) {
						filteredProdutos.add(produto);
					}
				} else {
					String produtoNome = Normalizer.normalize(produto.getNome(), Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
					if(StringUtils.containsIgnoreCase(produtoNome, query)) {
						filteredProdutos.add(produto);
					}
				}
				
			}
		}

		return filteredProdutos;
	}
	
	// *************************************************************************
    // * Verifica se contem somente numeros em uma String
    // *************************************************************************
    public boolean containsOnlyNumbers(String str) {
        if (str == null || str.length() == 0) {
            return false;
        }
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }


	//********************** GETS & SETS ***************************************
	public ItemVenda getItemVenda() {
		if(itemVenda == null) {
			itemVenda = new ItemVenda();
		}
		return itemVenda;
	}


	public void setItemVenda(ItemVenda itemVenda) {
		this.itemVenda = itemVenda;
	}


	public Boolean getDisableExcluir() {
		if(disableExcluir == null) {
			return true;
		}
		return disableExcluir;
	}

	public Boolean getDisableExcluirVenda() {
		if(disableExcluirVenda == null) {
			return true;
		}
		return disableExcluirVenda;
	}

	public void setDisableExcluirVenda(Boolean disableExcluirVenda) {
		this.disableExcluirVenda = disableExcluirVenda;
	}


	public void setDisableExcluir(Boolean disableExcluir) {
		this.disableExcluir = disableExcluir;
	}


	public String getTotalFormatado() {
		if(total != null && total != BigDecimal.ZERO ) {
			return NumberFormat.getCurrencyInstance().format(total);
		}
		return totalFormatado;
	}


	public void setTotalFormatado(String totalFormatado) {
		this.totalFormatado = totalFormatado;
	}


	public String getSubTotalFormatado() {
		if(subTotal != null  && subTotal != BigDecimal.ZERO) {
			return NumberFormat.getCurrencyInstance().format(subTotal);
		}
		return subTotalFormatado;
	}


	public void setSubTotalFormatado(String subTotalFormatado) {
		this.subTotalFormatado = subTotalFormatado;
	}


	public String getDescontoFormatado() {
		if(desconto != null && desconto != BigDecimal.ZERO) {
			return NumberFormat.getCurrencyInstance().format(desconto);
		}
		return descontoFormatado;
	}


	public void setDescontoFormatado(String descontoFormatado) {
		this.descontoFormatado = descontoFormatado;
	}


	public String getDescontoTotalFormatado() {
		if(descontoTotal != null && descontoTotal != BigDecimal.ZERO) {
			return NumberFormat.getCurrencyInstance().format(descontoTotal);
		}
		return descontoTotalFormatado;
	}

	public void setDescontoTotalFormatado(String descontoTotalFormatado) {
		this.descontoTotalFormatado = descontoTotalFormatado;
	}


	public BigDecimal getTotal() {
		if(total == null) {
			total = BigDecimal.ZERO;
		}
		return total;
	}


	public void setTotal(BigDecimal total) {
		this.total = total;
	}


	public BigDecimal getSubTotal() {
		if(subTotal == null) {
			subTotal = BigDecimal.ZERO;
		}
		return subTotal;
	}

	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
	}

	public BigDecimal getDesconto() {
		if(desconto == null) {
			desconto = BigDecimal.ZERO;
		}
		return desconto;
	}

	public void setDesconto(BigDecimal desconto) {
		this.desconto = desconto;
	}

	public ItemVenda getItemVendaSelecionado() {
		return itemVendaSelecionado;
	}

	public void setItemVendaSelecionado(ItemVenda itemVendaSelecionado) {
		this.itemVendaSelecionado = itemVendaSelecionado;
	}

	public BigDecimal getDescontoTotal() {
		if(descontoTotal == null) {
			return BigDecimal.ZERO;
		}
		return descontoTotal;
	}

	public void setDescontoTotal(BigDecimal descontoTotal) {
		this.descontoTotal = descontoTotal;
	}

	public BigDecimal getVlRecebido() {
		return vlRecebido;
	}

	public void setVlRecebido(BigDecimal vlRecebido) {
		this.vlRecebido = vlRecebido;
	}

	public BigDecimal getTroco() {
		if(troco == null) {
			troco = BigDecimal.ZERO;
		}
		return troco;
	}

	public void setTroco(BigDecimal troco) {
		this.troco = troco;
	}

	public String getTrocoFormatado() {
		if(troco != null && troco != BigDecimal.ZERO) {
			return NumberFormat.getCurrencyInstance().format(troco);
		}
		return trocoFormatado;
	}

	public void setTrocoFormatado(String trocoFormatado) {
		this.trocoFormatado = trocoFormatado;
	}

	public String getPagamento() {
		if(pagamento == null) {
			return "1";
		}
		return pagamento;
	}

	public void setPagamento(String pagamento) {
		this.pagamento = pagamento;
	}

	public List<Venda> getOrcamentosPendentes() {
		if(orcamentosPendentes == null) {
			orcamentosPendentes = new ArrayList<>();
		}
		return orcamentosPendentes;
	}

	public void setOrcamentosPendentes(List<Venda> orcamentosPendentes) {
		this.orcamentosPendentes = orcamentosPendentes;
	}

	public Integer getIdOrcamento() {
		return idOrcamento;
	}

	public void setIdOrcamento(Integer idOrcamento) {
		this.idOrcamento = idOrcamento;
	}

	public Venda getOrcamentoSelecionado() {
		return orcamentoSelecionado;
	}

	public void setOrcamentoSelecionado(Venda orcamentoSelecionado) {
		this.orcamentoSelecionado = orcamentoSelecionado;
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

	public List<Venda> getVendas() {
		if(vendas == null) {
			return vendaDAO.findVendasRealizadas();
		}
		return vendas;
	}

	public void setVendas(List<Venda> vendas) {
		this.vendas = vendas;
	}

	public String getHeaderDt() {
		if(headerDt == null) {
			return "Vendas Realizadas";
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

	public List<ItemVenda> getItemVendaList() {
		if(itemVendaList == null) {
			itemVendaList = new ArrayList<>();
		}
		return itemVendaList;
	}

	public void setItemVendaList(List<ItemVenda> itemVendaList) {
		this.itemVendaList = itemVendaList;
	}


	public Boolean getSemEstoque() {
		if(semEstoque == null) {
			return false;
		}
		return semEstoque;
	}


	public void setSemEstoque(Boolean semEstoque) {
		this.semEstoque = semEstoque;
	}


}
