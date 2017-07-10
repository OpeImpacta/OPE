package br.edu.impacta.entity;

import java.io.Serializable;
import java.util.Date;

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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author Stefany Souza
 */
@Entity
@Table(name = "movimentacao")
@NamedQueries({
	@NamedQuery(name = "Movimentacao.findAll", query = "SELECT m FROM Movimentacao m ")
})
public class Movimentacao implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_movimentacao", nullable = false)
	private Integer idMovimentacao;
	
	// 1 - Entrada | 2 - Saida | 3 - Ajuste
	@Column(name = "tipo_movimentacao", nullable = false)
	private Integer tipoMovimentacao;
	
	@Column(name = "dt_movimentacao", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dataMovimentacao;
	
	@Column(name = "quantidade", nullable = false)
	private Integer quantidade;
	
	@Column(name = "observacao", length = 150, nullable = true)
	private String observacao;
	
	@JoinColumn(name = "id_produto", referencedColumnName = "id_produto", nullable = false)
	@ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.EAGER)
	private Produto produto;

	
	public Movimentacao() {}

	public Movimentacao(Integer idMovimentacao) {
		this.idMovimentacao = idMovimentacao;
	}

	public Integer getIdMovimentacao() {
		return idMovimentacao;
	}

	public void setIdMovimentacao(Integer idMovimentacao) {
		this.idMovimentacao = idMovimentacao;
	}

	public Integer getTipoMovimentacao() {
		return tipoMovimentacao;
	}

	public void setTipoMovimentacao(Integer tipoMovimentacao) {
		this.tipoMovimentacao = tipoMovimentacao;
	}

	public Date getDataMovimentacao() {
		return dataMovimentacao;
	}

	public void setDataMovimentacao(Date dataMovimentacao) {
		this.dataMovimentacao = dataMovimentacao;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idMovimentacao == null) ? 0 : idMovimentacao.hashCode());
		result = prime * result + ((produto == null) ? 0 : produto.hashCode());
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
		Movimentacao other = (Movimentacao) obj;
		if (idMovimentacao == null) {
			if (other.idMovimentacao != null)
				return false;
		} else if (!idMovimentacao.equals(other.idMovimentacao))
			return false;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Movimentacao [idMovimentacao=" + idMovimentacao + "]";
	}
	

}
