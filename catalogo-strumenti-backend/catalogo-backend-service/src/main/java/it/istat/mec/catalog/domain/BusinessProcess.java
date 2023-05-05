package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "CSM_BUSINESS_PROCESS")
public class BusinessProcess implements Serializable  {

	
	private static final long serialVersionUID = 267803872317420154L;
	private static final String cascade  = null;
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Integer id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;	

	@Column(name = "LABEL")
	private String label;

	@Column(name = "ORDER_CODE")
	private Integer orderCode;
	
	@Column(name = "PARENT")
	private Integer parent;	
	
	@ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_link_function_process", joinColumns = {
            @JoinColumn(name = "BUSINESS_PROCESS_ID", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "BUSINESS_FUNCTION_ID", referencedColumnName = "ID", nullable = false)})
	private List<BusinessFunction> businessFunctions;
	
	
	@ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_link_process_step", joinColumns = {
            @JoinColumn(name = "BUSINESS_PROCESS_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "PROCESS_STEP_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})    
	private List<ProcessStep> processSteps;
	
	public BusinessProcess() {
		super();
	}
	
	public BusinessProcess(Integer id) {
		super();
		this.id = id;
	}
}

