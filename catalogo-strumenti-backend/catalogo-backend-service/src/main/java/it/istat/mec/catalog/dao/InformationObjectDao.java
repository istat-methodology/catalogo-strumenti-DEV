package it.istat.mec.catalog.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.domain.InformationObject;


@Repository
public interface InformationObjectDao extends JpaRepository<InformationObject, Integer> {
	
	List<InformationObject> findAll();
	
	List<InformationObject> findByBusinessService(BusinessService businessService);

	public void save(Optional<InformationObject> informationObject);

	public void delete(InformationObject informationObject);
}