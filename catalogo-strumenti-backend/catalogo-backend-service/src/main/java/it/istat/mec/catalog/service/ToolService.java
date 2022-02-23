package it.istat.mec.catalog.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.GsbpmProcessDao;
import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.GsbpmProcess;
import it.istat.mec.catalog.dto.CatalogToolDTO;
import it.istat.mec.catalog.dto.GSBPMProcessDto;
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
	GsbpmProcessDao gsbpmProcessDao;

	public List<CatalogToolDTO> findAllTools(Integer[] type, Integer[] gsbpmIds, String[] orderBy, String[] sort) {
	
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
	 
	 return Translators.translate(toolDao.findAllWithFilter(types,types.size(), gsbpmProcesses,gsbpmProcesses.size(),sortQuery));
  	}
	
	public CatalogToolDTO newTool(CreateToolRequest request) {
		CatalogTool tool = new CatalogTool();
		tool = Translators.translate(request);	
		
		Date date = new Date(System.currentTimeMillis());	
		
		tool.setLastUpdate(date);
		
		int[] gsbpmIds = request.getGsbpm();
		List <GsbpmProcess> gsbpmProcesses = new ArrayList <GsbpmProcess>();
		
		Optional<GsbpmProcess> gsbpmProcess;
		
		for(int i=0; i<gsbpmIds.length; i++) {
			gsbpmProcess = gsbpmProcessDao.findById(gsbpmIds[i]);
					
			gsbpmProcesses.add(gsbpmProcess.get());
		}		
		tool.setGsbpmProcesses(gsbpmProcesses);		
		
		toolDao.save(tool);
		return Translators.translate(tool);
	}
	
	public CatalogToolDTO findToolById(Long id) {

		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
		return Translators.translate(toolDao.findById(id).get());
	}
	
	public CatalogToolDTO updateTool(CreateToolRequest request) {		
		
		if (!toolDao.findById(request.getId()).isPresent())
			throw new NoDataException("Tool not present");
		
		CatalogTool tool = toolDao.findById(request.getId()).get();	
		
		tool = Translators.translate(request);
		Date date = new Date(System.currentTimeMillis());	
		
		tool.setLastUpdate(date);
		toolDao.save(tool);		
		
		return Translators.translate(tool);
	}
	public CatalogToolDTO deleteTool(Long id) {		
		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
			CatalogTool tool = toolDao.findById(id).get();
			toolDao.delete(tool);
			return Translators.translate(tool);		
	}
}
