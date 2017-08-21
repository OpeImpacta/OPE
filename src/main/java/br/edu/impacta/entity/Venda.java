package br.edu.impacta.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name = "venda")
@NamedQueries({
	@NamedQuery(name = "Venda.findAll", query = "SELECT v FROM Venda v ")
})
public class Venda implements Serializable, Cloneable{

	private static final long serialVersionUID = -2563553073361081307L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_venda")
	private Integer idVenda;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data", nullable = true)
	private Date data;
	
	@Column(name = "desconto", nullable = true)
	private BigDecimal desconto;
	
	// 1 - Dinheiro | 2 - Debito | 3 - Credito | 4 - Cheque
	@Column(name = "forma_pgto", nullable = true)
	private Integer formaPgto;
	
	// 1 - Venda | 2 - Orçamento
	@Column(name = "tipo", nullable = true)
	private Integer tipo;
	
	@Column(name = "total", nullable = true)
	private BigDecimal total;
	
	@Column(name = "aprovado", nullable = true)
	private Boolean aprovado;
	
	@Column(name = "ativo", nullable = true)
	private Boolean ativo; 
	
	@Column(name = "finalizado", nullable = true)
	private Boolean finalizado;
	
	@JoinColumn(name = "id_cliente", referencedColumnName = "id_cliente")
	@ManyToOne(optional = true, fetch = FetchType.EAGER)
	private Cliente cliente;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "venda", fetch = FetchType.EAGER, orphanRemoval = true)
	private List<ItemVenda> itens = new ArrayList<>();
	
	@Transient
	private String totalFormatado;
	
	
	@Override
	public Venda clone()  {
		try {
			return (Venda) super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Integer getIdVenda() {
		return idVenda;
	}

	public void setIdVenda(Integer idVenda) {
		this.idVenda = idVenda;
	}

	public List<ItemVenda> getItens() {
		if(itens == null) {
			itens = new ArrayList<>();
		}
		return itens;
	}

	public void setItens(List<ItemVenda> itens) {
		this.itens = itens;
	}

	public Date getData() {
		return data;
	}


	public void setData(Date data) {
		this.data = data;
	}


	public BigDecimal getDesconto() {
		return desconto;
	}


	public void setDesconto(BigDecimal desconto) {
		this.desconto = desconto;
	}


	public Integer getFormaPgto() {
		return formaPgto;
	}


	public void setFormaPgto(Integer formaPgto) {
		this.formaPgto = formaPgto;
	}


	public Integer getTipo() {
		return tipo;
	}


	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}


	public BigDecimal getTotal() {
		return total;
	}


	public void setTotal(BigDecimal total) {
		this.total = total;
	}


	public Boolean getAprovado() {
		return aprovado;
	}


	public void setAprovado(Boolean aprovado) {
		this.aprovado = aprovado;
	}


	public Boolean getAtivo() {
		return ativo;
	}


	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}


	public Boolean getFinalizado() {
		return finalizado;
	}


	public void setFinalizado(Boolean finalizado) {
		this.finalizado = finalizado;
	}


	public Cliente getCliente() {
		return cliente;
	}


	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public void addItem(ItemVenda item) {
		item.setVenda(this);
		itens.add(item);
	}

	public void removeItem(ItemVenda item) {
		item.setVenda(null);
		this.itens.remove(item);
	}
	
	public String getTotalFormatado() {
		if(total != null) {
			return NumberFormat.getCurrencyInstance().format(total);
		}
		return totalFormatado;
	}

	public void setTotalFormatado(String totalFormatado) {
		this.totalFormatado = totalFormatado;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idVenda == null) ? 0 : idVenda.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Venda other = (Venda) obj;
		if (idVenda == null) {
			if (other.idVenda != null)
				return false;
		} else if (!idVenda.equals(other.idVenda))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Venda [idVenda=" + idVenda + "]";
	}

}
