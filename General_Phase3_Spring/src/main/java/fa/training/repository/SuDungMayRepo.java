package fa.training.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.entity.SuDungMay;
import fa.training.entity.SuDungMayID;

@Repository
public interface SuDungMayRepo extends JpaRepository<SuDungMay, SuDungMayID> {
	
	@Query("SELECT m.id FROM May m")
	List<String> findAllIds();
	
}
