package it.istat.mec.catalog.service;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.GsbpmProcess;
import it.istat.mec.catalog.dto.CatalogToolDTO;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateToolRequest;
import it.istat.mec.catalog.request.UpdateToolRequest;
import it.istat.mec.catalog.translators.Translators;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
@Service
public class ToolService {
	
	@Autowired
	ToolDao toolDao;

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
		toolDao.save(tool);
		return Translators.translate(tool);
	}
	
	public CatalogToolDTO findToolById(Long id) {

		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
		return Translators.translate(toolDao.findById(id).get());
	}
	
	public CatalogToolDTO updateTool(UpdateToolRequest request) {		
		
		if (!toolDao.findById(request.getId()).isPresent())
			throw new NoDataException("Tool not present");
		
		CatalogTool tool = toolDao.findById(request.getId()).get();	
		
		tool = Translators.translateUpdate(request, tool);
		
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
