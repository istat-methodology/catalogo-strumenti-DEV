package it.istat.mec.catalog.service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.BusinessProcessDao;
import it.istat.mec.catalog.dao.BusinessServiceDao;
import it.istat.mec.catalog.dao.ProcessStepDao;
import it.istat.mec.catalog.dao.StepInstanceDao;
import it.istat.mec.catalog.domain.BusinessProcess;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.domain.GsbpmProcess;
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
	@Autowired
	BusinessProcessDao businessProcessDao;

	public List<ProcessStepDto> findAllProcessSteps() {
		
		return Translators.translatePS(processStepDao.findAll());

	}
	
	public ProcessStepDto newProcessStep(CreateProcessStepRequest request) {
		ProcessStep ps = new ProcessStep();
		ps = Translators.translate(request);		
		ps.setBusinessService(businessServiceDao.getOne(request.getBusinessServiceId()));	
		
		// Test: provo ad aggiungere un businessProcess allo step
		List<BusinessProcess> listaBs = new ArrayList<BusinessProcess>();		
			
		if(request.getProcessIds()!=null) {
			for(int i=0; i<request.getProcessIds().length; i++) {
							
				listaBs.add(businessProcessDao.getOne(request.getProcessIds()[i]));
				
			}
		}
		ps.setBusinessProcesses(listaBs);		
		
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
		ProcessStep ps = processStepDao.getOne(request.getId());
		
		ps = Translators.translateUpdate(request, ps);
		BusinessService bs = businessServiceDao.getOne(request.getBusinessServiceId());
		List<BusinessProcess> listaBs = new ArrayList<BusinessProcess>();
		
		if (businessServiceDao.existsById(bs.getId())) 
		{
			ps.setBusinessService(bs);
		}
		
		if(request.getProcessIds()!=null) {
			for(int i=0; i<request.getProcessIds().length; i++)
				listaBs.add(new BusinessProcess(request.getProcessIds()[i]));
		}
		
		ps.setBusinessProcesses(listaBs);		
		
		processStepDao.save(ps);		
		
		return Translators.translate(ps);
	}
	
	public Boolean deleteProcessStep(Integer idStep, Integer idProcess) {		
		if (!processStepDao.findById(idStep).isPresent())
			throw new NoDataException("ProcessStep not present");
			ProcessStep ps = processStepDao.findById(idStep).get();
			// TEST: verficare
			BusinessProcess bp = businessProcessDao.getOne(idProcess);
			ps.getBusinessProcesses().remove(bp);			
			
			//processStepDao.delete(ps);
			processStepDao.save(ps);	
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

