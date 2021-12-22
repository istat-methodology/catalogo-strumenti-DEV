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
@Table(name = "CLS_DOCUMENT_TYPE")
public class DocumentType implements Serializable  {

	private static final long serialVersionUID = 5618704681989455879L;
	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;
}
