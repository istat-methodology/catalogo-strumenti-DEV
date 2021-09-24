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
package it.istat.mec.users.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import it.istat.mec.users.domain.UsersEntity;

@Repository
public interface UsersDao extends CrudRepository<UsersEntity, Integer> {

	@Override
	List<UsersEntity> findAll();
	
	@Query("SELECT u from UsersEntity u where u.role.role=:role")
	List<UsersEntity> findByRole(@Param("role") String role);
	
	@Override
	Optional<UsersEntity> findById(Integer id);
	
	public void save(Optional<UsersEntity> address);

	public void delete(UsersEntity address);
	
	Optional<UsersEntity> findByEmail(String email);	

}
