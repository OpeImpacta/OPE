package br.edu.impacta.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Paulo Pasinato
 */

@Entity
@Table(name = "produto_modelo")
public class ProdutoModelo implements Serializable {
	
	private static final long serialVersionUID = 8317633278916954682L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_produto_modelo")
	private Integer idProdutoModelo;
	
	@OneToOne
    @JoinColumn(name = "id_produto", referencedColumnName = "id_produto")
    private Produto produto;   
	
	@OneToOne
	@JoinColumn(name = "id_modelo", referencedColumnName = "id_modelo")
	private Modelo modelo;

	
	public ProdutoModelo(Integer idProdutoModelo, Produto produto, Modelo modelo) {
		super();
		this.idProdutoModelo = idProdutoModelo;
		this.produto = produto;
		this.modelo = modelo;
	}
	
	public ProdutoModelo(Produto produto, Modelo modelo) {
		super();
		this.produto = produto;
		this.modelo = modelo;
	}

	public ProdutoModelo(){
	}

	public Integer getIdProdutoModelo() {
		return idProdutoModelo;
	}

	public void setIdProdutoModelo(Integer idProdutoModelo) {
		this.idProdutoModelo = idProdutoModelo;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Modelo getModelo() {
		return modelo;
	}

	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idProdutoModelo == null) ? 0 : idProdutoModelo.hashCode());
		result = prime * result + ((modelo == null) ? 0 : modelo.hashCode());
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
		ProdutoModelo other = (ProdutoModelo) obj;
		if (idProdutoModelo == null) {
			if (other.idProdutoModelo != null)
				return false;
		} else if (!idProdutoModelo.equals(other.idProdutoModelo))
			return false;
		if (modelo == null) {
			if (other.modelo != null)
				return false;
		} else if (!modelo.equals(other.modelo))
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
		return "ProdutoModelo [idProdutoModelo=" + idProdutoModelo + ", produto=" + produto + ", modelo=" + modelo
				+ "]";
	}
}