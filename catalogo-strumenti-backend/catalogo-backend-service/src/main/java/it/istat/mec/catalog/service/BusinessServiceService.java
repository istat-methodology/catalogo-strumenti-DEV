package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.BusinessServiceDao;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.dto.BusinessServiceDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateBusinessServiceRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class BusinessServiceService {

	@Autowired
	BusinessServiceDao businessServiceDao;

	public List<BusinessServiceDto> findAllBusinessServices() {
		
		return Translators.translateBS(businessServiceDao.findAll());

	}
	
	public BusinessServiceDto newBusinessService(CreateBusinessServiceRequest request) {
		BusinessService bs  = Translators.translate(request);		
		businessServiceDao.save(bs);
		return Translators.translate(bs);
	}
	
	public BusinessServiceDto findBusinessServiceById(Integer id) {

		if (!businessServiceDao.findById(id).isPresent())
			throw new NoDataException("BusinessService not present");
		return Translators.translate(businessServiceDao.findById(id).get());
	}
	
	public BusinessServiceDto updateBusinessService(CreateBusinessServiceRequest request) {		
		
		if (!businessServiceDao.findById(request.getId()).isPresent())
			throw new NoDataException("BusinessService not present");
		
		BusinessService bs = businessServiceDao.findById(request.getId()).get();	
		
		bs = Translators.translateUpdate(request, bs);
		
		businessServiceDao.save(bs);		
		
		return Translators.translate(bs);
	}
	public BusinessServiceDto deleteBusinessService(Integer id) {		
		if (!businessServiceDao.findById(id).isPresent())
			throw new NoDataException("BusinessService not present");
			BusinessService bs = businessServiceDao.findById(id).get();
			businessServiceDao.delete(bs);
			return Translators.translate(bs);		
	}
}

