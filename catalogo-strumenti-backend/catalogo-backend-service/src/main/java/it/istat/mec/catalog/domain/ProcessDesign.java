package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "CSM_PROCESS_DESIGN")
public class ProcessDesign implements Serializable  {

	private static final long serialVersionUID = 4182189367596411863L;
	@Id  @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Integer id;
 
    @ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "process_design_ID", nullable = false, insertable = false)
	private ProcessDesignDescription processDesignDescription;
 
    @ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "STEP", nullable = false, insertable = false)
	private ProcessStep step;	
	
	@ManyToOne
    @JoinColumn(name = "TYPE", nullable = false, insertable = false)
 	private DesignType designType;
		
	@ManyToOne
    @JoinColumn(name = "CSM_INFORMATION_OBJECT_ID", nullable = false, insertable = false)
	private InformationObject informationObject;
	
	
	
}
