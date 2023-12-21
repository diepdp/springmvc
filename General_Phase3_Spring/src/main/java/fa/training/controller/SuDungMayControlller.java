package fa.training.controller;

import java.time.LocalDate;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.dto.FormDKMay;
import fa.training.dto.ShowAll;
import fa.training.entity.KhachHang;
import fa.training.entity.May;
import fa.training.entity.SuDungMay;
import fa.training.entity.SuDungMayID;
import fa.training.service.KHService;
import fa.training.service.MayService;
import fa.training.service.SuDungDichVuService;
import fa.training.service.SuDungMayService;

@Controller
@RequestMapping("/sudungmay")
public class SuDungMayControlller {

	@Autowired
	SuDungMayService service;
	
	@Autowired
	MayService mayService;
	
	@Autowired
	KHService khService;
	
	@Autowired
	SuDungDichVuService sdService;
	
	
	private static final int PAGE_SIZE = 5;
	
	@GetMapping("/list")
	public String getAllSuDungMayWithPageAble(Model model, @RequestParam(defaultValue="0") int page) {
		Pageable pageAble = PageRequest.of(page, PAGE_SIZE);
		Page<SuDungMay> suDungMay = service.findAll(pageAble);
		model.addAttribute("sudungmay", suDungMay.getContent());
		model.addAttribute("totalPages", suDungMay.getTotalPages());
		model.addAttribute("currentPage", page);
		return "/sudungmay/list";
	}
	
	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("suDungMayForm", new SuDungMay());
		return "/sudungmay/new";
	}
	
	@PostMapping("/saveMay")
	public String addNewSuDungDichVu(@ModelAttribute(name="suDungMayForm") @Valid FormDKMay formDKMay, BindingResult result, Model model) {
		model.addAttribute("listIDKH", khService.getAll());
		model.addAttribute("listIDMay", mayService.getAll());
		if(result.hasErrors()) {
			return "/sudungmay/new";
		}
		
		SuDungMayID suDungMayID = new SuDungMayID();
		SuDungMay suDungMay = new SuDungMay();
		KhachHang khachHang = khService.findById(formDKMay.getIdKH());
		May may = mayService.findById(formDKMay.getIdMay());
		
		if(sdService.findAllInformation(may.getId()) > 0 ) {
			model.addAttribute("message", "Máy đang được sử dụng");
			return "/sudungmay/new";
		}
		suDungMayID.setKhachHang(khachHang);
		suDungMayID.setMay(may);
		suDungMayID.setNgayBatDauSuDung(LocalDate.parse(formDKMay.getNgayBDSD()));
		suDungMayID.setGioBatDauSuDung(formDKMay.getGioBDSD());
		
		suDungMay.setSuDungMayID(suDungMayID);
		suDungMay.setThoiGianSuDung(formDKMay.getThoiGianSD());
		
		service.save(suDungMay);
		return "redirect:/sudungdichvu/show";
	}
	
	@GetMapping("/save")
	public String showForm(Model model) {
		model.addAttribute("listIDKH", khService.getAll());
		model.addAttribute("listIDMay", mayService.getAll());
		model.addAttribute("suDungMayForm", new FormDKMay());
		return "/sudungmay/new";
	}
	
	
	
}
