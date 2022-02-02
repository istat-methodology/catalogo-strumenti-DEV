package it.istat.mec.users.dao;
import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import it.istat.mec.users.domain.UserRolesEntity;


@Repository
public interface UserRolesDao extends CrudRepository<UserRolesEntity, Integer> {

	@Override
	List<UserRolesEntity> findAll();
	
	@Override
	Optional<UserRolesEntity> findById(Integer id);
	
	public void save(Optional<UserRolesEntity> address);

	public void delete(UserRolesEntity address);
}
