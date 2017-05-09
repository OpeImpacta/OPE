package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Cliente;

/**
 * @author Stefany Souza
 */
public class ClienteDAO extends GenericDAO<Cliente> implements Serializable {

	private static final long serialVersionUID = 1L;

	public ClienteDAO() {
		super(Cliente.class);
	}
	
}
