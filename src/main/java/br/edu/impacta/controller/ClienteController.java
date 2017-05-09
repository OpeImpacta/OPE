package br.edu.impacta.controller;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;

import br.edu.impacta.dao.ClienteDAO;
import br.edu.impacta.entity.Cliente;
import br.edu.impacta.entity.TelCliente;

/**
 * @author Stefany Souza
 */

@Named(value = "clienteControl")
@ViewScoped
public class ClienteController extends BasicControlCad<Cliente> implements Serializable {

	private static final long serialVersionUID = 1L;

	private static ClienteDAO clienteDAO = new ClienteDAO();
	private TelCliente telCliente = new TelCliente();
	
	private boolean disableButton = true;


	// *******************************************
	// * Alterar somente neste construtor
	// *******************************************
	public ClienteController() throws Exception {
		super(Cliente.class,  clienteDAO);
	}

	//Verifica se telefone já existe e altera, senão adiciona na lista
	public void addTelefone(){
		if(!verificaTelefone()){
			return;
		}
		List<TelCliente> telefones = ((Cliente)this.getSelected()).getTelefones();
		for (TelCliente telefone : telefones) {
			if(Objects.equals(telCliente, telefone)){
				telefone.setNumero(telCliente.getNumero());
				telefone.setComplemento(telCliente.getComplemento());
				telefone.setTipo(telCliente.getTipo());

				this.telCliente = new TelCliente();
				return;
			}
		}
		((Cliente)this.getSelected()).addTelefone(telCliente);
		telCliente = new TelCliente();
	}

	//Mostra o telefone do cliente para poder alterar
	public void upTelefone(TelCliente telefone){
		telCliente = telefone;
	}

	//Remove telefone da lista
	public void delTelefone(TelCliente telefone){
		((Cliente)this.getSelected()).delTelefone(telefone);

	}
	
	//Verifica se todos os campos do telefone estão preenchidos
	public boolean verificaTelefone(){
		if(telCliente.getNumero().equals("")){
			UtilityTela.criarMensagemErroSemDetail("Campo Número do Telefone é Necessário");
			return false;
		}
		
		if(telCliente.getTipo().equals("")){
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

	public TelCliente getTelCliente() {
		return telCliente;
	}

	public void setTelCliente(TelCliente telCliente) {
		this.telCliente = telCliente;
	}

}
