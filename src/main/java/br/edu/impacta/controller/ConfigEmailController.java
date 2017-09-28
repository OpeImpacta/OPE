package br.edu.impacta.controller;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.ConfigEmailDAO;
import br.edu.impacta.entity.ConfigEmail;
import br.edu.impacta.entity.Email;

/**
 * @author Stefany Souza
 */

@Named(value = "emailControl")
@ViewScoped
public class ConfigEmailController extends BasicControlCad<ConfigEmail> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private static ConfigEmailDAO confiEmailDAO = new ConfigEmailDAO();
	
	private ConfigEmail configEmail;

	// *******************************************
    // * Alterar somente neste construtor
    // *******************************************
	public ConfigEmailController() throws Exception {
		super(ConfigEmail.class,  confiEmailDAO);
	}
	
	
	public void getConfig() {
		List<ConfigEmail> listEmail = confiEmailDAO.findAll();
		
		if(listEmail != null && listEmail.size() >= 1){
			configEmail = confiEmailDAO.findAll().get(0);
		}else{
			configEmail = new ConfigEmail();
		}
	}
	
	public ConfigEmail getConfigEmail() {
		return configEmail;
	}

	public void setConfigEmail(ConfigEmail configEmail) {
		this.configEmail = configEmail;
	}	
	
	@Override
	public void treatRecord() {
		if(configEmail.getIdConfig() == null){
			confiEmailDAO.save(configEmail);
		}else{
			confiEmailDAO.update(configEmail);
		}
		
		UtilityTela.criarMensagem("Sucesso!", "Configuração salva.");
	}
	
	
	public boolean enviarEmail(String para){
		this.getConfig();
		
		Email email = new Email();
		email.setAssunto(configEmail.getAssunto());
		email.setDe(configEmail.getEmail());
		email.setPara(para);
		email.setPorta(configEmail.getPortaSmtp());
		email.setSenha(configEmail.getSenha());
		email.setServidor(configEmail.getServidor());
		email.setTexto(configEmail.getAssinatura());
		email.setUsuario(configEmail.getUsuario());
		email.setEmail(configEmail.getEmail());
	
		return email.sendEmail();
	}
	
	@SuppressWarnings("rawtypes")
	public boolean enviarEmailAnexo(String para, Map params, String nomeRelatorio){
		this.getConfig();
		
		if(configEmail.getIdConfig() == null){
			return false;
		}
		
		Email email = new Email();
		email.setAssunto(configEmail.getAssunto());
		email.setDe(configEmail.getEmail());
		email.setPara(para);
		email.setPorta(configEmail.getPortaSmtp());
		email.setSenha(configEmail.getSenha());
		email.setServidor(configEmail.getServidor());
		
		String textoEmail = "Prezado Cliente,"
				+ "<br/><br/><br/> Segue em anexo orçamento do(s) produto(s) conforme solicitado no site.<br/><br/><br/>";
		
		email.setTexto(textoEmail + configEmail.getAssinatura());
		email.setUsuario(configEmail.getUsuario());
		email.setEmail(configEmail.getEmail());
	
		return email.sendEmailAnexo(params, nomeRelatorio);
	}
	
}
