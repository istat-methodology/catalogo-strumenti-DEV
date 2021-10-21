package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.StatisticalMethodDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.StatisticalMethod;
import it.istat.mec.catalog.dto.StatisticalMethodDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateStatisticalMethodRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class StatisticalMethodService {

	@Autowired
	StatisticalMethodDao statisticalMethodDao;

	public List<StatisticalMethodDto> findAllStatisticalMethods() {
		
		return Translators.translateSM(statisticalMethodDao.findAll());

	}
	
	public List<StatisticalMethodDto> findByCataloTool(Long id) {
		
		return Translators.translateSM(statisticalMethodDao.findByCatalogTool(new CatalogTool(id)));

	}
	
	
	public StatisticalMethodDto newStatisticalMethod(CreateStatisticalMethodRequest request) {
		StatisticalMethod sm = new StatisticalMethod();
		sm = Translators.translate(request);		
		statisticalMethodDao.save(sm);
		return Translators.translate(sm);
	}
	
	public StatisticalMethodDto findStatisticalMethodById(Long id) {

		if (!statisticalMethodDao.findById(id).isPresent())
			throw new NoDataException("StatisticalMethod not present");
		return Translators.translate(statisticalMethodDao.findById(id).get());
	}
	
	public StatisticalMethodDto updateStatisticalMethod(CreateStatisticalMethodRequest request) {		
		
		if (!statisticalMethodDao.findById(request.getId()).isPresent())
			throw new NoDataException("StatisticalMethod not present");
		
		StatisticalMethod sm = statisticalMethodDao.findById(request.getId()).get();	
		
		sm = Translators.translateUpdate(request, sm);
		
		statisticalMethodDao.save(sm);		
		
		return Translators.translate(sm);
	}
	public StatisticalMethodDto deleteStatisticalMethod(Long id) {		
		if (!statisticalMethodDao.findById(id).isPresent())
			throw new NoDataException("StatisticalMethod not present");
			StatisticalMethod sm = statisticalMethodDao.findById(id).get();
			statisticalMethodDao.delete(sm);
			return Translators.translate(sm);		
	}
}

