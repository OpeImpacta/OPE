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

/**
 * @author Paulo Pasinato
 */

@Entity
@Table(name = "montadora")
@NamedQueries({
	@NamedQuery(name = "Montadora.findAll", query = "SELECT m FROM Montadora m ")
})
public class Montadora implements Serializable {
	
	private static final long serialVersionUID = 8317633278916954682L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_montadora")
	private Integer idMontadora;
	
	@Column(name="nome", nullable =  false, length =  50)
	private String nome;

	@Column(name="ativo")
	private boolean ativo = true;
	
	public Montadora() {}

	public Montadora(Integer idMontadora, String nome) {
		this.idMontadora = idMontadora;
		this.nome = nome;
	}

	public Integer getIdMontadora() {
		return idMontadora;
	}

	public void setIdMontadora(Integer idMontadora) {
		this.idMontadora = idMontadora;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result + ((idMontadora == null) ? 0 : idMontadora.hashCode());
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
		Montadora other = (Montadora) obj;
		if (ativo != other.ativo)
			return false;
		if (idMontadora == null) {
			if (other.idMontadora != null)
				return false;
		} else if (!idMontadora.equals(other.idMontadora))
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
		return "Montadora [idMontadora=" + idMontadora + "]";
	}

	
	
}
