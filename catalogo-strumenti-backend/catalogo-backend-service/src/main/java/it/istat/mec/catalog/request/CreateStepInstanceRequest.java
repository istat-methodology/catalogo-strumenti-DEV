package it.istat.mec.catalog.request;

import java.io.Serializable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateStepInstanceRequest implements Serializable {

	private static final long serialVersionUID = -5844676942420048218L;
	private Integer id;

	private String descr;
	private String method;

	private Integer statMethod;

	private String functionality;

	private Integer appService;

}
