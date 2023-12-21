package fa.training.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.entity.DichVu;

@Repository
public interface DichVuRepo extends JpaRepository<DichVu, String> {
	Optional<DichVu> findById(String id);
	
	@Query(value="FROM DichVu dv WHERE dv.id LIKE %?1% OR dv.tenDV LIKE %?1% OR dv.donViTinh LIKE %?1% OR dv.donGia LIKE %?1%")
	Page<DichVu> findByKeyWord(String keyword, Pageable pageAble);
	
	Page<DichVu> findAll(Pageable pageAble);
	
	@Query(value="SELECT dv.id FROM DichVu dv")
	List<String> findAllIds();
	
}
