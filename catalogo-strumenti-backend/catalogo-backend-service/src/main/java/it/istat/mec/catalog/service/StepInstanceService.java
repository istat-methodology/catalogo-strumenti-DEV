package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.StepInstanceDao;
import it.istat.mec.catalog.domain.AppService;
import it.istat.mec.catalog.domain.StepInstance;
import it.istat.mec.catalog.dto.StepInstanceDto;
import it.istat.mec.catalog.dto.StepInstanceInverseDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateStepInstanceRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class StepInstanceService {

	@Autowired
	StepInstanceDao stepInstanceDao;

	public List<StepInstanceDto> findAllStepInstances() {
		
		return Translators.translateSI(stepInstanceDao.findAll());

	}
	
	public StepInstanceDto newStepInstance(CreateStepInstanceRequest request) {
		StepInstance si = new StepInstance();
		si = Translators.translate(request);		
		stepInstanceDao.save(si);
		return Translators.translate(si);
	}
	
	public StepInstanceDto findStepInstanceById(Integer id) {

		if (!stepInstanceDao.findById(id).isPresent())
			throw new NoDataException("StepInstance not present");
		return Translators.translate(stepInstanceDao.findById(id).get());
	}
	
	public StepInstanceDto updateStepInstance(CreateStepInstanceRequest request) {		
		
		if (!stepInstanceDao.findById(request.getId()).isPresent())
			throw new NoDataException("StepInstance not present");
		
		StepInstance si = stepInstanceDao.findById(request.getId()).get();	
		
		si = Translators.translateUpdate(request, si);
		
		stepInstanceDao.save(si);		
		
		return Translators.translate(si);
	}
	public StepInstanceDto deleteStepInstance(Integer id) {		
		if (!stepInstanceDao.findById(id).isPresent())
			throw new NoDataException("StepInstance not present");
			StepInstance si = stepInstanceDao.findById(id).get();
			stepInstanceDao.delete(si);
			return Translators.translate(si);		
	}

	public List<StepInstanceInverseDto> findStepInstancesByAppService(Integer id) {
		
		return Translators.translateStepInstancesInverse(stepInstanceDao.findByAppService(new AppService(id)));
	}
}

