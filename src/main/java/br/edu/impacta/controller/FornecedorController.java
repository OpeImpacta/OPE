package br.edu.impacta.controller;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.cep.CepWebService;
import br.edu.impacta.dao.FornecedorDAO;
import br.edu.impacta.entity.Endereco;
import br.edu.impacta.entity.Fornecedor;
import br.edu.impacta.entity.TelFornecedor;

/**
 * @author Stefany Souza
 */

@Named(value = "fornecedorControl")
@ViewScoped
public class FornecedorController extends BasicControlCad<Fornecedor> implements Serializable {

	private static final long serialVersionUID = 1L;

	private static FornecedorDAO fonecedorDAO = new FornecedorDAO();
	private TelFornecedor telFornecedor = new TelFornecedor();

	private CepWebService cepWebService = new CepWebService();

	private boolean disableButton = true;

	private String maskTelefone;


	// *******************************************
	// * Alterar somente neste construtor
	// *******************************************
	public FornecedorController() throws Exception {
		super(Fornecedor.class,  fonecedorDAO);
	}

	//Chama o metódo do cepWebService que retorna o endereço
	public void buscarCep(){
		String cep = ((Fornecedor)this.getSelected()).getEndereco().getCep();
		String cepAux = cep.replace('-',' ').replace('_', ' ').trim();

		//Verifica se o cep é valido
		if(cepAux == null || cepAux.length() < 8 || cepAux.equals("")){
			return;
		}
		Endereco endereco = getCepWebService().carregaEndereco(cep);
		if(endereco != null){
			((Fornecedor)this.getSelected()).setEndereco(endereco);
		}
	}

	//Verifica se telefone já existe e altera, senão adiciona na lista
	public void addTelefone(){
		if(!verificaTelefone()){
			return;
		}
		List<TelFornecedor> telefones = ((Fornecedor)this.getSelected()).getTelefones();
		for (TelFornecedor telefone : telefones) {
			if(Objects.equals(telFornecedor, telefone)){
				telefone.setNumero(telFornecedor.getNumero());
				telefone.setComplemento(telFornecedor.getComplemento());
				telefone.setTipo(telFornecedor.getTipo());

				this.telFornecedor = new TelFornecedor();
				return;
			}
		}
		((Fornecedor)this.getSelected()).addTelefone(telFornecedor);
		telFornecedor = new TelFornecedor();
	}

	//Mostra o telefone do cliente para poder alterar
	public void upTelefone(TelFornecedor telefone){
		telFornecedor = telefone;
	}

	//Remove telefone da lista
	public void delTelefone(TelFornecedor telefone){
		((Fornecedor)this.getSelected()).delTelefone(telefone);

	}

	//Verifica se todos os campos do telefone estão preenchidos
	public boolean verificaTelefone(){
		if(telFornecedor.getNumero().equals("")){
			UtilityTela.criarMensagemErroSemDetail("Campo Número do Telefone é Necessário");
			return false;
		}

		if(telFornecedor.getTipo().equals("")){
			UtilityTela.criarMensagemErroSemDetail("Campo Tipo é Necessário");
			return false;
		}
		return true;
	}

	//Quando seleciona a linha habilita o botão cancelar e visualizar
	public void onRowSelect(){
		disableButton = false;
	}

	//Quando seleciona a linha habilita o botão cancelar e visualizar
	public void unRowSelect(){
		disableButton = true;
	}

	//altera a mascara do telefone de acordo com o tipo
	public void updateMaskTelefone() {
		if(telFornecedor != null) {
			switch (telFornecedor.getTipo()) {
			case "Residencial":
				maskTelefone = "(99)9999-9999";
				break;
			case "Comercial":
				maskTelefone = "(99)9999-9999";
				break;
			case "Celular":
				maskTelefone = "(99)99999-9999";
				break;
			default:
				break;
			}
		}
	}

	@Override
	public void treatRecord() {
		super.treatRecord();
		UtilityTela.executarJavascript("PF('dlgCadastro').hide()");
	}


	public boolean isDisableButton() {
		return disableButton;
	}

	public void setDisableButton(boolean disableButton) {
		this.disableButton = disableButton;
	}

	public TelFornecedor getTelFornecedor() {
		return telFornecedor;
	}

	public void setTelFornecedor(TelFornecedor telFornecedor) {
		this.telFornecedor = telFornecedor;
	}

	public CepWebService getCepWebService() {
		if(cepWebService == null){
			cepWebService = new CepWebService();
		}
		return cepWebService;
	}

	public void setCepWebService(CepWebService cepWebService) {
		this.cepWebService = cepWebService;
	}

	public String getMaskTelefone() {
		if(maskTelefone == null) {
			return "(99)9999-9999";
		}
		return maskTelefone;
	}

	public void setMaskTelefone(String maskTelefone) {
		this.maskTelefone = maskTelefone;
	}


}
