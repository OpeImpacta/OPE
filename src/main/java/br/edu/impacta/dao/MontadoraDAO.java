package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Montadora;

/**
 * @author Paulo Pasinato
 */
public class MontadoraDAO extends GenericDAO<Montadora> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public MontadoraDAO() {
		super(Montadora.class);
	}
	
}
