package br.edu.impacta.dao;

import java.io.Serializable;
import java.util.List;

import br.edu.impacta.entity.Venda;

/**
 * @author Stefany Souza
 */
public class VendaDAO extends GenericDAO<Venda> implements Serializable {

	
	private static final long serialVersionUID = 1L;

	public VendaDAO() {
		super(Venda.class);
	}
	
	
	public List<Venda> findOrcamentosPendentes(){
		String jpql = "from Venda v where (v.aprovado = 1) and (v.ativo = 1) and (v.finalizado = 0) and (v.tipo = 2)";
		return find(jpql);
	}
	
	public List<Venda> findVendasCanceladas(){
		String jpql = "from Venda v where (v.ativo = 0) and (v.tipo = 1)";
		return find(jpql);
	}
	
	public List<Venda> findVendasRealizadas() {
		String jpql = "from Venda v where (v.ativo = 1) and (v.tipo = 1)";
		return find(jpql);
	}
	
	public List<Venda> findVendasTodas() {
		String jpql = "from Venda v where v.tipo = 1";
		return find(jpql);
	}
	
}
