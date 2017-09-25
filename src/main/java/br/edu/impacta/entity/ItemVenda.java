package br.edu.impacta.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;

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
import javax.persistence.Transient;

@Entity
@Table(name = "item_venda")
@NamedQueries({
	@NamedQuery(name = "ItemVenda.findAll", query = "SELECT i FROM ItemVenda i ")
})
public class ItemVenda implements Serializable,  Cloneable {

	
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_item_venda")
    private Integer idItemVenda;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Venda venda;

	@Column(name = "quantidade", nullable = true)
	private Integer quantidade;
	
	@JoinColumn(name = "id_produto", referencedColumnName = "id_produto")
	@ManyToOne(optional = true, fetch = FetchType.EAGER)
	private Produto produto;
	
	@Column(name = "total_item_venda", nullable = true)
	private BigDecimal totalItemVenda;
	
	@Transient
	private String totalItemFormatado;
	
	@Transient
	private String corFundo;
	
	@Transient 
	private String corTexto;
	
	
	@Override
	public ItemVenda clone()  {
		try {
			return (ItemVenda) super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return null;
	}


	public Integer getIdItemVenda() {
		return idItemVenda;
	}

	public void setIdItemVenda(Integer idItemVenda) {
		this.idItemVenda = idItemVenda;
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
	}

	public Integer getQuantidade() {
		if(quantidade == null) {
			return 1;
		}
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	
	public BigDecimal getTotalItemVenda() {
		if(totalItemVenda == null) {
			this.totalItemVenda = BigDecimal.ZERO;
		}
		return totalItemVenda;
	}

	public void setTotalItemVenda(BigDecimal totalItemVenda) {
		this.totalItemVenda = totalItemVenda;
	}

	public String getTotalItemFormatado() {
		if(totalItemVenda != null) {
			return NumberFormat.getCurrencyInstance().format(totalItemVenda);
		}
		return totalItemFormatado;
	}

	public void setTotalItemFormatado(String totalItemFormatado) {
		this.totalItemFormatado = totalItemFormatado;
	}

	public String getCorFundo() {
		if(getProduto() != null) {
			if((getProduto().getQuantidade() <= 0 || getProduto().getQuantidade() < getQuantidade()) && getProduto().getControlaEstoque() == true) {
				corFundo = "FF7F50";
			}
		}else {
			corFundo = "";
		}
		return corFundo;
		
	}

	public void setCorFundo(String corFundo) {
		this.corFundo = corFundo;
	}


	public String getCorTexto() {
		if(getProduto() != null) {
			if((getProduto().getQuantidade() <= 0 || getProduto().getQuantidade() < getQuantidade()) && getProduto().getControlaEstoque() == true) {
				corTexto = "FFFFFF";
			}
		}else {
			corTexto = "";
		}
		return corTexto;
	}


	public void setCorTexto(String corTexto) {
		this.corTexto = corTexto;
	}
	

	@Override
	public String toString() {
		return "ItemVenda [idItemVenda=" + idItemVenda + ", venda=" + venda + ", quantidade=" + quantidade
				+ ", produto=" + produto + ", totalItemVenda=" + totalItemVenda + ", totalItemFormatado="
				+ totalItemFormatado + ", corFundo=" + corFundo + ", corTexto=" + corTexto + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((corFundo == null) ? 0 : corFundo.hashCode());
		result = prime * result + ((corTexto == null) ? 0 : corTexto.hashCode());
		result = prime * result + ((idItemVenda == null) ? 0 : idItemVenda.hashCode());
		result = prime * result + ((produto == null) ? 0 : produto.hashCode());
		result = prime * result + ((quantidade == null) ? 0 : quantidade.hashCode());
		result = prime * result + ((totalItemFormatado == null) ? 0 : totalItemFormatado.hashCode());
		result = prime * result + ((totalItemVenda == null) ? 0 : totalItemVenda.hashCode());
		result = prime * result + ((venda == null) ? 0 : venda.hashCode());
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
		ItemVenda other = (ItemVenda) obj;
		if (corFundo == null) {
			if (other.corFundo != null)
				return false;
		} else if (!corFundo.equals(other.corFundo))
			return false;
		if (corTexto == null) {
			if (other.corTexto != null)
				return false;
		} else if (!corTexto.equals(other.corTexto))
			return false;
		if (idItemVenda == null) {
			if (other.idItemVenda != null)
				return false;
		} else if (!idItemVenda.equals(other.idItemVenda))
			return false;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		if (quantidade == null) {
			if (other.quantidade != null)
				return false;
		} else if (!quantidade.equals(other.quantidade))
			return false;
		if (totalItemFormatado == null) {
			if (other.totalItemFormatado != null)
				return false;
		} else if (!totalItemFormatado.equals(other.totalItemFormatado))
			return false;
		if (totalItemVenda == null) {
			if (other.totalItemVenda != null)
				return false;
		} else if (!totalItemVenda.equals(other.totalItemVenda))
			return false;
		if (venda == null) {
			if (other.venda != null)
				return false;
		} else if (!venda.equals(other.venda))
			return false;
		return true;
	}

}
