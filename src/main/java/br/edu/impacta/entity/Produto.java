package br.edu.impacta.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author Paulo Pasinato
 */

@Entity
@Table(name = "produto")
@NamedQueries({
	@NamedQuery(name = "Produto.findAll", query = "SELECT p FROM Produto p ")
})
public class Produto implements Serializable {

	private static final long serialVersionUID = 8317633278916954682L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_produto")
	private Integer idProduto;

	@Column(name="nome", nullable =  false, length =  50)
	private String nome;

	@Column(name = "quantidade", nullable = true)
	private Integer quantidade;

	@Column(name = "qtd_minima", nullable = true)
	private Integer qtdMinima;

	@Column(name = "mostra_vitrine", nullable = true)
	private Boolean mostraVitrine;

	@Column(name = "preco_compra", nullable = true)
	private BigDecimal precoCompra;

	@Column(name =  "preco_venda", nullable = true)
	private BigDecimal precoVenda;

	@Column(name = "margem", nullable = true)
	private BigDecimal margem;

	@Column(name = "controla_estoque")
	private Boolean controlaEstoque;

	@Column(name="ativo")
	private boolean ativo = true;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_categoria", referencedColumnName = "id_categoria")
	private Categoria categoria;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name = "id_imagem", referencedColumnName = "id_imagem")
	private Imagem imagem;

	@OneToMany(mappedBy="produto", cascade = {CascadeType.ALL}, fetch = FetchType.EAGER, orphanRemoval = true )
	private List<ProdutoModelo> produtoModeloList;

	@Transient
	private String precoVendaFormatado;


	public Produto() {}

	public Produto(Integer idProduto, String nome, boolean ativo) {
		super();
		this.idProduto = idProduto;
		this.nome = nome;
		this.ativo = ativo;
	}

	public Integer getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Integer getQtdMinima() {
		return qtdMinima;
	}

	public void setQtdMinima(Integer qtdMinima) {
		this.qtdMinima = qtdMinima;
	}

	public Boolean getMostraVitrine() {
		return mostraVitrine;
	}

	public void setMostraVitrine(Boolean mostraVitrine) {
		this.mostraVitrine = mostraVitrine;
	}

	public BigDecimal getPrecoCompra() {
		return precoCompra;
	}

	public void setPrecoCompra(BigDecimal precoCompra) {
		this.precoCompra = precoCompra;
	}

	public BigDecimal getPrecoVenda() {
		return precoVenda;
	}

	public void setPrecoVenda(BigDecimal precoVenda) {
		this.precoVenda = precoVenda;
	}

	public BigDecimal getMargem() {
		return margem;
	}

	public void setMargem(BigDecimal margem) {
		this.margem = margem;
	}

	public Boolean getControlaEstoque() {
		return controlaEstoque;
	}

	public void setControlaEstoque(Boolean controlaEstoque) {
		this.controlaEstoque = controlaEstoque;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Imagem getImagem() {
		if (imagem == null) {
			this.imagem = new Imagem();
		}
		return imagem;
	}

	public void setImagem(Imagem imagem) {
		this.imagem = imagem;
	}	

	public List<ProdutoModelo> getProdutoModeloList() {
		if(produtoModeloList == null){
			produtoModeloList = new ArrayList<>();
		}
		return produtoModeloList;
	}

	public void setProdutoModeloList(List<ProdutoModelo> produtoModeloList) {
		this.produtoModeloList = produtoModeloList;
	}

	public String getPrecoVendaFormatado() {
		if (this.precoVenda != null) {
			return NumberFormat.getCurrencyInstance().format(precoVenda);
		}
		return precoVendaFormatado;
	}

	public void setPrecoVendaFormatado(String precoVendaFormatado) {
		this.precoVendaFormatado = precoVendaFormatado;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result + ((idProduto == null) ? 0 : idProduto.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
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
		Produto other = (Produto) obj;
		if (ativo != other.ativo)
			return false;
		if (idProduto == null) {
			if (other.idProduto != null)
				return false;
		} else if (!idProduto.equals(other.idProduto))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Produto [idProduto=" + idProduto + ", nome=" + nome + ", ativo=" + ativo + ", idImagem=" + "]";
	}
}
