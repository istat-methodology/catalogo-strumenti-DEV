package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.ProcessStepDao;
import it.istat.mec.catalog.domain.ProcessStep;
import it.istat.mec.catalog.dto.ProcessStepDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateProcessStepRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ProcessStepService {

	@Autowired
	ProcessStepDao processStepDao;

	public List<ProcessStepDto> findAllProcessSteps() {
		
		return Translators.translatePS(processStepDao.findAll());

	}
	
	public ProcessStepDto newProcessStep(CreateProcessStepRequest request) {
		ProcessStep ps = new ProcessStep();
		ps = Translators.translate(request);		
		processStepDao.save(ps);
		return Translators.translate(ps);
	}
	
	public ProcessStepDto findProcessStepById(Integer id) {

		if (!processStepDao.findById(id).isPresent())
			throw new NoDataException("ProcessStep not present");
		return Translators.translate(processStepDao.findById(id).get());
	}
	
	public ProcessStepDto updateProcessStep(CreateProcessStepRequest request) {		
		
		if (!processStepDao.findById(request.getId()).isPresent())
			throw new NoDataException("ProcessStep not present");
		
		ProcessStep ps = processStepDao.findById(request.getId()).get();	
		
		ps = Translators.translateUpdate(request, ps);
		
		processStepDao.save(ps);		
		
		return Translators.translate(ps);
	}
	public ProcessStepDto deleteProcessStep(Integer id) {		
		if (!processStepDao.findById(id).isPresent())
			throw new NoDataException("ProcessStep not present");
			ProcessStep ps = processStepDao.findById(id).get();
			processStepDao.delete(ps);
			return Translators.translate(ps);		
	}
}

