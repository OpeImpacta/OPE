package br.edu.impacta.controller;

import java.io.Serializable;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;

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
}
