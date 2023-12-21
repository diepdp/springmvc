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

import fa.training.entity.May;
import fa.training.service.MayService;


@Controller
@RequestMapping("/may")
public class MayControlller {
	private static final int PAGE_SIZE = 5;

	@Autowired
	private MayService service;
	
	
	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("mayForm", new May());
		return "may/new";
	}
	
	@PostMapping("/save")
	public String addNewMay(@ModelAttribute(name = "mayForm") @Valid May may, BindingResult result) {
		if(service.checkExistsId(may.getId())) {
			result.rejectValue("id", "duplicate", "Mã máy đã tồn tại");
			return "may/new";
		}

		if(result.hasErrors()) {
			return "may/new";
		}
		service.save(may);
		return "redirect:/may/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(name = "id") String mayId) {
		service.deleteById(mayId);
		return "redirect:/may/list";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable(name = "id") String mayId, Model model) {
		May may = service.findById(mayId);
		model.addAttribute("mayForm", may);
		return "may/update";
	}
	@PostMapping("/update")
	public String updateMay(@ModelAttribute(name="mayForm") @Valid May may, Model model, BindingResult result) {
		if(result.hasErrors()) {
			return "may/update";
		}
		service.save(may);
		return "redirect:/may/list";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam("search") String text, Model model, @RequestParam(defaultValue="0") int page) {
		Pageable pageable = PageRequest.of(page, PAGE_SIZE);
		Page<May> may = service.findByKeyword(text, pageable);
		model.addAttribute("may", may.getContent());
		model.addAttribute("totalPages", may.getTotalPages());
		model.addAttribute("currentPage", page);
		return "may/list";
	} 
	
	@GetMapping("/list")
	public String getAllMayWithPageAble(Model model, @RequestParam(defaultValue="0") int page) {
		Pageable pageAble = PageRequest.of(page, PAGE_SIZE);
		Page<May> mays = service.findAll(pageAble);
		model.addAttribute("may", mays.getContent());
		model.addAttribute("totalPages", mays.getTotalPages());
		model.addAttribute("currentPage",page);
		return "may/list";
	}
}
