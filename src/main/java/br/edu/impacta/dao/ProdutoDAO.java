package br.edu.impacta.dao;

import java.io.Serializable;
import java.util.List;

import br.edu.impacta.entity.Produto;

/**
 * @author Paulo Pasinato
 */
public class ProdutoDAO extends GenericDAO<Produto> implements Serializable {

	private static final long serialVersionUID = 1L;

	public ProdutoDAO() {
		super(Produto.class);
	}
	
	public List<Produto> findEstoqueMinimo(){
		String jpql = "from Produto p where p.qtdMinima = p.quantidade";
		return find(jpql);
	}
	
	public List<Produto> findSemEstoque(){
		String jpql = "from Produto p where p.quantidade = 0";
		return find(jpql);
	}
	
	public List<Produto> findEstoqueBom(){
		String jpql = "from Produto p where p.quantidade > p.qtdMinima";
		return find(jpql);
	}
	
}