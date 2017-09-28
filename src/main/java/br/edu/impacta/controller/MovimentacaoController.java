package br.edu.impacta.controller;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.PostActivate;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.MovimentacaoDAO;
import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.entity.Movimentacao;
import br.edu.impacta.entity.Produto;

/**
 * @author Stefany Souza
 */

@Named(value = "movimentacaoControl")
@ViewScoped
public class MovimentacaoController extends BasicControlCad<Movimentacao> implements Serializable {

	private static final long serialVersionUID = 1L;

	private static MovimentacaoDAO movimentacaoDAO = new MovimentacaoDAO();

	private Movimentacao movimentacao;
	private List<Movimentacao> movList;

	private Boolean disableInputs;
	private Integer tpMovimentacao;

	@Inject
	private ProdutoDAO produtoDAO;
	private List<Produto> produtos;
	private List<Produto> estoqueBaixo;
	private String opcao;
	private String headerDt;



	// *******************************************
	// * Alterar somente neste construtor
	// *******************************************
	public MovimentacaoController() throws Exception {
		super(Movimentacao.class,  movimentacaoDAO);
	}

	@PostConstruct
	@PostActivate
	public void init() {
		preencheProdutos();
	}	

	//verifica qual o tipo de movimentação conforme o nº para mostrar na tela
	public String verificaTpMov(Movimentacao mov){
		if(mov.getTipoMovimentacao() == 1){
			return "Entrada";
		}else if(mov.getTipoMovimentacao() == 2){
			return "Saída";
		}else{
			return "Ajuste";
		}
	}

	// ***********************************************************************************************
	// * Adiciona produto na lista
	// * verifica se o produto já esta na lista, se já estiver apenas seta a nova quantidade
	// ***********************************************************************************************
	public void addItem(){
		if(validaCamposProduto()){
			for (Movimentacao mov : movList) {
				if(mov.getProduto().getIdProduto() == this.movimentacao.getProduto().getIdProduto()){
					mov.setQuantidade(this.movimentacao.getQuantidade());
				}
			}

			if(! movList.contains(this.movimentacao)){
				movimentacao.getProduto().setQuantidade(this.qtdProduto(movimentacao.getProduto()));
				movimentacao.setTipoMovimentacao(tpMovimentacao);
				movList.add(movimentacao);
			}

			movimentacao = null;
			disableInputs = null;
		}
	}

	//retorna quantidade de produtos conforme o tipo de movimentação
	public Integer qtdProduto(Produto produto){
		if(tpMovimentacao == 1){
			return produto.getQuantidade() + movimentacao.getQuantidade();
		}else if(tpMovimentacao == 2){
			return produto.getQuantidade() - movimentacao.getQuantidade();
		}else{
			return movimentacao.getQuantidade();
		}
	}

	//retira movimetação da lista
	public void delMovimentacao(Movimentacao mov){
		movList.remove(mov);
	}

	//limpa os campos caso click em fechar ou cancelar
	public void limparForm(){
		movimentacao = null;
		disableInputs = null;
		movList = null;
	}
	

	//verifica se os campos do produto foram preenchidos
	public boolean validaCamposProduto(){
		if(movimentacao.getProduto() == null){
			return false;
		}
		
		if(movimentacao.getQuantidade() <= 0 ){
			return false;
		}
		
		if(tpMovimentacao == 2){
			if(movimentacao.getQuantidade() > movimentacao.getProduto().getQuantidade() ){
				return false;
			}
		}
		
		return true;
	}

	//grava um novo registro no banco para cada item da lista
	public void recordMovimentacao(){
		if(movList != null && movList.size() > 0){
			for (Movimentacao mov : movList) {
				movimentacaoDAO.save(mov);
				produtoDAO.update(mov.getProduto());
			}
			this.finalRecord();
		}
	}

	public void finalRecord(){
		UtilityTela.criarMensagem("Sucesso","Item gravado com sucesso!");
		this.setSelected(null);
		limparForm();
	}

	//calcula total da venda atraves da porcentagem estipulada
	public void calculaPrecoVenda(){
		if(movimentacao.getProduto().getMargem() != null && movimentacao.getProduto().getMargem() != BigDecimal.ZERO &&
				movimentacao.getProduto().getPrecoCompra() != null && movimentacao.getProduto().getPrecoCompra() != BigDecimal.ZERO){

			BigDecimal prCompra = movimentacao.getProduto().getPrecoCompra();
			BigDecimal margem = movimentacao.getProduto().getMargem();

			BigDecimal mult = prCompra.multiply(margem);
			movimentacao.getProduto().setPrecoVenda(mult.divide(new BigDecimal(100)).add(movimentacao.getProduto().getPrecoCompra()));
		}
	}

	//calcula valor da margem se campo valor da compra estiver preenchido
	public void calculaMargem(){
		if(		movimentacao.getProduto().getPrecoCompra() != null && movimentacao.getProduto().getPrecoCompra() != BigDecimal.ZERO &&
				movimentacao.getProduto().getPrecoVenda() != null && movimentacao.getProduto().getPrecoVenda() != BigDecimal.ZERO &&
				movimentacao.getProduto().getMargem() != null &&  movimentacao.getProduto().getMargem() != BigDecimal.ZERO &&
				movimentacao.getProduto().getPrecoVenda().compareTo(movimentacao.getProduto().getPrecoCompra()) == 1){

			BigDecimal prCompra = movimentacao.getProduto().getPrecoCompra();
			BigDecimal prVenda = movimentacao.getProduto().getPrecoVenda();

			BigDecimal div = prVenda.divide(prCompra);

			BigDecimal mult = div.multiply(new BigDecimal(100));
			movimentacao.getProduto().setMargem(mult.subtract(new BigDecimal(100)));
		}

	}

	//libera campos de preços do produto para poder alterar
	public void liberaInputsProdutos(){
		this.disableInputs = false;
	}

	//preenche lista de produtos conforme opção selecionada
	public void preencheProdutos(){
		if(opcao == null || opcao.equals("2")){
			headerDt = "Produtos com estoque mínimo";
			produtos = produtoDAO.findEstoqueMinimo();
		}else if(opcao.equals("1")){
			headerDt = "Produtos sem estoque";
			produtos = produtoDAO.findSemEstoque();
		}else if(opcao.equals("3")){
			headerDt = "Produtos com estoque alto";
			produtos = produtoDAO.findEstoqueBom();
		}else{
			headerDt = "Lista de Produtos";
			produtos = produtoDAO.findControleEstoque();
		}
	}

	//verifica os produtos com estoque baixo
	public void verificaEstoqueBaixo(){
		estoqueBaixo = produtoDAO.findEstoqueMinimo();
	}

	public void doStartRecordEntrada(){
		newInSelected();
		tpMovimentacao = 1;
		UtilityTela.executarJavascript("PF('dlgEntrada').show();");
	}

	public void doStartRecordSaida(){
		newInSelected();
		tpMovimentacao = 2;
		UtilityTela.executarJavascript("PF('dlgSaida').show();");
	}

	public void doStartRecordAjuste(){
		newInSelected();
		tpMovimentacao = 3;
		UtilityTela.executarJavascript("PF('dlgAjuste').show();");

	}

	// ***********************************************************************************************
	// * Redireciona para pagina consulta estoque
	// ***********************************************************************************************
	public String getUrl(){
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		String url = request.getRequestURL().toString();

		String Str = new String(url);
		int pos = Str.indexOf("ope");

		return Str.substring(0, pos) + "ope/sistema/estoque/consultarEstoque.xhtml";
	}



	public Movimentacao getMovimentacao() {
		if(movimentacao == null){
			movimentacao = new Movimentacao();
			movimentacao.setDataMovimentacao(new Date());
		}
		return movimentacao;
	}

	public void setMovimentacao(Movimentacao movimentacao) {
		this.movimentacao = movimentacao;
	}

	public List<Movimentacao> getMovList() {
		if(movList == null){
			movList = new ArrayList<>();
		}
		return movList;
	}

	public void setMovList(List<Movimentacao> movList) {
		this.movList = movList;
	}

	public Boolean getDisableInputs() {
		if(disableInputs == null){
			disableInputs = true;
		}
		return disableInputs;
	}

	public void setDisableInputs(Boolean disableInputs) {
		this.disableInputs = disableInputs;
	}

	public List<Produto> getProdutos() {
		if(produtos == null){
			produtos = new ArrayList<>();
		}
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	public String getOpcao() {
		if(opcao == null){
			return "2";
		}
		return opcao;
	}

	public void setOpcao(String opcao) {
		this.opcao = opcao;
	}

	public String getHeaderDt() {
		return headerDt;
	}

	public void setHeaderDt(String headerDt) {
		this.headerDt = headerDt;
	}

	public List<Produto> getEstoqueBaixo() {
		if(estoqueBaixo == null){
			estoqueBaixo = new ArrayList<>();
		}
		return estoqueBaixo;
	}

	public void setEstoqueBaixo(List<Produto> estoqueBaixo) {
		this.estoqueBaixo = estoqueBaixo;
	}


}
