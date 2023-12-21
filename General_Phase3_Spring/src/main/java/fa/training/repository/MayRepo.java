package fa.training.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.entity.May;

@Repository
public interface MayRepo extends JpaRepository<May, String> {
	
	Optional<May> findById(String id);
	
	Page<May> findAll(Pageable pageable);
	
	@Query(value="FROM May m WHERE m.id LIKE %?1% OR m.viTri LIKE %?1% OR m.trangThai LIKE %?1%")
	Page<May> findByKeyword(String keyword, Pageable pageable);
	
	@Query(value="SELECT m.id FROM May m")
	List<String> findAllIds();
}
