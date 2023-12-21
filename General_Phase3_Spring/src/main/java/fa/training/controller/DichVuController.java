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

import fa.training.entity.DichVu;
import fa.training.service.DVServices;

@Controller
@RequestMapping("/dichvu")
public class DichVuController {
	
	private static final int PAGE_SIZE = 5;
	
	@Autowired
	DVServices dvServices;

	@GetMapping("/list")
	public String getAllDichVuWithPageAble(Model model, @RequestParam(defaultValue = "0") Integer page) {
		Pageable pageAble = PageRequest.of(page, PAGE_SIZE);
		Page<DichVu> dichVu = dvServices.findAll(pageAble);
		model.addAttribute("dichVu", dichVu.getContent());
		model.addAttribute("totalPages", dichVu.getTotalPages());
		model.addAttribute("currentPage", page);
		return "dichvu/list";
	}

	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("dichVuForm", new DichVu());
		return "dichvu/new";
	}

	@PostMapping("/save")
	public String addNewDichVu(@ModelAttribute(name = "dichVuForm") @Valid DichVu dichVu, BindingResult result) {
		if(dvServices.existsById(dichVu.getId())) {
			result.rejectValue("id", "duplicate","Mã dịch vụ đã tồn tại");
			return "dichvu/new";
		}
		if (result.hasErrors()) {
			return "dichvu/new";
		}
		dvServices.save(dichVu);
		return "redirect:/dichvu/list";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam(name = "id") String dichVuId) {
		dvServices.deleteById(dichVuId);
		return "redirect:/dichvu/list";
	}

	@GetMapping("/update/{id}")
	public String update(@PathVariable(name="id") String dichVuId, Model model) {
		DichVu dichVu = dvServices.findById(dichVuId);
		model.addAttribute("dichVuForm", dichVu);
		return "/dichvu/update";
	}

	@PostMapping("/update")
	public String updateDichVu(@ModelAttribute(name = "dichVuForm") @Valid DichVu dichVu, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "/dichvu/update";
		}
		dvServices.save(dichVu);
		return "redirect:/dichvu/list";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam("searchKey") String text, Model model,@RequestParam(defaultValue="0") int page) {
		Pageable pagealbe = PageRequest.of(page, PAGE_SIZE);
		Page<DichVu> dvList = dvServices.findByKeyWord(text, pagealbe);
		model.addAttribute("dichVu", dvList.getContent());
		model.addAttribute("totalPages", dvList.getTotalPages());
		model.addAttribute("currentPage", page);
		return "dichvu/list";
	}
}
