package br.edu.impacta.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Paulo Pasinato
 */

@Entity
@Table(name = "modelo")
@NamedQueries({
	@NamedQuery(name = "Modelo.findAll", query = "SELECT m FROM Modelo m ")
})
public class Modelo implements Serializable {
	
	private static final long serialVersionUID = 8317633278916954682L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_modelo")
	private Integer idModelo;
	
	@Column(name="nome", nullable =  false, length =  50)
	private String nome;

	@Column(name="ativo")
	private boolean ativo = true;
	
	@OneToOne
    @JoinColumn(name = "id_montadora", referencedColumnName = "id_montadora")
    private Montadora montadora;   

	public Modelo(Integer idModelo, String nome) {
		this.idModelo = idModelo;
		this.nome = nome;
	}
	
	public Modelo(){
	}

	public Integer getIdModelo() {
		return idModelo;
	}

	public void setIdModelo(Integer idModelo) {
		this.idModelo = idModelo;
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

	public Montadora getMontadora() {
		return montadora;
	}

	public void setMontadora(Montadora montadora) {
		this.montadora = montadora;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result + ((idModelo == null) ? 0 : idModelo.hashCode());
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
		Modelo other = (Modelo) obj;
		if (ativo != other.ativo)
			return false;
		if (idModelo == null) {
			if (other.idModelo != null)
				return false;
		} else if (!idModelo.equals(other.idModelo))
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
		return "Modelo [idModelo=" + idModelo + "]";
	}
}
