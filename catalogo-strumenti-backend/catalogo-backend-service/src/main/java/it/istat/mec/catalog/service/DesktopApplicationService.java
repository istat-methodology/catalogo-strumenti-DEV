package it.istat.mec.catalog.service;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.DesktopApplicationDao;
import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.DesktopApplication;
import it.istat.mec.catalog.dto.DesktopApplicationDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateDesktopApplicationRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class DesktopApplicationService {

	@Autowired
	DesktopApplicationDao desktopApplicationDao;
	@Autowired
	ToolDao toolDao;

	public List<DesktopApplicationDto> findAllDesktopApplications() {
		
		return Translators.translateDA(desktopApplicationDao.findAll());

	}
	
	public List<DesktopApplicationDto> findByCataloTool(Long id) {
		
		return Translators.translateDA(desktopApplicationDao.findByCatalogTool(new CatalogTool(id)));

	}
	
	public DesktopApplicationDto newDesktopApplication(CreateDesktopApplicationRequest request) {
		DesktopApplication da = new DesktopApplication();
		da = Translators.translate(request);
		CatalogTool tool = toolDao.getOne(request.getTool());
		da.setCatalogTool(tool);
		desktopApplicationDao.save(da);
		return Translators.translate(da);
	}
	
	public DesktopApplicationDto findDesktopApplicationById(Long id) {

		if (!desktopApplicationDao.findById(id).isPresent())
			throw new NoDataException("DesktopApplication not present");
		return Translators.translate(desktopApplicationDao.findById(id).get());
	}
	
	public DesktopApplicationDto updateDesktopApplication(CreateDesktopApplicationRequest request) {		
		
		if (!desktopApplicationDao.findById(request.getId()).isPresent())
			throw new NoDataException("DesktopApplication not present");
		
		DesktopApplication da = desktopApplicationDao.findById(request.getId()).get();	
		da = Translators.translateUpdate(request, da);
		if(!da.getCatalogTool().getId().equals( request.getTool())){
			if (!toolDao.findById(request.getTool()).isPresent())
				throw new NoDataException("Statistical Tool not present");
			da.setCatalogTool(toolDao.findById(request.getTool()).get());
		}
		
		desktopApplicationDao.save(da);		
		
		return Translators.translate(da);
	}
	public DesktopApplicationDto deleteDesktopApplication(Long id) {		
		if (!desktopApplicationDao.findById(id).isPresent())
			throw new NoDataException("DesktopApplication not present");
			DesktopApplication da = desktopApplicationDao.findById(id).get();
			desktopApplicationDao.delete(da);
			return Translators.translate(da);		
	}
}

