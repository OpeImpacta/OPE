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
    private Integer id_item_venda;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Venda venda;

	@Column(name = "quantidade", nullable = true)
	private Integer quantidade;
	
	@JoinColumn(name = "id_produto", referencedColumnName = "id_produto")
	@ManyToOne(optional = true, fetch = FetchType.EAGER)
	private Produto produto;
	
	@Transient
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

	
	public Integer getId_item_venda() {
		return id_item_venda;
	}

	public void setId_item_venda(Integer id_item_venda) {
		this.id_item_venda = id_item_venda;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id_item_venda == null) ? 0 : id_item_venda.hashCode());
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
		ItemVenda other = (ItemVenda) obj;
		if (id_item_venda == null) {
			if (other.id_item_venda != null)
				return false;
		} else if (!id_item_venda.equals(other.id_item_venda))
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
		return "ItemVenda [id_item_venda=" + id_item_venda + "]";
	}
	

}
