package fa.training.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entity.DichVu;
import fa.training.repository.DichVuRepo;

@Service
public class DVServices {
	
	@Autowired
	DichVuRepo dvRepo;
	
	public void save(DichVu dichVu) {
		dvRepo.save(dichVu);
	}
	
	public void deleteById(String id) {
		dvRepo.deleteById(id);
	}
	
	public DichVu findById(String id) {
		Optional<DichVu> optionnalDichVu = dvRepo.findById(id);
		return optionnalDichVu.orElse(null);
//		return dvDao.findById(id);
	}
	
	public Page<DichVu> findByKeyWord(String keyword, Pageable pageable) {
		return dvRepo.findByKeyWord(keyword, pageable);
	}
	
	public Page<DichVu> findAll(Pageable pageable) {
		return dvRepo.findAll(pageable);
	}
	
	public boolean existsById(String id) {
		return dvRepo.existsById(id);
	}
	
	public List<String> getAll() {
		return dvRepo.findAllIds();
	}
	
	
}
