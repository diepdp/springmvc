package fa.training.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import fa.training.entity.KhachHang;

@Repository
public interface KhachHangRepo extends JpaRepository<KhachHang, String>{
	Optional<KhachHang> findById(String id);
	
	@Query(value="FROM KhachHang kh WHERE kh.id LIKE %?1% OR kh.tenKH LIKE %?1% OR kh.diaChi LIKE %?1% OR kh.soDienThoai LIKE %?1% OR kh.email LIKE %?1%")
	Page<KhachHang> findByKeyWord(String keyword, Pageable pageable);
	
	@Query(value = "SELECT kh.id FROM KhachHang kh")
	List<String> findAllIds();
}
