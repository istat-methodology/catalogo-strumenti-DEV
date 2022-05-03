package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.ProcessDesignDao;
import it.istat.mec.catalog.domain.ProcessDesign;
import it.istat.mec.catalog.dto.ProcessDesignDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateProcessDesignRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ProcessDesignService {

	@Autowired
	ProcessDesignDao processDesignDao;
	

	public List<ProcessDesignDto> findAllPrcessDesignes() {
		
		return Translators.translatePD(processDesignDao.findAll());

	}
	
	public ProcessDesignDto newProcessDesign(CreateProcessDesignRequest request) {
		ProcessDesign pd = new ProcessDesign();
		pd = Translators.translate(request);		
		processDesignDao.save(pd);
		return Translators.translate(pd);
	}
	
	public List<ProcessDesignDto> findProcessDesignesByStep(Integer id_step) {

		if (!processDesignDao.findByStep(id_step).isEmpty())
			throw new NoDataException("ProcessDesignes not present");
		return Translators.translatePD(processDesignDao.findByStep(id_step));
	}
	
	public ProcessDesignDto updateProcessDesign(CreateProcessDesignRequest request) {		
		
		if (!processDesignDao.findById(request.getId()).isPresent())
			throw new NoDataException("ProcessDesign not present");
		
		ProcessDesign pd = processDesignDao.findById(request.getId()).get();	
		
		pd = Translators.translateUpdate(request, pd);
		
		processDesignDao.save(pd);		
		
		return Translators.translate(pd);
	}
	
	public ProcessDesignDto deleteProcessDesign(Integer id) {		
		if (!processDesignDao.findById(id).isPresent())
			throw new NoDataException("ProcessDesign not present");
			ProcessDesign pd = processDesignDao.findById(id).get();
			processDesignDao.delete(pd);
			return Translators.translate(pd);		
	}	

	
}

