package br.edu.impacta.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.edu.impacta.entity.Dashboard;
import br.edu.impacta.entity.ItemVenda;
import br.edu.impacta.entity.Venda;

/**
 * @author Stefany Souza
 */
public class VendaDAO extends GenericDAO<Venda> implements Serializable {

	
	private static final long serialVersionUID = 1L;

	public VendaDAO() {
		super(Venda.class);
	}
	
	public Venda findVendaById(Integer id) {
		String jpql = "from Venda v where v.idVenda = ?";
		return findOne(jpql, id);
	}
	
	public List<Venda> findOrcamentosPendentes(){
		String jpql = "from Venda v where (v.aprovado = 1) and (v.ativo = 1) and (v.finalizado = 0) and (v.tipo = 2)";
		return find(jpql);
	}
	
	public List<Venda> findOrcamentosAguardAprovacao(){
		String jpql = "from Venda v where (v.aprovado = 0) and (v.ativo = 1) and (v.finalizado = 0) and (v.tipo = 2)";
		return find(jpql);
	}
	
	
	public List<Venda> findOrcamentosFinalizados(){
		String jpql = "from Venda v where (v.aprovado = 1) and (v.ativo = 1) and (v.finalizado = 1) and (v.tipo = 2)";
		return find(jpql);
	}
	
	
	public List<Venda> findVendasCanceladas(){
		String jpql = "from Venda v where (v.ativo = 0) and (v.tipo = 1)";
		return find(jpql);
	}
	
	public List<Venda> findOrcamentosCancelados(){
		String jpql = "from Venda v where (v.ativo = 0) and (v.tipo = 2)";
		return find(jpql);
	}
	
	public List<Venda> findVendasRealizadas() {
		String jpql = "from Venda v where (v.ativo = 1) and (v.tipo = 1)";
		return find(jpql);
	}
	
	public List<Venda> findOrcamentosAprovados() {
		String jpql = "from Venda v where (v.ativo = 1) and (v.tipo = 2) and (v.aprovado = 1) and (v.finalizado = 0)";
		return find(jpql);
	}
	
	public List<Venda> findVendasTodas() {
		String jpql = "from Venda v where v.tipo = 1";
		return find(jpql);
	}
	
	public List<Venda> findOrcamentosTodos() {
		String jpql = "from Venda v where v.tipo = 2";
		return find(jpql);
	}
	
	public List<Venda> getOrcamentoByDate(Date dataDe, Date dataAte){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String jpql = "from Venda v where v.tipo = 2 AND v.data BETWEEN '" + sdf.format(dataDe) + " 00:00:00.000"
                + "' AND '" + sdf.format(dataAte) + " 23:59:59.999'";
		return find(jpql);
	}
	
	public List<Venda> getVendaByDate(Date dataDe, Date dataAte){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String jpql = "from Venda v where v.tipo = 1 AND v.data BETWEEN '" + sdf.format(dataDe) + " 00:00:00.000"
                + "' AND '" + sdf.format(dataAte) + " 23:59:59.999'";
		return find(jpql);
	}

	
	@SuppressWarnings("unchecked")
	public Dashboard getDashVendas(String mes, String ano){
		
		String jpql = " select sum(v.total), count(v.total)  from Venda v where (v.ativo = 1) and (v.tipo = 1) "
				+ "and (month(v.data) = " + mes + ") and (year(v.data) = " + ano + ") ";
		
		EntityManager em = getEntityManager();
		Query query = em.createQuery(jpql);
		
		List<Object[]> result = query.getResultList();
		Dashboard dashboard = new Dashboard();
		
		for (Object[] objects : result) {
			dashboard.setTotalVendasVl((BigDecimal)objects[0]);
			dashboard.setTotalVendas((Long)objects[1]);
		}
		
		return dashboard;
	}
	
	@SuppressWarnings("unchecked")
	public Dashboard getDashOrcamentos(String mes, String ano){
		
		String jpql = " select sum(v.total), count(v.total)  from Venda v where (v.ativo = 1) and (v.tipo = 2) and (v.finalizado = 1) and (v.aprovado = 1) "
				+ "and (month(v.data) = " + mes + ") and (year(v.data) = " + ano + ") ";
		
		EntityManager em = getEntityManager();
		Query query = em.createQuery(jpql);
		
		List<Object[]> result = query.getResultList();
		Dashboard dashboard = new Dashboard();
		
		for (Object[] objects : result) {
			dashboard.setTotalOrcamentosVl((BigDecimal)objects[0]);
			dashboard.setTotalOrcamentos((Long)objects[1]);
		}
		
		return dashboard;
	}
	
	
}
