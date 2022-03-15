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
@Table(name = "CSM_BUSINESS_PROCESS")
public class BusinessProcess implements Serializable  {

	
	private static final long serialVersionUID = 267803872317420154L;
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;	

	@Column(name = "LABEL")
	private String label;

	@Column(name = "ORDER_CODE")
	private String orderCode;
	
	@Column(name = "PARENT")
	private String parent;	
	
}

