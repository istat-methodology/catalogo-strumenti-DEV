package it.istat.mec.catalog.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import it.istat.mec.catalog.dto.GSBPMProcessDto;
import it.istat.mec.catalog.dto.ToolTypeDto;
import it.istat.mec.catalog.service.ClsToolTypeService;
import it.istat.mec.catalog.service.GsbpmProcessService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class GsbpmController {

	@Autowired
	private GsbpmProcessService  service;
	
	@GetMapping("/open/gsbpm-processes")
	public List<GSBPMProcessDto> getAll() {

		return service.findAllProcesses();
	}
	 
}

