package br.edu.impacta.entity;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * @author Paulo Pasinato
 */

@Entity
@Table(name = "imagem")
@NamedQueries({
	@NamedQuery(name = "Imagem.findAll", query = "SELECT i FROM Imagem i ")
})
public class Imagem implements Serializable {
	
	private static final long serialVersionUID = 8317633278916954682L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_imagem")
	private Integer idImagem;
	
	@Lob
    @Column(name = "foto")
    private byte[] foto;
	
	@Column(name="nome", nullable =  false, length =  50)
	private String nome;
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Produto produto;
	
	public Imagem() {}
	
	public Imagem(byte[] foto, Produto produto, String nome) {
		this.foto = foto;
		this.produto = produto;
		this.nome = nome;
	}

	public Imagem(Integer idImagem, byte[] foto) {
		super();
		this.idImagem = idImagem;
		this.foto = foto;
	}

	public Integer getIdImagem() {
		return idImagem;
	}


	public void setIdImagem(Integer idImagem) {
		this.idImagem = idImagem;
	}


	public byte[] getFoto() {
		return foto;
	}


	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(foto);
		result = prime * result + ((idImagem == null) ? 0 : idImagem.hashCode());
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
		Imagem other = (Imagem) obj;
		if (!Arrays.equals(foto, other.foto))
			return false;
		if (idImagem == null) {
			if (other.idImagem != null)
				return false;
		} else if (!idImagem.equals(other.idImagem))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Imagem [idImagem=" + idImagem + ", foto=" + Arrays.toString(foto) + "]";
	}
}

