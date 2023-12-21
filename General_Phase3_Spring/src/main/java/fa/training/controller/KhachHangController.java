package fa.training.controller;



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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entity.KhachHang;
import fa.training.service.KHService;


@Controller
@RequestMapping("/khachhang")
public class KhachHangController {

	@Autowired
	KHService services;
	
	private static final int PAGE_SIZE = 5;	
	
	@GetMapping("/list")
	public String getAllKhachHangWithPageAble(Model model, @RequestParam(defaultValue = "0") int page) {
		Pageable pageAble = PageRequest.of(page, PAGE_SIZE);
		Page<KhachHang> khachHang = services.findAll(pageAble);
		model.addAttribute("khachHangs", khachHang.getContent());
		model.addAttribute("totalPages", khachHang.getTotalPages());
		model.addAttribute("currentPage", page);
		return "khachhang/list";
	}
	
	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("khachHangForm", new KhachHang());
		return "khachhang/new";
	}
	
	@PostMapping("/save")
	public String addNewKhachHang(@ModelAttribute(name="khachHangForm") @Valid KhachHang khachHang, BindingResult result) {
		if(services.checkExistId(khachHang.getId())) {
			result.rejectValue("id", "duplicate", "Mã khách hàng đã tồn tại");
			return "khachhang/new";
		}
		if(result.hasErrors()) {
			return "khachhang/new";
		}
		services.save(khachHang);
		return "redirect:/khachhang/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(name="id") String khachHangId) {
		services.deleteById(khachHangId);
		return "redirect:/khachhang/list";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable(name = "id") String khachHangId, Model model) {
		KhachHang khachHang = services.findById(khachHangId);
		model.addAttribute("khachHangForm", khachHang);
		return "khachhang/update";
	}
	
	@PostMapping("/update")
	public String updateKhachHang(@ModelAttribute(name="khachHangForm") @Valid KhachHang khachHang,BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "/khachhang/update";
		}
		services.save(khachHang);
		return "redirect:/khachhang/list";
	}
	@GetMapping("/search")
	public String search(@RequestParam("search") String text, Model model,@RequestParam(defaultValue="0") int page) {
		Pageable pageable = PageRequest.of(page, PAGE_SIZE);
		Page<KhachHang> khList = services.findByKeyword(text, pageable);
		model.addAttribute("khachHangs", khList.getContent());
		model.addAttribute("totalPages", khList.getTotalPages());
		model.addAttribute("currentPage", page);
		return "khachhang/list";
	}
	
	
}
