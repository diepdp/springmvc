package fa.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.entity.SuDungMay;
import fa.training.repository.SuDungMayRepo;


@Service
public class SuDungMayService {

	@Autowired
	SuDungMayRepo repo;
	
//	public boolean checkExistsId(SuDungMay.SuDungMayID id) {
//		return repo.existsById(id);
//	}
	
	public void save(SuDungMay suDungMay) {
		repo.save(suDungMay);
	}
	
	public Page<SuDungMay> findAll(Pageable pageable) {
		return repo.findAll(pageable);
	}
	
	public List<String> findAllId() {
		return repo.findAllIds();
	}
}
