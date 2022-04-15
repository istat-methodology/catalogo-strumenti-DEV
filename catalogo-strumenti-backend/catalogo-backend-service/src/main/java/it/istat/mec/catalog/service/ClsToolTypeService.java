package it.istat.mec.catalog.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.ToolTypeDao;
import it.istat.mec.catalog.dto.ToolTypeDto;
import it.istat.mec.catalog.translators.Translators;

@Service
public class ClsToolTypeService {

	@Autowired
	ToolTypeDao dao;

	public List<ToolTypeDto> findAll() {
		
		return Translators.translateToolTypeList(dao.findAll());

	}
	}

