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

	@Column(name = "BUSINESS_SERVICE_ID")
	private String businessServiceId;
	
	@Column(name = "SUBSTEP")
	private String substep;	
}
