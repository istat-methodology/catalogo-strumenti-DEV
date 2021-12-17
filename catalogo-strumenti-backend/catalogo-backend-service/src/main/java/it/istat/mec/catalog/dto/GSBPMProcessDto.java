package it.istat.mec.catalog.dto;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class GSBPMProcessDto extends BaseDto implements Serializable {

	private static final long serialVersionUID = -6905546979001300372L;
 
	private String name;
	private String descr;
	private Boolean active;
	private Short orderCode;
	private GSBPMProcessDto gsbpmProcessParent;
	private List<GSBPMProcessDto> gsbpmSubProcesses = new ArrayList<>();

}
