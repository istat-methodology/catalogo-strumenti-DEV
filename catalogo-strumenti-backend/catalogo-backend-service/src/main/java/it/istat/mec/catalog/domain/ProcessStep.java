package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "CSM_PROCESS_STEP")
public class ProcessStep implements Serializable  {

	
	private static final long serialVersionUID = -7586846904189535365L;
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;	

	@Column(name = "LABEL")
	private String label;

	
	@ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "BUSINESS_SERVICE_ID", nullable = false, insertable = false)
	private BusinessService businessService;
	
	@Column(name = "SUBSTEP")
	private String substep;	
	
	@ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_link_process_step", joinColumns = {
            @JoinColumn(name = "PROCESS_STEP_ID", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "BUSINESS_PROCESS_ID", referencedColumnName = "ID", nullable = false)})
	private List<BusinessProcess> businessProcesses;
	
	@ManyToMany
    @JoinTable(name = "csm_link_step_instance", joinColumns = {
            @JoinColumn(name = "PROCESS_STEP_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "PROCESS_STEP_INSTANCE_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
	private List<StepInstance> stepInstances;
}
