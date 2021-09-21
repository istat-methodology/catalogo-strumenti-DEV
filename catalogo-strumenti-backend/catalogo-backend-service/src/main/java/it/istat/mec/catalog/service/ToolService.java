package it.istat.mec.catalog.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.ToolDao;
import it.istat.mec.catalog.dto.ToolDto;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ToolService {
	
	@Autowired
	ToolDao toolDao;

	public List<ToolDto> findAllTools() {
		
		return Translators.translate(toolDao.findAll());

	}
}
