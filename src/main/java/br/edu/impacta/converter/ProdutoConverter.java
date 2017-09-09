package br.edu.impacta.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.inject.Inject;

import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.entity.Produto;

@FacesConverter("produtoConverter")
public class ProdutoConverter implements Converter {

	@Inject
	private ProdutoDAO produtoDAO;

	@Override
	public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
		
		if(value != null) {
			return produtoDAO.findById(Integer.valueOf(value));
        }
		return null;
		
	}

	@Override
	public String getAsString(FacesContext fc, UIComponent uic, Object object) {
		
		if(object != null) {
			return String.valueOf(((Produto) object).getIdProduto());
		}
		return null;
		
	}

}