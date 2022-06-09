package it.istat.mec.catalog.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.AgentDao;
import it.istat.mec.catalog.dao.BusinessServiceDao;
import it.istat.mec.catalog.dao.DocumentationDao;
import it.istat.mec.catalog.dao.GsbpmProcessDao;
import it.istat.mec.catalog.dao.StatisticalMethodDao;
import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.domain.Agent;
import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.Documentation;
import it.istat.mec.catalog.domain.GsbpmProcess;
import it.istat.mec.catalog.domain.LinkAgentTool;
import it.istat.mec.catalog.domain.StatisticalMethod;
import it.istat.mec.catalog.dto.CatalogToolDTO;
import it.istat.mec.catalog.dto.CatalogToolMiniListDTO;
import it.istat.mec.catalog.dto.StatisticalMethodDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateToolRequest;
import it.istat.mec.catalog.translators.Translators;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
@Service
public class ToolService {
	
	@Autowired
	ToolDao toolDao;
	@Autowired
	BusinessServiceDao businessServiceDao;
	
	@Autowired
	AgentDao agentDao;
	@Autowired
	DocumentationDao documentationDao;
	@Autowired
	GsbpmProcessDao gsbpmProcessDao;
	
	@Autowired
	StatisticalMethodDao statisticalMethodDao;

	public List<CatalogToolMiniListDTO> findAllTools(Integer[] type, Integer[] gsbpmIds, String[] orderBy, String[] sort) {
	
		List<Order> orders = new ArrayList<Order>();
		for (int i = 0; i < orderBy.length; i++) {
			Order order = new Order((i<sort.length &&  Sort.Direction.DESC.name().equalsIgnoreCase(sort[i]))? Sort.Direction.DESC:Sort.Direction.ASC,orderBy[i]);
			orders.add(order);

		}
		Sort sortQuery = Sort.by(orders);
		
		List<GsbpmProcess> gsbpmProcesses=new ArrayList<GsbpmProcess>();
		if(gsbpmIds!=null)  
		for (int i = 0; i < gsbpmIds.length; i++) {
			gsbpmProcesses.add(new GsbpmProcess(gsbpmIds[i]));
		}
	 
		List<Integer> types=new ArrayList<Integer>();
		if(type!=null) 
		for (int i = 0; i < type.length; i++) {
			types.add(Integer.valueOf(type[i]));
		}
	 return Translators.translateMiniTools(toolDao.findAllWithFilter(types,types.size(), gsbpmProcesses,gsbpmProcesses.size(),sortQuery));
	  
	}
	
	@Transactional
	public CatalogToolDTO newTool(CreateToolRequest request) {
		CatalogTool tool = new CatalogTool();
		
		List<GsbpmProcess> gsbpmProcesses = new ArrayList<GsbpmProcess>();
		List<LinkAgentTool> linkAgentsTools = new ArrayList<LinkAgentTool>();
		List<StatisticalMethod> statisticalMethods = new ArrayList<StatisticalMethod>();
		List<Documentation> documentations = new ArrayList<Documentation>();
		
		tool = Translators.translate(request);	
		
		if(request.getGsbpmProcesses()!=null) {
			for(int i=0; i<request.getGsbpmProcesses().length; i++)
				gsbpmProcesses.add(new GsbpmProcess(request.getGsbpmProcesses()[i]));
		}
		if(request.getLinkAgents()!=null) {
			for(int i=0; i<request.getLinkAgents().length; i++) {				
				LinkAgentTool linkAgentTool = new LinkAgentTool();		
				
				Agent agent = agentDao.findById(request.getLinkAgents()[i].getAgent()).get();
				linkAgentTool.setId(request.getLinkAgents()[i].getId());
				linkAgentTool.setAgent(agent);
				linkAgentTool.setTool(tool);
				linkAgentTool.setNotes(request.getLinkAgents()[i].getNotes());
				linkAgentTool.setReferenceDate(request.getLinkAgents()[i].getReferenceDate());
				linkAgentTool.setRole(request.getLinkAgents()[i].getRole());	
				
				linkAgentsTools.add(linkAgentTool);
			}
		}
		if(request.getStatisticalMethods()!=null) {
			for(int i=0; i<request.getStatisticalMethods().length; i++)
				statisticalMethods.add(new StatisticalMethod(request.getStatisticalMethods()[i]));
		}
		if(request.getDocumentations()!=null) {
			for(int i=0; i<request.getDocumentations().length; i++) {				
				Documentation doc = documentationDao.findById(request.getDocumentations()[i]).get();
				doc.getCatalogTools().add(tool);
				documentations.add(doc);
			}
			
		}
		tool.setGsbpmProcesses(gsbpmProcesses);
		tool.setLinkAgentsTools(linkAgentsTools);
		tool.setStatisticalMethods(statisticalMethods);
		tool.setDocumentations(documentations);
		
		Date date = new Date(System.currentTimeMillis());	
		
		tool.setLastUpdate(date);	
		
		BusinessService businessService=new BusinessService();
		businessService.setName(tool.getName());
		businessService.setDescr(tool.getDescription());
		
		businessService=businessServiceDao.save(businessService);
		tool.setBusinessService(businessService);
		
		
		toolDao.save(tool);
		return Translators.translate(tool);
	}
	
	public CatalogToolDTO findToolById(Integer id) {

		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
		return Translators.translate(toolDao.findById(id).get());
	}
	
	public CatalogToolDTO updateTool(CreateToolRequest request) {		
		
		if (!toolDao.findById(request.getId()).isPresent())
			throw new NoDataException("Tool not present");
		
		CatalogTool tool = toolDao.findById(request.getId()).get();	
		
		List<GsbpmProcess> gsbpmProcesses = new ArrayList<GsbpmProcess>();
		List<LinkAgentTool> linkAgentsTools = new ArrayList<LinkAgentTool>();
		List<StatisticalMethod> statisticalMethods = new ArrayList<StatisticalMethod>();
		List<Documentation> documentations = new ArrayList<Documentation>();
		
		tool = Translators.translate(request);
		
		if(request.getGsbpmProcesses()!=null) {
			for(int i=0; i<request.getGsbpmProcesses().length; i++)
				gsbpmProcesses.add(new GsbpmProcess(request.getGsbpmProcesses()[i]));
		}
		if(request.getLinkAgents()!=null) {
			for(int i=0; i<request.getLinkAgents().length; i++) {				
				LinkAgentTool linkAgentTool = new LinkAgentTool();		
				
				Agent agent = agentDao.findById(request.getLinkAgents()[i].getAgent()).get();
				linkAgentTool.setId(request.getLinkAgents()[i].getId());
				linkAgentTool.setAgent(agent);
				linkAgentTool.setTool(tool);
				linkAgentTool.setNotes(request.getLinkAgents()[i].getNotes());
				linkAgentTool.setReferenceDate(request.getLinkAgents()[i].getReferenceDate());
				linkAgentTool.setRole(request.getLinkAgents()[i].getRole());	
				
				linkAgentsTools.add(linkAgentTool);
			}
		}
		if(request.getStatisticalMethods()!=null) {
			for(int i=0; i<request.getStatisticalMethods().length; i++)
				statisticalMethods.add(new StatisticalMethod(request.getStatisticalMethods()[i]));
		}
		if(request.getDocumentations()!=null) {
			for(int i=0; i<request.getDocumentations().length; i++) {				
				Documentation doc = documentationDao.findById(request.getDocumentations()[i]).get();
				doc.getCatalogTools().add(tool);
				documentations.add(doc);
			}
			
		}
		tool.setGsbpmProcesses(gsbpmProcesses);
		tool.setLinkAgentsTools(linkAgentsTools);
		tool.setStatisticalMethods(statisticalMethods);
		tool.setDocumentations(documentations);
				
		
		Date date = new Date(System.currentTimeMillis());	
		
		tool.setLastUpdate(date);
		toolDao.save(tool);		
		
		return Translators.translate(tool);
	}
	public CatalogToolDTO deleteTool(Integer id) {		
		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
			CatalogTool tool = toolDao.findById(id).get();
			toolDao.delete(tool);
			return Translators.translate(tool);		
	}

	public List<CatalogToolMiniListDTO> findToolsByBusinessFunctions(Integer id) {
	 	 return Translators.translateMiniTools(toolDao.findToolsByBusinessFunctions(new BusinessFunction(id)));
		 
	}
	
	public List<CatalogToolMiniListDTO> findToolsByStatisticalMethod(Integer id) {		
	 	return Translators.translateMiniTools(toolDao.findToolsStatisticalMethod(new StatisticalMethod(id)));
		 
	}
	
	public List<CatalogToolMiniListDTO> findToolsByAgent(Integer id) {		
	 	return Translators.translateMiniTools(toolDao.findToolsByAgent(new Agent(id)));
		 
	}
	
	public List<CatalogToolMiniListDTO> findToolsByDocumentation(Integer id) {		
	 	return Translators.translateMiniTools(toolDao.findToolsByDocumentation(new Documentation(id)));
		 
	}

	public CatalogToolDTO addDocumentation(Integer id, Integer docID) {
		
		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
		CatalogTool tool = toolDao.findById(id).get();

		if (!documentationDao.findById(docID).isPresent())
			throw new NoDataException("Documentation not present");
		Documentation doc = documentationDao.findById(docID).get();
		tool.getDocumentations().add(doc);

		tool = toolDao.save(tool);
		return Translators.translate(tool);
	}
	
	public CatalogToolDTO removeDocumentation(Integer id, Integer docID) {
		
		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
		CatalogTool tool = toolDao.findById(id).get();
		if (!documentationDao.findById(docID).isPresent())
			throw new NoDataException("Documentation not present");
		Documentation doc = documentationDao.findById(docID).get();
		tool.getDocumentations().remove(doc);
		tool = toolDao.save(tool);
		return Translators.translate(tool);
	}
}
