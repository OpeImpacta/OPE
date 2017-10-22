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
import br.edu.impacta.dao.VendaDAO;
import br.edu.impacta.entity.Cliente;
import br.edu.impacta.entity.ItemVenda;
import br.edu.impacta.entity.Movimentacao;
import br.edu.impacta.entity.Produto;
import br.edu.impacta.entity.Venda;

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
	private static VendaDAO vendaDAO = new VendaDAO();

	private int tipoRelatorio;
	private Date dataDe;
	private Date dataAte;
	private boolean mostraData = true;
	private List<Movimentacao> movimentacaoList = new ArrayList<>();
	private List<ItemVenda> produtoOrcadoList = new ArrayList<>();
	private List<ItemVenda> produtoVendidoList = new ArrayList<>();
	private List<Cliente> clienteList = new ArrayList<>();
	private List<Produto> produtoList = new ArrayList<>();
	private List<Venda> vendaList = new ArrayList<>();
	private List<Venda> orcamentoList = new ArrayList<>();

	// 1 - Cliente | 2 - Estoque | 3 - Orçamento | 4 - Produtos Vendidos | 5 - Produtos Orçados | 6 - Orçamento | 7 - Venda 
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
			produtoOrcadoList = itemVendaDAO.getProdutoOrcadoByDate(dataDe, dataAte);
			break;
		case 4:
			produtoVendidoList = itemVendaDAO.getProdutoVendidoByDate(dataDe, dataAte);
			break;
		case 5:
			produtoList = produtoDAO.findAll();
			break;
		case 6:
			orcamentoList = vendaDAO.getOrcamentoByDate(dataDe, dataAte);
			break;
		case 7:
			vendaList = vendaDAO.getVendaByDate(dataDe, dataAte);
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

	// 1 - Dinheiro | 2 - Debito | 3 - Credito | 4 - Cheque
	public String verificaFormaPgtoVenda(Venda venda) {
		if(venda != null && venda.getFormaPgto() != null) {
			switch (venda.getFormaPgto()) {
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

	public String verificaSituacaoVenda(Venda venda) {
		if(venda.getAtivo() != null) {
			switch(tipoRelatorio) {
			case 6:
				if(venda.getAtivo() && !venda.getAprovado() && !venda.getFinalizado()) {
					return "Pendente";
				}
				if(venda.getAtivo() && venda.getAprovado() && !venda.getFinalizado()) {
					return "Aprovado";
				}
				if(venda.getAtivo() && venda.getAprovado() && venda.getFinalizado()) {
					return "Finalizado";
				}
				if(!venda.getAtivo()) {
					return "Cancelado";
				}
			case 7:
				if(venda.getAtivo()) {
					return "Realizada";
				}
				return "Cancelada";
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
			limpaRelatorioList();
			break;
		case 2:
			mostraData = false;
			limpaRelatorioList();
			break;
		case 3:
			mostraData = false;
			limpaRelatorioList();
			break;
		case 4:
			mostraData = false;
			limpaRelatorioList();
			break;
		case 5:
			mostraData = true;
			limpaRelatorioList();
			break;
		case 6:
			mostraData = false;
			limpaRelatorioList();
			break;
		case 7:
			mostraData = false;
			limpaRelatorioList();
			break;
		}
	}

	public void limpaRelatorioList() {
		clienteList.isEmpty();
		movimentacaoList.isEmpty();
		produtoOrcadoList.isEmpty();
		produtoVendidoList.isEmpty();
		produtoList.isEmpty();
		orcamentoList.isEmpty();
		vendaList.isEmpty();
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

	public List<ItemVenda> getProdutoOrcadoList() {
		return produtoOrcadoList;
	}

	public void setProdutoOrcadoList(List<ItemVenda> produtoOrcadoList) {
		this.produtoOrcadoList = produtoOrcadoList;
	}

	public List<ItemVenda> getProdutoVendidoList() {
		return produtoVendidoList;
	}

	public void setProdutoVendidoList(List<ItemVenda> produtoVendidoList) {
		this.produtoVendidoList = produtoVendidoList;
	}

	public List<Venda> getVendaList() {
		return vendaList;
	}

	public void setVendaList(List<Venda> vendaList) {
		this.vendaList = vendaList;
	}

	public List<Venda> getOrcamentoList() {
		return orcamentoList;
	}

	public void setOrcamentoList(List<Venda> orcamentoList) {
		this.orcamentoList = orcamentoList;
	}
}
