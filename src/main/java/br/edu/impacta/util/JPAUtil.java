package br.edu.impacta.util;
import java.io.Serializable;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class JPAUtil implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private EntityManagerFactory factory;

	private static JPAUtil instance;

	private JPAUtil() {
		this.factory = Persistence.createEntityManagerFactory("unit_app");
	}

	//synchronized: apenas p/ dizer q é um metodo sincronizado
	public static synchronized JPAUtil getInstance() {
		//Garante q  só teremos uma instancia da entidade
		if (instance == null) {
			instance = new JPAUtil();
		}
		return instance;
	}
	
	public EntityManager getEntityManager() {
		return factory.createEntityManager();
	}
}
