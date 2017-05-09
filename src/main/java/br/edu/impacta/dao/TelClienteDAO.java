package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.TelCliente;

/**
 * @author Stefany Souza
 */
public class TelClienteDAO extends GenericDAO<TelCliente> implements Serializable {

	private static final long serialVersionUID = 1L;

	public TelClienteDAO() {
		super(TelCliente.class);
	}
	
}
