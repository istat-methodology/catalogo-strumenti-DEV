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
@Table(name = "CLS_TOOL_TYPE")
public class ToolType implements Serializable  {


	private static final long serialVersionUID = -9183210442808680679L;

	@Id
	@Column(name = "ID")
	private Integer id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCR")
	private String descr;
	
	public ToolType(Integer id) {
		this.id=id;
	}
}
