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
@Table(name = "CSM_STEP_INSTANCE")
public class StepInstance implements Serializable  {

	
	private static final long serialVersionUID = 6108556245854543459L;

	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "METHOD")
	private String method;
	
	@Column(name = "STATMETHOD")
	private String statMethod;
	
	@Column(name = "DESCR")
	private String descr;	

	@Column(name = "FUNCTIONALITY")
	private String functionality;

	
	@ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "csm_link_step_instance", joinColumns = {
            @JoinColumn(name = "PROCESS_STEP_INSTANCE_ID", referencedColumnName = "ID", nullable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "PROCESS_STEP_ID", referencedColumnName = "ID", nullable = false)})
	private List<ProcessStep> processSteps;
	
	@ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "APP_SERVICE_ID", nullable = false, insertable = false)
	private AppService appService;
	
}
