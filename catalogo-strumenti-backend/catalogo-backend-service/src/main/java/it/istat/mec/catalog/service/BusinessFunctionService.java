package it.istat.mec.catalog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.BusinessFunctionDao;
import it.istat.mec.catalog.dao.BusinessProcessDao;
import it.istat.mec.catalog.domain.BusinessFunction;
import it.istat.mec.catalog.domain.BusinessProcess;
import it.istat.mec.catalog.domain.BusinessService;
import it.istat.mec.catalog.domain.GsbpmProcess;
import it.istat.mec.catalog.dto.BusinessFunctionDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateBusinessFunctionRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class BusinessFunctionService {

	@Autowired
	BusinessFunctionDao businessFunctionDao;
	@Autowired
	BusinessProcessDao businessProcessDao;

	public List<BusinessFunctionDto> findAllBusinessFunctions() {

		return Translators.translateBF(businessFunctionDao.findAll());

	}

	public List<BusinessFunctionDto> findAllFunctionsByGsbpms(Integer[] gsbpmIds, String[] orderBy, String[] sort) {

		List<Order> orders = new ArrayList<Order>();
		for (int i = 0; i < orderBy.length; i++) {
			Order order = new Order(
					(i < sort.length && Sort.Direction.DESC.name().equalsIgnoreCase(sort[i])) ? Sort.Direction.DESC
							: Sort.Direction.ASC,
					orderBy[i]);
			orders.add(order);

		}
		Sort sortQuery = Sort.by(orders);

		List<GsbpmProcess> gsbpmProcesses = new ArrayList<GsbpmProcess>();
		if (gsbpmIds != null)
			for (int i = 0; i < gsbpmIds.length; i++) {
				gsbpmProcesses.add(new GsbpmProcess(gsbpmIds[i]));
			}

		return Translators.translateBusinessFunctions(
				businessFunctionDao.findAllWithFilter(gsbpmProcesses, gsbpmProcesses.size(), sortQuery));
	}

	public List<BusinessFunctionDto> findBusinessFunctionsByBusinessService(Integer id) {

		return Translators
				.translateBusinessFunctions(businessFunctionDao.findByBusinessService(new BusinessService(id)));
	}

	public BusinessFunctionDto newBusinessFunction(CreateBusinessFunctionRequest request) {
		BusinessFunction bs = new BusinessFunction();
		bs = Translators.translate(request);
		businessFunctionDao.save(bs);
		return Translators.translate(bs);
	}

	public BusinessFunctionDto findBusinessFunctionById(Integer id) {

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
	
	public BusinessFunctionDto addProcessToBusinessFunction(Integer id_function, Integer id_process) {
		
		if (!businessFunctionDao.findById(id_function).isPresent())
			throw new NoDataException("BusinessFunction not present");
		BusinessFunction bs = businessFunctionDao.findById(id_function).get();		
		if (!businessProcessDao.findById(id_process).isPresent())
			throw new NoDataException("BusinessProcess not present");
		BusinessProcess bp = businessProcessDao.findById(id_process).get();
		
		bs.getBusinessProcesses().add(bp);
		businessFunctionDao.save(bs);
		return Translators.translate(bs);
	}

	public BusinessFunctionDto deleteBusinessFunction(Integer id) {
		if (!businessFunctionDao.findById(id).isPresent())
			throw new NoDataException("BusinessFunction not present");
		BusinessFunction bs = businessFunctionDao.findById(id).get();
		businessFunctionDao.delete(bs);
		return Translators.translate(bs);
	}
	
	public BusinessFunctionDto deleteProcessFromBusinessFunction(Integer id_function, Integer id_process) {
		if (!businessFunctionDao.findById(id_function).isPresent())
			throw new NoDataException("BusinessFunction not present");
		BusinessFunction bs = businessFunctionDao.findById(id_function).get();		
		if (!businessProcessDao.findById(id_process).isPresent())
			throw new NoDataException("BusinessProcess not present");
		BusinessProcess bp = businessProcessDao.findById(id_process).get();
		
		bs.getBusinessProcesses().remove(bp);		
		businessFunctionDao.save(bs);
		return Translators.translate(bs);
	}
}
