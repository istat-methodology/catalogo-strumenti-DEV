package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "csm_information_object")
public class InformationObject implements Serializable  {

	private static final long serialVersionUID = -4138548145919392087L;

	@Id
	@Column(name = "ID")
	private Integer id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;
	
	@Column(name = "CSM_APP_ROLE_ID")
	private String csmAppRoleId;
	
	@Column(name = "CSM_BUSINESS_SERVICE_ID")
	private String businessService;
/*	
	@OneToOne(mappedBy = "informationObject")
	private ProcessDesign processDesign;
	*/
	public InformationObject() {		
	}
	public InformationObject(Integer id) {
		this.id=id;
	}
}
