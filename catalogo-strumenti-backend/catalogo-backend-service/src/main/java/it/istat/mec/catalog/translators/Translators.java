package it.istat.mec.catalog.translators;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.modelmapper.Provider;
import org.modelmapper.TypeMap;
import org.springframework.stereotype.Component;

import it.istat.mec.catalog.constants.CatalogConst;
import it.istat.mec.catalog.domain.Agent;
import it.istat.mec.catalog.domain.AppService;
import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.domain.BusinessProcess;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.DesktopApplication;
import it.istat.mec.catalog.domain.Documentation;
import it.istat.mec.catalog.domain.DocumentationType;
import it.istat.mec.catalog.domain.GsbpmProcess;
import it.istat.mec.catalog.domain.InformationObject;
import it.istat.mec.catalog.domain.LinkAgentTool;
import it.istat.mec.catalog.domain.ProcessDesign;
import it.istat.mec.catalog.domain.ProcessStep;
import it.istat.mec.catalog.domain.SoftwareProcedure;
import it.istat.mec.catalog.domain.StatisticalMethod;
import it.istat.mec.catalog.domain.StatisticalService;
import it.istat.mec.catalog.domain.StepInstance;
import it.istat.mec.catalog.domain.ToolType;
import it.istat.mec.catalog.dto.AgentDto;
import it.istat.mec.catalog.dto.AppServiceDto;
import it.istat.mec.catalog.dto.BusinessFunctionDto;
import it.istat.mec.catalog.dto.BusinessFunctionMiniDto;
import it.istat.mec.catalog.dto.BusinessProcessDto;
import it.istat.mec.catalog.dto.BusinessProcessMiniDto;
import it.istat.mec.catalog.dto.BusinessServiceDto;
import it.istat.mec.catalog.dto.CatalogToolDTO;
import it.istat.mec.catalog.dto.CatalogToolMiniListDTO;
import it.istat.mec.catalog.dto.DesktopApplicationDto;
import it.istat.mec.catalog.dto.DocumentationDto;
import it.istat.mec.catalog.dto.DocumentationTypeDto;
import it.istat.mec.catalog.dto.GSBPMProcessDto;
import it.istat.mec.catalog.dto.InformationObjectDto;
import it.istat.mec.catalog.dto.LinkAgentToolDto;
import it.istat.mec.catalog.dto.ProcessDesignDto;
import it.istat.mec.catalog.dto.ProcessStepDto;
import it.istat.mec.catalog.dto.ProcessStepInverseDto;
import it.istat.mec.catalog.dto.SoftwareProcedureDto;
import it.istat.mec.catalog.dto.StatisticalMethodDto;
import it.istat.mec.catalog.dto.StatisticalServiceDto;
import it.istat.mec.catalog.dto.StepInstanceDto;
import it.istat.mec.catalog.dto.StepInstanceInverseDto;
import it.istat.mec.catalog.dto.ToolTypeDto;
import it.istat.mec.catalog.request.CreateAgentRequest;
import it.istat.mec.catalog.request.CreateAppServiceRequest;
import it.istat.mec.catalog.request.CreateBusinessFunctionRequest;
import it.istat.mec.catalog.request.CreateBusinessProcessRequest;
import it.istat.mec.catalog.request.CreateBusinessServiceRequest;
import it.istat.mec.catalog.request.CreateDesktopApplicationRequest;
import it.istat.mec.catalog.request.CreateDocumentationRequest;
import it.istat.mec.catalog.request.CreateInformationObjectRequest;
import it.istat.mec.catalog.request.CreateLinkAgentToolRequest;
import it.istat.mec.catalog.request.CreateProcessDesignRequest;
import it.istat.mec.catalog.request.CreateProcessStepRequest;
import it.istat.mec.catalog.request.CreateSoftwareProcedureRequest;
import it.istat.mec.catalog.request.CreateStatisticalMethodRequest;
import it.istat.mec.catalog.request.CreateStatisticalServiceRequest;
import it.istat.mec.catalog.request.CreateStepInstanceRequest;
import it.istat.mec.catalog.request.CreateToolRequest;
import it.istat.mec.catalog.request.UpdateToolRequest;


@Component
public class Translators {



	public static GSBPMProcessDto translate(GsbpmProcess x) {

		final ModelMapper modelMapper = new ModelMapper();
		final GSBPMProcessDto dTO = modelMapper.map(x, GSBPMProcessDto.class);
		return dTO;
	}
	
	public static AppServiceDto translate(AppService x) {

		final ModelMapper modelMapper = new ModelMapper();
		final AppServiceDto dTO = modelMapper.map(x, AppServiceDto.class);
		return dTO;
	}
	
	public static InformationObjectDto translate(InformationObject x) {

		final ModelMapper modelMapper = new ModelMapper();
		final InformationObjectDto dTO = modelMapper.map(x, InformationObjectDto.class);
		return dTO;
	}
	
	public static ProcessDesignDto translate(ProcessDesign x) {

		final ModelMapper modelMapper = new ModelMapper();
		final ProcessDesignDto dTO = modelMapper.map(x, ProcessDesignDto.class);
		return dTO;
	}
	
	public static CatalogToolMiniListDTO translateMini(CatalogTool x) {

		final ModelMapper modelMapper = new ModelMapper();
		final CatalogToolMiniListDTO dTO = modelMapper.map(x, CatalogToolMiniListDTO.class);
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
	
	public static LinkAgentToolDto translate(LinkAgentTool x) {

		final ModelMapper modelMapper = new ModelMapper();
		final LinkAgentToolDto dTO = modelMapper.map(x, LinkAgentToolDto.class);
		return dTO;
	}
	
	public static BusinessServiceDto translate(BusinessService x) {

		final ModelMapper modelMapper = new ModelMapper();
		final BusinessServiceDto bsDto = modelMapper.map(x, BusinessServiceDto.class);
		return bsDto;
	}

	public static BusinessFunctionDto translate(BusinessFunction x) {

		final ModelMapper modelMapper = new ModelMapper();
		final BusinessFunctionDto bfDto = modelMapper.map(x, BusinessFunctionDto.class);
		return bfDto;
	}
	
	public static BusinessProcessDto translate(BusinessProcess x) {

		final ModelMapper modelMapper = new ModelMapper();
		final BusinessProcessDto bpDto = modelMapper.map(x, BusinessProcessDto.class);
		return bpDto;
	}	
	
	public static ProcessStepDto translate(ProcessStep x) {

		final ModelMapper modelMapper = new ModelMapper();
		final ProcessStepDto psDto = modelMapper.map(x, ProcessStepDto.class);
		return psDto;
	}
	
	public static StepInstanceDto translate(StepInstance x) {

		final ModelMapper modelMapper = new ModelMapper();
		final StepInstanceDto siDto = modelMapper.map(x, StepInstanceDto.class);
		return siDto;
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

	public static StatisticalServiceDto translate(StatisticalService x) {

		final ModelMapper modelMapper = new ModelMapper();
		final StatisticalServiceDto ss = modelMapper.map(x, StatisticalServiceDto.class);
		return ss;
	}

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
	
	
	
	public static List<CatalogToolMiniListDTO> translateMiniTools(List<CatalogTool> list) {	
		final ModelMapper modelMapper = new ModelMapper();
		return  Arrays.asList(modelMapper.map(list, CatalogToolMiniListDTO[].class));
		
	}
	public static List<BusinessFunctionDto> translateBusinessFunctions(List<BusinessFunction> list) {	
		return mapList(list, BusinessFunctionDto.class);
	}
	public static List<BusinessFunctionMiniDto> translateBusinessFunctionsMini(List<BusinessFunction> list) {	
		return mapList(list, BusinessFunctionMiniDto.class);
	}
	
	public static List<GSBPMProcessDto> translateGsbpmProcess(List<GsbpmProcess> list) {
		//final ModelMapper modelMapper = new ModelMapper();
	//	TypeMap<GsbpmProcess, GSBPMProcessDto> typeMap = modelMapper.createTypeMap(GsbpmProcess.class, GSBPMProcessDto.class).addMapping(mapper -> mapper.when(getGsbpmProcessParent == null).map(GsbpmProcess::getGsbpmSubProcesses, GSBPMProcessDto::setGsbpmSubProcesses));
		return mapList(list, GSBPMProcessDto.class);
	}


	public static List<AgentDto> translateAgentList(List<Agent> list) {
		return mapList(list, AgentDto.class);
	}
	
	public static List<LinkAgentToolDto> translateLinkAgentToolList(List<LinkAgentTool> list) {
		return mapList(list, LinkAgentToolDto.class);
	}
	
	public static List<BusinessServiceDto> translateBS(List<BusinessService> list) {
		return mapList(list, BusinessServiceDto.class);
	}

	public static List<BusinessFunctionDto> translateBF(List<BusinessFunction> list) {
		return mapList(list, BusinessFunctionDto.class);
	}
	
	public static List<BusinessProcessDto> translateBP(List<BusinessProcess> list) {
		return mapList(list, BusinessProcessDto.class);
	}
	
	public static List<BusinessProcessMiniDto> translateBPMini(List<BusinessProcess> list) {
		return mapList(list, BusinessProcessMiniDto.class);
	}
	
	public static List<ProcessStepDto> translatePS(List<ProcessStep> list) {
		return mapList(list, ProcessStepDto.class);
	}
	
	public static List<ProcessDesignDto> translatePD(List<ProcessDesign> list) {
		return mapList(list, ProcessDesignDto.class);
	}
	
	public static List<ProcessStepInverseDto> translateProcessStepInverse(List<ProcessStep> list) {
		return mapList(list, ProcessStepInverseDto.class);
	}
	
	public static List<StepInstanceDto> translateSI(List<StepInstance> list) {
		return mapList(list, StepInstanceDto.class);
	}
	
	public static List<InformationObjectDto> translateIO(List<InformationObject> list) {
		return mapList(list, InformationObjectDto.class);
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
	  return (List<T>) source.stream().map(element -> modelMapper.map(element,getExtendedClassType(element.getClass(), targetClass))).collect(Collectors.toList());
	}

	public static Class getExtendedClassType(Class elementClass, Class targetClass) {
		// TODO Auto-generated method stub
		   Class dtoClass=targetClass;
	        if(elementClass ==  StatisticalService.class) dtoClass=  StatisticalServiceDto.class;  
	        if(elementClass ==  DesktopApplication.class) dtoClass = DesktopApplicationDto.class;   
	        if(elementClass ==  SoftwareProcedure.class)  dtoClass=  SoftwareProcedureDto.class; 
		return dtoClass;
	}

	public static Agent translate(CreateAgentRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final Agent agent = modelMapper.map(x, Agent.class);
		return agent;
	}
	
	public static AppService translate(CreateAppServiceRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final AppService appService = modelMapper.map(x, AppService.class);
		return appService;
	}
	
	public static LinkAgentTool translate(CreateLinkAgentToolRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final LinkAgentTool toolAgent = modelMapper.map(x, LinkAgentTool.class);
		return toolAgent;
	}

	public static BusinessService translate(CreateBusinessServiceRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final BusinessService bs = modelMapper.map(x, BusinessService.class);
		return bs;
	}
	
	public static BusinessFunction translate(CreateBusinessFunctionRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final BusinessFunction bf = modelMapper.map(x, BusinessFunction.class);
		return bf;
	}
	
	public static BusinessProcess translate(CreateBusinessProcessRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final BusinessProcess bp = modelMapper.map(x, BusinessProcess.class);
		return bp;
	}
	
	public static ProcessStep translate(CreateProcessStepRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final ProcessStep ps = modelMapper.map(x, ProcessStep.class);
		return ps;
	}
	
	public static ProcessDesign translate(CreateProcessDesignRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final ProcessDesign pd = modelMapper.map(x, ProcessDesign.class);
		return pd;
	}
	
	public static InformationObject translate(CreateInformationObjectRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final InformationObject io = modelMapper.map(x, InformationObject.class);
		return io;
	}
	
	public static StepInstance translate(CreateStepInstanceRequest x) {

		final ModelMapper modelMapper = new ModelMapper();
		final StepInstance si = modelMapper.map(x, StepInstance.class);
		return si;
	}

	public static CatalogTool translate(CreateToolRequest x) {
		Class targetClass = null;
		if(x.getToolType()==CatalogConst.CATALOG_TYPE_STATISTICAL_SERVICE) {
			targetClass = StatisticalService.class;
		}
		if(x.getToolType()==CatalogConst.CATALOG_TYPE_DESKTOP_APPLICATION) {
			targetClass = DesktopApplication.class;
		}
		if(x.getToolType()==CatalogConst.CATALOG_TYPE_SOFTWARE_PROCEDURE) {
			targetClass = SoftwareProcedure.class;
		}
		
		final ModelMapper modelMapper = new ModelMapper();
		final CatalogTool tool = (CatalogTool) modelMapper.map(x, targetClass);
		tool.setToolType(new ToolType(x.getToolType()));	
	
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
	
	public static ProcessDesign translateUpdate(CreateProcessDesignRequest x, ProcessDesign pd) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, pd);

		return pd;
	}
	
	public static BusinessService translateUpdate(CreateBusinessServiceRequest x, BusinessService bs) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, bs);

		return bs;
	}

	public static BusinessFunction translateUpdate(CreateBusinessFunctionRequest x, BusinessFunction bf) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, bf);

		return bf;
	}
	
	public static BusinessProcess translateUpdate(CreateBusinessProcessRequest x, BusinessProcess bp) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, bp);

		return bp;
	}
	
	public static ProcessStep translateUpdate(CreateProcessStepRequest x, ProcessStep ps) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, ps);

		return ps;
	}
	
	public static StepInstance translateUpdate(CreateStepInstanceRequest x, StepInstance si) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, si);

		return si;
	}
	
	public static InformationObject translateUpdate(CreateInformationObjectRequest x, InformationObject io) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, io);

		return io;
	}

	public static Agent translateUpdate(CreateAgentRequest x, Agent agent) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, agent);

		return agent;
	}
	
	public static AppService translateUpdate(CreateAppServiceRequest x, AppService appService) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, appService);

		return appService;
	}
	
	public static LinkAgentTool translateUpdate(CreateLinkAgentToolRequest x, LinkAgentTool toolAgent) {
		final ModelMapper modelMapper = new ModelMapper();
		modelMapper.map(x, toolAgent);

		return toolAgent;
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
	
	public static List<AppServiceDto> translateAppServiceList(List<AppService> list) {
		
		return mapList(list, AppServiceDto.class);
	}
	
    public static List<DocumentationTypeDto> translateDocumentationTypeList(List<DocumentationType> list) {
		
		return mapList(list, DocumentationTypeDto.class);
	}
	
	public static List<GsbpmProcess> translateGSBPMProcessList(List<GSBPMProcessDto> list) {
		
		return mapList(list, GsbpmProcess.class);
	}

	public static List<StepInstanceInverseDto> translateStepInstancesInverse(List<StepInstance> list) {

		return mapList(list, StepInstanceInverseDto.class);
	}

}
