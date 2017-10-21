package br.edu.impacta.dao;

import java.io.Serializable;

import javax.persistence.Query;

import br.edu.impacta.entity.Usuario;

public class UsuarioDAO extends GenericDAO<Usuario> implements Serializable {
	private static final long serialVersionUID = 1L;

	public UsuarioDAO() {
		super(Usuario.class);
	}
	
	public Usuario getUsuarioByLoginPassword(String login, String password) {
		try {
			String jpql = "from Usuario usr where usr.email = '"+login+"' and usr.senha = '"+password+"'";
			Query q = getEntityManager().createQuery(jpql);
			return (Usuario)q.getSingleResult();
		} catch(Exception ex) {
			return null;
		}
	}
	
	public Boolean findByEmail(String email){
		String jpql = "from Usuario u where u.email = ? ";
		Usuario usuario = findOne(jpql, email);
		
		if(usuario == null)
			return true;
		
		return false;
	}
}