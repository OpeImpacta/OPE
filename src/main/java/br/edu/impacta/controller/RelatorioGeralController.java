package br.edu.impacta.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.ClienteDAO;
import br.edu.impacta.dao.ItemVendaDAO;
import br.edu.impacta.dao.MovimentacaoDAO;
import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.entity.Cliente;
import br.edu.impacta.entity.ItemVenda;
import br.edu.impacta.entity.Movimentacao;
import br.edu.impacta.entity.Produto;

/**
 * @author Paulo Pasinato
 */

@Named(value = "relatorioControl")
@ViewScoped
public class RelatorioGeralController implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private static MovimentacaoDAO movimentacaoDAO = new MovimentacaoDAO();
	private static ItemVendaDAO itemVendaDAO = new ItemVendaDAO();
	private static ClienteDAO clienteDAO = new ClienteDAO();
	private static ProdutoDAO produtoDAO = new ProdutoDAO();
	
	private int tipoRelatorio;
	private Date dataDe;
	private Date dataAte;
	private boolean mostraData = true;
	private List<Movimentacao> movimentacaoList = new ArrayList<>();
	private List<ItemVenda> orcamentoList = new ArrayList<>();
	private List<ItemVenda> vendaList = new ArrayList<>();
	private List<Cliente> clienteList = new ArrayList<>();
	private List<Produto> produtoList = new ArrayList<>();
	
	// 1 - Cliente | 2 - Estoque | 3 - Orçamento | 4 - Venda | 5 - Produto
	public void pesquisar() {
		if(tipoRelatorio != 1 && tipoRelatorio != 5) {
			if(dataDe == null || dataAte == null) {
				UtilityTela.criarMensagemErro("Atenção!", "Favor verificar as datas selecionadas.");
				return;
			}
		}
		switch (tipoRelatorio) {
			case 1:
				clienteList = clienteDAO.findAll();
				break;
			case 2:
				movimentacaoList = movimentacaoDAO.getMovimentacaoByDate(dataDe, dataAte);
				break;
			case 3:
				orcamentoList = itemVendaDAO.getOrcamentoByDate(dataDe, dataAte);
				break;
			case 4:
				vendaList = itemVendaDAO.getVendaByDate(dataDe, dataAte);
				break;
			case 5:
				produtoList = produtoDAO.findAll();
				break;
		}
	}	
	
	// 1 - Dinheiro | 2 - Debito | 3 - Credito | 4 - Cheque
	public String verificaFormaPgto(ItemVenda itemVenda) {
		if(itemVenda.getVenda() != null && itemVenda.getVenda().getFormaPgto() != null) {
			switch (itemVenda.getVenda().getFormaPgto()) {
				case 1:
					return "Dinheiro";
				case 2:
					return "Débito";
				case 3:
					return "Crédito";
				case 4:
					return "Cheque";
			}
		}
		return "";
	}
	
	public String verificaSituacao(ItemVenda itemVenda) {
		if(itemVenda.getVenda() != null && itemVenda.getVenda().getAtivo() != null) {
			switch(tipoRelatorio) {
				case 3:
					if(itemVenda.getVenda().getAtivo() && !itemVenda.getVenda().getAprovado() && !itemVenda.getVenda().getFinalizado()) {
						return "Pendentes";
					}
					if(itemVenda.getVenda().getAtivo() && itemVenda.getVenda().getAprovado() && !itemVenda.getVenda().getFinalizado()) {
						return "Aprovados";
					}
					if(itemVenda.getVenda().getAtivo() && itemVenda.getVenda().getAprovado() && itemVenda.getVenda().getFinalizado()) {
						return "Finalizados";
					}
					if(!itemVenda.getVenda().getAtivo()) {
						return "Cancelados";
					}
				case 4:
					if(itemVenda.getVenda().getAtivo()) {
						return "Realizadas";
					}
						return "Canceladas";
			}
		}
		return "";
	}
	
	public String verificaAtivoCliente(Cliente cliente) {
		if(cliente.getAtivo()) {
			return "Sim";
		}
		return "Não";
	}
		
	public String verificaAtivoProduto(Produto produto) {
		if(produto.isAtivo()) {
			return "Sim";
		}
		return "Não";
	}
	
	public void verificaTipoRelatorio() {
		switch (tipoRelatorio) {
			case 1:
				mostraData = true;
				break;
			case 2:
				mostraData = false;
				break;
			case 3:
				mostraData = false;
				break;
			case 4:
				mostraData = false;
				break;
			case 5:
				mostraData = true;
				break;
		}
	}
	
	
	public int getTipoRelatorio() {
		return tipoRelatorio;
	}
	public void setTipoRelatorio(int tipoRelatorio) {
		this.tipoRelatorio = tipoRelatorio;
	}
	public Date getDataDe() {
		return dataDe;
	}
	public void setDataDe(Date dataDe) {
		this.dataDe = dataDe;
	}
	public Date getDataAte() {
		return dataAte;
	}
	public void setDataAte(Date dataAte) {
		this.dataAte = dataAte;
	}

	public List<Movimentacao> getMovimentacaoList() {
		return movimentacaoList;
	}

	public void setMovimentacaoList(List<Movimentacao> movimentacaoList) {
		this.movimentacaoList = movimentacaoList;
	}

	public List<ItemVenda> getOrcamentoList() {
		return orcamentoList;
	}

	public void setOrcamentoList(List<ItemVenda> orcamentoList) {
		this.orcamentoList = orcamentoList;
	}

	public List<ItemVenda> getVendaList() {
		return vendaList;
	}

	public void setVendaList(List<ItemVenda> vendaList) {
		this.vendaList = vendaList;
	}

	public List<Cliente> getClienteList() {
		return clienteList;
	}

	public void setClienteList(List<Cliente> clienteList) {
		this.clienteList = clienteList;
	}

	public List<Produto> getProdutoList() {
		return produtoList;
	}

	public void setProdutoList(List<Produto> produtoList) {
		this.produtoList = produtoList;
	}

	public boolean isMostraData() {
		return mostraData;
	}

	public void setMostraData(boolean mostraData) {
		this.mostraData = mostraData;
	}
}
