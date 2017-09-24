package br.edu.impacta.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.ItemVendaDAO;
import br.edu.impacta.dao.MovimentacaoDAO;
import br.edu.impacta.entity.ItemVenda;
import br.edu.impacta.entity.Movimentacao;

/**
 * @author Paulo Pasinato
 */

@Named(value = "relatorioControl")
@ViewScoped
public class RelatorioGeralController implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private static MovimentacaoDAO movimentacaoDAO = new MovimentacaoDAO();
	private static ItemVendaDAO itemVendaDAO = new ItemVendaDAO();
	
	private int tipoRelatorio;
	private Date dataDe;
	private Date dataAte;
	private List<Movimentacao> movimentacaoList = new ArrayList<>();
	private List<ItemVenda> orcamentoList = new ArrayList<>();
	private List<ItemVenda> vendaList = new ArrayList<>();
	
	// 1 - Cliente | 2 - Estoque | 3 - Orçamento | 4 - Venda
	public void pesquisar() {
		if(dataDe == null || dataAte == null) {
			UtilityTela.criarMensagemErro("Atenção!", "Favor verificar as datas selecionadas.");
			return;
		}
		switch (tipoRelatorio) {
			case 1:
				
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
}
