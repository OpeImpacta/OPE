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
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Stefany Souza
 */

@Entity
@Table(name = "FORNECEDOR")
@NamedQueries({
	@NamedQuery(name = "Fornecedor.findAll", query = "SELECT f FROM Fornecedor f ")
})
public class Fornecedor implements Serializable {

	private static final long serialVersionUID = 8317633278916954682L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_fornecedor")
	private Integer idFornecedor;

	@Column(name="razao_social", nullable =  false, length =  100)
	private String razaoSocial;

	@Column(name="nome_fantasia", nullable =  true, length =  100)
	private String nomeFantasia;

	@Column(name="cnpj", nullable =  true, length =  18)
	private String cnpj;

	@Column(name="ie", nullable =  true, length =  12)
	private String ie;

	@Column(name="email", nullable =  true, length =  50)
	private String email;
	
	@Column(name="ativo")
	private boolean ativo = true;

	@OneToMany(mappedBy = "fornecedor", cascade = {CascadeType.PERSIST, CascadeType.MERGE}, fetch = FetchType.EAGER, orphanRemoval = true )
	private List<TelFornecedor> telefones;

	@OneToOne(cascade = CascadeType.ALL, optional = true, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name = "id_endereco", referencedColumnName = "id_endereco")
	private Endereco endereco;	

	public Fornecedor() {}

	public Fornecedor(Integer idFornecedor, String razaoSocial) {
		super();
		this.idFornecedor = idFornecedor;
		this.razaoSocial = razaoSocial;
	}

	//Adiciona telefone na lista
	public void addTelefone(TelFornecedor telFornecedor){
		if(telefones == null){
			telefones = new ArrayList<>();
		}
		telFornecedor.setFornecedor(this);
		telefones.add(telFornecedor);
	}

	//Remove telefone da lista
	public void delTelefone(TelFornecedor telFornecedor){
		if(telefones != null){
			telefones.remove(telFornecedor);
		}
	}


	public Integer getIdFornecedor() {
		return idFornecedor;
	}

	public void setIdFornecedor(Integer idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getIe() {
		return ie;
	}

	public void setIe(String ie) {
		this.ie = ie;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public List<TelFornecedor> getTelefones() {
		if(telefones == null){
			telefones = new ArrayList<>();
		}
		return telefones;
	}

	public void setTelefones(List<TelFornecedor> telefones) {
		this.telefones = telefones;
	}

	public Endereco getEndereco() {
		if(endereco == null){
			endereco = new Endereco();
		}
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idFornecedor == null) ? 0 : idFornecedor.hashCode());
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
		Fornecedor other = (Fornecedor) obj;
		if (idFornecedor == null) {
			if (other.idFornecedor != null)
				return false;
		} else if (!idFornecedor.equals(other.idFornecedor))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Fornecedor [idFornecedor=" + idFornecedor + "]";
	}

}
