package br.edu.impacta.dao;

import java.io.Serializable;
import br.edu.impacta.entity.Produto;

/**
 * @author Paulo Pasinato
 */
public class ProdutoDAO extends GenericDAO<Produto> implements Serializable {

	private static final long serialVersionUID = 1L;

	public ProdutoDAO() {
		super(Produto.class);
	}
	
}
