package br.edu.impacta.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.dao.VendaDAO;
import br.edu.impacta.entity.Dashboard;

@Named(value = "dashControl")
@ViewScoped
public class DashController implements Serializable {


	private static final long serialVersionUID = 1L;

	@Inject
	private VendaDAO vendaDAO;
	
	@Inject
	private ProdutoDAO produtoDAO;
	
	private Integer novosOrcamentos;
	
	private Integer estoqueBaixo;

	private Dashboard dashboardVenda;

	private Dashboard dashboardOrcamento;


	public void getValores(){
		SimpleDateFormat mes = new SimpleDateFormat("M");
		SimpleDateFormat ano = new SimpleDateFormat("yyyy");

		Date dataAtual = new Date();

		dashboardVenda = vendaDAO.getDashVendas(mes.format(dataAtual), ano.format(dataAtual));
		dashboardOrcamento = vendaDAO.getDashOrcamentos(mes.format(dataAtual), ano.format(dataAtual));
	}


	public Integer getNovosOrcamentos() {
		novosOrcamentos = vendaDAO.findOrcamentosAguardAprovacao().size();
		return novosOrcamentos;
	}

	public void setNovosOrcamentos(Integer novosOrcamentos) {
		this.novosOrcamentos = novosOrcamentos;
	}


	public Dashboard getDashboardVenda() {
		return dashboardVenda;
	}


	public void setDashboardVenda(Dashboard dashboardVenda) {
		this.dashboardVenda = dashboardVenda;
	}


	public Dashboard getDashboardOrcamento() {
		return dashboardOrcamento;
	}


	public void setDashboardOrcamento(Dashboard dashboardOrcamento) {
		this.dashboardOrcamento = dashboardOrcamento;
	}


	public Integer getEstoqueBaixo() {
		estoqueBaixo = produtoDAO.findEstoqueMinimo().size();
		return estoqueBaixo;
	}


	public void setEstoqueBaixo(Integer estoqueBaixo) {
		this.estoqueBaixo = estoqueBaixo;
	}
	


}
