package it.istat.mec.catalog.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.domain.BusinessProcess;
import it.istat.mec.catalog.domain.StepInstance;


@Repository
public interface StepInstanceDao extends CrudRepository<StepInstance, Long> {

  //  @Query("SELECT si from BusinessFunction sf join sf.businessProcesses sp join sp.businessSteps ss join ss.stepInstances si where sf=:businessFunction  and si.appService.id=:codiceAppServiceR ORDER BY si.id ASC ")
     @Query("SELECT si from StepInstance si ")
    List<StepInstance> findAllStepInstanceByFunctionAndService(@Param("businessFunction") BusinessFunction businessFunction, @Param("codiceAppServiceR") int codiceAppServiceR);

   // @Query("SELECT si from BusinessProcess bpp join bpp.businessSubProcesses sp join sp.businessSteps ss join ss.stepInstances si where bpp=:businessProcess ORDER BY si.id ASC ")
      @Query("SELECT si from StepInstance si ")
    List<StepInstance> findAllStepInstanceByProcess(@Param("businessProcess") BusinessProcess businessProcess);

    //@Query("SELECT si from BusinessProcess sbp  join sbp.businessSteps ss join ss.stepInstances si   where sbp=:subBusinessProcess ORDER BY si.id ASC ")
      @Query("SELECT si from StepInstance si ")
    List<StepInstance> findAllStepInstanceBySubBProcess(@Param("subBusinessProcess") BusinessProcess subBusinessProcess);
    


}
