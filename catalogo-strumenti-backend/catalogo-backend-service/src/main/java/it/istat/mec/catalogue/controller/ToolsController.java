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
package it.istat.mec.catalogue.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import it.istat.mec.catalogue.dto.ToolDto;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/catalogue")
public class ToolsController {
	 
	
	@GetMapping (value = "/tools")
	public List<ToolDto> getDugList() {

		List<ToolDto> tools=new ArrayList<ToolDto>();
		ToolDto tool1=new ToolDto();
		tool1.setAutore("Autore 1");
		tool1.setData(java.time.LocalDateTime.now().toString());
		tool1.setDescrizione("Descrizione 1");
		tool1.setDocumentazione("documentazione 1");
		tool1.setId(1);
		tool1.setMetodoStatistico("metodoStatistico 1");
		tool1.setNome("nomec1 ");
		tool1.setNoteDiCompilazione(" noteDiCompilazione 1" );
		tool1.setRiferimenti("riferimenti 1" );
		tool1.setStandard("st 1");
		tool1.setTags("tags 1");
		tool1.setTipologia("tipologia 1");
		tool1.setVersione(" v1");
		tools.add(tool1);
		ToolDto tool2=new ToolDto();
		tool2.setAutore("Autore 2");
		tool2.setData(java.time.LocalDateTime.now().toString());
		tool2.setDescrizione("Descrizione 2");
		tool2.setDocumentazione("documentazione 2");
		tool2.setId(2);
		tool2.setMetodoStatistico("metodoStatistico 2");
		tool2.setNome("nomec2 ");
		tool2.setNoteDiCompilazione(" noteDiCompilazione 2" );
		tool2.setRiferimenti("riferimenti 2" );
		tool2.setStandard("st 2");
		tool2.setTags("tags 2");
		tool2.setTipologia("tipologia 2");
		tool2.setVersione(" v2");
		tools.add(tool2);
		ToolDto tool3=new ToolDto();
		tool3.setAutore("Autore 3");
		tool3.setData(java.time.LocalDateTime.now().toString());
		tool3.setDescrizione("Descrizione 3");
		tool3.setDocumentazione("documentazione 3");
		tool3.setId(3);
		tool3.setMetodoStatistico("metodoStatistico 3");
		tool3.setNome("nomec3 ");
		tool3.setNoteDiCompilazione(" noteDiCompilazione 3" );
		tool3.setRiferimenti("riferimenti 3" );
		tool3.setStandard("st 3");
		tool3.setTags("tags 3");
		tool3.setTipologia("tipologia 3");
		tool3.setVersione(" v3");
		tools.add(tool3);
		return tools;
	}
 
}
