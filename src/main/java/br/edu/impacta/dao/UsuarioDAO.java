package br.edu.impacta.dao;

import java.io.Serializable;

import br.edu.impacta.entity.Usuario;

public class UsuarioDAO extends GenericDAO<Usuario> implements Serializable {
	private static final long serialVersionUID = 1L;

	public UsuarioDAO() {
		super(Usuario.class);
	}
}