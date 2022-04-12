package it.istat.mec.catalog.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "CSM_BUSINESS_SERVICE")
public class AppService implements Serializable  {

	
	private static final long serialVersionUID = 7543049167079818501L;

	@Id
	@Column(name = "ID")
	private Integer id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;
	
	@Column(name = "IMPLEMENTATION_LANGUAGE")
	private Long implementationLanguage;

	@Column(name = "ENGINE")
	private String engine;
	
	@Column(name = "SOURCE_PATH")
	private String SourcePath;
	
	@Column(name = "SOURCE_CODE")
	private Long sourceCode;

	@Column(name = "AUTHOR")
	private String author;
	
	@Column(name = "LICENCE")
	private String licence;
	
	@Column(name = "CONTACT")
	private Long contact;
	
	
 
	@OneToMany(mappedBy = "appService", cascade = CascadeType.ALL)
    private List<StepInstance> stepInstances;
	
	@ManyToOne
    @JoinColumn(name = "BUSINESS_SERVICE_ID", nullable = false, insertable = false)
	private BusinessService businessService;
	
}
