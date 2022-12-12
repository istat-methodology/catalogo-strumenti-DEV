package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.DesignTypeDao;
import it.istat.mec.catalog.domain.DesignType;
import it.istat.mec.catalog.dto.DesignTypeDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateDesignTypetRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class DesignTypeService {

	@Autowired
	DesignTypeDao designTypeDao;

	public List<DesignTypeDto> findAllDesignType() {
		
		return Translators.translateDesignTypeList(designTypeDao.findAll());

	}
	
	public List<DesignTypeDto> findParentsDesignTypes() {
		
		return Translators.translateDesignTypeList(designTypeDao.findParentsDesignTypes());

	}
	
	public List<DesignTypeDto> findDesignTypesByParent(Integer parent) {
		
		return Translators.translateDesignTypeList(designTypeDao.findDesignTypesByParent(parent));

	}
	
	public DesignTypeDto newDesignType(CreateDesignTypetRequest request) {
		DesignType designType = new DesignType();
		designType = Translators.translate(request);		
		designTypeDao.save(designType);
		return Translators.translate(designType);
	}
	
	public DesignTypeDto findDesignTypeById(Integer id) {

		if (!designTypeDao.findById(id).isPresent())
			throw new NoDataException("DesignType not present");
		return Translators.translate(designTypeDao.findById(id).get());
	}
	
	public DesignTypeDto updateDesignType(CreateDesignTypetRequest request) {		
		
		if (!designTypeDao.findById(request.getId()).isPresent())
			throw new NoDataException("DesignType not present");
		
		DesignType designType = designTypeDao.findById(request.getId()).get();	
		
		designType = Translators.translateUpdate(request, designType);
		
		designTypeDao.save(designType);		
		
		return Translators.translate(designType);
	}
	public DesignTypeDto deleteDesignType(Integer id) {		
		if (!designTypeDao.findById(id).isPresent())
			throw new NoDataException("DesignType not present");
			DesignType designType = designTypeDao.findById(id).get();
			designTypeDao.delete(designType);
			return Translators.translate(designType);		
	}
}

