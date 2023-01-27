package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.BusinessServiceDao;
import it.istat.mec.catalog.dao.ProcessStepDao;
import it.istat.mec.catalog.dao.StepInstanceDao;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.domain.ProcessStep;
import it.istat.mec.catalog.domain.StepInstance;
import it.istat.mec.catalog.dto.ProcessStepDto;
import it.istat.mec.catalog.dto.ProcessStepInverseDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateProcessStepRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ProcessStepService {

	@Autowired
	ProcessStepDao processStepDao;
	@Autowired
	StepInstanceDao stepInstanceDao;
	@Autowired
	BusinessServiceDao businessServiceDao;

	public List<ProcessStepDto> findAllProcessSteps() {
		
		return Translators.translatePS(processStepDao.findAll());

	}
	
	public ProcessStepDto newProcessStep(CreateProcessStepRequest request) {
		ProcessStep ps = new ProcessStep();
		ps = Translators.translate(request);		
		ps.setBusinessService(businessServiceDao.getOne(request.getBusinessServiceId()));		
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
		ps.setBusinessService(businessServiceDao.getOne(request.getBusinessServiceId()));		
		processStepDao.save(ps);		
		
		return Translators.translate(ps);
	}
	
	public Boolean deleteProcessStep(Integer id) {		
		if (!processStepDao.findById(id).isPresent())
			throw new NoDataException("ProcessStep not present");
			ProcessStep ps = processStepDao.findById(id).get();
			processStepDao.delete(ps);
			return Boolean.TRUE;			
	}
	
	public ProcessStepDto addStepInstanceToProcessStep(Integer id_process_step, Integer id_step_instance) {
		
		if (!processStepDao.findById(id_process_step).isPresent())
			throw new NoDataException("ProcessStep not present");
		ProcessStep ps = processStepDao.findById(id_process_step).get();	
		if (!stepInstanceDao.findById(id_step_instance).isPresent())
			throw new NoDataException("StepInstance not present");
		StepInstance si = stepInstanceDao.findById(id_step_instance).get();
		
		ps.getStepInstances().add(si);
		processStepDao.save(ps);
		return Translators.translate(ps);
	}
	
	public ProcessStepDto deleteStepInstanceFromProcessStep(Integer id_process_step, Integer id_step_instance) {	
		if (!processStepDao.findById(id_process_step).isPresent())
			throw new NoDataException("ProcessStep not present");
		ProcessStep ps = processStepDao.findById(id_process_step).get();	
		if (!stepInstanceDao.findById(id_step_instance).isPresent())
			throw new NoDataException("StepInstance not present");
		StepInstance si = stepInstanceDao.findById(id_step_instance).get();
		
		ps.getStepInstances().remove(si);
		processStepDao.save(ps);
		return Translators.translate(ps);	
	}

	public List<ProcessStepInverseDto> getProcessStepsByBusinessService(Integer id) {
		
		return Translators.translateProcessStepInverse(processStepDao.findByBusinessService(new BusinessService(id)));
	}
}

