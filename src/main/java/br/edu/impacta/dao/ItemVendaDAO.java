package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.ItemVenda;

/**
 * @author Stefany Souza
 */
public class ItemVendaDAO extends GenericDAO<ItemVenda> implements Serializable {

	
	private static final long serialVersionUID = 1L;

	public ItemVendaDAO() {
		super(ItemVenda.class);
	}
	
}
