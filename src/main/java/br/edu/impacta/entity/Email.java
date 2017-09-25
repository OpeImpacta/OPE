package br.edu.impacta.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import br.edu.impacta.controller.ReportController;

/**
 * @author Stefany Souza
 */
public class Email implements Serializable {


	private static final long serialVersionUID = 1L;

	private String de;
	private String email;
	private String para;
	private String servidor;
	private String porta;
	private String usuario;
	private String senha;
	private String texto;
	private String assunto;


	public Email() {}


	private Session getSession(Properties props){
		Session session =  Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(getUsuario(), getSenha());
			}
		});

		session.setDebug(true);
		return session;
	}

	private Properties setPropirties(){

		Properties props = new Properties();
		props.put("mail.smtp.host", getServidor());
		props.put("mail.smtp.socketFactory.port", getPorta());
		props.put("mail.smtp.starttls.required", true);
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", getPorta());

		return props;
	}

	public boolean sendEmail(){
		boolean retorno = true;
		try {

			Message message = new MimeMessage(getSession(setPropirties()));
			message.setFrom(new InternetAddress(getEmail()));

			Address toUser = new InternetAddress(getPara());  

			message.setRecipient(Message.RecipientType.TO, toUser);
			message.setSubject(getAssunto());
			message.setText(getTexto());

			MimeBodyPart mimeBodyPart1 = new MimeBodyPart();
			mimeBodyPart1.setContent(getTexto(), "text/html");

			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mimeBodyPart1);

			message.setContent(mp);   
			message.setSentDate(new Date());
			message.saveChanges();   

			Transport.send(message);
		} catch (MessagingException e) {
			retorno = false;
			throw new RuntimeException(e);
		}

		return retorno;
	}

	@SuppressWarnings("rawtypes")
	public boolean sendEmailAnexo(Map params, String nomeRelatorio){
		boolean retorno = true;
		try {

			Message message = new MimeMessage(getSession(setPropirties()));
			message.setFrom(new InternetAddress(getEmail()));

			Address toUser = new InternetAddress(getPara());  

			message.setRecipient(Message.RecipientType.TO, toUser);
			message.setSubject(getAssunto());
			message.setText(getTexto());

			MimeBodyPart mimeBodyPart1 = new MimeBodyPart();
			mimeBodyPart1.setContent(getTexto(), "text/html");

			MimeBodyPart mimeBodyPart2 = new MimeBodyPart();
			ReportController reportController = new ReportController();
			DataSource fds = new ByteArrayDataSource(reportController.getRelatorioByte(nomeRelatorio, params), "application/pdf");   
			mimeBodyPart2.setDisposition(Part.ATTACHMENT);   
			mimeBodyPart2.setDataHandler(new DataHandler(fds));   
			mimeBodyPart2.setFileName("orcamento.pdf"); 

			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mimeBodyPart1);
			mp.addBodyPart(mimeBodyPart2);

			message.setContent(mp);   
			message.setSentDate(new Date());
			message.saveChanges();   

			Transport.send(message);
		} catch (MessagingException e) {
			retorno = false;
			throw new RuntimeException(e);
		}

		return retorno;
	}


	public String getDe() {
		return de;
	}

	public void setDe(String de) {
		this.de = de;
	}

	public String getPara() {
		return para;
	}

	public void setPara(String para) {
		this.para = para;
	}

	public String getServidor() {
		return servidor;
	}

	public void setServidor(String servidor) {
		this.servidor = servidor;
	}

	public String getPorta() {
		return porta;
	}

	public void setPorta(String porta) {
		this.porta = porta;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}


	public String getAssunto() {
		return assunto;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}






}
