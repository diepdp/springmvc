package fa.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fa.training.dto.ShowAll;
import fa.training.entity.SuDungDichVu;
import fa.training.entity.SuDungDichVuID;
import fa.training.repository.SuDungDichVuRepo;

@Service
public class SuDungDichVuService {
	
	@Autowired
	SuDungDichVuRepo repo;

	public void save(SuDungDichVu id) {
		repo.save(id);
	}
	
	public boolean checkExistId(SuDungDichVuID id) {
		return repo.existsById(id);
	}
	
	public Page<SuDungDichVu> findAll(Pageable pageable) {
		return repo.findAll(pageable);
	}
	
	public Page<ShowAll> findAllInfo(Pageable pageable) {
		return repo.findAllInfo(pageable);
	}
	
	public int findAllInformation(String id) {
		return repo.countById(id);
	}
}
