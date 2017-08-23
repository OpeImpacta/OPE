package br.edu.impacta.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.edu.impacta.dao.ClienteDAO;
import br.edu.impacta.entity.Cliente;

@FacesConverter("clienteConverter")
public class ClienteConverter implements Converter {

	@Inject
	private ClienteDAO clienteDAO;
	
	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		if(value != null) {
			return clienteDAO.findById(Integer.valueOf(value));
		}
		return null;
	}

	@Override
	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		if(object != null) {
			return String.valueOf(((Cliente) object).getIdCliente());
		}
		
		return null;
	}

}
