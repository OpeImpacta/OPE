package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Modelo;

/**
 * @author Stefany Souza
 */
public class ModeloDAO extends GenericDAO<Modelo> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ModeloDAO() {
		super(Modelo.class);
	}
	
}
