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
	
	public Boolean findByEmail(String email){
		String jpql = "from Cliente c where c.email = '" + email + "'";
		Cliente cliente = findOne(jpql);
		
		if(cliente == null)
			return true;
		
		return false;
	}
	
}
