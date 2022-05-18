package it.istat.mec.catalog.domain;
import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "CSM_BUSINESS_FUNCTION")
public class BusinessFunction implements Serializable  {


	private static final long serialVersionUID = 267803872317420154L;
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)	
	@Column(name = "ID")
	private Integer id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;	

	@Column(name = "LABEL")
	private String label;

	@Column(name = "ACTIVE")
	private String active;	
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "csm_link_gsbpm_business_function", joinColumns = {
            @JoinColumn(name = "BUSINESS_FUNCTION_ID" , referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "GSBPM_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
	private List<GsbpmProcess> gsbpmProcesses;
	
	@ManyToMany
    @JoinTable(name = "csm_link_function_process", joinColumns = {
            @JoinColumn(name = "BUSINESS_FUNCTION_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "BUSINESS_PROCESS_ID", referencedColumnName = "ID", nullable = false, updatable = false, insertable = false)})
	private List<BusinessProcess> businessProcesses;
	
	
	public BusinessFunction(Integer id) {
		 super();
		 this.id=id;
	}
	public BusinessFunction() {
		 super();
	}

	
}
