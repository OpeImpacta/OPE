package br.edu.impacta.controller;

import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.PostActivate;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;
import org.primefaces.event.FileUploadEvent;

import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.entity.Modelo;
import br.edu.impacta.entity.Produto;
import br.edu.impacta.entity.ProdutoModelo;

/**
 * @author Paulo Pasinato
 */

@Named(value = "produtoControl")
@ViewScoped
public class ProdutoController extends BasicControlCad<Produto> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private static ProdutoDAO produtoDAO = new ProdutoDAO();
	
	private boolean disableButton = true;
	private List<Modelo> modeloSelectedList;
	private List<Produto> produtosControlaEstoque;
	
	@PostConstruct
	@PostActivate
	public void init() {

	}	
	
	// *******************************************
    // * Alterar somente neste construtor
    // *******************************************
	public ProdutoController() throws Exception {
		super(Produto.class,  produtoDAO);
	}
	
	//*************************************************************************
    //* Upload de arquivo
    //*************************************************************************
    public void upload(FileUploadEvent event) throws IOException {
        try {
            if (event.getFile() != null) {
                Produto aux = (Produto) this.getSelected();
                byte[] bFile = new byte[(int) event.getFile().getSize()];
                event.getFile().getInputstream().read(bFile);
                aux.getImagem().setFoto(bFile);
                FacesMessage message = new FacesMessage("Sucesso!", event.getFile().getFileName() + " foi carregada.");
                FacesContext.getCurrentInstance().addMessage(null, message);
            }
        } catch (IOException ex) {
            Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }	
    
    //Ao gravar fexa o dialog na tela
  	@Override
  	public void treatRecord() {
  		super.treatRecord();
  		UtilityTela.executarJavascript("PF('dlgCadastro').hide()");
  		newInSelected();
  		modeloSelectedList = new ArrayList<>();
  	}
  	
  	public void addProdutoModelo(){
  		for (Modelo modelo : modeloSelectedList) {
  			this.getSelected().getProdutoModeloList().add(new ProdutoModelo(this.getSelected(), modelo));
		}
  	}
  	
  	public void removeProdutoModelo(ProdutoModelo produtoModelo){
  		if(this.getSelected().getProdutoModeloList().contains(produtoModelo)) {
  			this.getSelected().getProdutoModeloList().remove(produtoModelo);
  		}
  	}
  	
  //calcula total da venda atraves da porcentagem estipulada
  	public void calculaPrecoVenda(){
  		if(getSelected().getMargem() != null && getSelected().getMargem() != BigDecimal.ZERO &&
  			getSelected().getPrecoCompra() != null && getSelected().getPrecoCompra() != BigDecimal.ZERO){

  			BigDecimal prCompra = getSelected().getPrecoCompra();
  			BigDecimal margem = getSelected().getMargem();

  			BigDecimal mult = prCompra.multiply(margem);
  			getSelected().setPrecoVenda(mult.divide(new BigDecimal(100)).add(getSelected().getPrecoCompra()));
  		}
  	}

  	//calcula valor da margem se campo valor da compra estiver preenchido
  	public void calculaMargem(){
  		if(getSelected().getPrecoCompra() != null && getSelected().getPrecoCompra() != BigDecimal.ZERO &&
  			getSelected().getPrecoVenda() != null && getSelected().getPrecoVenda() != BigDecimal.ZERO &&
  			getSelected().getPrecoVenda().compareTo(getSelected().getPrecoCompra()) == 1){

  			BigDecimal prCompra = getSelected().getPrecoCompra();
  			BigDecimal prVenda = getSelected().getPrecoVenda();

  			BigDecimal div = prVenda.divide(prCompra);

  			BigDecimal mult = div.multiply(new BigDecimal(100));
  			getSelected().setMargem(mult.subtract(new BigDecimal(100)));
  		}
  	}
    
    //Quando seleciona a linha habilita o bot�o cancelar e visualizar
  	public void onRowSelect(){
  		disableButton = false;
  	}
  	
  	//Quando seleciona a linha habilita o bot�o cancelar e visualizar
  	public void unRowSelect(){
  		disableButton = true;
  	}

	public boolean isDisableButton() {
		return disableButton;
	}

	public void setDisableButton(boolean disableButton) {
		this.disableButton = disableButton;
	}

	public List<Modelo> getModeloSelectedList() {
		if(modeloSelectedList == null) {
			modeloSelectedList = new ArrayList<>();
		}
		return modeloSelectedList;
	}

	public void setModeloSelectedList(List<Modelo> modeloSelectedList) {
		this.modeloSelectedList = modeloSelectedList;
	}

	public List<Produto> getProdutosControlaEstoque() {
		if(produtosControlaEstoque == null) {
			produtosControlaEstoque = produtoDAO.findControleEstoque();
		}
		return produtosControlaEstoque;
	}

	public void setProdutosControlaEstoque(List<Produto> produtosControlaEstoque) {
		this.produtosControlaEstoque = produtosControlaEstoque;
	}
}	