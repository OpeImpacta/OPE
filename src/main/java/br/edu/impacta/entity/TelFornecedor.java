package br.edu.impacta.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * @author Stefany Souza
 */

@Entity
@Table(name = "Tel_Fornecedor")
public class TelFornecedor implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idTelFornecedor;
	
	@Column(name = "numero", nullable = false, length = 15)
	private String numero;
	
	@Column(name =  "complemento", nullable = true, length = 20)
	private String complemento;
	
	@Column(name = "tipo", nullable = false, length = 15)
	private String tipo;
	
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name = "idFornecedor")
	private Fornecedor fornecedor;

	public TelFornecedor() {}

	public TelFornecedor(Integer idTelFornecedor, String numero, String complemento, String tipo, Fornecedor fornecedor) {
		this.idTelFornecedor = idTelFornecedor;
		this.numero = numero;
		this.complemento = complemento;
		this.tipo = tipo;
		this.fornecedor = fornecedor;
	}

	public Integer getIdTelFornecedor() {
		return idTelFornecedor;
	}

	public void setIdTelFornecedor(Integer idTelFornecedor) {
		this.idTelFornecedor = idTelFornecedor;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Fornecedor getFornecedor() {
		if(fornecedor == null){
			fornecedor = new Fornecedor();
		}
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idTelFornecedor == null) ? 0 : idTelFornecedor.hashCode());
		result = prime * result + ((numero == null) ? 0 : numero.hashCode());
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
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
		TelFornecedor other = (TelFornecedor) obj;
		if (idTelFornecedor == null) {
			if (other.idTelFornecedor != null)
				return false;
		} else if (!idTelFornecedor.equals(other.idTelFornecedor))
			return false;
		if (numero == null) {
			if (other.numero != null)
				return false;
		} else if (!numero.equals(other.numero))
			return false;
		if (tipo == null) {
			if (other.tipo != null)
				return false;
		} else if (!tipo.equals(other.tipo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TelFornecedor [idTelFornecedor=" + idTelFornecedor + "]";
	}
	
}
