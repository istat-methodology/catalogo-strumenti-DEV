package it.istat.mec.catalog.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESC")
	private String desc;
	
	@Column(name = "STEP")
	private String step;	
	
	@ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "TYPE", nullable = false, insertable = false)
 	private DesignType designType;
	
	@ManyToOne(optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "CSM_INFORMATION_OBJECT_ID", nullable = false, insertable = false)
 	private InformationObject csmInformationObjecdId;
	
	
	
}
