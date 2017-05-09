package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Fornecedor;

/**
 * @author Stefany Souza
 */
public class FornecedorDAO extends GenericDAO<Fornecedor> implements Serializable {

	private static final long serialVersionUID = 1L;

	public FornecedorDAO() {
		super(Fornecedor.class);
	}
	
}
