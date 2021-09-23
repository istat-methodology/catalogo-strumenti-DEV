package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.dto.ToolDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateToolRequest;
import it.istat.mec.catalog.request.UpdateToolRequest;
import it.istat.mec.catalog.translators.Translators;
@Service
public class ToolService {
	
	@Autowired
	ToolDao toolDao;

	public List<ToolDto> findAllTools() {
		
		return Translators.translate(toolDao.findAll());

	}
	
	public ToolDto newTool(CreateToolRequest request) {
		CatalogTool tool = new CatalogTool();
		tool = Translators.translate(request);		
		toolDao.save(tool);
		return Translators.translate(tool);
	}
	
	public ToolDto findToolById(Long id) {

		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
		return Translators.translate(toolDao.findById(id).get());
	}
	
	public ToolDto updateTool(UpdateToolRequest request) {		
		
		if (!toolDao.findById(request.getId()).isPresent())
			throw new NoDataException("Tool not present");
		
		CatalogTool tool = toolDao.findById(request.getId()).get();	
		
		tool = Translators.translateUpdate(request, tool);
		
		toolDao.save(tool);		
		
		return Translators.translate(tool);
	}
	public ToolDto deleteTool(Long id) {		
		if (!toolDao.findById(id).isPresent())
			throw new NoDataException("Tool not present");
			CatalogTool tool = toolDao.findById(id).get();
			toolDao.delete(tool);
			return Translators.translate(tool);		
	}
}
