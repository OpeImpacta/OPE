package br.edu.impacta.controller;

import java.io.IOException;
import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.enterprise.inject.Specializes;
import javax.inject.Named;

import org.omnifaces.util.Faces;
import org.omnifaces.util.Messages;

import com.github.adminfaces.template.session.AdminSession;

import br.edu.impacta.dao.UsuarioDAO;
import br.edu.impacta.entity.Usuario;

@Named(value="loginControl")
@SessionScoped
@Specializes
public class LoginController extends AdminSession implements Serializable {
	
	private static UsuarioDAO usuarioDAO = new UsuarioDAO();
	
	private String currentUser;
    private String email;
    private String password;
    private boolean remember;
    private Usuario usuarioLogado;


    public void login() throws IOException {
    	usuarioLogado = null;
        usuarioLogado = usuarioDAO.getUsuarioByLoginPassword(email, password);
        if(usuarioLogado != null) {
	        currentUser = email;
	        Messages.addGlobalInfo("Login efetuado com sucesso!");
	        Faces.getExternalContext().getFlash().setKeepMessages(true);
	        Faces.redirect("index.xhtml");
        } else {
        	UtilityTela.criarMensagemErroSemDetail("Não foi possível efetuar o login, favor verificar os dados digitados.");
        }
    }
   
    @Override
    public boolean isLoggedIn() {
    	
    	// Para habilitar o login substituir o return true pela linha comentada
    	
    	// return currentUser != null;
    	return true;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }

    public String getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(String currentUser) {
        this.currentUser = currentUser;
    }

	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}

	public void setUsuarioLogado(Usuario usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}
}
