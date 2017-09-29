package br.edu.impacta.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.edu.impacta.util.JPAUtil;
/**
 * @author Stefany Souza
 */
public abstract class GenericDAO<T> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Class<T> aClass;

	protected GenericDAO(Class<T> aClass) {
		this.aClass = aClass;
	}

	protected EntityManager getEntityManager() {
		return JPAUtil.getInstance().getEntityManager();
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();

		Query query = manager.createQuery("from " + aClass.getSimpleName());
		
		List<T> entities = query.getResultList();
		
		manager.getTransaction().commit();
		manager.close();
		
		return entities;
	}

	@SuppressWarnings("unchecked")
	public List<T> findAtivos() {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();

		Query query = manager.createQuery(" from " + aClass.getSimpleName() + " c where c.ativo = 1");
		
		List<T> entities = query.getResultList();
		
		manager.getTransaction().commit();
		manager.close();
		
		return entities;
	}

	
	@SuppressWarnings("unchecked")
	public T findOne(String jpql, Object... params) {

		EntityManager manager = getEntityManager();
		//Inicia a transação
		manager.getTransaction().begin();

		//Criação da Query
		Query query = manager.createQuery(jpql);

		for (int i = 0; i < params.length; i++) {
			query.setParameter(i+1, params[i]);
		}

		T entity = (T) query.getSingleResult();

		//Executa a ação
		manager.getTransaction().commit();
		manager.close();

		//Retorna o que foi pedido no comando SQL
		return entity;
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String jpql, Object... params) {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();

		Query query = manager.createQuery(jpql);

		for (int i = 0; i < params.length; i++) {
			query.setParameter(i+1, params[i]);
		}

		List<T> entities = query.getResultList();

		manager.getTransaction().commit();
		manager.close();

		return entities;
	}

	public T findById(Integer id) {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();

		T entity = (T) manager.find(aClass, id);

		manager.getTransaction().commit();
		manager.close();

		return entity; 
	}

	public T save(T entity) {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();
		manager.persist(entity);
		manager.getTransaction().commit();
		manager.close();
		
		return entity;
	}

	public void update(T entity) {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();
		manager.merge(entity);
		manager.getTransaction().commit();
		manager.close();
	}

	public void delete(Integer id) {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();
		manager.remove(manager.getReference(aClass, id));
		manager.getTransaction().commit();
		manager.close();
	}

	public void delete(T entity) {
		EntityManager manager = getEntityManager();
		manager.getTransaction().begin();
		manager.remove(manager.merge(entity));
		manager.getTransaction().commit();
		manager.close();
	}

}
