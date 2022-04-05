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
@Table(name = "CSM_CLS_DATA_TYPE")
public class DataType implements Serializable  {

	private static final long serialVersionUID = 2770935607864704065L;

	@Id
	@Column(name = "ID")
	private Long id;

	@Column(name = "type")
	private String type;
 
}
