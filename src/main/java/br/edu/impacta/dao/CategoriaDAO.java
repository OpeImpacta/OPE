package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Categoria;

/**
 * @author Stefany Souza
 */
public class CategoriaDAO extends GenericDAO<Categoria> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CategoriaDAO() {
		super(Categoria.class);
	}
	
}
