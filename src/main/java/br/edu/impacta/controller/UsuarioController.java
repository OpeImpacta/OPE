package br.edu.impacta.controller;

import java.io.Serializable;

import javax.inject.Inject;
import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.UsuarioDAO;
import br.edu.impacta.entity.Usuario;

@Named(value = "usuarioControl")
@ViewScoped
public class UsuarioController extends BasicControlCad<Usuario> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private static UsuarioDAO usuarioDAO = new UsuarioDAO();
	
	@Inject
	private LoginController loginControl;
	
	private boolean disableButton = true;
	
	private String senhaAtual;
	private String senhaNova;

	// Quando seleciona a linha habilita o botão cancelar e visualizar
	public void onRowSelect() {
		disableButton = false;
	}

	// Quando seleciona a linha habilita o botão cancelar e visualizar
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
		UtilityTela.executarJavascript("PF('dlgCadastro').hide()");
	}
	
	
	public void alterarSenha() {
		Usuario usuario = loginControl.getUsuarioLogado();
		if(senhaAtual.equalsIgnoreCase(usuario.getSenha())) {
			if(senhaNova.equalsIgnoreCase(usuario.getSenha())) {
				UtilityTela.criarMensagemErroSemDetail("A nova senha não pode ser igual a senha atual!");
				return;
			}
		} else {
			UtilityTela.criarMensagemErroSemDetail("A senha atual está incorreta!");
			return;
		}	
		usuario.setSenha(senhaNova);
		setSelected(usuario);
		super.treatRecord();
		senhaAtual = "";
		senhaNova = "";
	}
	
	//verifica se o email já esta cadastrado
	public void verificaEmail(){
		if(((Usuario)getSelected()).getEmail() != null){
			if(!usuarioDAO.findByEmail(((Usuario)getSelected()).getEmail())){
				((Usuario)getSelected()).setEmail(null);
				UtilityTela.criarMensagemErro("Erro!", "E-mail em uso por outro usuário.");
			}
		}
	}

	public String getSenhaAtual() {
		return senhaAtual;
	}

	public void setSenhaAtual(String senhaAtual) {
		this.senhaAtual = senhaAtual;
	}

	public String getSenhaNova() {
		return senhaNova;
	}

	public void setSenhaNova(String senhaNova) {
		this.senhaNova = senhaNova;
	}
}