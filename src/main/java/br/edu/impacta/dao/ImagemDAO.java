package br.edu.impacta.dao;

import java.io.Serializable;
import java.util.List;

import br.edu.impacta.entity.Imagem;
import br.edu.impacta.entity.Produto;

/**
 * @author Paulo Pasinato
 */
public class ImagemDAO extends GenericDAO<Imagem> implements Serializable {

	private static final long serialVersionUID = 1L;

	public ImagemDAO() {
		super(Imagem.class);
	}
	
	public List<Imagem> findImagemByProduto(Produto produto){
		String jpql = "from Imagem i where i.produto = " + produto.getIdProduto();
		return find(jpql);
	}
	
}
