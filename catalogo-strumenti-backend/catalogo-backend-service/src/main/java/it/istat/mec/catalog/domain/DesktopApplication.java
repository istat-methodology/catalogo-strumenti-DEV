package it.istat.mec.catalog.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@DiscriminatorValue("2")
@Table(name = "CSM_DESKTOP_APPLICATION")
public class DesktopApplication extends CatalogTool implements Serializable  {

	
	private static final long serialVersionUID = -755222506187438035L;	
	
	@Column(name = "DOWNLOAD")
	private String download;	

	@Column(name = "LICENCE")
	private String licence;

	@Column(name = "LANGUAGE")
	private String language;

	@Column(name = "PACKAGE")
	private String packageApplication; 
	
	@Column(name = "OPERATIVE_SYSTEM")
	private String operativeSystem;
	
	@Column(name = "VERSION")
	private String version;
	
	@Column(name = "TECHNICAL_REQUIREMENTS")
	private String technicalRequirements;


}
