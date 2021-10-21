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
import org.springframework.web.bind.annotation.RestController;
import it.istat.mec.catalog.dto.StatisticalServiceDto;
import it.istat.mec.catalog.request.CreateStatisticalServiceRequest;
import it.istat.mec.catalog.service.StatisticalServiceService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalog")
public class StatisticalServiceController {

	@Autowired
	private StatisticalServiceService statisticalServiceService;
	
	@GetMapping("/statisticalservices")
	public List<StatisticalServiceDto> getAllStatisticalServices() {

		return statisticalServiceService.findAllStatisticalServices();
	}	
	
	@GetMapping(value = "/statisticalservices/{id}")
	public StatisticalServiceDto getStatisticalService(@PathVariable("id") Long id) {

		return statisticalServiceService.findStatisticalServiceById(id);

	}
	
	@GetMapping("/statisticalservices/tools/{id}")
	public List<StatisticalServiceDto> getByCatalogTool(@PathVariable("id") Long id) {

		return statisticalServiceService.findByCataloTool(id);
	}
	
	@PostMapping("/statisticalservices")
	public StatisticalServiceDto create(@RequestBody CreateStatisticalServiceRequest request) {

		return statisticalServiceService.newStatisticalService(request);
	}
	
	@PutMapping(value = "/statisticalservices/{id}")
	public StatisticalServiceDto updateStatisticalService(@RequestBody CreateStatisticalServiceRequest request) {
		
		return statisticalServiceService.updateStatisticalService(request);
	}
	
	@DeleteMapping(value = "/statisticalservices/{id}")
	public StatisticalServiceDto deleteStatisticalService(@PathVariable("id") Long id) {

		return statisticalServiceService.deleteStatisticalService(id);
	}
 
}


