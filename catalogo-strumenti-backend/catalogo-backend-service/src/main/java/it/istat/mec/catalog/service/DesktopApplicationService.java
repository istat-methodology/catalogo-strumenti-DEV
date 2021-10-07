package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.DesktopApplicationDao;
import it.istat.mec.catalog.domain.DesktopApplication;
import it.istat.mec.catalog.dto.DesktopApplicationDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateDesktopApplicationRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class DesktopApplicationService {

	@Autowired
	DesktopApplicationDao desktopApplicationDao;

	public List<DesktopApplicationDto> findAllDesktopApplications() {
		
		return Translators.translateDA(desktopApplicationDao.findAll());

	}
	
	public DesktopApplicationDto newDesktopApplication(CreateDesktopApplicationRequest request) {
		DesktopApplication da = new DesktopApplication();
		da = Translators.translate(request);		
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

