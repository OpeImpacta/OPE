package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.TelFornecedor;

/**
 * @author Stefany Souza
 */
public class TelFornecedorDAO extends GenericDAO<TelFornecedor> implements Serializable {

	private static final long serialVersionUID = 1L;

	public TelFornecedorDAO() {
		super(TelFornecedor.class);
	}
	
}
