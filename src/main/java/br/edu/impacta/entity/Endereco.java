package br.edu.impacta.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * @author Stefany Souza
 */

@Entity
@Table(name = "ENDERECO")
@NamedQueries({
	@NamedQuery(name = "Endereco.findAll", query = "SELECT e FROM Endereco e ")
})
public class Endereco implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_endereco")
	private Integer idEndereco;
	
	@SerializedName("cep")
	@Expose
	@Column(name = "cep", length = 9)
	private String cep;
	
	@SerializedName("logradouro")
	@Expose
	@Column(name = "logradouro", length = 100)
	private String logradouro;
	
	@Column(name = "numero", length = 13)
	private Integer numero;
	
	@Column(name = "complemento", length = 20)
	private String complemento;
	
	@SerializedName("localidade")
	@Expose
	@Column(name = "cidade", length = 50)
	private String cidade;
	
	@SerializedName("uf")
	@Expose
	@Column(name = "estado", length = 10)
	private String estado;
	
	@SerializedName("bairro")
	@Expose
	@Column(name = "bairro", length = 50)
	private String bairro;

	
	public Endereco() {}

	public Endereco(Integer idEndereco, String cep, String logradouro, Integer numero, String complemento,
			String cidade, String estado, String bairro) {
		this.idEndereco = idEndereco;
		this.cep = cep;
		this.logradouro = logradouro;
		this.numero = numero;
		this.complemento = complemento;
		this.cidade = cidade;
		this.estado = estado;
		this.bairro = bairro;
	}
	
	

	public Integer getIdEndereco() {
		return idEndereco;
	}

	public void setIdEndereco(Integer idEndereco) {
		this.idEndereco = idEndereco;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idEndereco == null) ? 0 : idEndereco.hashCode());
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
		Endereco other = (Endereco) obj;
		if (idEndereco == null) {
			if (other.idEndereco != null)
				return false;
		} else if (!idEndereco.equals(other.idEndereco))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Endereco [idEndereco=" + idEndereco + "]";
	}
	
}
