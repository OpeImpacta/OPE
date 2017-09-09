package br.edu.impacta.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.PostActivate;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.ServletContext;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import br.edu.impacta.dao.ImagemDAO;
import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.entity.Imagem;
import br.edu.impacta.entity.Modelo;
import br.edu.impacta.entity.Produto;
import br.edu.impacta.entity.ProdutoModelo;

/**
 * @author Paulo Pasinato
 */

@Named(value = "produtoControl")
@SessionScoped
public class ProdutoController extends BasicControlCad<Produto> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private static ProdutoDAO produtoDAO = new ProdutoDAO();
	private static ImagemDAO imagemDAO = new ImagemDAO();
	
	private boolean disableButton = true;
	private List<Produto> produtosControlaEstoque;
	private List<Modelo> modeloSelectedList = new ArrayList<>();
	
	private StreamedContent imagem = new DefaultStreamedContent();
	private List<Imagem> fotos = new ArrayList<Imagem>();
	
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
	
	public void enviaImagem(FileUploadEvent event) {
        try {
            imagem = new DefaultStreamedContent(event.getFile().getInputstream());
            ((Produto)getSelected()).getImagemList().add(new Imagem(event.getFile().getContents(), (Produto)getSelected()));
            FacesMessage message = new FacesMessage("Sucesso!", event.getFile().getFileName() + " foi carregada.");
            FacesContext.getCurrentInstance().addMessage(null, message);
        } catch (IOException ex) {
            Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
	
	public void criaArquivo(byte[] bytes, String arquivo) {
        FileOutputStream fos;
        try {
            fos = new FileOutputStream(arquivo);
            fos.write(bytes);
            fos.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
 
    public void carregaFotosProduto() {
        fotos = imagemDAO.findImagemByProduto(this.getSelected());
		for (Imagem f : fotos) {
		    FacesContext facesContext = FacesContext.getCurrentInstance();
		    ServletContext scontext = (ServletContext) facesContext.getExternalContext().getContext();
		    String nomeArquivo = f.getIdImagem().toString() + ".jpg";
		    String arquivo = scontext.getRealPath("/temp/" + nomeArquivo);
		    criaArquivo(f.getFoto(), arquivo);
		}
    }
    
    public void excluirFotos() {
    	fotos = new ArrayList<>();
    	((Produto)getSelected()).setImagemList(new ArrayList<>());
    }
    
    public boolean verificaFotos() {
    	if(((Produto)getSelected()).getImagemList().size() < 4) {
    		return true;
    	}
    	return false;
    }
    
    @Override
    public void doStartAddRecord() throws Exception {
    	modeloSelectedList = new ArrayList<>();
  		fotos = new ArrayList<>();
    	super.doStartAddRecord();
    }
    
    //Ao gravar fexa o dialog na tela
  	@Override
  	public void treatRecord() {
  		super.treatRecord();
  		UtilityTela.executarJavascript("PF('dlgCadastro').hide()");
  		limpaSelecteds();
  	}
  	
  	public void limpaSelecteds() {
  		newInSelected();
  		modeloSelectedList = new ArrayList<>();
  		fotos = new ArrayList<>();
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
  		if(getSelected().getPrecoVenda() != null && getSelected().getPrecoCompra() != null && getSelected().getPrecoVenda().compareTo(getSelected().getPrecoCompra()) == -1) {
  			getSelected().setPrecoVenda(BigDecimal.ZERO);
            return;
  		} else 
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
  	
  	public void addProdutoModelo(){
  		this.getSelected().setProdutoModeloList(new ArrayList<>());
  		for(Modelo modeloAux : modeloSelectedList) {
  			this.getSelected().getProdutoModeloList().add(new ProdutoModelo(this.getSelected(), modeloAux));
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

	public List<Produto> getProdutosControlaEstoque() {
		if(produtosControlaEstoque == null) {
			produtosControlaEstoque = produtoDAO.findControleEstoque();
		}
		return produtosControlaEstoque;
	}

	public void setProdutosControlaEstoque(List<Produto> produtosControlaEstoque) {
		this.produtosControlaEstoque = produtosControlaEstoque;
	}
	
	public List<Modelo> getModeloSelectedList() {
		if(this.getSelected().getProdutoModeloList() != null && !this.getSelected().getProdutoModeloList().isEmpty()) {
			for(ProdutoModelo produtoModelo : this.getSelected().getProdutoModeloList()) {
				modeloSelectedList.add(produtoModelo.getModelo());
			}
		}
		return modeloSelectedList;
	}

	public void setModeloSelectedList(List<Modelo> modeloSelectedList) {
		this.modeloSelectedList = modeloSelectedList;
	}

	public List<Imagem> getFotos() {
		return fotos;
	}

	public void setFotos(List<Imagem> fotos) {
		this.fotos = fotos;
	}

	public StreamedContent getImagem() {
		return imagem;
	}

	public void setImagem(StreamedContent imagem) {
		this.imagem = imagem;
	}
}	