package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Imagem;

/**
 * @author Paulo Pasinato
 */
public class ImagemDAO extends GenericDAO<Imagem> implements Serializable {

	private static final long serialVersionUID = 1L;

	public ImagemDAO() {
		super(Imagem.class);
	}
	
}
