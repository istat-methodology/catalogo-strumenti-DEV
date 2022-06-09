package it.istat.mec.catalog.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.DocumentationDao;
import it.istat.mec.catalog.dao.StatisticalMethodDao;
import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.domain.CatalogTool;
import it.istat.mec.catalog.domain.Documentation;
import it.istat.mec.catalog.domain.GsbpmProcess;
import it.istat.mec.catalog.domain.StatisticalMethod;
import it.istat.mec.catalog.dto.StatisticalMethodDto;
import it.istat.mec.catalog.dto.StatisticalMethodMiniDto;
import it.istat.mec.catalog.exceptions.NoDataException;
import it.istat.mec.catalog.request.CreateStatisticalMethodRequest;
import it.istat.mec.catalog.translators.Translators;

@Service
public class StatisticalMethodService {

	@Autowired
	StatisticalMethodDao statisticalMethodDao;
	@Autowired
	ToolDao toolDao;
	@Autowired
	DocumentationDao documentationDao;

	public List<StatisticalMethodMiniDto> findAllStatisticalMethods() {

		return Translators.translateSMMini(statisticalMethodDao.findAll());

	}

	public List<StatisticalMethodDto> findByCataloTools(Integer id) {
		List<CatalogTool> catalogTools = new ArrayList<CatalogTool>();
		catalogTools.add(new CatalogTool(id));
		// return
		// Translators.translateSM(statisticalMethodDao.findByCatalogTools(catalogTools));
		return null;
	}

	@Transactional
	public StatisticalMethodDto newStatisticalMethod(CreateStatisticalMethodRequest request) throws ParseException {
		StatisticalMethod sm = new StatisticalMethod();
		sm = Translators.translate(request);
		Date date = new Date(System.currentTimeMillis());
		sm.setLastUpdate(date);
		sm.setReleaseDate(new SimpleDateFormat("dd/MM/yyyy").parse(request.getReleaseDate()));
		List<GsbpmProcess> gsbpmProcesses = new ArrayList<GsbpmProcess>();
		if (request.getGsbpmProcesses() != null) {
			for (int i = 0; i < request.getGsbpmProcesses().length; i++)
				gsbpmProcesses.add(new GsbpmProcess(request.getGsbpmProcesses()[i]));
		}

		sm.setGsbpmProcesses(gsbpmProcesses);
		sm = statisticalMethodDao.save(sm);
		return Translators.translate(sm);
	}

	public StatisticalMethodDto findStatisticalMethodById(Integer id) {

		if (!statisticalMethodDao.findById(id).isPresent())
			throw new NoDataException("Statistical Method not present");
		return Translators.translate(statisticalMethodDao.findById(id).get());
	}

	@Transactional
	public StatisticalMethodDto updateStatisticalMethod(CreateStatisticalMethodRequest request) throws ParseException {

		if (!statisticalMethodDao.findById(request.getId()).isPresent())
			throw new NoDataException("Statistical Method not present");

		StatisticalMethod sm = statisticalMethodDao.findById(request.getId()).get();

		sm = Translators.translateUpdate(request, sm);

		List<GsbpmProcess> gsbpmProcesses = new ArrayList<GsbpmProcess>();
		if (request.getGsbpmProcesses() != null) {
			for (int i = 0; i < request.getGsbpmProcesses().length; i++)
				gsbpmProcesses.add(new GsbpmProcess(request.getGsbpmProcesses()[i]));
		}

		sm.setGsbpmProcesses(gsbpmProcesses);

		Date date = new Date(System.currentTimeMillis());
		sm.setLastUpdate(date);

		sm.setReleaseDate(new SimpleDateFormat("dd/MM/yyyy").parse(request.getReleaseDate()));

		sm = statisticalMethodDao.save(sm);

		return Translators.translate(sm);
	}

	public StatisticalMethodDto deleteStatisticalMethod(Integer id) {
		if (!statisticalMethodDao.findById(id).isPresent())
			throw new NoDataException("Statistical Method not present");
		StatisticalMethod sm = statisticalMethodDao.findById(id).get();
		statisticalMethodDao.delete(sm);
		return Translators.translate(sm);
	}

	public StatisticalMethodDto addStatisticalMethodDocumentation(Integer id, Integer docID) {

		if (!statisticalMethodDao.findById(id).isPresent())
			throw new NoDataException("Statistical Method not present");
		StatisticalMethod sm = statisticalMethodDao.findById(id).get();

		if (!documentationDao.findById(docID).isPresent())
			throw new NoDataException("Documentation not present");
		Documentation doc = documentationDao.findById(docID).get();
		sm.getDocumentations().add(doc);

		sm = statisticalMethodDao.save(sm);
		return Translators.translate(sm);

	}

	public StatisticalMethodDto removeStatisticalMethodDocumentation(Integer id, Integer docID) {
		if (!statisticalMethodDao.findById(id).isPresent())
			throw new NoDataException("Statistical Method not present");
		StatisticalMethod sm = statisticalMethodDao.findById(id).get();
		if (!documentationDao.findById(docID).isPresent())
			throw new NoDataException("Documentation not present");
		Documentation doc = documentationDao.findById(docID).get();
		sm.getDocumentations().remove(doc);
		sm = statisticalMethodDao.save(sm);
		return Translators.translate(sm);

	}

}
