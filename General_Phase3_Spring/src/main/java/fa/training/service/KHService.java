package fa.training.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entity.KhachHang;
import fa.training.repository.KhachHangRepo;

@Service
public class KHService {
	@Autowired
	KhachHangRepo  khRepo;
	
	public void save(KhachHang khachHang) {
		khRepo.save(khachHang);
	}
	
	public void deleteById(String id) {
		khRepo.deleteById(id);
	}
	
	public KhachHang findById(String id) {
		Optional<KhachHang> optionalKhachHang = khRepo.findById(id);
		return optionalKhachHang.orElse(null);
	}
	
	public Page<KhachHang> findByKeyword(String keyword, Pageable pageable) {
		return khRepo.findByKeyWord(keyword,pageable);
	}
	
	public Page<KhachHang> findAll(Pageable pageable) {
		return khRepo.findAll(pageable);
	}
	
	public List<KhachHang> getAllKhachHang() {
		return khRepo.findAll();
	}
	
	public boolean checkExistId(String id) {
		return khRepo.existsById(id);
	}
	
	public List<String> getAll() {
		return khRepo.findAllIds();
	}
}
