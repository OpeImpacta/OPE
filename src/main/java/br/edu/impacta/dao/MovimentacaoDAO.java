package br.edu.impacta.dao;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import br.edu.impacta.entity.Movimentacao;

/**
 * @author Stefany Souza
 */
public class MovimentacaoDAO extends GenericDAO<Movimentacao> implements Serializable {


	private static final long serialVersionUID = 1L;

	public MovimentacaoDAO() {
		super(Movimentacao.class);
	}
	
	public List<Movimentacao> getMovimentacaoByDate(Date dataDe, Date dataAte){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String jpql = "from Movimentacao m where m.dataMovimentacao BETWEEN '" + sdf.format(dataDe) + " 00:00:00.000"
                + "' AND '" + sdf.format(dataAte) + " 23:59:59.999'";
		return find(jpql);
	}
}


