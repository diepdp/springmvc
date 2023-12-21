package fa.training.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entity.May;
import fa.training.repository.MayRepo;


@Service
public class MayService {

	@Autowired
	MayRepo service;
	
	
	public boolean checkExistsId(String id) {
		return service.existsById(id);
	}
	
	public void save(May may) {
		service.save(may);
	}
	
	public void deleteById(String id) {
		service.deleteById(id);
	}
	
	public Page<May> findAll(Pageable  pageable) {
		return service.findAll(pageable);
	}
	
	public Page<May> findByKeyword(String id, Pageable pageable) {
		return service.findByKeyword(id, pageable);
	}
	
	public May findById(String id) {
		Optional<May> may = service.findById(id);
		return may.orElse(null);
	}
	
	public List<String> getAll() {
		return service.findAllIds();
	}

	
}	
