/**
 * Copyright 2021 ISTAT
 *
 * Licensed under the EUPL, Version 1.1 or – as soon they will be approved by
 * the European Commission - subsequent versions of the EUPL (the "Licence");
 * You may not use this work except in compliance with the Licence. You may
 * obtain a copy of the Licence at:
 *
 * http://ec.europa.eu/idabc/eupl5
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the Licence is distributed on an "AS IS" basis, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * Licence for the specific language governing permissions and limitations under
 * the Licence.
 *
 * @author Francesco Amato <framato @ istat.it>
 * @author Mauro Bruno <mbruno @ istat.it>
 * @author Renzo Iannacone <iannacone @ istat.it>
 * @author Stefano Macone <macone @ istat.it>
 * @version 1.0
 */
package it.istat.mec.catalog.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import it.istat.mec.catalog.dto.CatalogToolDTO;
import it.istat.mec.catalog.request.CreateToolRequest;
import it.istat.mec.catalog.request.UpdateToolRequest;
import it.istat.mec.catalog.service.ToolService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class ToolController {
	
	@Autowired
	private ToolService toolService;
	
	@GetMapping("/open/tools")
	public List<CatalogToolDTO> getAllTools(@RequestParam(value = "type", required = false) Integer[] type,
			@RequestParam(value = "gsbpmIds", required = false) Integer[] gsbpmIds,
			@RequestParam(value = "orderBy", required = false, defaultValue = "id,name") String[] orderBy,
			@RequestParam(value = "sort", required = false, defaultValue = "ASC,ASC") String[] sort) {

		return toolService.findAllTools(type,gsbpmIds,orderBy,sort);
	}
	
	@GetMapping(value = "/open/tools/{id}")
	public CatalogToolDTO getTool(@PathVariable("id") Long id) {

		return toolService.findToolById(id);

	}
	
	@PostMapping("/tools")
	public CatalogToolDTO create(@RequestBody CreateToolRequest request) {

		return toolService.newTool(request);
	}
	
	@PutMapping(value = "/tools/{id}")
	public CatalogToolDTO updateAddress(@RequestBody UpdateToolRequest request) {

		//return addressService.updateAddress(request, JwtTokenProvider.getUserId(jwt));
		return toolService.updateTool(request);
	}
	
	@DeleteMapping(value = "/tools/{id}")
	public CatalogToolDTO deleteAddress(@PathVariable("id") Long id) {

		return toolService.deleteTool(id);
	}
 
}
