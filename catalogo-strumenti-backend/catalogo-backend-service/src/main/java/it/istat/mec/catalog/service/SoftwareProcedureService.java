package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.SoftwareProcedureDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.SoftwareProcedure;
import it.istat.mec.catalog.dto.SoftwareProcedureDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateSoftwareProcedureRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class SoftwareProcedureService {

	@Autowired
	SoftwareProcedureDao softwareProcedureDao;

	public List<SoftwareProcedureDto> findAllSoftwareProcedures() {
		
		return Translators.translateSP(softwareProcedureDao.findAll());		

	}
	
	public List<SoftwareProcedureDto> findByCataloTool(Long id) {
		
		return Translators.translateSP(softwareProcedureDao.findByCatalogTool(new CatalogTool(id)));

	}
	
	public SoftwareProcedureDto newSoftwareProcedure(CreateSoftwareProcedureRequest request) {
		SoftwareProcedure sp = new SoftwareProcedure();
		sp = Translators.translate(request);		
		softwareProcedureDao.save(sp);
		return Translators.translate(sp);
	}
	
	public SoftwareProcedureDto findSoftwareProcedureById(Long id) {

		if (!softwareProcedureDao.findById(id).isPresent())
			throw new NoDataException("SoftwareProcedure not present");
		return Translators.translate(softwareProcedureDao.findById(id).get());
	}
	
	public SoftwareProcedureDto updateSoftwareProcedure(CreateSoftwareProcedureRequest request) {		
		
		if (!softwareProcedureDao.findById(request.getId()).isPresent())
			throw new NoDataException("SoftwareProcedure not present");
		
		SoftwareProcedure sp = softwareProcedureDao.findById(request.getId()).get();	
		
		sp = Translators.translateUpdate(request, sp);
		
		softwareProcedureDao.save(sp);		
		
		return Translators.translate(sp);
	}
	public SoftwareProcedureDto deleteSoftwareProcedure(Long id) {		
		if (!softwareProcedureDao.findById(id).isPresent())
			throw new NoDataException("SoftwareProcedure not present");
			SoftwareProcedure sp = softwareProcedureDao.findById(id).get();
			softwareProcedureDao.delete(sp);
			return Translators.translate(sp);		
	}
}

