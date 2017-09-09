package br.edu.impacta.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.edu.impacta.dao.ModeloDAO;
import br.edu.impacta.entity.Modelo;

@FacesConverter("modeloConverter")
public class ModeloConverter implements Converter {

	@Inject
	private ModeloDAO modeloDAO;

	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		
		if(value != null) {
			return modeloDAO.findById(Integer.valueOf(value));
        }
		return null;
		
	}

	@Override
	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		
		if(object != null) {
			Modelo modelo = (Modelo) object;
			return modelo.getIdModelo().toString();
		}
		return null;
		
	}
}
