package br.edu.impacta.controller;

import java.io.IOException;
import java.io.Serializable;
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
	
	private Modelo modeloSelected;
	private List<Modelo> modeloList;
	
	private ProdutoModelo produtoModeloSelected;
	
	@Inject
	private ModeloController modeloControl;
	
	@PostConstruct
	@PostActivate
	public void init() {
		//modeloList = modeloControl.getListAtivo();
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
  	}
  	
  	public void addProdutoModelo(){
  		this.getModeloList().remove(this.modeloSelected);
  		this.getSelected().getProdutoModeloList().add(new ProdutoModelo(this.getSelected(), this.modeloSelected));
  	}
  	
  	public void removeProdutoModelo(){
  		this.getSelected().getProdutoModeloList().remove(this.getProdutoModeloSelected());
  		this.getModeloList().add(this.getProdutoModeloSelected().getModelo());
  	}
  	
  	public void verificaModeloList(){
  		if(modeloList != null && this.getSelected().getIdProduto() != null){
			for (ProdutoModelo produtoModelo : getSelected().getProdutoModeloList()) {
				if(modeloList.contains(produtoModelo.getModelo())){
					modeloList.remove(produtoModelo.getModelo());
				} 
			}
		} else {
			modeloList = modeloControl.getListAtivo();
		}
  	}
    
    //Quando seleciona a linha habilita o botão cancelar e visualizar
  	public void onRowSelect(){
  		disableButton = false;
  	}
  	
  	//Quando seleciona a linha habilita o botão cancelar e visualizar
  	public void unRowSelect(){
  		disableButton = true;
  	}

	public boolean isDisableButton() {
		return disableButton;
	}

	public void setDisableButton(boolean disableButton) {
		this.disableButton = disableButton;
	}
	
	public Modelo getModeloSelected() {
		return modeloSelected;
	}

	public void setModeloSelected(Modelo modeloSelected) {
		this.modeloSelected = modeloSelected;
	}

	public List<Modelo> getModeloList() {
		return modeloList;
	}

	public void setModeloList(List<Modelo> modeloList) {
		this.modeloList = modeloList;
	}

	public ProdutoModelo getProdutoModeloSelected() {
		return produtoModeloSelected;
	}

	public void setProdutoModeloSelected(ProdutoModelo produtoModeloSelected) {
		this.produtoModeloSelected = produtoModeloSelected;
	}
}
