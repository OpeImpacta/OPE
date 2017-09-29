package br.edu.impacta.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "Tel_Cliente")
public class TelCliente implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idTelCliente;
	
	@Column(name = "numero", nullable = false, length = 15)
	private String numero;
	
	@Column(name =  "complemento", nullable = true, length = 20)
	private String complemento;
	
	@Column(name = "tipo", nullable = false, length = 15)
	private String tipo;
	
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, fetch = FetchType.LAZY)
	@JoinColumn(name = "idCliente")
	private Cliente cliente;

	public TelCliente() {}

	public TelCliente(Integer idTelCliente, String numero, String complemento, String tipo, Cliente cliente) {
		this.idTelCliente = idTelCliente;
		this.numero = numero;
		this.complemento = complemento;
		this.tipo = tipo;
		this.cliente = cliente;
	}

	public Integer getIdTelCliente() {
		return idTelCliente;
	}

	public void setIdTelCliente(Integer idTelCliente) {
		this.idTelCliente = idTelCliente;
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

	public Cliente getCliente() {
		if(cliente == null){
			cliente = new Cliente();
		}
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idTelCliente == null) ? 0 : idTelCliente.hashCode());
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
		TelCliente other = (TelCliente) obj;
		if (idTelCliente == null) {
			if (other.idTelCliente != null)
				return false;
		} else if (!idTelCliente.equals(other.idTelCliente))
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
		return "TelCliente [idTelCliente=" + idTelCliente + "]";
	}
	
}
