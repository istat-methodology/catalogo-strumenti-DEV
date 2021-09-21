package it.istat.mec.catalogue.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalogue.dao.ToolDao;
import it.istat.mec.catalogue.dto.ToolDto;
import it.istat.mec.catalogue.translators.Translators;

@Service
public class ToolService {
	
	@Autowired
	ToolDao toolDao;

	public List<ToolDto> findAllTools() {
		
		return Translators.translate(toolDao.findAll());

	}
}
