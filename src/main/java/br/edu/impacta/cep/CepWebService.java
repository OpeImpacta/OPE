package br.edu.impacta.cep;

import java.io.Serializable;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

import br.edu.impacta.entity.Endereco;

/**
 * @author Stefany Souza
 */
public class CepWebService implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	//Busca o cep através da URL e retrona o endereco preenchido 
	public Endereco carregaEndereco(String cep){
		Endereco endereco = new Endereco();
		
		Client c = Client.create();
		WebResource wr = c.resource("https://viacep.com.br/ws/" + cep + "/json/");
		
		System.out.println("Chamou a URI...");
		endereco = buscaEnderecoByCep(wr.get(String.class));
		
		String JSON = wr.get(String.class);
		System.out.println("JSON: " + JSON);

		if(JSON == null ||  JSON.equals("")){
			return null;
		}
		
		return endereco;
	}
	
	//Pega o resultado do json e converte em uma classe Java
	public Endereco buscaEnderecoByCep(String urlJson){
		System.out.println("Chamou o Serviço...");
		
		final GsonBuilder gsonBuilder = new GsonBuilder();
		final Gson  gson = gsonBuilder.create();
		
		Endereco retorno = gson.fromJson(urlJson, Endereco.class);
		return retorno;
		
	}
	
}
