package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;	

	@Column(name = "LABEL")
	private String label;

	@Column(name = "ORDER_CODE")
	private String orderCode;
	
	@Column(name = "PARENT")
	private String parent;	
	
	@ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_link_function_process", joinColumns = {
            @JoinColumn(name = "BUSINESS_PROCESS_ID", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "BUSINESS_FUNCTION_ID", referencedColumnName = "ID", nullable = false)})
	private List<BusinessFunction> businessFunctions;
	
	@ManyToMany
    @JoinTable(name = "csm_link_process_step", joinColumns = {
            @JoinColumn(name = "BUSINESS_PROCESS_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "PROCESS_STEP_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
	private List<ProcessStep> processSteps;
	
}

