package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CLS_DESIGN_TYPE")
public class DesignType implements Serializable  {

	private static final long serialVersionUID = 6751134601358411316L;

	@Id
	@Column(name = "ID")
	private Integer id;

	@Column(name = "TYPE")
	private String type;
	
	@Column(name = "PARENT")
	private Integer parent;	
	
	public DesignType() {		
	}
	public DesignType(Integer id) {
		this.id=id;
	}
	
	@OneToMany(mappedBy = "designType", cascade = CascadeType.ALL)   
	private List<ProcessSpecification> processSpecification;
}
