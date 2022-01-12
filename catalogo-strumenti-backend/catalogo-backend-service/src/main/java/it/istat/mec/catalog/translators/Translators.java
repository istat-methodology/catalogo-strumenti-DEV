package it.istat.mec.catalog.translators;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.modelmapper.Provider;
import org.modelmapper.Provider.ProvisionRequest;
import org.modelmapper.TypeMap;
import org.springframework.stereotype.Component;

import it.istat.mec.catalog.domain.Agent;
import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.DesktopApplication;
import it.istat.mec.catalog.domain.Documentation;
import it.istat.mec.catalog.domain.GsbpmProcess;
import it.istat.mec.catalog.domain.SoftwareProcedure;
import it.istat.mec.catalog.domain.StatisticalMethod;
import it.istat.mec.catalog.domain.StatisticalService;
import it.istat.mec.catalog.domain.ToolType;
import it.istat.mec.catalog.dto.AgentDto;
import it.istat.mec.catalog.dto.BusinessFunctionDto;
import it.istat.mec.catalog.dto.CatalogToolDTO;
import it.istat.mec.catalog.dto.DesktopApplicationDto;
import it.istat.mec.catalog.dto.DocumentationDto;
import it.istat.mec.catalog.dto.GSBPMProcessDto;
import it.istat.mec.catalog.dto.SoftwareProcedureDto;
import it.istat.mec.catalog.dto.StatisticalMethodDto;
import it.istat.mec.catalog.dto.StatisticalServiceDto;
import it.istat.mec.catalog.dto.ToolTypeDto;
import it.istat.mec.catalog.request.CreateAgentRequest;
import it.istat.mec.catalog.request.CreateBusinessFunctionRequest;
import it.istat.mec.catalog.request.CreateDesktopApplicationRequest;
import it.istat.mec.catalog.request.CreateDocumentationRequest;
import it.istat.mec.catalog.request.CreateSoftwareProcedureRequest;
import it.istat.mec.catalog.request.CreateStatisticalMethodRequest;
import it.istat.mec.catalog.request.CreateStatisticalServiceRequest;
import it.istat.mec.catalog.request.CreateToolRequest;
import it.istat.mec.catalog.request.UpdateToolRequest;


@Component
public class Translators {



	public static GSBPMProcessDto translate(GsbpmProcess x) {

		final ModelMapper modelMapper = new ModelMapper();
		final GSBPMProcessDto dTO = modelMapper.map(x, GSBPMProcessDto.class);
		return dTO;
	}

	public static CatalogToolDTO translate(CatalogTool x) {
		
		final ModelMapper modelMapper = new ModelMapper();
		TypeMap<CatalogTool, CatalogToolDTO> typeMap = modelMapper.createTypeMap(CatalogTool.class, CatalogToolDTO.class);

	    typeMap
	     .include(DesktopApplication .class, CatalogToolDTO.class)
	    .include(StatisticalService.class, CatalogToolDTO.class)
	    .include(SoftwareProcedure.class, CatalogToolDTO.class);
	    
	    modelMapper.typeMap(DesktopApplication.class, CatalogToolDTO.class).setProvider(new Provider<CatalogToolDTO>() {
            public CatalogToolDTO get(ProvisionRequest<CatalogToolDTO> request) {
                return new DesktopApplicationDto();
            }
        });
        modelMapper.typeMap(StatisticalService.class, CatalogToolDTO.class).setProvider(new Provider<CatalogToolDTO>() {
            public CatalogToolDTO get(ProvisionRequest<CatalogToolDTO> request) {
                return new StatisticalServiceDto();
            }
        });
        
        modelMapper.typeMap(SoftwareProcedure.class, CatalogToolDTO.class).setProvider(new Provider<CatalogToolDTO>() {
            public CatalogToolDTO get(ProvisionRequest<CatalogToolDTO> request) {
                return new SoftwareProcedureDto();
            }
        });
        
        
        CatalogToolDTO dTO=null; 
        if(x instanceof  StatisticalService) dTO =modelMapper.map(x,StatisticalServiceDto.class);  
        if(x instanceof  DesktopApplication) dTO =modelMapper.map(x,DesktopApplicationDto.class);   
        if(x instanceof  SoftwareProcedure)  dTO =modelMapper.map(x,SoftwareProcedureDto.class);  
	//	final CatalogToolDTO dTO = modelMapper.map(x,CatalogToolDTO.class);
   
		return dTO;
	}

	public static AgentDto translate(Agent x) {

		final ModelMapper modelMapper = new ModelMapper();
		final AgentDto dTO = modelMapper.map(x, AgentDto.class);
		return dTO;
	}

	public static BusinessFunctionDto translate(BusinessFunction x) {

		final ModelMapper modelMapper = new ModelMapper();
		final BusinessFunctionDto bsDto = modelMapper.map(x, BusinessFunctionDto.class);
		return bsDto;
	}

	/*public static DesktopApplicationDto translate(DesktopApplication x) {

		final ModelMapper modelMapper = new ModelMapper();
		final DesktopApplicationDto dsDto = modelMapper.map(x, DesktopApplicationDto.class);
		return dsDto;
	}

	public static SoftwareProcedureDto translate(SoftwareProcedure x) {

		final ModelMapper modelMapper = new ModelMapper();
		final SoftwareProcedureDto sp = modelMapper.map(x, SoftwareProcedureDto.class);
		return sp;
	}
/*/
	public static DocumentationDto translate(Documentation x) {

		final ModelMapper modelMapper = new ModelMapper();
		final DocumentationDto doc = modelMapper.map(x, DocumentationDto.class);
		return doc;
	}

	public static StatisticalMethodDto translate(StatisticalMethod x) {

		final ModelMapper modelMapper = new ModelMapper();
		final StatisticalMethodDto sm = modelMapper.map(x, StatisticalMethodDto.class);
		return sm;
	}

	/*public static StatisticalServiceDto translate(StatisticalService x) {

		final ModelMapper modelMapper = new ModelMapper();
		final StatisticalServiceDto ss = modelMapper.map(x, StatisticalServiceDto.class);
		return ss;
	}
*/
	public static List<CatalogToolDTO> translate(List<CatalogTool> list) {
		final ModelMapper modelMapper = new ModelMapper();
		TypeMap<CatalogTool, CatalogToolDTO> typeMap = modelMapper.createTypeMap(CatalogTool.class, CatalogToolDTO.class);

	    typeMap
	     .include(DesktopApplication .class, DesktopApplicationDto.class)
	    .include(StatisticalService.class, StatisticalServiceDto.class)
	    .include(SoftwareProcedure.class, SoftwareProcedureDto.class);
	    typeMap
	     .include(DesktopApplication .class, CatalogToolDTO.class)
	    .include(StatisticalService.class, CatalogToolDTO.class)
	    .include(SoftwareProcedure.class, CatalogToolDTO.class);
	    
	    modelMapper.typeMap(DesktopApplication.class, CatalogToolDTO.class).setProvider(new Provider<CatalogToolDTO>() {
           public CatalogToolDTO get(ProvisionRequest<CatalogToolDTO> request) {
               return new DesktopApplicationDto();
           }
       });
       modelMapper.typeMap(StatisticalService.class, CatalogToolDTO.class).setProvider(new Provider<CatalogToolDTO>() {
           public CatalogToolDTO get(ProvisionRequest<CatalogToolDTO> request) {
               return new StatisticalServiceDto();
           }
       });
       
       modelMapper.typeMap(SoftwareProcedure.class, CatalogToolDTO.class).setProvider(new Provider<CatalogToolDTO>() {
           public CatalogToolDTO get(ProvisionRequest<CatalogToolDTO> request) {
               return new SoftwareProcedureDto();
           }
       });

		return mapList(list, CatalogToolDTO.class,modelMapper);
	}
	
	public static List<GSBPMProcessDto> translateGsbpmProcess(List<GsbpmProcess> list) {
		//final ModelMapper modelMapper = new ModelMapper();
	//	TypeMap<GsbpmProcess, GSBPMProcessDto> typeMap = modelMapper.createTypeMap(GsbpmProcess.class, GSBPMProcessDto.class).addMapping(mapper -> mapper.when(getGsbpmProcessParent == null).map(GsbpmProcess::getGsbpmSubProcesses, GSBPMProcessDto::setGsbpmSubProcesses));
		return mapList(list, GSBPMProcessDto.class);
	}


	public static List<AgentDto> translateAgentList(List<Agent> list) {
		return mapList(list, AgentDto.class);
	}

	public static List<BusinessFunctionDto> translateBF(List<BusinessFunction> list) {
		return mapList(list, BusinessFunctionDto.class);
	}

	public static List<DesktopApplicationDto> translateDA(List<DesktopApplication> list) {
		return mapList(list, DesktopApplicationDto.class);
	}

	public static List<SoftwareProcedureDto> translateSP(List<SoftwareProcedure> list) {
		return mapList(list, SoftwareProcedureDto.class);
	}

	public static List<DocumentationDto> translateDoc(List<Documentation> list) {
		return mapList(list, DocumentationDto.class);
	}

	public static List<StatisticalMethodDto> translateSM(List<StatisticalMethod> list) {
		return mapList(list, StatisticalMethodDto.class);
	}

	public static List<StatisticalServiceDto> translateSS(List<StatisticalService> list) {
		return mapList(list, StatisticalServiceDto.class);
	}

	public static <S, T> List<T> mapList(List<S> source, Class<T> targetClass) {
		final ModelMapper modelMapper = new ModelMapper();
		return source.stream().map(element -> modelMapper.map(element, targetClass)).collect(Collectors.toList());
	}
	
	public static <S, T> List<T> mapList(List<S> source, Class<T> targetClass,final ModelMapper modelMapper) {
	  return source.stream().map(element -> modelMapper.map(element, targetClass)).collect(Collectors.toList());
	}

	private static Class checkClassType(CatalogTool element, Class targetClass) {
		// TODO Auto-generated method stub
		   Class dtoClass=CatalogToolDTO.class;
	        if(element instanceof  StatisticalService) dtoClass=  StatisticalServiceDto.class;  
	        if(element instanceof  DesktopApplication) dtoClass = DesktopApplicationDto.class;   
	        if(element instanceof  SoftwareProcedure)  dtoClass=  SoftwareProcedureDto.class; 
		return dtoClass;
	}

	public static Agent translate(CreateAgentRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final Agent agent = modelMapper.map(x, Agent.class);
		return agent;
	}

	public static BusinessFunction translate(CreateBusinessFunctionRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final BusinessFunction bs = modelMapper.map(x, BusinessFunction.class);
		return bs;
	}

	public static CatalogTool translate(CreateToolRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final CatalogTool tool = modelMapper.map(x, CatalogTool.class);
		return tool;
	}

	public static DesktopApplication translate(CreateDesktopApplicationRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final DesktopApplication da = modelMapper.map(x, DesktopApplication.class);
		return da;
	}

	public static Documentation translate(CreateDocumentationRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final Documentation doc = modelMapper.map(x, Documentation.class);
		return doc;
	}

	public static SoftwareProcedure translate(CreateSoftwareProcedureRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final SoftwareProcedure sp = modelMapper.map(x, SoftwareProcedure.class);
		return sp;
	}

	public static StatisticalMethod translate(CreateStatisticalMethodRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final StatisticalMethod sm = modelMapper.map(x, StatisticalMethod.class);
		return sm;
	}

	public static StatisticalService translate(CreateStatisticalServiceRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final StatisticalService ss = modelMapper.map(x, StatisticalService.class);
		return ss;
	}

	public static CatalogTool translateUpdate(UpdateToolRequest x, CatalogTool tool) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, tool);

		return tool;
	}

	public static BusinessFunction translateUpdate(CreateBusinessFunctionRequest x, BusinessFunction bs) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, bs);

		return bs;
	}

	public static Agent translateUpdate(CreateAgentRequest x, Agent agent) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, agent);

		return agent;
	}

	public static Documentation translateUpdate(CreateDocumentationRequest x, Documentation doc) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, doc);

		return doc;
	}

	public static DesktopApplication translateUpdate(CreateDesktopApplicationRequest x, DesktopApplication da) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, da);

		return da;
	}

	public static SoftwareProcedure translateUpdate(CreateSoftwareProcedureRequest x, SoftwareProcedure sp) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, sp);

		return sp;
	}

	public static StatisticalMethod translateUpdate(CreateStatisticalMethodRequest x, StatisticalMethod sm) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, sm);
		return sm;
	}

	public static StatisticalService translateUpdate(CreateStatisticalServiceRequest x, StatisticalService ss) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, ss);
		return ss;
	}

	public static List<ToolTypeDto> translateToolTypeList(List<ToolType> list) {
		
		return mapList(list, ToolTypeDto.class);
	}

}
