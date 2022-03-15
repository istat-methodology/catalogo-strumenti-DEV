package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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

	@Column(name = "APP_SERVICE_ID")
	private String appServiceId;
	
}
