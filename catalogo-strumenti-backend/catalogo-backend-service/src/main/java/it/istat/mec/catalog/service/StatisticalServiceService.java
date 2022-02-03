package it.istat.mec.catalog.service;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.StatisticalServiceDao;
import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.StatisticalService;
import it.istat.mec.catalog.dto.StatisticalServiceDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateStatisticalServiceRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class StatisticalServiceService {

	@Autowired
	StatisticalServiceDao statisticalServiceDao;
	@Autowired
	ToolDao toolDao;


	public List<StatisticalServiceDto> findAllStatisticalServices() {
		
		return Translators.translateSS(statisticalServiceDao.findAll());

	}
	
	public List<StatisticalServiceDto> findByCataloTools(Long id) {
		List<CatalogTool>catalogTools = new ArrayList<CatalogTool>();
		catalogTools.add(new CatalogTool(id));
		//return Translators.translateSM(statisticalMethodDao.findByCatalogTools(catalogTools));
		return null;
	}
	
	
	public StatisticalServiceDto newStatisticalMethod(CreateStatisticalServiceRequest request) {
		StatisticalService ss = new StatisticalService();
		ss = Translators.translate(request);	
		statisticalServiceDao.save(ss);
		return Translators.translate(ss);
	}
	
	public StatisticalServiceDto findStatisticalServiceById(Long id) {

		if (!statisticalServiceDao.findById(id).isPresent())
			throw new NoDataException("Statistical Service not present");
		return Translators.translate(statisticalServiceDao.findById(id).get());
	}
	
	public StatisticalServiceDto updateStatisticalService(CreateStatisticalServiceRequest request) {		
		
		if (!statisticalServiceDao.findById(request.getId()).isPresent())
			throw new NoDataException("Statistical Service not present");
		
		StatisticalService ss = statisticalServiceDao.findById(request.getId()).get();	
		
		ss = Translators.translateUpdate(request, ss);
//		if(!sm.getCatalogTool().getId().equals( request.getToolId())){
//			if (!toolDao.findById(request.getToolId()).isPresent())
//				throw new NoDataException("Statistical Tool not present");
//			sm.setCatalogTool(toolDao.findById(request.getToolId()).get());
//		}
		
		statisticalServiceDao.save(ss);		
		
		return Translators.translate(ss);
	}
	public StatisticalServiceDto deleteStatisticalService(Long id) {		
		if (!statisticalServiceDao.findById(id).isPresent())
			throw new NoDataException("Statistical Service not present");
			StatisticalService ss = statisticalServiceDao.findById(id).get();
			statisticalServiceDao.delete(ss);
			return Translators.translate(ss);		
	}
}

