package it.istat.mec.catalog.domain;
import java.io.Serializable;
import java.util.List;
import java.util.Optional;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "CSM_PROCESS_DESIGN")
public class ProcessDesign implements Serializable  {

	private static final long serialVersionUID = 4182189367596411863L;
	@Id  @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Integer id;
 
	@Column(name = "DESCR")
	private String descr;
	
	@ManyToOne(optional = true, fetch = FetchType.LAZY)
	@JoinColumn(name = "STEP", nullable = false, insertable = true)
	private ProcessStep step;
	
	public ProcessDesign() {		
	}
	 
	@OneToMany(mappedBy = "processDesign", cascade = CascadeType.ALL)   
	private List<ProcessSpecification> processSpecification;
 
	public ProcessDesign(Integer id) {
		this.id = id;
	} 
}
