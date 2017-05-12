package br.edu.impacta.entity;

import java.io.Serializable;
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

	@Column(name="ativo")
	private boolean ativo = true;
	
	@OneToOne
    @JoinColumn(name = "id_categoria", referencedColumnName = "id_categoria")
    private Categoria categoria;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name = "id_imagem", referencedColumnName = "id_imagem")
	private Imagem imagem;
	
	@OneToMany(mappedBy="produto", cascade = {CascadeType.ALL}, fetch = FetchType.EAGER, orphanRemoval = true )
	private List<ProdutoModelo> produtoModeloList;
	
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
