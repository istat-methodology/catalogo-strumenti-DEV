/**
 * Copyright 2019 ISTAT
 * <p>
 * Licensed under the EUPL, Version 1.1 or – as soon they will be approved by
 * the European Commission - subsequent versions of the EUPL (the "Licence");
 * You may not use this work except in compliance with the Licence. You may
 * obtain a copy of the Licence at:
 * <p>
 * http://ec.europa.eu/idabc/eupl5
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the Licence is distributed on an "AS IS" basis, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * Licence for the specific language governing permissions and limitations under
 * the Licence.
 *
 * @author Francesco Amato <framato @ istat.it>
 * @author Mauro Bruno <mbruno @ istat.it>
 * @author Paolo Francescangeli  <pafrance @ istat.it>
 * @author Renzo Iannacone <iannacone @ istat.it>
 * @author Stefano Macone <macone @ istat.it>
 * @version 1.0
 */
package it.istat.mec.catalog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.istat.mec.catalog.dao.GsbpmProcessDao;
import it.istat.mec.catalog.dto.GSBPMProcessDto;
import it.istat.mec.catalog.translators.Translators;

import java.util.HashMap;
import java.util.LinkedHashMap;

@Service
public class GsbpmProcessService {

	@Autowired
	GsbpmProcessDao gsbpmProcessDao;

	public GSBPMProcessDto findById(Long id) {

		return Translators.translate(gsbpmProcessDao.findById(id).orElse(null));
	}

	public List<GSBPMProcessDto> findAllProcesses() {
		return Translators.translateGsbpmProcess(gsbpmProcessDao.findAll());
	}

	public List<GSBPMProcessDto> findAllSubProcesses() {
		return Translators.translateGsbpmProcess(gsbpmProcessDao.findAllSubProcesses());
	}

	public List<GSBPMProcessDto> findSubProcessesByGsbpmParentProcess(Long gsbpmProcess) {
		return Translators.translateGsbpmProcess(gsbpmProcessDao.findSubProcessesByGsbpmParentProcess(gsbpmProcess));
	}

	public Integer getGsbpmRows() {
		return gsbpmProcessDao.getGsbpmRows();
	}

	public Integer getGsbpmColumns() {
		return gsbpmProcessDao.getGsbpmColumns();
	}

	public HashMap<String, GSBPMProcessDto> getGsbpmMatrix() {

		HashMap<String, GSBPMProcessDto> matrix = new LinkedHashMap<>();

		int x = 0, y = 0;
		long parent = -1;
		boolean isFirst = true;

		// Process row (x>=0, y=0)
		List<GSBPMProcessDto> processList = this.findAllProcesses();
		for (GSBPMProcessDto process : processList) {
			matrix.put(x + "_" + y, process);
			if (isFirst) {
				parent = process.getId(); // register code of first process
				isFirst = false;
			}
			x++;
		}

		// Subprocesses rows (x>=0, y>=1)
		List<GSBPMProcessDto> subprocessList = this.findAllSubProcesses();
		x = 0;
		y = 0;
		for (GSBPMProcessDto process : subprocessList) {
			if (process.getGsbpmProcessParent().getId() != parent) {
				parent = process.getGsbpmProcessParent().getId();
				x++;
				y = 1;
			} else {
				y++;
			}
			matrix.put(x + "_" + y, process);
		}

		return matrix;
	}

}
