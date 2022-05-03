package it.istat.mec.catalog.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.istat.mec.catalog.dao.InformationObjectDao;
import it.istat.mec.catalog.domain.InformationObject;
import it.istat.mec.catalog.dto.InformationObjectDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateInformationObjectRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class InformationObjectService {

	@Autowired
	InformationObjectDao informationObjectDao;

	public List<InformationObjectDto> findAllInformationObjects() {
		
		return Translators.translateIO(informationObjectDao.findAll());

	}
	
	public InformationObjectDto newInformationObject(CreateInformationObjectRequest request) {
		InformationObject io = new InformationObject();
		io = Translators.translate(request);		
		informationObjectDao.save(io);
		return Translators.translate(io);
	}
	
	public InformationObjectDto findInformationObjectById(Integer id) {

		if (!informationObjectDao.findById(id).isPresent())
			throw new NoDataException("InformationObject not present");
		return Translators.translate(informationObjectDao.findById(id).get());
	}
	
	public InformationObjectDto updateInformationObject(CreateInformationObjectRequest request) {		
		
		if (!informationObjectDao.findById(request.getId()).isPresent())
			throw new NoDataException("InformationObject not present");
		
		InformationObject io = informationObjectDao.findById(request.getId()).get();	
		
		io = Translators.translateUpdate(request, io);
		
		informationObjectDao.save(io);		
		
		return Translators.translate(io);
	}
	public InformationObjectDto deleteInformationObject(Integer id) {		
		if (!informationObjectDao.findById(id).isPresent())
			throw new NoDataException("InformationObject not present");
			InformationObject io = informationObjectDao.findById(id).get();
			informationObjectDao.delete(io);
			return Translators.translate(io);		
	}

}

