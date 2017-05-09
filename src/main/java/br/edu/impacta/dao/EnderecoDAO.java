package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Endereco;

/**
 * @author Stefany Souza
 */
public class EnderecoDAO extends GenericDAO<Endereco> implements Serializable {

	private static final long serialVersionUID = 1L;

	public EnderecoDAO() {
		super(Endereco.class);
	}
	
}
