package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.ProcessDesignDao;
import it.istat.mec.catalog.dao.ProcessSpecificationDao;
import it.istat.mec.catalog.domain.ProcessDesign;
import it.istat.mec.catalog.domain.ProcessSpecification;
import it.istat.mec.catalog.dto.ProcessSpecificationDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateProcessSpecificationRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ProcessSpecificationService {

	@Autowired
	ProcessSpecificationDao processSpecificationDao;
	@Autowired
	ProcessDesignDao processDesignDao;
	

	public List<ProcessSpecificationDto> findAllProcessSpecification() {
		
		return Translators.translatePDS(processSpecificationDao.findAll());

	}
	
	public ProcessSpecificationDto newProcessSpecification(CreateProcessSpecificationRequest request) {
		ProcessSpecification ps = new ProcessSpecification();
		ps = Translators.translate(request);		
		processSpecificationDao.save(ps);
		return Translators.translate(ps);
	}
	
	public List<ProcessSpecificationDto> findProcessSpecificationByDesign(Integer idDesign) {

		//if (!processSpecificationDao.findByProcessDesign(idDesign).isEmpty())
		//	throw new NoDataException("ProcessSpecification not present");
		//return Translators.translatePDS(processSpecificationDao.findByProcessDesign(idDesign));
		return Translators.translatePDS(processSpecificationDao.findByProcessDesign(new ProcessDesign(idDesign)));
	}
	
	public List<ProcessSpecificationDto> findProcessSpecificationByDesign(ProcessDesign idDesign) {

		//if (!processSpecificationDao.findByProcessDesign(idDesign).isEmpty())
		//	throw new NoDataException("ProcessSpecification not present");
		//return Translators.translatePDS(processSpecificationDao.findByProcessDesign(idDesign));
		return Translators.translatePDS(processSpecificationDao.findByProcessDesign(idDesign));
	}
	
	public ProcessSpecificationDto updateProcessSpecification(CreateProcessSpecificationRequest request) {		
		
		if (!processSpecificationDao.findById(request.getId()).isPresent())
			throw new NoDataException("ProcessSpecification not present");
		
		ProcessSpecification ps = processSpecificationDao.findById(request.getId()).get();	
		
		ps = Translators.translateUpdate(request, ps);
		
		processSpecificationDao.save(ps);		
		
		return Translators.translate(ps);
	}
	
	public ProcessSpecificationDto deleteProcessSpecification(Integer id) {		
		if (!processSpecificationDao.findById(id).isPresent())
			throw new NoDataException("ProcessSpecification not present");
		ProcessSpecification ps = processSpecificationDao.findById(id).get();
			processSpecificationDao.delete(ps);
			return Translators.translate(ps);		
	}	

	
}

