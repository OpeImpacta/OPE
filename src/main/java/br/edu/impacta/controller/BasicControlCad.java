package br.edu.impacta.controller;

import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.omnifaces.util.Messages;

import br.edu.impacta.dao.GenericDAO;

/**
 * @author Stefany Souza
 */
public abstract class BasicControlCad<C> implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<C> list;
	private List<C> listAtivo;
	private GenericDAO<C> dao;
	private C selected;
	private C selectedTemp;
	private Class<C> classToCastMatrix;

	// **************************************************************************
	// * Contrutor principal
	// **************************************************************************

	public BasicControlCad(Class<C> classToCastMatrix, GenericDAO<C> dao) throws Exception {
		this.dao = dao;
		this.classToCastMatrix = classToCastMatrix;
		newInSelected();
	}

	public BasicControlCad() {

	}

	public void treatRecord(){
		if(selectedTemp != selected){
			saveRecord();
			return;
		} else {
			updateRecord();
		}
	}

	// Salvar
	public void saveRecord() {
		try {
			this.dao.save(selected);
			selected = null;
			Messages.create("Sucesso!").detail("Item gravado com sucesso").add();
		} catch (Exception ex) {
			Logger.getLogger(BasicControlCad.class.getName()).log(Level.SEVERE, null, ex);
			Messages.create("Erro!").error().detail("Um erro ocorreu e não foi possível gravar o item").add();
		}
	}

	// Update
	public void updateRecord() {
		try {
			this.dao.update(selected);
			selected = null;
			Messages.create("Sucesso!").detail("Item editado com sucesso").add();
		} catch (Exception ex) {
			Logger.getLogger(BasicControlCad.class.getName()).log(Level.SEVERE, null, ex);
			Messages.create("Erro!").error().detail("Um erro ocorreu e não foi possível editar o item").add();
		}
	}

	// Remover Por Entidade
	public void deleteRecord() {
		try {
			this.dao.delete(selected);
			selected = null;
			Messages.create("Sucesso!").detail("Item excluído com sucesso").add();
		} catch (Exception ex) {
			Logger.getLogger(BasicControlCad.class.getName()).log(Level.SEVERE, null, ex);
			Messages.create("Erro!").error().detail("Um erro ocorreu e não foi possível excluir o item").add();
		}
	}

	// Remover Por ID
	public void deleteRecordPk(Integer id) {
		try {
			this.dao.delete(id);
			selected = null;
			Messages.create("Sucesso!").detail("Item excluído com sucesso").add();
		} catch (Exception ex) {
			Logger.getLogger(BasicControlCad.class.getName()).log(Level.SEVERE, null, ex);
			Messages.create("Erro!").error().detail("Um erro ocorreu e não foi possível excluir o item").add();
		}
	}

	// **************************************************************************
	// * Prepara para inclusao
	// **************************************************************************
	public void doStartAddRecord() throws Exception {
		System.out.println("BasicControlCad:doStartAddRegistro");
		newInSelected();
		// Para funcionar, todos os dialog de cadastro devem ter
		// widgetVar="dlgCadastro"
		UtilityTela.executarJavascript("PF('dlgCadastro').show();");
	}

	// **************************************************************************
	// * Prepara para inclusao - quando não tem dialog
	// **************************************************************************
	public void doStartAddRecordComum() throws Exception {
		System.out.println("BasicControlCad:doStartAddRegistroComum");
		newInSelected();
	}

	public void newInSelected() {
		this.selected = newItem();
	}

	public C newItem() {
		C item = null;
		try {
			Constructor<C> constr = this.classToCastMatrix.getConstructor();
			item = constr.newInstance();
		} catch (Exception ex) {
			Logger.getLogger(BasicControlCad.class.getName()).log(Level.SEVERE, null, ex);
		}
		return item;
	}

	public List<C> getList() {
		this.list = dao.findAll();
		return list;
	}

	public void setList(List<C> list) {
		this.list = list;
	}

	public List<C> getListAtivo() {
		this.listAtivo = dao.findAtivos();
		return listAtivo;
	}

	public void setListAtivo(List<C> listAtivo) {
		this.listAtivo = listAtivo;
	}

	public C getSelected() {
		return selected;
	}

	public void setSelected(C selected) {
		selectedTemp = selected;
		this.selected = (C) selected;
	}

	public C getSelectedTemp() {
		return selectedTemp;
	}

	public void setSelectedTemp(C selectedTemp) {
		this.selectedTemp = selectedTemp;
	}

}
