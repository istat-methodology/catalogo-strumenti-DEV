package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.BusinessProcessDao;
import it.istat.mec.catalog.dao.ProcessStepDao;
import it.istat.mec.catalog.domain.BusinessProcess;
import it.istat.mec.catalog.domain.ProcessStep;
import it.istat.mec.catalog.dto.BusinessProcessDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateBusinessProcessRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class BusinessProcessService {

	@Autowired
	BusinessProcessDao businessProcessDao;
	@Autowired
	ProcessStepDao processStepDao;

	public List<BusinessProcessDto> findAllBusinessProcesses() {
		
		return Translators.translateBP(businessProcessDao.findAll());

	}
	
	public BusinessProcessDto newBusinessProcess(CreateBusinessProcessRequest request) {
		BusinessProcess bp = new BusinessProcess();
		bp = Translators.translate(request);		
		businessProcessDao.save(bp);
		return Translators.translate(bp);
	}
	
	public BusinessProcessDto findBusinessProcessById(Integer id) {

		if (!businessProcessDao.findById(id).isPresent())
			throw new NoDataException("BusinessProcess not present");
		return Translators.translate(businessProcessDao.findById(id).get());
	}
	
	public BusinessProcessDto updateBusinessProcess(CreateBusinessProcessRequest request) {		
		
		if (!businessProcessDao.findById(request.getId()).isPresent())
			throw new NoDataException("BusinessProcess not present");
		
		BusinessProcess bp = businessProcessDao.findById(request.getId()).get();	
		
		bp = Translators.translateUpdate(request, bp);
		
		businessProcessDao.save(bp);		
		
		return Translators.translate(bp);
	}
	public BusinessProcessDto deleteBusinessProcess(Integer id) {		
		if (!businessProcessDao.findById(id).isPresent())
			throw new NoDataException("BusinessProcess not present");
			BusinessProcess bp = businessProcessDao.findById(id).get();
			businessProcessDao.delete(bp);
			return Translators.translate(bp);		
	}
	public BusinessProcessDto addStepToBusinessProcess(Integer id_process, Integer id_step) {
		
		if (!businessProcessDao.findById(id_process).isPresent())
			throw new NoDataException("BusinessProcess not present");
		BusinessProcess bp = businessProcessDao.findById(id_process).get();	
		if (!processStepDao.findById(id_process).isPresent())
			throw new NoDataException("ProcessStep not present");
		ProcessStep ps = processStepDao.findById(id_step).get();
		
		bp.getProcessSteps().add(ps);
		businessProcessDao.save(bp);
		return Translators.translate(bp);
	}
	public BusinessProcessDto deleteStepFromBusinessProcess(Integer id_process, Integer id_step) {
		if (!businessProcessDao.findById(id_process).isPresent())
			throw new NoDataException("BusinessProcess not present");
		BusinessProcess bp = businessProcessDao.findById(id_process).get();	
		if (!processStepDao.findById(id_process).isPresent())
			throw new NoDataException("ProcessStep not present");
		ProcessStep ps = processStepDao.findById(id_step).get();
		
		bp.getProcessSteps().remove(ps);
		businessProcessDao.save(bp);
		return Translators.translate(bp);
	}
}

