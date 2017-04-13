package br.edu.impacta.controller;

import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.PostActivate;
import javax.inject.Named;
import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.CategoriaDAO;
import br.edu.impacta.entity.Categoria;

/**
 * @author Stefany Souza
 */

@Named(value = "categoriaControl")
@ViewScoped
public class CategoriaController extends BasicControlCad<Categoria> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private static CategoriaDAO categoriaDAO = new CategoriaDAO();
	
	private boolean disableButton = true;
	
	//Quando seleciona a linha habilita o botão cancelar e visualizar
	public void onRowSelect(){
		disableButton = false;
	}
	
	//Quando seleciona a linha habilita o botão cancelar e visualizar
		public void unRowSelect(){
			disableButton = true;
		}
	
	// *******************************************
    // * Alterar somente neste construtor
    // *******************************************
	public CategoriaController() throws Exception {
		super(Categoria.class,  categoriaDAO);
	}

	@PostConstruct
	@PostActivate
	public void init(){

	}

	public boolean isDisableButton() {
		return disableButton;
	}

	public void setDisableButton(boolean disableButton) {
		this.disableButton = disableButton;
	}

}
