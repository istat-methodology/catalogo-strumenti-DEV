package it.istat.mec.catalog.service;
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
	
	public List<StatisticalServiceDto> findByCataloTool(Long id) {
		
		return Translators.translateSS(statisticalServiceDao.findByCatalogTool(new CatalogTool(id)));

	}
	
	public StatisticalServiceDto newStatisticalService(CreateStatisticalServiceRequest request) {
		StatisticalService ss = new StatisticalService();
		ss = Translators.translate(request);
	//	CatalogTool tool = toolDao.getOne(request.getToolId());
	//	ss.setCatalogTool(tool);
		statisticalServiceDao.save(ss);
		return Translators.translate(ss);
	}
	
	public StatisticalServiceDto findStatisticalServiceById(Long id) {

		if (!statisticalServiceDao.findById(id).isPresent())
			throw new NoDataException("StatisticalService not present");
		return Translators.translate(statisticalServiceDao.findById(id).get());
	}
	
	public StatisticalServiceDto updateStatisticalService(CreateStatisticalServiceRequest request) {		
		
		if (!statisticalServiceDao.findById(request.getId()).isPresent())
			throw new NoDataException("StatisticalService not present");
		
		StatisticalService ss = statisticalServiceDao.findById(request.getId()).get();	
		
		ss = Translators.translateUpdate(request, ss);
/*		if(!ss.getCatalogTool().getId().equals( request.getToolId())){
			if (!toolDao.findById(request.getToolId()).isPresent())
				throw new NoDataException("Statistical Tool not present");
			ss.setCatalogTool(toolDao.findById(request.getToolId()).get());
		}
	*/	
		statisticalServiceDao.save(ss);		
		
		return Translators.translate(ss);
	}
	public StatisticalServiceDto deleteStatisticalService(Long id) {		
		if (!statisticalServiceDao.findById(id).isPresent())
			throw new NoDataException("StatisticalService not present");
			StatisticalService ss = statisticalServiceDao.findById(id).get();
			statisticalServiceDao.delete(ss);
			return Translators.translate(ss);		
	}
}

