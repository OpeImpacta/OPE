package br.edu.impacta.controller;

import java.io.Serializable;
import javax.inject.Named;
import org.omnifaces.cdi.ViewScoped;
import br.edu.impacta.dao.MontadoraDAO;
import br.edu.impacta.entity.Montadora;

/**
 * @author Paulo Pasinato
 */

@Named(value = "montadoraControl")
@ViewScoped
public class MontadoraController extends BasicControlCad<Montadora> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private static MontadoraDAO montadoraDAO = new MontadoraDAO();
	
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
	public MontadoraController() throws Exception {
		super(Montadora.class,  montadoraDAO);
	}

	public boolean isDisableButton() {
		return disableButton;
	}

	public void setDisableButton(boolean disableButton) {
		this.disableButton = disableButton;
	}
	
	//Ao gravar fexa o dialog na tela
	@Override
	public void treatRecord() {
		super.treatRecord();
		UtilityTela.executarJavascript("PF('dlgCadastro').hide()");
	}

}
