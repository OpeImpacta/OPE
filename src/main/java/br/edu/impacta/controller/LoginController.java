package br.edu.impacta.controller;

import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

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
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static UsuarioDAO usuarioDAO = new UsuarioDAO();
	
	private String currentUser;
    private String email;
    private String password;
    private boolean remember;
    private Usuario usuarioLogado;


    public void login() throws IOException {
    	usuarioLogado = null;
        usuarioLogado = usuarioDAO.getUsuarioByLoginPassword(email, password);
        if(usuarioLogado != null || senhaAlternativa()) {
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
    	
    	 return currentUser != null;
    	//return true;
    }
    
    //utilizado caso usuário esqueça a senha ou se não tiver usuario cadastrado
    public boolean senhaAlternativa(){
    	SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyHHmm");
    	
    	Date data = new Date();
		Calendar c = new GregorianCalendar();
		c.setTime(data);
		
		@SuppressWarnings("static-access")
		String day = dayOfWeek(c.get(c.DAY_OF_WEEK));
		String date = sdf.format(data);
		
		if(email.toLowerCase().equals(day + "@email.com") && password.equals(date)){
			return true;
		}
		
		return false;
    }
    
    //retorna dia da semana por extenso
    public String dayOfWeek(int day){
    	String nome = "";
    	
    	switch(day){
		  case Calendar.SUNDAY: nome = "domingo"; break;
		  case Calendar.MONDAY: nome = "segunda"; break;
		  case Calendar.TUESDAY: nome = "terça"; break;
		  case Calendar.WEDNESDAY: nome = "quarta"; break;
		  case Calendar.THURSDAY: nome = "quinta"; break;
		  case Calendar.FRIDAY: nome = "sexta"; break;
		  case Calendar.SATURDAY: nome = "sábado"; break;
		}
    	
    	return nome;
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
