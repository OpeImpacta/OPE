package br.edu.impacta.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.omnifaces.cdi.ViewScoped;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.DateAxis;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;

import br.edu.impacta.dao.ProdutoDAO;
import br.edu.impacta.dao.VendaDAO;
import br.edu.impacta.entity.Dashboard;
import br.edu.impacta.entity.Venda;

@Named(value = "dashControl")
@ViewScoped
public class DashController implements Serializable {


	private static final long serialVersionUID = 1L;

	@Inject
	private VendaDAO vendaDAO;
	
	@Inject
	private ProdutoDAO produtoDAO;
	
	private Integer novosOrcamentos;
	
	private Integer estoqueBaixo;

	private Dashboard dashboardVenda;

	private Dashboard dashboardOrcamento;
	
	private LineChartModel animatedModel;
	private List<Venda> orcamentoList;
	private List<Venda> vendaList;
	private SimpleDateFormat mes = new SimpleDateFormat("M");
	private SimpleDateFormat ano = new SimpleDateFormat("yyyy");
	private Date dataAtual = new Date();

	public void getValores() {
		dashboardVenda = vendaDAO.getDashVendas(mes.format(dataAtual), ano.format(dataAtual));
		dashboardOrcamento = vendaDAO.getDashOrcamentos(mes.format(dataAtual), ano.format(dataAtual));
	}
	
	public void init() {
		getValores();
		orcamentoList = vendaDAO.findOrcamentosNotCancelados(mes.format(dataAtual), ano.format(dataAtual));
		vendaList = vendaDAO.findVendasNotCancelados(mes.format(dataAtual), ano.format(dataAtual));
		createAnimatedModels();
	}


	public Integer getNovosOrcamentos() {
		novosOrcamentos = vendaDAO.findOrcamentosAguardAprovacao().size();
		return novosOrcamentos;
	}

	public void setNovosOrcamentos(Integer novosOrcamentos) {
		this.novosOrcamentos = novosOrcamentos;
	}


	public Dashboard getDashboardVenda() {
		return dashboardVenda;
	}


	public void setDashboardVenda(Dashboard dashboardVenda) {
		this.dashboardVenda = dashboardVenda;
	}


	public Dashboard getDashboardOrcamento() {
		return dashboardOrcamento;
	}


	public void setDashboardOrcamento(Dashboard dashboardOrcamento) {
		this.dashboardOrcamento = dashboardOrcamento;
	}


	public Integer getEstoqueBaixo() {
		estoqueBaixo = produtoDAO.findEstoqueMinimo().size();
		return estoqueBaixo;
	}


	public void setEstoqueBaixo(Integer estoqueBaixo) {
		this.estoqueBaixo = estoqueBaixo;
	}
	

	public LineChartModel getAnimatedModel() {
        return animatedModel;
    }
	
	private void createAnimatedModels() {
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		cal2.set(Calendar.DAY_OF_MONTH, cal.getMaximum(Calendar.DAY_OF_MONTH));
		
        animatedModel = initLinearModel();
        animatedModel.setTitle("Visão Geral");
        animatedModel.setAnimate(true);
        animatedModel.setLegendPosition("ne");
        Axis yAxis = animatedModel.getAxis(AxisType.Y);
        yAxis.setLabel("Quantidade");
        yAxis.setTickInterval("1");
        yAxis.setMin(0);
        
        DateAxis xAxis = new DateAxis("Dias");
        xAxis.setTickAngle(-50);
        xAxis.setMin(UtilityTela.dateTimeFormatYMD(cal.getTime())); 
        xAxis.setMax(UtilityTela.dateTimeFormatYMD(cal2.getTime()));
        xAxis.setTickFormat("%d");
        xAxis.setTickInterval("1 day");
        animatedModel.getAxes().put(AxisType.X, xAxis);
    }
	
	private LineChartModel initLinearModel() {
        LineChartModel model = new LineChartModel();
        model.setSeriesColors("008000,FF0000");
        model.setShowPointLabels(true);
 
        LineChartSeries series1 = new LineChartSeries();
        series1.setLabel("Orçamentos");
        series1.setSmoothLine(true);
        
        if(!orcamentoList.isEmpty()) {
	        for(Venda venda : orcamentoList) {
	        	series1.set(UtilityTela.dateTimeFormatYMD(venda.getData()), verificaQtdeOrcamento(getData(venda.getData())));
	        }
	        model.addSeries(series1);
        }
 
        LineChartSeries series2 = new LineChartSeries();
        series2.setLabel("Vendas");
        series2.setSmoothLine(true);
 
        if(!vendaList.isEmpty()) {
	        for(Venda venda : vendaList) {
	        	series2.set(UtilityTela.dateTimeFormatYMD(venda.getData()), verificaQtdeVenda(getData(venda.getData())));
	        }
	        model.addSeries(series2);
        }
        return model;
    }	
	
	private int verificaQtdeOrcamento(Date data) {
		int aux = 0;
		for(Venda venda : orcamentoList) {
			if(getData(venda.getData()).compareTo(data) == 0) {
				aux++;
			}
		}
		return aux;
	}
	
	private int verificaQtdeVenda(Date data) {
		int aux = 0;
		for(Venda venda : vendaList) {
			if(getData(venda.getData()).compareTo(data) == 0) {
				aux++;
			}
		}
		return aux;
	}
	
	private Date getData(Date aDate){       
        final Calendar myCalendar = Calendar.getInstance();
        myCalendar.setTime(aDate);
        myCalendar.set(Calendar.HOUR_OF_DAY, 0);
        myCalendar.set(Calendar.MINUTE, 0);
        myCalendar.set(Calendar.SECOND, 0);
        myCalendar.set(Calendar.MILLISECOND, 0);
        return myCalendar.getTime();
    }
}
