package br.edu.impacta.dao;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import br.edu.impacta.entity.ItemVenda;

/**
 * @author Stefany Souza
 */
public class ItemVendaDAO extends GenericDAO<ItemVenda> implements Serializable {

	
	private static final long serialVersionUID = 1L;

	public ItemVendaDAO() {
		super(ItemVenda.class);
	}
	
	public List<ItemVenda> getProdutoVendidoByDate(Date dataDe, Date dataAte){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String jpql = "from ItemVenda v where v.venda.tipo = 1 AND v.venda.data BETWEEN '" + sdf.format(dataDe) + " 00:00:00.000"
                + "' AND '" + sdf.format(dataAte) + " 23:59:59.999'";
		return find(jpql);
	}
	
	public List<ItemVenda> getProdutoOrcadoByDate(Date dataDe, Date dataAte){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String jpql = "from ItemVenda v where v.venda.tipo = 2 AND v.venda.data BETWEEN '" + sdf.format(dataDe) + " 00:00:00.000"
                + "' AND '" + sdf.format(dataAte) + " 23:59:59.999'";
		return find(jpql);
	}
	
}
