package it.istat.mec.catalog.service;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.ProcessDesignDao;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.domain.ProcessDesign;
import it.istat.mec.catalog.dao.ProcessStepDao;
import it.istat.mec.catalog.domain.ProcessStep;
import it.istat.mec.catalog.dto.ProcessDesignDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateProcessDesignRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ProcessDesignService {

	@Autowired
	ProcessDesignDao processDesignDao;
	@Autowired
	ProcessStepDao ProcessStepDao;
	

	public List<ProcessDesignDto> findAllProcessDesignes() {
		
		return Translators.translatePD(processDesignDao.findAll());

	}
	
	public ProcessDesignDto newProcessDesign(CreateProcessDesignRequest request) {
		ProcessDesign pd = new ProcessDesign();
		pd = Translators.translate(request);		
		processDesignDao.save(pd);
		return Translators.translate(pd);
	}
	
	public List<ProcessDesignDto> findProcessDesignsByStep(Integer id_step) {
//		if (!processDesignDao.findByStep(id_step).isEmpty())
//		throw new NoDataException("ProcessDesignes not present");	
	
	//return Translators.translatePD(processDesignDao.findByStep((new ProcessStep(id_step))));
	return Translators.translatePD(processDesignDao.findByStep(new ProcessStep(id_step)));
}
	public ProcessDesignDto findProcessDesignsById(Integer id_design) {
//		if (!processDesignDao.findById(id_design).isEmpty())
//		throw new NoDataException("ProcessDesign not present");	
	

	return Translators.translatePD(processDesignDao.findById(id_design).get());
}
	public List<ProcessDesignDto> findProcessDesignsByStep(ProcessStep step) {
//		if (!processDesignDao.findByStep(id_step).isEmpty())
//		throw new NoDataException("ProcessDesignes not present");	
	
	//return Translators.translatePD(processDesignDao.findByStep((new ProcessStep(id_step))));
	return Translators.translatePD(processDesignDao.findByStep(step));
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

