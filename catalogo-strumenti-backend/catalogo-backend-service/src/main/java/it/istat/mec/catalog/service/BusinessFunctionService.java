package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.BusinessFunctionDao;
import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.dto.BusinessFunctionDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateBusinessFunctionRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class BusinessFunctionService {

	@Autowired
	BusinessFunctionDao businessFunctionDao;

	public List<BusinessFunctionDto> findAllBusinessFunctions() {
		
		return Translators.translateBF(businessFunctionDao.findAll());

	}
	
	public BusinessFunctionDto newBusinessFunction(CreateBusinessFunctionRequest request) {
		BusinessFunction bs = new BusinessFunction();
		bs = Translators.translate(request);		
		businessFunctionDao.save(bs);
		return Translators.translate(bs);
	}
	
	public BusinessFunctionDto findBusinessFunctionById(Long id) {

		if (!businessFunctionDao.findById(id).isPresent())
			throw new NoDataException("BusinessFunction not present");
		return Translators.translate(businessFunctionDao.findById(id).get());
	}
	
	public BusinessFunctionDto updateBusinessFunction(CreateBusinessFunctionRequest request) {		
		
		if (!businessFunctionDao.findById(request.getId()).isPresent())
			throw new NoDataException("BusinessFunction not present");
		
		BusinessFunction bs = businessFunctionDao.findById(request.getId()).get();	
		
		bs = Translators.translateUpdate(request, bs);
		
		businessFunctionDao.save(bs);		
		
		return Translators.translate(bs);
	}
	public BusinessFunctionDto deleteBusinessFunction(Long id) {		
		if (!businessFunctionDao.findById(id).isPresent())
			throw new NoDataException("BusinessFunction not present");
			BusinessFunction bs = businessFunctionDao.findById(id).get();
			businessFunctionDao.delete(bs);
			return Translators.translate(bs);		
	}
}

