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
 * @author Stefany Souza
 */

@Entity
@Table(name = "config_email")
@NamedQueries({
	@NamedQuery(name = "ConfigEmail.findAll", query = "SELECT c FROM ConfigEmail c ")
})
public class ConfigEmail implements Serializable {

	private static final long serialVersionUID = 8317633278916954682L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_config")
	private Integer idConfig;

	@Column(name="email", nullable = false, length =  50)
	private String email;

	@Column(name="usuario", nullable = false, length =  50)
	private String usuario;

	@Column(name="senha", nullable = false, length =  50)
	private String senha;

	@Column(name="nome", nullable = false, length =  50)
	private String nome;

	@Column(name="servidor", nullable = false, length =  50)
	private String servidor;

	@Column(name="porta_smtp", nullable = false, length =  5)
	private String portaSmtp;
	
	@Column(name="assinatura", nullable = true, length = 3000)
    private String assinatura;
	
	@Column(name="assunto", nullable = true, length = 50)
    private String assunto;

	
	public ConfigEmail() {}


	public ConfigEmail(Integer idConfig) {
		super();
		this.idConfig = idConfig;
	}


	public Integer getIdConfig() {
		return idConfig;
	}


	public void setIdConfig(Integer idConfig) {
		this.idConfig = idConfig;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUsuario() {
		return usuario;
	}


	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}


	public String getSenha() {
		return senha;
	}


	public void setSenha(String senha) {
		this.senha = senha;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getServidor() {
		return servidor;
	}


	public void setServidor(String servidor) {
		this.servidor = servidor;
	}


	public String getPortaSmtp() {
		return portaSmtp;
	}


	public void setPortaSmtp(String portaSmtp) {
		this.portaSmtp = portaSmtp;
	}


	public String getAssinatura() {
		return assinatura;
	}


	public void setAssinatura(String assinatura) {
		this.assinatura = assinatura;
	}


	public String getAssunto() {
		return assunto;
	}


	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idConfig == null) ? 0 : idConfig.hashCode());
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
		ConfigEmail other = (ConfigEmail) obj;
		if (idConfig == null) {
			if (other.idConfig != null)
				return false;
		} else if (!idConfig.equals(other.idConfig))
			return false;
		return true;
	}
	

	@Override
	public String toString() {
		return "ConfigEmail [idConfig=" + idConfig + "]";
	}


}
