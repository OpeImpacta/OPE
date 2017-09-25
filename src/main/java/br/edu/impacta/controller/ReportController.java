package br.edu.impacta.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.http.HttpServletResponse;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.factory.Factory;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;


@Named(value = "reportControl")
@ViewScoped
public class ReportController implements Serializable {


	private static final long serialVersionUID = 1L;

	private HttpServletResponse response;
	private FacesContext context;
	private ByteArrayOutputStream baos;
	private InputStream stream;
	private Connection con;

	public ReportController() {
		this.context = FacesContext.getCurrentInstance();
		this.response = (HttpServletResponse) context.getExternalContext().getResponse();
	}

	// *******************************************
	// * Gera Relatório em PDF
	// *******************************************
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void getRelatorio(String nomeRelatorio, Map params) {

		// Carrega o stream com o arquivo jasper (getResourceAsStream - pega o caminho) 
		stream = this.getClass().getResourceAsStream("/br/edu/impacta/relatorios/" + nomeRelatorio + ".jasper");
		System.out.println(stream);
		baos = new ByteArrayOutputStream();

		try {
			// Carrega o arquivo
			JasperReport report = (JasperReport) JRLoader.loadObject(stream);

			// Adiciona logo no relatório
			params.put("logoOPE", getLogo());
			
			// Define o objeto Jasper print, responsavel por gerar o relatório
			JasperPrint print = JasperFillManager.fillReport(report, params, getConexao());

			// Exporta o arquivo gerado para PDF
			JasperExportManager.exportReportToPdfStream(print, baos);

			response.reset();
			response.setContentType("application/pdf");
			response.setContentLength(baos.size());

			response.setHeader("Content-disposition", "inline; filename=" + nomeRelatorio + ".pdf");
			response.getOutputStream().write(baos.toByteArray());
			response.getOutputStream().flush();
			response.getOutputStream().close();

			context.renderResponse();
			// Informa que a resposta HTTP esta pronta
			context.responseComplete();

			con.close();

		} catch (JRException ex) {
			Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
		} catch (IOException ex) {
			Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	
	
	public InputStream getLogo(){
		ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
		String logo = externalContext.getRealPath("") +  File.separator + "resources" +  File.separator + "images" + File.separator + "logo.jpg";
		
		try {
			
			File file = new File(logo);
			InputStream stream = new FileInputStream(file);
			
			return stream;
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	// **************************************************
	// * Gera relatorios em bytes para enviar por email
	// **************************************************
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public byte[] getRelatorioByte(String nomeRelatorio, Map params){
		try {

			stream = this.getClass().getResourceAsStream("/br/edu/impacta/relatorios/" + nomeRelatorio + ".jasper");
			baos = new ByteArrayOutputStream();

			JasperReport report = (JasperReport) JRLoader.loadObject(stream);
			
			params.put("logoOPE", getLogo());
			JasperPrint print = JasperFillManager.fillReport(report, params, getConexao());
			
			System.out.println("Bytes: " + JasperExportManager.exportReportToPdf(print));

			return JasperExportManager.exportReportToPdf(print);

		} catch (JRException ex) {
			Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
		} 

		return null;
	}

	// *******************************************
	// * Obtem conexão com o banco de dados
	// *******************************************
	private Connection getConexao() {
		try 
		{
			Factory factory = new Factory();
			con = factory.getConnection();

		}catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

}
