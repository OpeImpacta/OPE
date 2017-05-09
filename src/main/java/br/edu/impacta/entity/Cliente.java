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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Stefany Souza
 */

@Entity
@Table(name = "CLIENTE")
@NamedQueries({
	@NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c ")
})
public class Cliente implements Serializable {
	
	private static final long serialVersionUID = 8317633278916954682L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_cliente")
	private Integer idCliente;
	
	@Column(name="nome", nullable =  false, length =  50)
	private String nome;
	
	@Column(name="email", nullable =  true, length =  50)
	private String email;
	
	@Column(name="cpf", nullable =  false, length =  14)
	private String cpf;

	@Column(name="senha", nullable =  true, length =  100)
	private String senha;

	@Column(name="ativo")
	private boolean ativo = true;
	
	@OneToMany(mappedBy = "cliente", cascade = {CascadeType.PERSIST, CascadeType.MERGE}, fetch = FetchType.EAGER, orphanRemoval = true )
	private List<TelCliente> telefones;
	
	public Cliente() {}

	public Cliente(Integer idCliente, String nome, String email, String cpf, String senha, boolean ativo,
			List<TelCliente> telefones) {
		this.idCliente = idCliente;
		this.nome = nome;
		this.email = email;
		this.cpf = cpf;
		this.senha = senha;
		this.ativo = ativo;
		this.telefones = telefones;
	}
	
	//Adiciona telefone na lista
	public void addTelefone(TelCliente telCliente){
		if(telefones == null){
			telefones = new ArrayList<>();
		}
		telCliente.setCliente(this);
		telefones.add(telCliente);
	}
	
	//Remove telefone da lista
	public void delTelefone(TelCliente telCliente){
		if(telefones != null){
			telefones.remove(telCliente);
		}
	}

	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public List<TelCliente> getTelefones() {
		if(telefones == null){
			telefones = new ArrayList<>();
		}
		return telefones;
	}

	public void setTelefones(List<TelCliente> telefones) {
		this.telefones = telefones;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cpf == null) ? 0 : cpf.hashCode());
		result = prime * result + ((idCliente == null) ? 0 : idCliente.hashCode());
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
		Cliente other = (Cliente) obj;
		if (cpf == null) {
			if (other.cpf != null)
				return false;
		} else if (!cpf.equals(other.cpf))
			return false;
		if (idCliente == null) {
			if (other.idCliente != null)
				return false;
		} else if (!idCliente.equals(other.idCliente))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Cliente [idCliente=" + idCliente + "]";
	}

}
