package br.edu.impacta.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.ejb.PostActivate;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.ServletContext;

import org.omnifaces.cdi.ViewScoped;
import org.primefaces.event.FileUploadEvent;

import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.entity.Imagem;
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
	private List<Produto> produtosControlaEstoque;
	private List<Modelo> modeloSelectedList = new ArrayList<>();
	
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
	
	//Upload das imagens
	public void enviaImagem(FileUploadEvent event) {
		fotos.add(new Imagem(event.getFile().getContents(), (Produto)getSelected(), UtilityTela.dateFormatFull(new Date())));
		FacesContext context = FacesContext.getCurrentInstance();
		context.addMessage(null, new FacesMessage("Sucesso!", "A(s) foto(s) foram carregada(s)"));
    }
	
	//Cria o arquivo de imagem
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
    	FacesContext context = FacesContext.getCurrentInstance();
        ServletContext servletContext = (ServletContext) context.getExternalContext().getContext();
        String realPath = servletContext.getContextPath();
        
        // Cria o diretorio caso não exista
        File file = new File(realPath + "/temp/");
        if(!file.exists()) {
        	file.mkdirs();
        }
		for (Imagem f : fotos) {
		    String arquivo = servletContext.getRealPath("/temp/" + f.getNome() + ".jpg");
		    criaArquivo(f.getFoto(), arquivo);
		}
		((Produto)getSelected()).getImagemList().addAll(fotos);
    }
    
  //Exclui as fotos
    public void excluirFotos() {
    	fotos = new ArrayList<>();
    	((Produto)getSelected()).setImagemList(new ArrayList<>());
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
  		carregaFotosProduto();
  		super.treatRecord();
  		UtilityTela.executarJavascript("PF('dlgCadastro').hide()");
  		limpaSelecteds();
  	}
  	
  //Limpa lista objeto e listas após efetivação do cadastro
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
  			getSelected().setPrecoVenda(mult.divide(new BigDecimal(100)).add(getSelected().getPrecoCompra(), MathContext.DECIMAL128));
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

  			BigDecimal div = prVenda.divide(prCompra, MathContext.DECIMAL128);

  			BigDecimal mult = div.multiply(new BigDecimal(100), MathContext.DECIMAL128);
  			getSelected().setMargem(mult.subtract(new BigDecimal(100)));
  		}
  	}
  	
  	public void addProdutoModelo(){
  		this.getSelected().setProdutoModeloList(new ArrayList<>());
  		for(Modelo modeloAux : modeloSelectedList) {
  			this.getSelected().getProdutoModeloList().add(new ProdutoModelo(this.getSelected(), modeloAux));
  		}
  	}
    
    //Quando seleciona a linha habilita o botï¿½o cancelar e visualizar
  	public void onRowSelect(){
  		disableButton = false;
  	}
  	
  	//Quando seleciona a linha habilita o botï¿½o cancelar e visualizar
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
}	