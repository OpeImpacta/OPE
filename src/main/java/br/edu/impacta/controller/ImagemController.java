package br.edu.impacta.controller;

import java.io.ByteArrayInputStream;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.enterprise.context.ApplicationScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseId;
import javax.inject.Named;

import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import br.edu.impacta.dao.ImagemDAO;
import br.edu.impacta.entity.Imagem;

/**
 * @author Paulo Pasinato
 */

@Named(value = "imagemControl")
@ApplicationScoped
public class ImagemController extends BasicControlCad<Imagem> implements Serializable {

	private static final long serialVersionUID = 1L;

	private static ImagemDAO imagemDAO = new ImagemDAO();


	// *******************************************
	// * Alterar somente neste construtor
	// *******************************************
	public ImagemController() throws Exception {
		super(Imagem.class, imagemDAO);
	}

	public byte[] getImage(int imagem) {
		if(imagem != 0) {
			byte[] img = imagemDAO.findById(imagem).getFoto();
			if (img != null) {
				return img;
			}
			return null;
		}
		byte[] myvar = "".getBytes();
		return myvar;
	}	


	// *************************************************
	// * Mostra imagem na tela, conforme id da imagem
	// *************************************************
	public StreamedContent getPhotoImageScreen() {
		try {
			FacesContext context = FacesContext.getCurrentInstance();
			if (context.getCurrentPhaseId() == PhaseId.RENDER_RESPONSE) {
				return new DefaultStreamedContent();
			} else {
				String id = context.getExternalContext().getRequestParameterMap().get("cdImagem");
				if (id == null) { 
					return null;
				}

				byte[] img = imagemDAO.findById(Integer.valueOf(id)).getFoto();

				if (img != null) {
					return new DefaultStreamedContent(new ByteArrayInputStream(img));
				}
			}
		} catch (Exception ex) {
			Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}
		return null;
	}
}
