package it.istat.mec.catalog.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.domain.BusinessProcess;


public interface BusinessProcessDao extends CrudRepository<BusinessProcess, Long> {
	 @Override
	    List<BusinessProcess> findAll();

	    @Query("SELECT bp FROM BusinessProcess bp WHERE bp.businessProcessParent IS NULL ORDER BY bp.order ASC ")
	    List<BusinessProcess> findAllProcesses();

	    @Query("SELECT bp FROM BusinessProcess bp WHERE bp.businessProcessParent IS NOT NULL ORDER BY bp.order ASC")
	    List<BusinessProcess> findAllSubProcesses();

	    List<BusinessProcess> findByBusinessFunctionsIn(List<BusinessFunction> businessFunctions);

	    BusinessProcess findBProcessByName(String name);
	}
