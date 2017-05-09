package br.edu.impacta.controller;

import java.io.Serializable;
import javax.inject.Named;
import org.omnifaces.cdi.ViewScoped;
import br.edu.impacta.dao.ModeloDAO;
import br.edu.impacta.entity.Modelo;

/**
 * @author Paulo Pasinato
 */

@Named(value = "modeloControl")
@ViewScoped
public class ModeloController extends BasicControlCad<Modelo> implements Serializable {

	private static final long serialVersionUID = 1L;

	private static ModeloDAO modeloDAO = new ModeloDAO();

	private boolean disableButton = true;

	// Quando seleciona a linha habilita o botão cancelar e visualizar
	public void onRowSelect() {
		disableButton = false;
	}

	// Quando seleciona a linha habilita o botão cancelar e visualizar
	public void unRowSelect() {
		disableButton = true;
	}

	// *******************************************
	// * Alterar somente neste construtor
	// *******************************************
	public ModeloController() throws Exception {
		super(Modelo.class, modeloDAO);
	}

	public boolean isDisableButton() {
		return disableButton;
	}

	public void setDisableButton(boolean disableButton) {
		this.disableButton = disableButton;
	}

	// Ao gravar fexa o dialog na tela
	@Override
	public void treatRecord() {
		super.treatRecord();
		UtilityTela.executarJavascript("PF('dlgCadastro').hide()");
	}

}
