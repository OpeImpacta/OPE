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

@Entity
@Table(name = "Usuario")
@NamedQueries({
	@NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u ")
})
public class Usuario implements Serializable{
	private static final long serialVersionUID = 8317633278916954682L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(name="nome", nullable =  false, length =  255)
	private String nome;
	
	@Column(name="email", nullable =  false, length =  255)
	private String email;
	
	@Column(name="senha", nullable =  false, length =  50)
	private String senha;
	
	@Column(name="tipo")
	private int tipo;
	
	@Column(name="telefone", nullable =  true, length =  15)
	private String telefone;
	
	@Column(name="documento", nullable =  false, length =  20)
	private String documento;
	
	@Column(name="ativo", nullable =  false, length =  1)
	private boolean ativo;
	
	public Usuario() {}
	
	public Usuario(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public Usuario setNome(String nome) {
		this.nome = nome;
		return this;
	}

	public String getEmail() {
		return email;
	}

	public Usuario setEmail(String email) {
		this.email = email;
		return this;
	}

	public String getSenha() {
		return senha;
	}

	public Usuario setSenha(String senha) {
		this.senha = senha;
		return this;
	}

	public int getTipo() {
		return tipo;
	}

	public Usuario setTipo(int tipo) {
		this.tipo = tipo;
		return this;
	}

	public String getTelefone() {
		return telefone;
	}

	public Usuario setTelefone(String telefone) {
		this.telefone = telefone;
		return this;
	}

	public String getDocumento() {
		return documento;
	}

	public Usuario setDocumento(String documento) {
		this.documento = documento;
		return this;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public Usuario setAtivo(boolean ativo) {
		this.ativo = ativo;
		return this;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		
		Usuario other = (Usuario) obj;
		if (id == null) {
			if (other.id != null){
				return false;
			}
		} else if (!id.equals(other.id)){
			return false;
		}
		
		return true;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + "]";
	}
}
