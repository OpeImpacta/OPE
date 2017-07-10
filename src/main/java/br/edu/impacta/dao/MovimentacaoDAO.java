package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Movimentacao;

/**
 * @author Stefany Souza
 */
public class MovimentacaoDAO extends GenericDAO<Movimentacao> implements Serializable {


	private static final long serialVersionUID = 1L;

	public MovimentacaoDAO() {
		super(Movimentacao.class);
	}
}


