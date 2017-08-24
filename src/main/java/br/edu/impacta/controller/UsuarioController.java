package br.edu.impacta.controller;

import java.io.Serializable;

import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.UsuarioDAO;
import br.edu.impacta.entity.Usuario;

@Named(value = "usuarioControl")
@ViewScoped
public class UsuarioController extends BasicControlCad<Usuario> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private static UsuarioDAO usuarioDAO = new UsuarioDAO();
	private boolean disableButton = true;
	
	private Boolean renderedSenha;

	// Quando seleciona a linha habilita o bot�o cancelar e visualizar
	public void onRowSelect() {
		disableButton = false;
	}

	// Quando seleciona a linha habilita o bot�o cancelar e visualizar
	public void unRowSelect() {
		disableButton = true;
	}

	public UsuarioController() throws Exception {
		super(Usuario.class, usuarioDAO);
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
		renderedSenha = false;
		UtilityTela.executarJavascript("PF('dlgCadastro').hide()");
	}
	
	@Override
	public void doStartAddRecord() throws Exception {
		renderedSenha = true;
		super.doStartAddRecord();
	}

	public Boolean getRenderedSenha() {
		return renderedSenha;
	}

	public void setRenderedSenha(Boolean renderedSenha) {
		this.renderedSenha = renderedSenha;
	}
	
}