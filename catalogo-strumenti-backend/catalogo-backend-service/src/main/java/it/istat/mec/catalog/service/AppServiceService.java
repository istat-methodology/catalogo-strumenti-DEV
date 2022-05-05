package it.istat.mec.catalog.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.AppServiceDao;
import it.istat.mec.catalog.dao.BusinessServiceDao;
import it.istat.mec.catalog.domain.AppService;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.dto.AppServiceDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateAppServiceRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class AppServiceService {

	@Autowired
	AppServiceDao appServiceDao;
	@Autowired
	BusinessServiceDao businessServiceDao;

	public List<AppServiceDto> findAllAppServices() {
		
		return Translators.translateAppServiceList(appServiceDao.findAll());

	}
	
	public AppServiceDto newAppService(CreateAppServiceRequest request) {
		AppService appService = new AppService();
		appService = Translators.translate(request);		
		BusinessService businessService = businessServiceDao.findById(request.getId()).get();	
		appService.setBusinessService(businessService);
		appServiceDao.save(appService);
		return Translators.translate(appService);
	}
	
	public AppServiceDto findAppServiceById(Integer id) {

		if (!appServiceDao.findById(id).isPresent())
			throw new NoDataException("AppService not present");
		return Translators.translate(appServiceDao.findById(id).get());
	}
	
	public AppServiceDto updateAppService(CreateAppServiceRequest request) {		
		
		if (!appServiceDao.findById(request.getId()).isPresent())
			throw new NoDataException("AppService not present");
		
		AppService appService = appServiceDao.findById(request.getId()).get();	
		
		appService = Translators.translateUpdate(request, appService);
		BusinessService businessService = businessServiceDao.findById(request.getId()).get();	
		appService.setBusinessService(businessService);
		appServiceDao.save(appService);		
		
		return Translators.translate(appService);
	}
	public AppServiceDto deleteAppService(Integer id) {		
		if (!appServiceDao.findById(id).isPresent())
			throw new NoDataException("AppService not present");
			AppService appService = appServiceDao.findById(id).get();
			appServiceDao.delete(appService);
			return Translators.translate(appService);		
	}
}

