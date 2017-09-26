package br.edu.impacta.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;

public class Dashboard implements Serializable {


	private static final long serialVersionUID = 1L;


	private Long totalVendas;

	private BigDecimal totalVendasVl;

	private String totalVendaFormatado;

	private Long totalOrcamentos;

	private BigDecimal totalOrcamentosVl;

	private String totalOrcamentosFormatado;

	public Long getTotalVendas() {
		return totalVendas;
	}

	public void setTotalVendas(Long totalVendas) {
		this.totalVendas = totalVendas;
	}

	public BigDecimal getTotalVendasVl() {
		return totalVendasVl;
	}

	public void setTotalVendasVl(BigDecimal totalVendasVl) {
		this.totalVendasVl = totalVendasVl;
	}

	public String getTotalVendaFormatado() {
		if(totalVendasVl != null){
			return  NumberFormat.getCurrencyInstance().format(totalVendasVl);
		}
		return totalVendaFormatado;
	}

	public void setTotalVendaFormatado(String totalVendaFormatado) {
		this.totalVendaFormatado = totalVendaFormatado;
	}

	public Long getTotalOrcamentos() {
		return totalOrcamentos;
	}

	public void setTotalOrcamentos(Long totalOrcamentos) {
		this.totalOrcamentos = totalOrcamentos;
	}

	public BigDecimal getTotalOrcamentosVl() {
		return totalOrcamentosVl;
	}

	public void setTotalOrcamentosVl(BigDecimal totalOrcamentosVl) {
		this.totalOrcamentosVl = totalOrcamentosVl;
	}

	public String getTotalOrcamentosFormatado() {
		if(totalOrcamentosVl != null){
			return  NumberFormat.getCurrencyInstance().format(totalOrcamentosVl);
		}
		return totalOrcamentosFormatado;
	}

	public void setTotalOrcamentosFormatado(String totalOrcamentosFormatado) {
		this.totalOrcamentosFormatado = totalOrcamentosFormatado;
	}

	


}
