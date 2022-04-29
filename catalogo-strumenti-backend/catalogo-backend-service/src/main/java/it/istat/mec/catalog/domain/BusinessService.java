package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "CSM_BUSINESS_SERVICE")
public class BusinessService implements Serializable  {

	private static final long serialVersionUID = 4780254819197312841L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Integer id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;
 
	@OneToMany(mappedBy = "businessService", cascade = CascadeType.ALL)  
    private List<ProcessStep> processSteps;
	
	@OneToMany(mappedBy = "businessService", cascade = CascadeType.ALL)  
    private List<AppService> appServices;
	
	public BusinessService(Integer id) {
		super();
		this.id = id;
	}
	
}
